<?xml version="1.0" encoding="UTF-8"?>
<!--
     sqlxmlast-shorten.xsl

     Stylesheet to compress elements in sqlxml ast files
     The basic idea is to shorten nestings of single elements like

     <a><b><c>x</c></b></a>         becomes <c rule-path="a b">x</c>
     <a><b><c>x</c><d>y</d></b></a> becomes <b rule-path="a"><c>x</c><d>y</d></b></b>

     Since the grammar fo oracle is realy big and there are many cases of deep single
     element nestings the resulting xml/json AST files downstream are signicant smaller
     and also the queries on these AST's are a lot easier to formulate

     Jurgen Hildebrand (ei@xs4all.nl)
     25052021
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema" version="3.0"
                xmlns="urn:xmlast:grammar"
                xmlns:g="urn:xmlast:grammar"
                xmlns:c="urn:xmlast:comment"
                xmlns:t="urn:xmlast:token"
                xmlns:fn="urn:xmlast:functions"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                exclude-result-prefixes="xs fn g map"
                expand-text="yes">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="c:*">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="g:ast" priority="10">
        <xsl:variable name="tree">
            <xsl:apply-templates/>
        </xsl:variable>
        <xsl:variable name="path-map" as="map(*)">
            <xsl:map>
                <xsl:for-each select="distinct-values($tree//@path)">
                    <xsl:variable name="path" select="."/>
                    <xsl:map-entry key="string(.)" select="generate-id(($tree//g:*[@path = $path])[1])"/>
                </xsl:for-each>
            </xsl:map>
        </xsl:variable>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="$tree" mode="path-ref">
                <xsl:with-param name="path-map" select="$path-map" tunnel="true"/>
            </xsl:apply-templates>
            <path-map>
                <xsl:for-each select="map:keys($path-map)">
                    <xsl:sort select="."/>
                    <entry path="{.}" path-def="{$path-map(.)}"/>
                </xsl:for-each>
            </path-map>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="@path" mode="path-ref">
        <xsl:param name="path-map" tunnel="true"/>
        <xsl:attribute name="path-ref" select="$path-map(.)"/>
    </xsl:template>

    <!-- wrap elements with a single child to compress ast -->
    <xsl:template match="g:*">
        <xsl:variable name="wrapped" select="fn:wrap(.,())" as="map(*)"/>
        <xsl:variable name="path-comps" select="$wrapped('path')[position() ne 1]"/>
        <xsl:variable name="path" select="string-join($path-comps,'/')"/>
        <xsl:copy>
            <xsl:choose>
                <xsl:when test="$path ne ''">
                    <xsl:attribute name="path" select="$path"/>
                </xsl:when>
            </xsl:choose>
            <xsl:sequence select="$wrapped('node')"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="c:WS">{translate(text(),'_tnr',' &#x9;&#xA;&#xD;')}</xsl:template>

    <!-- recursive function to remove single g:* children -->
    <xsl:function name="fn:wrap" as="map(*)">
        <xsl:param name="node"/>
        <xsl:param name="path"/>
        <xsl:choose>
            <xsl:when test="count($node/g:*) = 1 and not($node/t:*)">
                <xsl:sequence select="fn:wrap($node/(g:*,comment()),($path, local-name($node)))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:map>
                    <xsl:map-entry key="'path'" select="$path"/>
                    <xsl:map-entry key="'node'">

                        <xsl:for-each-group select="$node/node()" group-adjacent="fn:group-key(.)">
                            <xsl:variable name="key" select="current-grouping-key()"/>
                            <xsl:variable name="content">
                                <xsl:apply-templates select="current-group()"/>
                            </xsl:variable>
                            <!--
                            <xsl:comment>start {$namespace-uri}</xsl:comment>
                            -->
                            <xsl:choose>
                                <xsl:when test="$key = 'urn:xmlast:token'">
                                    <xsl:variable name="val"
                                                  select="string-join(fn:normalize-tokens(current-group()),'')"/>
                                    <xsl:variable name="name" select="string-join(current-group()/local-name(),',')"/>
                                    <t:t>
                                        <xsl:choose>
                                            <xsl:when test="$name ne $content">
                                                <xsl:attribute name="type" select="$name"/>
                                            </xsl:when>
                                        </xsl:choose>
                                        <xsl:attribute name="val" select="$val"/>
                                        <xsl:value-of select="$content"/>
                                    </t:t>
                                </xsl:when>
                                <xsl:when test="$key = 'sequence'">
                                    <xsl:variable name="val"
                                                  select="string-join(fn:normalize-tokens(current-group()),'')"/>
                                    <xsl:variable name="type" select="string-join(current-group()/self::t:*/local-name(),',')"/>
                                    <xsl:choose>
                                        <xsl:when test="$type = ('EQUALS_OP','PERIOD','COMMA','ASSIGN_OP','SEMICOLON','LEFT_PAREN','RIGHT_PAREN','IN','DEFAULT','NULL')">
                                           <t:t>{normalize-space($content)}</t:t>
                                        </xsl:when>
                                        <xsl:when test="$type ne ''">
                                            <xsl:element name="{if ($type = 'WS') then 'c:ws' else 't:ts'}">
                                                <xsl:choose>
                                                    <xsl:when test="$type ne $content">
                                                        <xsl:attribute name="type" select="$type"/>
                                                    </xsl:when>
                                                </xsl:choose>
                                                <xsl:choose>
                                                    <xsl:when test="$val ne ''">
                                                        <xsl:attribute name="val" select="$val"/>
                                                    </xsl:when>
                                                </xsl:choose>
                                                <xsl:value-of select="normalize-space($content)"/>
                                            </xsl:element>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:sequence select="$content"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <!--
                            <xsl:comment>end {$namespace-uri}</xsl:comment>
                            -->
                        </xsl:for-each-group>
                        <!--
                        <xsl:apply-templates select="$node/node()"/>
                        -->
                    </xsl:map-entry>
                </xsl:map>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:function name="fn:group-key">
        <xsl:param name="node"/>
        <xsl:choose>
            <xsl:when test="$node/self::c:WS or $node/self::t:*">sequence</xsl:when>
            <xsl:otherwise>{namespace-uri($node)}</xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:function name="fn:normalize-tokens">
        <xsl:param name="tokens"/>
        <xsl:variable name="quot">'</xsl:variable>
        <xsl:variable name="char_str_re">'(.*)'</xsl:variable>
        <xsl:variable name="perl_str_re">q'.(.*).'</xsl:variable>
        <xsl:variable name="delim_str_re">"(.*)"</xsl:variable>
        <xsl:for-each select="$tokens">
            <xsl:variable name="type" select="local-name(./self::t:*)"/>
            <xsl:variable name="value" select="string(.)"/>
            <xsl:choose>
                <xsl:when test="$type = 'REGULAR_ID'">
                    <xsl:value-of select="lower-case($value)"/>
                </xsl:when>
                <xsl:when test="$type = 'CHAR_STRING'">
                    <xsl:value-of select="replace($value,$char_str_re,'$1')"/>
                </xsl:when>
                <xsl:when test="$type = 'CHAR_STRING_PERL'">
                    <xsl:value-of select="replace($value,$perl_str_re,'$1')"/>
                </xsl:when>
                <xsl:when test="$type = 'DELIMITED_ID'">
                    <xsl:value-of select="lower-case(replace($value,$delim_str_re,'$1'))"/>
                </xsl:when>
                <xsl:when test="matches($type,'ROWCOUNT')">
                    <xsl:value-of select="replace($value,'\s+','')"/>
                </xsl:when>
                <xsl:when test="$type = ''">
                    <xsl:value-of select="''"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$value"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:function>

    <xsl:template mode="#all" match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="attribute() | node()" mode="#current"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>


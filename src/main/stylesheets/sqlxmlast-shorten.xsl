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

    <xsl:variable name="quot">'</xsl:variable>
    <xsl:variable name="char_str_re">'(.*)'</xsl:variable>
    <xsl:variable name="perl_str_re">q'.(.*).'</xsl:variable>
    <xsl:variable name="delim_str_re">"(.*)"</xsl:variable>


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
<!--
Decode whitespace, for later
    <xsl:template match="c:WS">{translate(text(),'_tnr',' &#x9;&#xA;&#xD;')}</xsl:template>
-->
    <!-- recursive function to remove single g:* children -->
    <xsl:function name="fn:wrap" as="map(*)">
        <xsl:param name="node"/>
        <xsl:param name="path"/>
        <xsl:choose>
            <xsl:when test="$node/self::t:*">
                <xsl:apply-templates select="$node"/>
            </xsl:when>
            <xsl:when test="$node/self::g:regular_id or $node/self::g:quoted_string">
                <xsl:map>
                    <xsl:map-entry key="'path'" select="$path"/>
                    <xsl:map-entry key="'node'">
                        <xsl:copy select="$node">
                            <xsl:apply-templates select=".//(t:*,comment())"/>
                        </xsl:copy>
                    </xsl:map-entry>
                </xsl:map>
            </xsl:when>
            <xsl:when test="count($node/g:*) = 1 and not($node/t:*)">
                <xsl:sequence select="fn:wrap($node/(g:*,comment()),($path, local-name($node)))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:map>
                    <xsl:map-entry key="'path'" select="$path"/>
                    <xsl:map-entry key="'node'">
                        <xsl:apply-templates select="$node/node()"/>
                    </xsl:map-entry>
                </xsl:map>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:template match="c:WS">
        <q>
            <xsl:apply-templates/>
        </q>
    </xsl:template>
    <xsl:template match="g:regular_id/t:*" priority="100">
        <i val="{lower-case(.)}">
            <xsl:value-of select="."/>
        </i>
    </xsl:template>
    <xsl:template match="t:CHAR_STRING" priority="80">
        <b val="{replace(.,$char_str_re,'$1')}">
            <xsl:value-of select="."/>
        </b>
    </xsl:template>
    <xsl:template match="t:CHAR_STRING_PERL" priority="80">
        <b val="{replace(.,$perl_str_re,'$1')}">
            <xsl:value-of select="."/>
        </b>
    </xsl:template>
    <xsl:template match="t:DELIMITED_ID" priority="80">
        <b val="{lower-case(replace(.,$delim_str_re,'$1'))}">
            <xsl:value-of select="."/>
        </b>
    </xsl:template>
    <xsl:template match="constant//t:*" priority="60">
        <b val="{.}">
            <xsl:value-of select="."/>
        </b>
    </xsl:template>
    <xsl:template match="t:*">
        <b>
            <xsl:value-of select="."/>
        </b>
    </xsl:template>

    <xsl:template mode="#all" match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="attribute() | node()" mode="#current"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>

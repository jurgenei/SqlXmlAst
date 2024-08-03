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
                xmlns:fn="http://www.w3.org/2005/xpath-functions"
                exclude-result-prefixes="xs fn g"
                expand-text="yes">
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="c:*"/>
    <xsl:template match="/*">
        <xsl:variable name="first-cut">
            <xsl:apply-templates mode="first-cut"/>
        </xsl:variable>
        <xsl:variable name="second-cut">
            <xsl:apply-templates mode="second-cut" select="$first-cut"/>
        </xsl:variable>
        <xsl:variable name="third-cut">
            <xsl:apply-templates mode="third-cut" select="$second-cut"/>
        </xsl:variable>
        <xsl:variable name="fourth-cut">
            <xsl:apply-templates mode="fourth-cut" select="$third-cut"/>
        </xsl:variable>
        <!--
        <xsl:sequence select="$fourth-cut"/>
        -->
        <xsl:apply-templates mode="fifth-cut" select="$fourth-cut"/>
    </xsl:template>
    <!-- first cut -->
    <xsl:template mode="first-cut" match="c:*"/>
    <xsl:template mode="first-cut" match="g:ebnfSuffix" />
    <xsl:template mode="first-cut" match="g:exceptionGroup[count(*) = 0]" priority="2"/>
    <xsl:template mode="first-cut" match="g:*[g:ebnfSuffix]">
        <xsl:copy>
            <xsl:attribute name="cardinality" select="g:ebnfSuffix/t:*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template mode="first-cut" match="g:blockSuffix" priority="2"/>
    <xsl:template mode="first-cut" match="g:block[following-sibling::g:blockSuffix]">
        <xsl:copy>
            <xsl:attribute name="cardinality" select="following-sibling::g:blockSuffix/g:ebnfSuffix/t:*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>



    <!-- second cut -->
    <xsl:template mode="second-cut" match="g:*[g:* and count(element()) = 1 and not(@*) and not(self::g:alternative)]">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    <xsl:template mode="second-cut" match="t:*">
        <xsl:comment>{.}</xsl:comment>
    </xsl:template>
    <xsl:template mode="second-cut" match="g:*[t:* and count(element()) = 1]">
        <xsl:variable name="apos">'</xsl:variable>
        <xsl:variable name="re">^{$apos}(.*){$apos}$</xsl:variable>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="{name(t:*)}" select="replace(t:*,$re,'$1')"/>
        </xsl:copy>
    </xsl:template>

    <!-- third cut -->
    <xsl:template mode="third-cut" match="g:labeledElement|g:element|g:atom|g:ebnf" priority="1">
        <!-- remove element, atom -->
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    <xsl:template mode="third-cut" match="g:labeledElement/g:identifier|g:ruleSpec|g:ruleBlock|g:ruleAltList|g:labeledAlt|g:altList" priority="1">
        <!-- remove element, atom -->
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    <xsl:template mode="third-cut" match="g:labeledElement/g:*|g:element/g:*|g:atom/g:*">
        <xsl:variable name="label" select="ancestor-or-self::g:labeledElement/g:identifier/@t:RULE_REF"/>
        <xsl:copy>
            <xsl:choose>
                <xsl:when test="$label">
                    <xsl:attribute name="label" select="$label"/>
                </xsl:when>
            </xsl:choose>
            <xsl:copy-of select="../../attribute()"/>
            <xsl:copy-of select="../attribute()"/>
            <xsl:copy-of select="attribute()"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template mode="third-cut" match="g:parserRuleSpec">
        <xsl:copy>
            <xsl:copy-of select="g:ruleDef/@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template mode="third-cut" match="g:ruleDef"/>

    <!-- fourth cut -->
    <xsl:template mode="fourth-cut" match="g:parserRuleSpec[count(g:alternative) = 1]">
        <xsl:copy>
            <xsl:copy-of select="attribute()"/>
            <xsl:apply-templates mode="#current" select="comment()|g:alternative/element()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template mode="fourth-cut" match="g:block[count(g:alternative) = 1]">
        <xsl:copy>
            <xsl:copy-of select="attribute()"/>
            <xsl:apply-templates mode="#current" select="g:alternative/element()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template mode="fourth-cut" match="g:alternative">
        <choice>
            <xsl:copy-of select="attribute()"/>
            <xsl:apply-templates mode="#current"/>
        </choice>
    </xsl:template>

    <xsl:template mode="fourth-cut" match="g:ruleref">
        <rule>
            <xsl:copy-of select="attribute()"/>
            <xsl:apply-templates mode="#current"/>
        </rule>
    </xsl:template>
    <!-- fifth cut -->
    <xsl:template mode="fifth-cut" match="g:parserRuleSpec">
        <xsl:copy>
            <xsl:copy-of select="attribute()"/>
            <xsl:choose>
                <xsl:when test="g:choice and count(element()) = count(g:choice) and
                (every $choise in g:choice satisfies (count($choise/g:*) = 1) and not($choise/g:block) and not($choise//@cardinality))">
                    <xsl:attribute name="simple">true</xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="g:choice and count(element()) = count(g:choice) and
                (every $choise in g:choice satisfies (count($choise/g:*) = 1) and ($choise/g:terminal))">
                    <xsl:attribute name="terminal">true</xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>

    <!-- all cut cuts -->
    <xsl:template mode="#all" match="/ | @* | node()">
        <xsl:copy>
         <xsl:apply-templates select="attribute() | node() | comment()" mode="#current"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>


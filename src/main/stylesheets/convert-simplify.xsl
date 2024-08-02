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
                xmlns:t="urn:xmlast:token"
                xmlns:c="urn:xmlast:comment"
                xmlns:nxsl="http://www.w3.org/1999/XSL/TransformAlias"
                xmlns:fn="http://www.w3.org/2005/xpath-functions"
                exclude-result-prefixes="xs fn"
                expand-text="yes">
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:namespace-alias stylesheet-prefix="nxsl" result-prefix="xsl"/>
    <xsl:template match="/*">
        <nxsl:stylesheet version="3.0"
                        expand-text="yes"
                         exclude-result-prefixes="g c"
            >
            <nxsl:strip-space elements="*"/>
            <nxsl:output method="xml" indent="yes"/>
            <xsl:apply-templates select="//g:parserRuleSpec[@simple='true' and not(@terminal)]"/>
            <xsl:apply-templates select="//g:parserRuleSpec[@simple='true' and @terminal = 'true']"/>

            <nxsl:template mode="#all" match="/ | @* | node()">
                <nxsl:copy>
                    <nxsl:apply-templates select="attribute() | node() | comment()" mode="#current"/>
                </nxsl:copy>
            </nxsl:template>
            <nxsl:template mode="#all" match="g:*[count(node()) = 1 and g:*]">
                <nxsl:apply-templates select="element()" mode="#current"/>
            </nxsl:template>
            <nxsl:template match="t:*">
                <t:t>
                    <nxsl:value-of select="."/>
                </t:t>
            </nxsl:template>
            <nxsl:template match="c:*"/>
        </nxsl:stylesheet>
    </xsl:template>

    <xsl:template match="g:parserRuleSpec[@simple='true' and not(@terminal)]">
            <nxsl:template match="g:{@t:RULE_REF}">
                <nxsl:apply-templates/>
            </nxsl:template>
    </xsl:template>
    <xsl:template match="g:parserRuleSpec[@simple='true' and (
            @terminal = 'true'
            or (
                every $rule_name in g:choice/g:rule/@t:RULE_REF satisfies ../g:parserRuleSpec[@t:RULE_REF = $rule_name][@terminal = 'true']
            )
       )]" priority="1">
        <nxsl:template match="g:{@t:RULE_REF}" priority="1">
            <nxsl:copy>
                <xsl:choose>
                    <xsl:when test="@t:RULE_REF ne 'regular_id'">
                        <nxsl:attribute name="n" select="local-name(t:*)"/>
                    </xsl:when>
                </xsl:choose>
                <nxsl:copy-of select="@*"/>
                <nxsl:value-of select="t:*"/>
            </nxsl:copy>
        </nxsl:template>


    </xsl:template>
    <xsl:template match="g:parserRuleSpec"/>


</xsl:stylesheet>


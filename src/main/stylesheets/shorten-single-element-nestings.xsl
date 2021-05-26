<?xml version="1.0" encoding="UTF-8"?>
<!--
shorten-single-element-nestings.xsl

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
    xmlns:g="http://ei.home.xs4all.nl/sql/grammar" 
    xmlns:c="http://ei.home.xs4all.nl/sql/comments"
    xmlns:t="http://ei.home.xs4all.nl/sql/token"
    xmlns="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="xs">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- root -->
    <xsl:template match="/g:sql" priority="1" mode="shorten-single-element-nestings-copy">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="shorten-single-element-nestings-copy"/>
        </xsl:copy>
    </xsl:template>
    <!-- match elements with just a g:* child -->
    <xsl:template match="g:*[count(element()) = 1 and g:*]" mode="shorten-single-element-nestings-copy">
        <xsl:apply-templates select="@* | node()" mode="shorten-single-element-nestings-skip">
            <xsl:with-param name="path" select="(local-name(.))"/>
        </xsl:apply-templates>
    </xsl:template>
    <xsl:template match="g:*[count(element()) = 1 and g:*]" mode="shorten-single-element-nestings-skip">
        <xsl:param name="path" as="xs:string*" select="()"/>
        <xsl:apply-templates select="@* | node()" mode="shorten-single-element-nestings-skip">
            <xsl:with-param name="path" select="($path,local-name(.))" as="xs:string*"/>
        </xsl:apply-templates>
    </xsl:template>
    <xsl:template match="g:*" mode="shorten-single-element-nestings-skip">
        <xsl:param name="path" as="xs:string*" select="()"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:if test="count($path) gt 0">
                <xsl:attribute name="rule-path">
                    <xsl:value-of select="string-join($path,' ')"/>
                </xsl:attribute>
            </xsl:if>
            <!-- reset mode -->
            <xsl:apply-templates select="@* | node()" mode="shorten-single-element-nestings-copy"/>
        </xsl:copy>
    </xsl:template>
    <!-- identity -->
    <xsl:template match="@* | node()" mode="shorten-single-element-nestings-skip">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="@* | node()" mode="shorten-single-element-nestings-copy">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>


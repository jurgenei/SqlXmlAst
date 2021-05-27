<?xml version="1.0" encoding="UTF-8"?>
<!--
sqlxmlast-short-html.xs

Render SQL AST in HTML showing syntax coloring

Jurgen Hildebrand (ei@xs4all.nl)
25052027
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema" version="3.0"
                xmlns:g="http://ei.home.xs4all.nl/sql/grammar"
                xmlns:c="http://ei.home.xs4all.nl/sql/comments"
                xmlns:t="http://ei.home.xs4all.nl/sql/token"
                xmlns:fn="http://www.w3.org/2005/xpath-functions"
                exclude-result-prefixes="xs g c t fn">
    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/g:sql">
        <html>
            <head>
                <link rel="stylesheet" href="../ft-syntax-highlight.css"/>
                <title>
                    <xsl:value-of select="@path"/>
                </title>
            </head>
            <body>
                <div>
                    <pre class="ft-syntax-highlight" data-syntax="python" data-syntax-theme="one-dark">
                        <code>
                            <xsl:apply-templates/>
                        </code>
                    </pre>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="t:*">
        <b>
            <xsl:value-of select="."/>
        </b>
    </xsl:template>
    <!-- <c:WS>\n__</c:WS> -->
    <xsl:template match="c:WS" priority="1">
        <xsl:value-of select="replace(replace(.,'n','&#10;'),'_',' ')"/>
    </xsl:template>
    <xsl:template match="c:*">
        <span class="comment">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="g:regular_id[@object-type='column_name']">
        <span class="property">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="g:regular_id[@object-type='tableview_name']">
        <span class="object">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="g:regular_id[@object-type='column_alias']">
        <span class="identifier-class">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="g:regular_id[@object-type='table_alias']">
        <span class="identifier-sub">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="g:regular_id[@object-type='table_alias_ref']">
        <span class="identifier-native">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="g:regular_id">
        <i>
            <xsl:value-of select="."/>
        </i>
    </xsl:template>
    <!-- by default ignore, process children -->
    <xsl:template match="@*|node()">
        <xsl:apply-templates select="@*|node()"/>
    </xsl:template>
</xsl:stylesheet>


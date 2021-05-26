<?xml version="1.0" encoding="UTF-8"?>
<!--
debug-shorten.xsl

Wrapper Stylesheet to debug shorten-single-element-nestings.xsl
Jurgen Hildebrand (ei@xs4all.nl)
25052021
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema" version="3.0"
                xmlns:g="http://ei.home.xs4all.nl/sql/grammar"
                xmlns="http://www.w3.org/2005/xpath-functions"
                exclude-result-prefixes="xs">
    <!-- processing -->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- imports -->
    <xsl:import href="shorten-single-element-nestings.xsl"/>
    <!-- convert AST trees to JSON -->
    <xsl:template match="/" priority="1">
            <xsl:apply-templates select="@* | g:sql" mode="shorten-single-element-nestings-copy"/>
    </xsl:template>
</xsl:stylesheet>

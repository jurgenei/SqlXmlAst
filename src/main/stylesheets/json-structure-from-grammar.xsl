<?xml version="1.0" encoding="UTF-8"?>
<!--
json-structure-from-grammar.xsl

Combiner/Wrapper stylesheet for
  shorten-single-element-nestings.xsl (compressing AST)
  json-stucture-build.xsl             (Write into JSON representation)

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
    <xsl:import href="json-stucture-build.xsl"/>
    <!-- convert AST trees to JSON -->
    <xsl:template match="/" priority="1">
        <xsl:variable name="shortened" as="node()*">
            <xsl:apply-templates select="@* | g:sql" mode="shorten-single-element-nestings-copy"/>
        </xsl:variable>
        <xsl:apply-templates select="$shortened"/>
    </xsl:template>
</xsl:stylesheet>

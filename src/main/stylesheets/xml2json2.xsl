<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" version="3.0"
    exclude-result-prefixes="xs">
    <xsl:output method="text"/>
    <xsl:strip-space elements="*"/>
    <!-- convert AST trees to JSON -->
    <xsl:template match="/">
        <xsl:variable name="options" select="map { 'indent' : true()}"/>
        <xsl:sequence select="xml-to-json(/, $options)"/>
    </xsl:template>
</xsl:stylesheet>


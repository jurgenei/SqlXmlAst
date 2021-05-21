<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" version="3.0"
    xmlns:g="http://ei.home.xs4all.nl/sql/grammar" 
    xmlns:c="http://ei.home.xs4all.nl/sql/comments"
    xmlns:t="http://ei.home.xs4all.nl/sql/token"
    xmlns="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="xs g c t">
    <!--
    <xsl:output method="json"/> 
    -->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- convert AST trees to JSON -->
    <xsl:template match="/g:sql" priority="1">
        <map xmlns="http://www.w3.org/2005/xpath-functions">
                <map key="head">
                    <xsl:for-each select="@*">
                        <string key="{name(.)}">
                            <xsl:value-of select="."/>
                        </string>
                    </xsl:for-each>
                </map>
                <array key="body">
                    <xsl:apply-templates/>
                </array>
            </map>
    </xsl:template>
    <xsl:template match="t:*">
        <map>
            <string key="class">token</string>
            <xsl:if test="local-name(.) ne .">
                <string key="type">
                    <xsl:value-of select="local-name(.)"/>
                </string>
            </xsl:if>
            <string key="value">
                <xsl:value-of select="."/>
            </string>
        </map>
    </xsl:template>
    <xsl:template match="c:WS">
        <map>
            <string key="whitespace">
                <xsl:value-of select="."/>
            </string>
        </map>
    </xsl:template>
    <xsl:template match="c:*">
        <map>
            <string key="{lower-case(local-name(.))}">
                <xsl:value-of select="."/>
            </string>
        </map>
    </xsl:template>
    <xsl:template match="g:*">
        <map>
            <array key="{local-name(.)}">
                <xsl:apply-templates/>
            </array>
        </map>
    </xsl:template>
    <!-- just have an identity rule for no matches -->
    <xsl:template match="@* | node()">
        <xsl:message>skip: <xsl:value-of select="name(.)"/></xsl:message>
    </xsl:template>
    <!--
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    -->
</xsl:stylesheet>

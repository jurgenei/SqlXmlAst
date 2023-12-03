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
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <xsl:variable name="regular-ids">
            <xsl:apply-templates select="@* | g:ast" mode="regular-ids"/>
        </xsl:variable>

        <xsl:variable name="label-tree" as="node()*">
            <xsl:apply-templates select="$regular-ids" mode="label-tree"/>
        </xsl:variable>
        <xsl:apply-templates select="$label-tree" mode="shorten-single-element-nestings-copy"/>
    </xsl:template>
    <!--
         <regular_id>
         <t:REGULAR_ID>accounting_unit_hierarchy</t:REGULAR_ID>
         </regular_id>

         Make all content of regular_id same, it can contain different t:* tokens
    -->
    <xsl:template match="g:regular_id" mode="regular-ids">
        <regular_id>
            <t:REGULAR_ID>{lower-case(t:*)}</t:REGULAR_ID>
        </regular_id>
        {c:*}
    </xsl:template>

    <!--
         <delimited_id rule-path="column_name identifier id_expression">
         <t:DELIMITED_ID>"PROT_CNT_ASSETS"</t:DELIMITED_ID>
         </delimited_id>
    -->
    <xsl:template match="g:delimited_id" mode="regular-ids">
        <xsl:variable name="var">
            <xsl:analyze-string select="t:DELIMITED_ID" regex="^(.)(.*)(.)$">
                <xsl:matching-substring>{regex-group(2)}</xsl:matching-substring>
                <xsl:non-matching-substring>{.}</xsl:non-matching-substring>
            </xsl:analyze-string>
        </xsl:variable>
        <regular_id flag="delimited">
            <t:REGULAR_ID>{lower-case($var)}</t:REGULAR_ID>
        </regular_id>
        {c:*}
    </xsl:template>
    <xsl:template match="@* | node()" mode="regular-ids">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    <!-- root -->
    <xsl:template match="g:ast" priority="1" mode="shorten-single-element-nestings-copy">
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
    <!-- -->
    <xsl:variable name="candidate_ancestors" select="(
            'table_alias','tableview_name',
            'column_alias','column_name',
            'procedure_name','parameter_name',
            'type_spec','variable_declaration','variable_name',
            'routine_name','execute_immediate','function_argument')" as="xs:string*"/>

    <xsl:template match="@*|node()" mode="label-tree">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="g:regular_id[not(../../following-sibling::g:function_argument)]" mode="label-tree">
        <xsl:copy>
            <xsl:variable name="selected_parent" select="local-name(ancestor::g:*[local-name(.) = $candidate_ancestors][1])"/>
            <xsl:attribute name="object-type">
                <xsl:choose>
                    <xsl:when test="$selected_parent eq 'column_alias'">
                        <xsl:value-of select="'column_alias_def'"/>
                    </xsl:when>
                    <xsl:when test="$selected_parent">
                        <xsl:value-of select="$selected_parent"/>
                    </xsl:when>
                    <xsl:when test="following-sibling::element()[1]/self::t:PERIOD">
                        <xsl:value-of select="'table_alias_ref'"/>
                    </xsl:when>
                    <xsl:when test="ancestor::g:id_expression[1]/following-sibling::element()[1]/self::t:PERIOD">
                        <xsl:value-of select="'table_alias_ref'"/>
                    </xsl:when>
                    <xsl:when test="ancestor::g:identifier[1]/following-sibling::element()[1]/self::t:PERIOD">
                        <xsl:value-of select="'table_alias_ref'"/>
                    </xsl:when>



                    <xsl:when test="ancestor::g:id_expression[1]/preceding-sibling::element()[1]/self::t:PERIOD">
                        <xsl:value-of select="'column_name'"/>
                    </xsl:when>
                    <xsl:when test="ancestor::g:expressions[1]/preceding-sibling::element()[1]/self::t:PERIOD">
                        <xsl:value-of select="'column_name'"/>
                    </xsl:when>
                    <xsl:when test="ancestor::g:label_name">
                        <xsl:value-of select="'column_alias_def'"/>
                    </xsl:when>

                    <!-- TODO: this one is way to generic -->
                    <xsl:when test="ancestor::g:data_manipulation_language_statements[1]">
                        <xsl:value-of select="'column_name'"/>
                    </xsl:when>
                    <!-- TODO: this one is way to generic -->
                    <xsl:when test="ancestor::g:create_view">
                        <xsl:value-of select="'column_name'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="''"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:apply-templates select="@*|node()" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="g:regular_id[../../following-sibling::g:function_argument]" mode="label-tree">
        <xsl:copy>
            <xsl:variable name="selected_parent" select="local-name(ancestor::g:*[local-name(.) = $candidate_ancestors][1])"/>
            <xsl:attribute name="object-type">
                <xsl:choose>
                    <xsl:when test="$selected_parent eq 'column_alias'">
                        <xsl:value-of select="'column_alias_def'"/>
                    </xsl:when>
                    <xsl:when test="$selected_parent">
                        <xsl:value-of select="$selected_parent"/>
                    </xsl:when>
                    <xsl:when test="following-sibling::element()[1]/self::t:PERIOD">
                        <xsl:value-of select="'package_ref'"/>
                    </xsl:when>
                    <xsl:when test="ancestor::g:id_expression[1]/following-sibling::element()[1]/self::t:PERIOD">
                        <xsl:value-of select="'package_ref'"/>
                    </xsl:when>
                    <xsl:when test="ancestor::g:id_expression[1]/preceding-sibling::element()[1]/self::t:PERIOD">
                        <xsl:value-of select="'function_name'"/>
                    </xsl:when>
                    <xsl:when test="ancestor::g:expressions[1]/preceding-sibling::element()[1]/self::t:PERIOD">
                        <xsl:value-of select="'function_name'"/>
                    </xsl:when>
                    <!-- TODO: this one is way to generic -->
                    <xsl:when test="ancestor::g:data_manipulation_language_statements[1]">
                        <xsl:value-of select="'function_name'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="''"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:apply-templates select="@*|node()" mode="#current"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>


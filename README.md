# SqlXmlAst toolkit

[![Travis Status](https://api.travis-ci.org/jurgenei/SqlXmlAst.png)](https://travis-ci.org/jurgenei/SqlXmlAst)

SqlXmlAst is a toolkit to parse Oracle and Sybase SQL and generate 
Abstact Syntax Trees (in short AST) in either XML or JSON format.

To facilitate batch conversion an ant task is included, which can be 
called as follows:

```xml
<project name="test.sqlxmlast">    
    <taskdef name="sqlxmlast" classname="nl.xs4all.home.ei.parsers.antlr.SqlXmlAstAntTask"
             classpath="${test_classpath}"/>
    <target name="testOracle">
        <sqlxmlast grammar="oracle"
                   basedir="examples/plsql"
                   destdir="target/sqlxmlast/plsql">
            <filename name="**/*.sql"/>
        </sqlxmlast>
    </target>
    <target name="testSybase">
        <sqlxmlast grammar="sybase"
                   basedir="examples/tsql"
                   destdir="target/sqlxmlast/tsql">
            <filename name="**/*.sql"/>
        </sqlxmlast>
    </target>
</project>
```
Taking example SQL:
```roomsql
/* simple table alias - self join
   from: https://www.oracletutorial.com/oracle-basics/oracle-alias/ */
SELECT e.first_name employee, m.first_name managerdir
FROM   employees e
INNER
JOIN   employees m
ON     m.employee_id = e.employee_id;
```
XmlSqlASt can generate XML:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<sql xmlns="http://ei.home.xs4all.nl/sql/grammar"
     xmlns:c="http://ei.home.xs4all.nl/sql/comments"
     xmlns:t="http://ei.home.xs4all.nl/sql/token"
     grammar="oracle"
     path="plsql_alias_table1.sql"
     numlines="6">
   <c:MULTI_LINE_COMMENT>/* simple table alias - self join
   from: https://www.oracletutorial.com/oracle-basics/oracle-alias/ */</c:MULTI_LINE_COMMENT>
   <script>
      <c:WS>\n</c:WS>
      <query_block rule-path="unit_statement data_manipulation_language_statements select_statement subquery subquery_basic_elements">
         <selector>
            <t:SELECT>SELECT</t:SELECT>
         </selector>
         <c:WS>_</c:WS>
         <selected_element>
            <select_list_elements>
               <regular_id>
                  <t:REGULAR_ID>e</t:REGULAR_ID>
               </regular_id>
               <t:PERIOD>.</t:PERIOD>
               <regular_id rule-path="expressions expression logical_expression multiset_expression relational_expression compound_expression concatenation model_expression unary_expression atom general_element general_element_part id_expression">
                  <t:REGULAR_ID>first_name</t:REGULAR_ID>
               </regular_id>
            </select_list_elements>
            <c:WS>_</c:WS>
            <regular_id rule-path="column_alias identifier id_expression">
               <t:REGULAR_ID>employee</t:REGULAR_ID>
            </regular_id>
         </selected_element>
         <t:COMMA>,</t:COMMA>
         <c:WS>_</c:WS>
         <selected_element>
            <select_list_elements>
               <regular_id>
                  <t:REGULAR_ID>m</t:REGULAR_ID>
               </regular_id>
               <t:PERIOD>.</t:PERIOD>
               <regular_id rule-path="expressions expression logical_expression multiset_expression relational_expression compound_expression concatenation model_expression unary_expression atom general_element general_element_part id_expression">
                  <t:REGULAR_ID>first_name</t:REGULAR_ID>
               </regular_id>
            </select_list_elements>
            <c:WS>_</c:WS>
            <regular_id rule-path="column_alias identifier id_expression">
               <t:REGULAR_ID>managerdir</t:REGULAR_ID>
            </regular_id>
         </selected_element>
         <c:WS>\n</c:WS>
         <from_clause>
            <t:FROM>FROM</t:FROM>
            <c:WS>___</c:WS>
            <table_ref rule-path="table_ref_list">
               <table_ref_aux>
                  <regular_id rule-path="table_ref_aux_internal dml_table_expression_clause tableview_name identifier id_expression">
                     <t:REGULAR_ID>employees</t:REGULAR_ID>
                  </regular_id>
                  <c:WS>_</c:WS>
                  <regular_id rule-path="table_alias identifier id_expression">
                     <t:REGULAR_ID>e</t:REGULAR_ID>
                  </regular_id>
               </table_ref_aux>
               <c:WS>\n</c:WS>
               <join_clause>
                  <t:INNER>INNER</t:INNER>
                  <t:JOIN>JOIN</t:JOIN>
                  <c:WS>___</c:WS>
                  <table_ref_aux>
                     <regular_id rule-path="table_ref_aux_internal dml_table_expression_clause tableview_name identifier id_expression">
                        <t:REGULAR_ID>employees</t:REGULAR_ID>
                     </regular_id>
                     <c:WS>_</c:WS>
                     <regular_id rule-path="table_alias identifier id_expression">
                        <t:REGULAR_ID>m</t:REGULAR_ID>
                     </regular_id>
                  </table_ref_aux>
                  <c:WS>\n</c:WS>
                  <join_on_part>
                     <t:ON>ON</t:ON>
                     <c:WS>_____</c:WS>
                     <relational_expression rule-path="condition expression logical_expression multiset_expression">
                        <general_element_part rule-path="relational_expression compound_expression concatenation model_expression unary_expression atom general_element">
                           <regular_id rule-path="id_expression">
                              <t:REGULAR_ID>m</t:REGULAR_ID>
                           </regular_id>
                           <t:PERIOD>.</t:PERIOD>
                           <regular_id rule-path="id_expression">
                              <t:REGULAR_ID>employee_id</t:REGULAR_ID>
                           </regular_id>
                        </general_element_part>
                        <c:WS>_</c:WS>
                        <relational_operator>
                           <t:EQUALS_OP>=</t:EQUALS_OP>
                        </relational_operator>
                        <c:WS>_</c:WS>
                        <general_element_part rule-path="relational_expression compound_expression concatenation model_expression unary_expression atom general_element">
                           <regular_id rule-path="id_expression">
                              <t:REGULAR_ID>e</t:REGULAR_ID>
                           </regular_id>
                           <t:PERIOD>.</t:PERIOD>
                           <regular_id rule-path="id_expression">
                              <t:REGULAR_ID>employee_id</t:REGULAR_ID>
                           </regular_id>
                        </general_element_part>
                     </relational_expression>
                  </join_on_part>
               </join_clause>
            </table_ref>
         </from_clause>
      </query_block>
      <t:SEMICOLON>;</t:SEMICOLON>
   </script>
</sql>
```
Additional styling can be applied to generate JSON using included XSLT stylesheets:  
```json

  { "head" : 
    { "grammar" : "oracle",
      "path" : "plsql_alias_table1.sql",
      "numlines" : "6" },
    "body" : 
    [ 
      { "multi_line_comment" : "\/* simple table alias - self join\n   from: https:\/\/www.oracletutorial.com\/oracle-basics\/oracle-alias\/ *\/" },
      
      { "script" : 
        [ 
          { "whitespace" : "\\n" },
          
          { "rule-path" : "unit_statement data_manipulation_language_statements select_statement subquery subquery_basic_elements",
            "query_block" : 
            [ 
              { "selector" : 
                [ 
                  { "class" : "token",
                    "value" : "SELECT" } ] },
              
              { "whitespace" : "_" },
              
              { "selected_element" : 
                [ 
                  { "select_list_elements" : 
                    [ 
                      { "regular_id" : 
                        [ 
                          { "class" : "token",
                            "type" : "REGULAR_ID",
                            "value" : "e" } ] },
                      
                      { "class" : "token",
                        "type" : "PERIOD",
                        "value" : "." },
                      
                      { "rule-path" : "expressions expression logical_expression multiset_expression relational_expression compound_expression concatenation model_expression unary_expression atom general_element general_element_part id_expression",
                        "regular_id" : 
                        [ 
                          { "class" : "token",
                            "type" : "REGULAR_ID",
                            "value" : "first_name" } ] } ] },
                  
                  { "whitespace" : "_" },
                  
                  { "rule-path" : "column_alias identifier id_expression",
                    "regular_id" : 
                    [ 
                      { "class" : "token",
                        "type" : "REGULAR_ID",
                        "value" : "employee" } ] } ] },
              
              { "class" : "token",
                "type" : "COMMA",
                "value" : "," },
              
              { "whitespace" : "_" },
              
              { "selected_element" : 
                [ 
                  { "select_list_elements" : 
                    [ 
                      { "regular_id" : 
                        [ 
                          { "class" : "token",
                            "type" : "REGULAR_ID",
                            "value" : "m" } ] },
                      
                      { "class" : "token",
                        "type" : "PERIOD",
                        "value" : "." },
                      
                      { "rule-path" : "expressions expression logical_expression multiset_expression relational_expression compound_expression concatenation model_expression unary_expression atom general_element general_element_part id_expression",
                        "regular_id" : 
                        [ 
                          { "class" : "token",
                            "type" : "REGULAR_ID",
                            "value" : "first_name" } ] } ] },
                  
                  { "whitespace" : "_" },
                  
                  { "rule-path" : "column_alias identifier id_expression",
                    "regular_id" : 
                    [ 
                      { "class" : "token",
                        "type" : "REGULAR_ID",
                        "value" : "managerdir" } ] } ] },
              
              { "whitespace" : "\\n" },
              
              { "from_clause" : 
                [ 
                  { "class" : "token",
                    "value" : "FROM" },
                  
                  { "whitespace" : "___" },
                  
                  { "rule-path" : "table_ref_list",
                    "table_ref" : 
                    [ 
                      { "table_ref_aux" : 
                        [ 
                          { "rule-path" : "table_ref_aux_internal dml_table_expression_clause tableview_name identifier id_expression",
                            "regular_id" : 
                            [ 
                              { "class" : "token",
                                "type" : "REGULAR_ID",
                                "value" : "employees" } ] },
                          
                          { "whitespace" : "_" },
                          
                          { "rule-path" : "table_alias identifier id_expression",
                            "regular_id" : 
                            [ 
                              { "class" : "token",
                                "type" : "REGULAR_ID",
                                "value" : "e" } ] } ] },
                      
                      { "whitespace" : "\\n" },
                      
                      { "join_clause" : 
                        [ 
                          { "class" : "token",
                            "value" : "INNER" },
                          
                          { "class" : "token",
                            "value" : "JOIN" },
                          
                          { "whitespace" : "___" },
                          
                          { "table_ref_aux" : 
                            [ 
                              { "rule-path" : "table_ref_aux_internal dml_table_expression_clause tableview_name identifier id_expression",
                                "regular_id" : 
                                [ 
                                  { "class" : "token",
                                    "type" : "REGULAR_ID",
                                    "value" : "employees" } ] },
                              
                              { "whitespace" : "_" },
                              
                              { "rule-path" : "table_alias identifier id_expression",
                                "regular_id" : 
                                [ 
                                  { "class" : "token",
                                    "type" : "REGULAR_ID",
                                    "value" : "m" } ] } ] },
                          
                          { "whitespace" : "\\n" },
                          
                          { "join_on_part" : 
                            [ 
                              { "class" : "token",
                                "value" : "ON" },
                              
                              { "whitespace" : "_____" },
                              
                              { "rule-path" : "condition expression logical_expression multiset_expression",
                                "relational_expression" : 
                                [ 
                                  { "rule-path" : "relational_expression compound_expression concatenation model_expression unary_expression atom general_element",
                                    "general_element_part" : 
                                    [ 
                                      { "rule-path" : "id_expression",
                                        "regular_id" : 
                                        [ 
                                          { "class" : "token",
                                            "type" : "REGULAR_ID",
                                            "value" : "m" } ] },
                                      
                                      { "class" : "token",
                                        "type" : "PERIOD",
                                        "value" : "." },
                                      
                                      { "rule-path" : "id_expression",
                                        "regular_id" : 
                                        [ 
                                          { "class" : "token",
                                            "type" : "REGULAR_ID",
                                            "value" : "employee_id" } ] } ] },
                                  
                                  { "whitespace" : "_" },
                                  
                                  { "relational_operator" : 
                                    [ 
                                      { "class" : "token",
                                        "type" : "EQUALS_OP",
                                        "value" : "=" } ] },
                                  
                                  { "whitespace" : "_" },
                                  
                                  { "rule-path" : "relational_expression compound_expression concatenation model_expression unary_expression atom general_element",
                                    "general_element_part" : 
                                    [ 
                                      { "rule-path" : "id_expression",
                                        "regular_id" : 
                                        [ 
                                          { "class" : "token",
                                            "type" : "REGULAR_ID",
                                            "value" : "e" } ] },
                                      
                                      { "class" : "token",
                                        "type" : "PERIOD",
                                        "value" : "." },
                                      
                                      { "rule-path" : "id_expression",
                                        "regular_id" : 
                                        [ 
                                          { "class" : "token",
                                            "type" : "REGULAR_ID",
                                            "value" : "employee_id" } ] } ] } ] } ] } ] } ] } ] } ] },
          
          { "class" : "token",
            "type" : "SEMICOLON",
            "value" : ";" } ] } ] }
```
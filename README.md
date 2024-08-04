# SqlXmlAst toolkit


SqlXmlAst is a toolkit to parse Oracle and Sybase SQL and generate 
Abstact Syntax Trees (in short AST) in XML.

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
```sql
/* simple table alias - self join
   from: https://www.oracletutorial.com/oracle-basics/oracle-alias/ */
SELECT e.first_name employee, m.first_name managerdir
FROM   employees e
INNER
JOIN   employees m
ON     m.employee_id = e.employee_id;
```
XmlSqlAst generates from this AST in XML:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ast xmlns="urn:xmlast:grammar" xmlns:c="urn:xmlast:comment" xmlns:t="urn:xmlast:token" grammar="oracle" path="plsql_alias_table1.sql" numlines="6">
    <c:MULTI_LINE_COMMENT>/* simple table alias - self join
        from: https://www.oracletutorial.com/oracle-basics/oracle-alias/ */</c:MULTI_LINE_COMMENT>
    <script>
        <c:WS>n</c:WS>
        <unit_statement>
            <data_manipulation_language_statements>
                <select_statement>
                    <select_only_statement>
                        <subquery>
                            <subquery_basic_elements>
                                <query_block>
                                    <t:SELECT>SELECT</t:SELECT>
                                    <c:WS>_</c:WS>
                                    <selected_list>
                                        <select_list_elements>
                                            <expression>
                                                <logical_expression>
                                                    <unary_logical_expression>
                                                        <multiset_expression>
                                                            <relational_expression>
                                                                <compound_expression>
                                                                    <concatenation>
                                                                        <model_expression>
                                                                            <unary_expression>
                                                                                <atom>
                                                                                    <general_element>
                                                                                        <general_element>
                                                                                            <general_element_part>
                                                                                                <id_expression>
                                                                                                    <regular_id>
                                                                                                        <t:E_>e</t:E_>
                                                                                                    </regular_id>
                                                                                                </id_expression>
                                                                                            </general_element_part>
                                                                                        </general_element>
                                                                                        <t:PERIOD>.</t:PERIOD>
                                                                                        <general_element_part>
                                                                                            <id_expression>
                                                                                                <regular_id>
                                                                                                    <t:REGULAR_ID>first_name</t:REGULAR_ID>
                                                                                                </regular_id>
                                                                                            </id_expression>
                                                                                        </general_element_part>
                                                                                    </general_element>
                                                                                </atom>
                                                                            </unary_expression>
                                                                        </model_expression>
                                                                    </concatenation>
                                                                </compound_expression>
                                                            </relational_expression>
                                                        </multiset_expression>
                                                    </unary_logical_expression>
                                                </logical_expression>
                                            </expression>
                                            <c:WS>_</c:WS>
                                            <column_alias>
                                                <identifier>
                                                    <id_expression>
                                                        <regular_id>
                                                            <t:REGULAR_ID>employee</t:REGULAR_ID>
                                                        </regular_id>
                                                    </id_expression>
                                                </identifier>
                                            </column_alias>
                                        </select_list_elements>
                                        <t:COMMA>,</t:COMMA>
                                        <c:WS>_</c:WS>
                                        <select_list_elements>
                                            <expression>
                                                <logical_expression>
                                                    <unary_logical_expression>
                                                        <multiset_expression>
                                                            <relational_expression>
                                                                <compound_expression>
                                                                    <concatenation>
                                                                        <model_expression>
                                                                            <unary_expression>
                                                                                <atom>
                                                                                    <general_element>
                                                                                        <general_element>
                                                                                            <general_element_part>
                                                                                                <id_expression>
                                                                                                    <regular_id>
                                                                                                        <t:M_>m</t:M_>
                                                                                                    </regular_id>
                                                                                                </id_expression>
                                                                                            </general_element_part>
                                                                                        </general_element>
                                                                                        <t:PERIOD>.</t:PERIOD>
                                                                                        <general_element_part>
                                                                                            <id_expression>
                                                                                                <regular_id>
                                                                                                    <t:REGULAR_ID>first_name</t:REGULAR_ID>
                                                                                                </regular_id>
                                                                                            </id_expression>
                                                                                        </general_element_part>
                                                                                    </general_element>
                                                                                </atom>
                                                                            </unary_expression>
                                                                        </model_expression>
                                                                    </concatenation>
                                                                </compound_expression>
                                                            </relational_expression>
                                                        </multiset_expression>
                                                    </unary_logical_expression>
                                                </logical_expression>
                                            </expression>
                                            <c:WS>_</c:WS>
                                            <column_alias>
                                                <identifier>
                                                    <id_expression>
                                                        <regular_id>
                                                            <t:REGULAR_ID>managerdir</t:REGULAR_ID>
                                                        </regular_id>
                                                    </id_expression>
                                                </identifier>
                                            </column_alias>
                                        </select_list_elements>
                                    </selected_list>
                                    <c:WS>n</c:WS>
                                    <from_clause>
                                        <t:FROM>FROM</t:FROM>
                                        <c:WS>___</c:WS>
                                        <table_ref_list>
                                            <table_ref>
                                                <table_ref_aux>
                                                    <table_ref_aux_internal>
                                                        <dml_table_expression_clause>
                                                            <tableview_name>
                                                                <dot_expression>
                                                                    <identifier>
                                                                        <id_expression>
                                                                            <regular_id>
                                                                                <t:REGULAR_ID>employees</t:REGULAR_ID>
                                                                            </regular_id>
                                                                        </id_expression>
                                                                    </identifier>
                                                                </dot_expression>
                                                            </tableview_name>
                                                        </dml_table_expression_clause>
                                                    </table_ref_aux_internal>
                                                    <c:WS>_</c:WS>
                                                    <table_alias>
                                                        <identifier>
                                                            <id_expression>
                                                                <regular_id>
                                                                    <t:E_>e</t:E_>
                                                                </regular_id>
                                                            </id_expression>
                                                        </identifier>
                                                    </table_alias>
                                                </table_ref_aux>
                                                <c:WS>n</c:WS>
                                                <join_clause>
                                                    <t:INNER>INNER</t:INNER>
                                                    <c:WS>n</c:WS>
                                                    <t:JOIN>JOIN</t:JOIN>
                                                    <c:WS>___</c:WS>
                                                    <table_ref_aux>
                                                        <table_ref_aux_internal>
                                                            <dml_table_expression_clause>
                                                                <tableview_name>
                                                                    <dot_expression>
                                                                        <identifier>
                                                                            <id_expression>
                                                                                <regular_id>
                                                                                    <t:REGULAR_ID>employees</t:REGULAR_ID>
                                                                                </regular_id>
                                                                            </id_expression>
                                                                        </identifier>
                                                                    </dot_expression>
                                                                </tableview_name>
                                                            </dml_table_expression_clause>
                                                        </table_ref_aux_internal>
                                                        <c:WS>_</c:WS>
                                                        <table_alias>
                                                            <identifier>
                                                                <id_expression>
                                                                    <regular_id>
                                                                        <t:M_>m</t:M_>
                                                                    </regular_id>
                                                                </id_expression>
                                                            </identifier>
                                                        </table_alias>
                                                    </table_ref_aux>
                                                    <c:WS>n</c:WS>
                                                    <join_on_part>
                                                        <t:ON>ON</t:ON>
                                                        <c:WS>_____</c:WS>
                                                        <condition>
                                                            <expression>
                                                                <logical_expression>
                                                                    <unary_logical_expression>
                                                                        <multiset_expression>
                                                                            <relational_expression>
                                                                                <relational_expression>
                                                                                    <compound_expression>
                                                                                        <concatenation>
                                                                                            <model_expression>
                                                                                                <unary_expression>
                                                                                                    <atom>
                                                                                                        <general_element>
                                                                                                            <general_element>
                                                                                                                <general_element_part>
                                                                                                                    <id_expression>
                                                                                                                        <regular_id>
                                                                                                                            <t:M_>m</t:M_>
                                                                                                                        </regular_id>
                                                                                                                    </id_expression>
                                                                                                                </general_element_part>
                                                                                                            </general_element>
                                                                                                            <t:PERIOD>.</t:PERIOD>
                                                                                                            <general_element_part>
                                                                                                                <id_expression>
                                                                                                                    <regular_id>
                                                                                                                        <t:REGULAR_ID>employee_id</t:REGULAR_ID>
                                                                                                                    </regular_id>
                                                                                                                </id_expression>
                                                                                                            </general_element_part>
                                                                                                        </general_element>
                                                                                                    </atom>
                                                                                                </unary_expression>
                                                                                            </model_expression>
                                                                                        </concatenation>
                                                                                    </compound_expression>
                                                                                </relational_expression>
                                                                                <c:WS>_</c:WS>
                                                                                <relational_operator>
                                                                                    <t:EQUALS_OP>=</t:EQUALS_OP>
                                                                                </relational_operator>
                                                                                <c:WS>_</c:WS>
                                                                                <relational_expression>
                                                                                    <compound_expression>
                                                                                        <concatenation>
                                                                                            <model_expression>
                                                                                                <unary_expression>
                                                                                                    <atom>
                                                                                                        <general_element>
                                                                                                            <general_element>
                                                                                                                <general_element_part>
                                                                                                                    <id_expression>
                                                                                                                        <regular_id>
                                                                                                                            <t:E_>e</t:E_>
                                                                                                                        </regular_id>
                                                                                                                    </id_expression>
                                                                                                                </general_element_part>
                                                                                                            </general_element>
                                                                                                            <t:PERIOD>.</t:PERIOD>
                                                                                                            <general_element_part>
                                                                                                                <id_expression>
                                                                                                                    <regular_id>
                                                                                                                        <t:REGULAR_ID>employee_id</t:REGULAR_ID>
                                                                                                                    </regular_id>
                                                                                                                </id_expression>
                                                                                                            </general_element_part>
                                                                                                        </general_element>
                                                                                                    </atom>
                                                                                                </unary_expression>
                                                                                            </model_expression>
                                                                                        </concatenation>
                                                                                    </compound_expression>
                                                                                </relational_expression>
                                                                            </relational_expression>
                                                                        </multiset_expression>
                                                                    </unary_logical_expression>
                                                                </logical_expression>
                                                            </expression>
                                                        </condition>
                                                    </join_on_part>
                                                </join_clause>
                                            </table_ref>
                                        </table_ref_list>
                                    </from_clause>
                                </query_block>
                            </subquery_basic_elements>
                        </subquery>
                    </select_only_statement>
                </select_statement>
            </data_manipulation_language_statements>
        </unit_statement>
        <t:SEMICOLON>;</t:SEMICOLON>
    </script>
</ast>
```
As this is a bit verbose, by applying a xslt stylesheet it can be shortened to:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ast xmlns="urn:xmlast:grammar"
     xmlns:c="urn:xmlast:comment"
     xmlns:t="urn:xmlast:token"
     grammar="oracle"
     path="plsql_alias_table1.sql"
     numlines="6">
   <c:MULTI_LINE_COMMENT>/* simple table alias - self join
   from: https://www.oracletutorial.com/oracle-basics/oracle-alias/ */</c:MULTI_LINE_COMMENT>
   <script>
      <unit_statement path-ref="d569e5">
         <t:t>SELECT</t:t>
         <selected_list>
            <select_list_elements>
               <expression path-ref="d569e10">
                  <general_element path-ref="d569e11">
                     <regular_id>e</regular_id>
                  </general_element>
                  <t:t>.</t:t>
                  <general_element_part path-ref="d569e14">
                     <regular_id>first_name</regular_id>
                  </general_element_part>
               </expression>
               <column_alias path-ref="d569e17">
                  <regular_id>employee</regular_id>
               </column_alias>
            </select_list_elements>
            <t:t>,</t:t>
            <select_list_elements>
               <expression path-ref="d569e10">
                  <general_element path-ref="d569e11">
                     <regular_id>m</regular_id>
                  </general_element>
                  <t:t>.</t:t>
                  <general_element_part path-ref="d569e14">
                     <regular_id>first_name</regular_id>
                  </general_element_part>
               </expression>
               <column_alias path-ref="d569e17">
                  <regular_id>managerdir</regular_id>
               </column_alias>
            </select_list_elements>
         </selected_list>
         <from_clause>
            <t:t>FROM</t:t>
            <table_ref_list>
               <table_ref_aux>
                  <table_ref_aux_internal path-ref="d569e37">
                     <regular_id>employees</regular_id>
                  </table_ref_aux_internal>
                  <table_alias path-ref="d569e17">
                     <regular_id>e</regular_id>
                  </table_alias>
               </table_ref_aux>
               <join_clause>
                  <t:t>INNER</t:t>
                  <t:t>JOIN</t:t>
                  <table_ref_aux>
                     <table_ref_aux_internal path-ref="d569e37">
                        <regular_id>employees</regular_id>
                     </table_ref_aux_internal>
                     <table_alias path-ref="d569e17">
                        <regular_id>m</regular_id>
                     </table_alias>
                  </table_ref_aux>
                  <join_on_part>
                     <t:t>ON</t:t>
                     <condition path-ref="d569e58">
                        <relational_expression path-ref="d569e59">
                           <general_element path-ref="d569e11">
                              <regular_id>m</regular_id>
                           </general_element>
                           <t:t>.</t:t>
                           <general_element_part path-ref="d569e14">
                              <regular_id>employee_id</regular_id>
                           </general_element_part>
                        </relational_expression>
                        <relational_operator>
                           <t:t>=</t:t>
                        </relational_operator>
                        <relational_expression path-ref="d569e59">
                           <general_element path-ref="d569e11">
                              <regular_id>e</regular_id>
                           </general_element>
                           <t:t>.</t:t>
                           <general_element_part path-ref="d569e14">
                              <regular_id>employee_id</regular_id>
                           </general_element_part>
                        </relational_expression>
                     </condition>
                  </join_on_part>
               </join_clause>
            </table_ref_list>
         </from_clause>
      </unit_statement>
      <t:t>;</t:t>
   </script>
   <path-map>
      <entry path="compound_expression/concatenation/model_expression/unary_expression/atom"
             path-def="d569e59"/>
      <entry path="data_manipulation_language_statements/select_statement/select_only_statement/subquery/subquery_basic_elements"
             path-def="d569e5"/>
      <entry path="dml_table_expression_clause/tableview_name/dot_expression/identifier/id_expression"
             path-def="d569e37"/>
      <entry path="expression/logical_expression/unary_logical_expression/multiset_expression"
             path-def="d569e58"/>
      <entry path="general_element_part/id_expression" path-def="d569e11"/>
      <entry path="id_expression" path-def="d569e14"/>
      <entry path="identifier/id_expression" path-def="d569e17"/>
      <entry path="logical_expression/unary_logical_expression/multiset_expression/relational_expression/compound_expression/concatenation/model_expression/unary_expression/atom"
             path-def="d569e10"/>
   </path-map>
</ast>
```
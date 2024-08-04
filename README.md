# SqlXmlAst toolkit


SqlXmlAst is a toolkit to parse Oracle PlSql and generate 
Abstract Syntax Trees in XML.

As PlSql is a quite big language with many grammar rules, the resulting
syntax trees are quite big even for the simplest queries.

To shorten the syntax trees a xslt3 stylesheet is used to post process
raw syntax trees into a shorter form which is much more suitable for
human consumption as well for further processing.

example SQL:

```sql
/* simple table alias - self join
   from: https://www.oracletutorial.com/oracle-basics/oracle-alias/ */
SELECT e.first_name employee, m.first_name managerdir
FROM   employees e
INNER
JOIN   employees m
ON     m.employee_id = e.employee_id;
```

The AST short form looks still a bit verbose, however from its form
you can still tell which production rules in the [grammar](src/main/antlr4/nl/xs4all/home/ei/parsers/antlr/PlSqlParser.g4) are applied.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ast xmlns="urn:xmlast:grammar"
     xmlns:c="urn:xmlast:comment"
     xmlns:t="urn:xmlast:token"
     grammar="oracle"
     path="plsql_alias_table1.sql"
     numlines="6">
    <q>/* simple table alias - self join
        from: https://www.oracletutorial.com/oracle-basics/oracle-alias/ */</q>
    <script>
        <q>n</q>
        <unit_statement path-ref="d725e6">
            <b>SELECT</b>
            <q>_</q>
            <selected_list>
                <select_list_elements>
                    <expression path-ref="d725e11">
                        <general_element path-ref="d725e12">
                            <regular_id>
                                <i val="e">e</i>
                            </regular_id>
                        </general_element>
                        <b>.</b>
                        <general_element_part path-ref="d725e17">
                            <regular_id>
                                <i val="first_name">first_name</i>
                            </regular_id>
                        </general_element_part>
                    </expression>
                    <q>_</q>
                    <column_alias path-ref="d725e22">
                        <regular_id>
                            <i val="employee">employee</i>
                        </regular_id>
                    </column_alias>
                </select_list_elements>
                <b>,</b>
                <q>_</q>
                <select_list_elements>
                    <expression path-ref="d725e11">
                        <general_element path-ref="d725e12">
                            <regular_id>
                                <i val="m">m</i>
                            </regular_id>
                        </general_element>
                        <b>.</b>
                        <general_element_part path-ref="d725e17">
                            <regular_id>
                                <i val="first_name">first_name</i>
                            </regular_id>
                        </general_element_part>
                    </expression>
                    <q>_</q>
                    <column_alias path-ref="d725e22">
                        <regular_id>
                            <i val="managerdir">managerdir</i>
                        </regular_id>
                    </column_alias>
                </select_list_elements>
            </selected_list>
            <q>n</q>
            <from_clause>
                <b>FROM</b>
                <q>___</q>
                <table_ref_list>
                    <table_ref_aux>
                        <table_ref_aux_internal path-ref="d725e50">
                            <regular_id>
                                <i val="employees">employees</i>
                            </regular_id>
                        </table_ref_aux_internal>
                        <q>_</q>
                        <table_alias path-ref="d725e22">
                            <regular_id>
                                <i val="e">e</i>
                            </regular_id>
                        </table_alias>
                    </table_ref_aux>
                    <q>n</q>
                    <join_clause>
                        <b>INNER</b>
                        <q>n</q>
                        <b>JOIN</b>
                        <q>___</q>
                        <table_ref_aux>
                            <table_ref_aux_internal path-ref="d725e50">
                                <regular_id>
                                    <i val="employees">employees</i>
                                </regular_id>
                            </table_ref_aux_internal>
                            <q>_</q>
                            <table_alias path-ref="d725e22">
                                <regular_id>
                                    <i val="m">m</i>
                                </regular_id>
                            </table_alias>
                        </table_ref_aux>
                        <q>n</q>
                        <join_on_part>
                            <b>ON</b>
                            <q>_____</q>
                            <condition path-ref="d725e79">
                                <relational_expression path-ref="d725e80">
                                    <general_element path-ref="d725e12">
                                        <regular_id>
                                            <i val="m">m</i>
                                        </regular_id>
                                    </general_element>
                                    <b>.</b>
                                    <general_element_part path-ref="d725e17">
                                        <regular_id>
                                            <i val="employee_id">employee_id</i>
                                        </regular_id>
                                    </general_element_part>
                                </relational_expression>
                                <q>_</q>
                                <relational_operator>
                                    <b>=</b>
                                </relational_operator>
                                <q>_</q>
                                <relational_expression path-ref="d725e80">
                                    <general_element path-ref="d725e12">
                                        <regular_id>
                                            <i val="e">e</i>
                                        </regular_id>
                                    </general_element>
                                    <b>.</b>
                                    <general_element_part path-ref="d725e17">
                                        <regular_id>
                                            <i val="employee_id">employee_id</i>
                                        </regular_id>
                                    </general_element_part>
                                </relational_expression>
                            </condition>
                        </join_on_part>
                    </join_clause>
                </table_ref_list>
            </from_clause>
        </unit_statement>
        <b>;</b>
    </script>
    <path-map>
        <entry path="compound_expression/concatenation/model_expression/unary_expression/atom"
               path-def="d725e80"/>
        <entry path="data_manipulation_language_statements/select_statement/select_only_statement/subquery/subquery_basic_elements"
               path-def="d725e6"/>
        <entry path="dml_table_expression_clause/tableview_name/dot_expression/identifier/id_expression"
               path-def="d725e50"/>
        <entry path="expression/logical_expression/unary_logical_expression/multiset_expression"
               path-def="d725e79"/>
        <entry path="general_element_part/id_expression" path-def="d725e12"/>
        <entry path="id_expression" path-def="d725e17"/>
        <entry path="identifier/id_expression" path-def="d725e22"/>
        <entry path="logical_expression/unary_logical_expression/multiset_expression/relational_expression/compound_expression/concatenation/model_expression/unary_expression/atom"
               path-def="d725e11"/>
    </path-map>
</ast>
```
Notes:
* path-refs are used to compress nested rule elements which only contain one child.
* html elements are used for terminals
** b for sql language tokens
** i for  id expressions
** q for whitespace (_ is space, t is tab, n is new line, r is cariage return)

# ant

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
</project>
```



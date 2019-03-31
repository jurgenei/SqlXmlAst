package com.ing.vortex.parsers.antlr;

import javax.xml.stream.XMLStreamWriter;
import java.util.List;

public class PlSqlWriter extends PlSqlParserBaseListener implements XmlWriterInterface {
    XMLStreamWriter xmlStreamWriter = null;
    List<String> ruleNames = null;

    PlSqlWriter(XMLStreamWriter xmlStreamWriter, List<String> ruleNames) {
        setXmlStreamWriter(xmlStreamWriter);
        setRuleNames(ruleNames);
    }

    public void setXmlStreamWriter(XMLStreamWriter s) {
        xmlStreamWriter = s;
    }

    public XMLStreamWriter getXmlStreamWriter() {
        return xmlStreamWriter;
    }

    public void setRuleNames(List<String> stringList) {
        ruleNames = stringList;
    }

    public List<String> getRuleNames() {
        return ruleNames;
    }

}

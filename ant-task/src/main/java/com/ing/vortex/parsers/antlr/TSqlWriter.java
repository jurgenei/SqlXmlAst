package com.ing.vortex.parsers.antlr;

import javax.xml.stream.XMLStreamWriter;
import java.util.List;

public class TSqlWriter extends TSqlParserBaseListener implements XmlWriterInterface {
    XMLStreamWriter xmlStreamWriter;
    List<String> ruleNames;

    TSqlWriter(XMLStreamWriter xmlStreamWriter, List<String> ruleNames) {
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

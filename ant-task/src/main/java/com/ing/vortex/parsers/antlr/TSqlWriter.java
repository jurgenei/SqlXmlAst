package com.ing.vortex.parsers.antlr;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ErrorNode;
import org.antlr.v4.runtime.tree.TerminalNode;

import javax.xml.stream.XMLStreamException;
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

    public void enterEveryRule(ParserRuleContext ctx) {
        try {
            getXmlStreamWriter().writeStartElement(extractRuleName(ctx));
        } catch (XMLStreamException e) {
            e.printStackTrace();
        }
    }

    public void exitEveryRule(ParserRuleContext ctx) {
        try {
            getXmlStreamWriter().writeEndElement();
        } catch (XMLStreamException e) {
            e.printStackTrace();
        }
    }

    public void visitTerminal(TerminalNode node) {
        try {
            XMLStreamWriter s = getXmlStreamWriter();
            s.writeStartElement("t");
            s.writeCharacters(node.getText());
            s.writeEndElement();
        } catch (XMLStreamException e) {
            e.printStackTrace();
        }
    }

    public void visitErrorNode(ErrorNode node) {
        try {
            XMLStreamWriter s = getXmlStreamWriter();
            s.writeStartElement("error");
            s.writeCharacters(node.getText());
            s.writeEndElement();
        } catch (XMLStreamException e) {
            e.printStackTrace();
        }
    }
}

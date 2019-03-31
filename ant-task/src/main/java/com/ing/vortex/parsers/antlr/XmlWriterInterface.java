package com.ing.vortex.parsers.antlr;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ErrorNode;
import org.antlr.v4.runtime.tree.TerminalNode;

import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamWriter;
import java.util.List;

public interface XmlWriterInterface {

    abstract public void setXmlStreamWriter(XMLStreamWriter s);
    abstract public XMLStreamWriter getXmlStreamWriter();
    abstract public void setRuleNames(List<String> stringList);
    abstract public List<String> getRuleNames();

    default public void enterEveryRule(ParserRuleContext ctx) {
        try {
            getXmlStreamWriter().writeStartElement(extractRuleName(ctx));
        } catch (XMLStreamException e) {
            e.printStackTrace();
        }
    }

    default public void exitEveryRule(ParserRuleContext ctx) {
        try {
            getXmlStreamWriter().writeEndElement();
        } catch (XMLStreamException e) {
            e.printStackTrace();
        }
    }

    default public void visitTerminal(TerminalNode node) {
        try {
            XMLStreamWriter s = getXmlStreamWriter();
            s.writeStartElement("t");
            s.writeCharacters(node.getText());
            s.writeEndElement();
        } catch (XMLStreamException e) {
            e.printStackTrace();
        }
    }

    default public void visitErrorNode(ErrorNode node) {
        try {
            XMLStreamWriter s = getXmlStreamWriter();
            s.writeStartElement("error");
            s.writeCharacters(node.getText());
            s.writeEndElement();
        } catch (XMLStreamException e) {
            e.printStackTrace();
        }
    }

    default public String extractRuleName(ParserRuleContext ctx) {
        int ruleIndex = ctx.getRuleIndex();

        String ruleName;

        if (ruleIndex >= 0 && ruleIndex < getRuleNames().size()) {
            ruleName = getRuleNames().get(ruleIndex).replace('_','-');
        } else {
            ruleName = "rule-" + Integer.toString(ruleIndex);
        };
        return ruleName;
    }
}

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

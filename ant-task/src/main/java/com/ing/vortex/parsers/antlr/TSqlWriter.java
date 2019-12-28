package com.ing.vortex.parsers.antlr;

import org.antlr.v4.runtime.ParserRuleContext;;
import org.antlr.v4.runtime.tree.ErrorNode;
import org.antlr.v4.runtime.tree.TerminalNode;
import javax.xml.stream.XMLStreamException;


public class TSqlWriter extends TSqlParserBaseListener {
    XmlAstWriter xmlAstWriter;

    TSqlWriter(XmlAstWriter xmlAstWriter) {
        this.xmlAstWriter = xmlAstWriter;
    }

    public void enterEveryRule(ParserRuleContext ctx) {
        try {
            xmlAstWriter.writeStartElement(ctx);
        } catch (XMLStreamException e) {
            e.printStackTrace();
        }
    }

    public void exitEveryRule(ParserRuleContext ctx) {
        try {
            xmlAstWriter.writeEndElement(ctx);
        } catch (XMLStreamException e) {
            e.printStackTrace();
        }
    }

    public void visitTerminal(TerminalNode node) {
        try {
            xmlAstWriter.writeToken(node);
        } catch (XMLStreamException e) {
            e.printStackTrace();
        }
    }

    public void visitErrorNode(ErrorNode node) {
        try {
            xmlAstWriter.writeError(node.getText());
        } catch (XMLStreamException e) {
            e.printStackTrace();
        }
    }


}

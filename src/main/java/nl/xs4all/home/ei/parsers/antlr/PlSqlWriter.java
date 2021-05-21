package nl.xs4all.home.ei.parsers.antlr;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ErrorNode;
import org.antlr.v4.runtime.tree.TerminalNode;
import javax.xml.stream.XMLStreamException;


public class PlSqlWriter extends PlSqlParserBaseListener  {

    XmlAstWriter xmlAstWriter;

    PlSqlWriter(XmlAstWriter xmlAstWriter) {
        this.xmlAstWriter = xmlAstWriter;
    }

     
     /** 
      * @param ctx
      */
     public void enterEveryRule(ParserRuleContext ctx) {
        try {
            xmlAstWriter.writeStartElement(ctx);
        } catch (XMLStreamException e) {
            e.printStackTrace();
        }
    }

     
     /** 
      * @param ctx
      */
     public void exitEveryRule(ParserRuleContext ctx) {
        try {
            xmlAstWriter.writeEndElement(ctx);
        } catch (XMLStreamException e) {
            e.printStackTrace();
        }
    }

     
     /** 
      * @param node
      */
     public void visitTerminal(TerminalNode node) {
        try {
            xmlAstWriter.writeToken(node);
        } catch (XMLStreamException e) {
            e.printStackTrace();
        }
    }

     
     /** 
      * @param node
      */
     public void visitErrorNode(ErrorNode node) {
        try {
            xmlAstWriter.writeError(node.getText());
        } catch (XMLStreamException e) {
            e.printStackTrace();
        }
    }
}

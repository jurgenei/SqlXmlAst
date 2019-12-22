package com.ing.vortex.parsers.antlr;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ErrorNode;
import org.antlr.v4.runtime.tree.TerminalNode;

import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamWriter;
import java.util.List;

public class PlSqlWriter extends PlSqlParserBaseListener implements XmlWriterInterface {
    XMLStreamWriter xmlStreamWriter = null;
    List<String> ruleNames = null;

    
    /** 
     * @param xmlStreamWriter
     * @param ruleNames
     * @return 
     */
    PlSqlWriter(XMLStreamWriter xmlStreamWriter, List<String> ruleNames) {
        setXmlStreamWriter(xmlStreamWriter);
        setRuleNames(ruleNames);
    }

    
    /** 
     * @param s
     */
    public void setXmlStreamWriter(XMLStreamWriter s) {
        xmlStreamWriter = s;
    }

    
    /** 
     * @return XMLStreamWriter
     */
    public XMLStreamWriter getXmlStreamWriter() {
        return xmlStreamWriter;
    }

    
    /** 
     * @param stringList
     */
    public void setRuleNames(List<String> stringList) {
        ruleNames = stringList;
    }

    
    /** 
     * @return List<String>
     */
    public List<String> getRuleNames() {
        return ruleNames;
    }

     
     /** 
      * @param ctx
      */
     public void enterEveryRule(ParserRuleContext ctx) {
        try {
            getXmlStreamWriter().writeStartElement(extractRuleName(ctx));
        } catch (XMLStreamException e) {
            e.printStackTrace();
        }
    }

     
     /** 
      * @param ctx
      */
     public void exitEveryRule(ParserRuleContext ctx) {
        try {
            getXmlStreamWriter().writeEndElement();
        } catch (XMLStreamException e) {
            e.printStackTrace();
        }
    }

     
     /** 
      * @param node
      */
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

     
     /** 
      * @param node
      */
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

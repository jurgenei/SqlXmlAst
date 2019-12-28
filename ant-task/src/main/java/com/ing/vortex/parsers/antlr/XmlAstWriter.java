package com.ing.vortex.parsers.antlr;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.antlr.v4.runtime.tree.TerminalNode;

import javax.xml.stream.XMLOutputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamWriter;
import java.io.*;
import java.util.*;

public class XmlAstWriter {


    private String commentNS = "http://ing.com/vortex/sql/comments";
    private String grammarNS = "http://ing.com/vortex/sql/grammar";

    private Class<Parser> parserClass;
    private Class<Lexer> lexerClass;
    private Class<ParseTreeListener> listenerClass;

    private XMLStreamWriter xmlStreamWriter;
    private List<String> ruleNames;
    private List<String> ruleStack;
    private List<String> lexNames;



    private CommonTokenStream tokenStream;
    private HashMap<Integer, Boolean> booleanHashMap;

    private Lexer lexer;
    private Parser parser;

    // the casts are checked!
    @SuppressWarnings("unchecked")
    public XmlAstWriter(Class parser, Class lexer, Class listener) {
        if (parser != null && Parser.class.isAssignableFrom(parser))
            parserClass = parser;
        else
            throw new RuntimeException("invalid parser");
        if (lexer != null && Lexer.class.isAssignableFrom(lexer))
            lexerClass = lexer;
        else
            throw new RuntimeException("invalid lexer");
        if (listener != null && ParseTreeListener.class.isAssignableFrom(listener))
            listenerClass = listener;
        else
            throw new RuntimeException("invalid listener");

        booleanHashMap = new HashMap<>();
        ruleStack = new ArrayList<>();
    }

    public String getgrammarNS() {
        return grammarNS;
    }

    public void setgrammarNS(String grammarNS) {
        this.grammarNS = grammarNS;
    }


    public String getCommentNS() {
        return commentNS;
    }

    public void setCommentNS(String commentNS) {
        this.commentNS = commentNS;
    }

    public void convert(final File inFile, final File outFile, final String path) throws Exception {

        // set up parser chain
        InputStream inputStream = new FileInputStream(inFile);
        CharStream s = CharStreams.fromStream(inputStream);
        lexer = lexerClass.getDeclaredConstructor(CharStream.class).newInstance(s);
        lexNames = Arrays.asList(lexer.getRuleNames());
        tokenStream = new CommonTokenStream(lexer);
        parser = parserClass.getDeclaredConstructor(TokenStream.class).newInstance(tokenStream);
        parser.setErrorHandler(new BailErrorStrategy());
        ruleNames = Arrays.asList(parser.getRuleNames());
        XMLOutputFactory xmlof = XMLOutputFactory.newInstance();
        //xmlStreamWriter = new IndentingXMLStreamWriter(xmlof.createXMLStreamWriter(new FileOutputStream(outFile)));
        xmlStreamWriter = xmlof.createXMLStreamWriter(new FileOutputStream(outFile));

        ParseTreeListener writer = listenerClass.getDeclaredConstructor(XmlAstWriter.class).newInstance(this);

        // convert
        xmlStreamWriter.writeStartDocument();
        xmlStreamWriter.writeCharacters("\n");
        xmlStreamWriter.writeStartElement("sql");
        xmlStreamWriter.writeDefaultNamespace(grammarNS);
        xmlStreamWriter.writeNamespace("c", commentNS);
        xmlStreamWriter.writeAttribute("grammar", "oracle");
        xmlStreamWriter.writeAttribute("path", path.replaceAll("\\\\", "/"));
        xmlStreamWriter.writeAttribute("numlines", Integer.toString(countLines(inFile)));
        xmlStreamWriter.writeCharacters("\n");
        ParseTreeWalker walker = new ParseTreeWalker();
        walker.walk(writer, (ParseTree) (parserClass.getMethod("sql_script")).invoke(parser));
        xmlStreamWriter.writeCharacters("\n");
        xmlStreamWriter.writeEndElement();
        xmlStreamWriter.writeEndDocument();
        xmlStreamWriter.flush();
        xmlStreamWriter.close();

    }

    public String getRuleName(ParserRuleContext ctx) {
        int ruleIndex = ctx.getRuleIndex();
        String ruleName;
        if (ruleIndex >= 0 && ruleIndex < ruleNames.size()) {
            ruleName = ruleNames.get(ruleIndex).replace('_', '-');
        } else {
            ruleName = "rule-" + ruleIndex;
        }
        return ruleName;
    }

    public void writeStartElement(ParserRuleContext ctx) throws XMLStreamException {
        commentBefore(ctx);
        String ruleName = getRuleName(ctx);
        xmlStreamWriter.writeStartElement("", ruleName, grammarNS);
        ruleStack.add(ruleName);
    }

    public void writeEndElement(ParserRuleContext ctx) throws XMLStreamException {
        xmlStreamWriter.writeEndElement();
        ruleStack.remove(ruleStack.size() - 1);
        commentAfter(ctx);
    }


    public void writeToken(TerminalNode node) throws XMLStreamException {
        String text = node.getText();
        Token token = node.getSymbol();

        commentBefore(token);
        if (ruleStack.size() > 1 || !text.equals("<EOF>")) {
            xmlStreamWriter.writeStartElement("", "t", grammarNS);
            xmlStreamWriter.writeCharacters(text);
            xmlStreamWriter.writeEndElement();
        }
        /*
        else {
            xmlStreamWriter.writeEmptyElement("c", "eof", commentNS);
        }
        */
        commentAfter(token);
    }

    public void writeError(String message) throws XMLStreamException {
        xmlStreamWriter.writeStartElement(grammarNS, "error");
        xmlStreamWriter.writeCharacters(message);
        xmlStreamWriter.writeEndElement();
    }

    public void processComments(List<Token> list) throws XMLStreamException {
        if (list == null || list.isEmpty())
            return;
        Iterator<Token> iter = list.iterator();
        while (iter.hasNext()) {
            Token token = iter.next();
            int in = token.getTokenIndex();
            if (booleanHashMap.containsKey(in))
                continue;
            booleanHashMap.put(in, Boolean.TRUE);
            String typeName = lexer.getVocabulary().getSymbolicName(token.getType());
            String value = token.getText();
            writeComment(value,typeName);
        }
    }

    private void writeComment(String comment, String tagName) throws XMLStreamException {
        xmlStreamWriter.writeStartElement("c", tagName, commentNS);
        writeChars(comment);
        xmlStreamWriter.writeEndElement();
    }

    private void writeChars(String s) throws XMLStreamException {
        xmlStreamWriter.writeCharacters(s);
    }

    private void commentBefore(ParserRuleContext ctx) throws XMLStreamException {
        processComments(tokenStream.getHiddenTokensToLeft(ctx.getStart().getTokenIndex()));
    }

    private void commentAfter(ParserRuleContext ctx) throws XMLStreamException {
        processComments(tokenStream.getHiddenTokensToRight(ctx.getStop().getTokenIndex()));
    }

    private void commentBefore(Token token) throws XMLStreamException {
        processComments(tokenStream.getHiddenTokensToLeft(token.getTokenIndex()));
    }

    private void commentAfter(Token token) throws XMLStreamException {
        processComments(tokenStream.getHiddenTokensToRight(token.getTokenIndex()));
    }

    public int countLines(File file) throws IOException {
        InputStream is = new BufferedInputStream(new FileInputStream(file));
        try {
            byte[] c = new byte[1024];
            int count = 0;
            int readChars = 0;
            boolean empty = true;
            while ((readChars = is.read(c)) != -1) {
                empty = false;
                for (int i = 0; i < readChars; ++i) {
                    if (c[i] == '\n') {
                        ++count;
                    }
                }
            }
            return (count == 0 && !empty) ? 1 : count;
        } finally {
            is.close();
        }
    }
}

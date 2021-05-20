package nl.xs4all.home.ei.parsers.antlr;

import com.sun.xml.txw2.output.IndentingXMLStreamWriter;
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


    private String commentNS = "http://ei.home.xs4all.nl/sql/comments";
    private String grammarNS = "http://ei.home.xs4all.nl/sql/grammar";
    private String tokenNS = "http://ei.home.xs4all.nl/sql/token";
    private final String grammar;

    private Class<Parser> parserClass;
    private Class<Lexer> lexerClass;
    private Class<ParseTreeListener> listenerClass;

    private XMLStreamWriter xmlStreamWriter;
    private List<String> ruleNames;

    private final List<String> ruleStack;
    private CommonTokenStream tokenStream;
    private final HashMap<Integer, Boolean> booleanHashMap;

    private Lexer lexer;
    private Parser parser;

    private String keepSpace;

    // the casts are checked!
    @SuppressWarnings("unchecked")
    public XmlAstWriter(final Class parser, final Class lexer, final Class listener, final String g) {
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
        grammar = g;
    }

    public String getgrammarNS() {
        return grammarNS;
    }

    public void setgrammarNS(final String grammarNS) {
        this.grammarNS = grammarNS;
    }

    public String getCommentNS() {
        return commentNS;
    }

    public void setCommentNS(final String commentNS) {
        this.commentNS = commentNS;
    }

    public String getTokenNS() {
        return tokenNS;
    }

    public void setTokenNS(final String tokenNS) {
        this.tokenNS = tokenNS;
    }

    public void convert(final File inFile, final File outFile, final String path) throws Exception {

        // set up parser chain
        final InputStream inputStream = new FileInputStream(inFile);
        final CharStream s = CharStreams.fromStream(inputStream);
        lexer = lexerClass.getDeclaredConstructor(CharStream.class).newInstance(s);

        tokenStream = new CommonTokenStream(lexer);
        parser = parserClass.getDeclaredConstructor(TokenStream.class).newInstance(tokenStream);
        parser.setErrorHandler(new BailErrorStrategy());
        ruleNames = Arrays.asList(parser.getRuleNames());
        final XMLOutputFactory xmlof = XMLOutputFactory.newInstance();

        xmlStreamWriter = new IndentingXMLStreamWriter(xmlof.createXMLStreamWriter(new
                FileOutputStream(outFile)));
        // xmlStreamWriter = xmlof.createXMLStreamWriter(new FileOutputStream(outFile));

        final ParseTreeListener writer = listenerClass.getDeclaredConstructor(XmlAstWriter.class).newInstance(this);

        // convert
        xmlStreamWriter.writeStartDocument();
        xmlStreamWriter.writeStartElement("sql");
        xmlStreamWriter.writeDefaultNamespace(grammarNS);
        xmlStreamWriter.writeNamespace("c", commentNS);
        xmlStreamWriter.writeNamespace("t", tokenNS);
        xmlStreamWriter.writeAttribute("grammar", grammar);
        xmlStreamWriter.writeAttribute("path", path.replaceAll("\\\\", "/"));
        xmlStreamWriter.writeAttribute("numlines", Integer.toString(countLines(inFile)));
        final ParseTreeWalker walker = new ParseTreeWalker();
        walker.walk(writer, (ParseTree) (parserClass.getMethod("sql_script")).invoke(parser));
        flushKeepSpace();
        xmlStreamWriter.writeEndElement();
        xmlStreamWriter.writeEndDocument();
        xmlStreamWriter.flush();
        xmlStreamWriter.close();
    }

    private void flushKeepSpace() throws XMLStreamException {
        if (keepSpace != null) {
            xmlStreamWriter.writeStartElement("c", "WS", commentNS);
            writeChars(keepSpace);
            xmlStreamWriter.writeEndElement();
            keepSpace = null;
        }
    }

    public String getRuleName(final ParserRuleContext ctx) {
        final int ruleIndex = ctx.getRuleIndex();
        String ruleName;
        if (ruleIndex >= 0 && ruleIndex < ruleNames.size()) {
            ruleName = ruleNames.get(ruleIndex);
            // .replace('_', '-'); -> not doing this Jurgen,
            // Makes it harder to convert XML2JSON
        } else {
            ruleName = "rule-" + ruleIndex;
        }
        return ruleName;
    }

    public void writeStartElement(final ParserRuleContext ctx) throws XMLStreamException {
        flushKeepSpace();
        commentBefore(ctx);
        final String ruleName = getRuleName(ctx);
        xmlStreamWriter.writeStartElement("", ruleName, grammarNS);
        ruleStack.add(ruleName);
    }

    public void writeEndElement(final ParserRuleContext ctx) throws XMLStreamException {
        xmlStreamWriter.writeEndElement();
        ruleStack.remove(ruleStack.size() - 1);
        commentAfter(ctx);
    }

    public void writeToken(final TerminalNode node) throws XMLStreamException {
        final String text = node.getText();
        final Token token = node.getSymbol();



        commentBefore(token);
        if (ruleStack.size() > 1 || !text.equals("<EOF>")) {
            final String LexerRule = lexer.getVocabulary().getSymbolicName(token.getType());
            xmlStreamWriter.writeStartElement("t", LexerRule, tokenNS);
            xmlStreamWriter.writeCharacters(text);
            xmlStreamWriter.writeEndElement();
        }
        /*
         * else { xmlStreamWriter.writeEmptyElement("c", "eof", commentNS); }
         */
        commentAfter(token);
    }

    public void writeError(final String message) throws XMLStreamException {
        xmlStreamWriter.writeStartElement(grammarNS, "error");
        xmlStreamWriter.writeCharacters(message);
        xmlStreamWriter.writeEndElement();
    }

    public void processComments(final List<Token> list) throws XMLStreamException {
        if (list == null || list.isEmpty())
            return;
        final Iterator<Token> iter = list.iterator();
        while (iter.hasNext()) {
            final Token token = iter.next();
            final int in = token.getTokenIndex();
            if (booleanHashMap.containsKey(in))
                continue;
            booleanHashMap.put(in, Boolean.TRUE);
            final String typeName = lexer.getVocabulary().getSymbolicName(token.getType());
            final String value = token.getText();
            writeComment(value, typeName);
        }
    }

    private void writeComment(final String comment, final String tagName) throws XMLStreamException {
        if (tagName.equals("SPACES")) {
            // defer output space until next open tag
            String replaced = comment
                    .replaceAll(" ", "_")
                    .replaceAll("\n", "\\\\n")
                    .replaceAll("\r", "\\\\r")
                    .replaceAll("\t", "\\\\t");
            keepSpace = replaced;
            /*
            xmlStreamWriter.writeStartElement("c", "WS", commentNS);
            writeChars(replaced);
            xmlStreamWriter.writeEndElement();
            */
        } else {
            xmlStreamWriter.writeStartElement("c", tagName, commentNS);
            writeChars(comment);
            xmlStreamWriter.writeEndElement();
        }

    }

    private void writeChars(final String s) throws XMLStreamException {
        xmlStreamWriter.writeCharacters(s);
    }

    private void commentBefore(final ParserRuleContext ctx) throws XMLStreamException {
        processComments(tokenStream.getHiddenTokensToLeft(ctx.getStart().getTokenIndex()));
    }

    private void commentAfter(final ParserRuleContext ctx) throws XMLStreamException {
        processComments(tokenStream.getHiddenTokensToRight(ctx.getStop().getTokenIndex()));
    }

    private void commentBefore(final Token token) throws XMLStreamException {
        processComments(tokenStream.getHiddenTokensToLeft(token.getTokenIndex()));
    }

    private void commentAfter(final Token token) throws XMLStreamException {
        processComments(tokenStream.getHiddenTokensToRight(token.getTokenIndex()));
    }

    public int countLines(final File file) throws IOException {
        final InputStream is = new BufferedInputStream(new FileInputStream(file));
        try {
            final byte[] c = new byte[1024];
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

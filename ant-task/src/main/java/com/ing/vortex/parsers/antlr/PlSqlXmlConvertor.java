package com.ing.vortex.parsers.antlr;

import com.sun.xml.txw2.output.IndentingXMLStreamWriter;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import javax.xml.stream.XMLOutputFactory;
import javax.xml.stream.XMLStreamWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;

public class PlSqlXmlConvertor implements SqlConverterInterace {

    public void convert(final File inFile, final File outFile, final String path) throws Exception {
        InputStream inputStream = new FileInputStream(inFile);
        CharStream s = CharStreams.fromStream(inputStream);
        Lexer lexer = new PlSqlLexer(s);
        TokenStream tokenStream = new CommonTokenStream(lexer);
        PlSqlParser parser = new PlSqlParser(tokenStream);
        parser.setErrorHandler(new BailErrorStrategy());

        ParseTreeWalker walker = new ParseTreeWalker();
        List<String> ruleNames = Arrays.asList(parser.getRuleNames());
        XMLOutputFactory xmlof = XMLOutputFactory.newInstance();
        XMLStreamWriter xsw = new IndentingXMLStreamWriter(xmlof.createXMLStreamWriter(new FileOutputStream(outFile)));
        PlSqlWriter writer = new PlSqlWriter(xsw, ruleNames);

        // convert
        xsw.writeStartDocument();
        xsw.writeStartElement("sql");
        xsw.writeAttribute("grammar","oracle");
        xsw.writeAttribute("path", path.replaceAll("\\\\", "/"));
        xsw.writeAttribute("numlines", Integer.toString(countLines(inFile)));
        try {
            walker.walk(writer, parser.sql_script());
        } catch (Exception e) {
            throw (e);
        } finally {
            xsw.writeEndElement();
            xsw.writeEndDocument();
            xsw.flush();
            xsw.close();
        };
    }
}

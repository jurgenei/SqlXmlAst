package com.ing.vortex.parsers.antlr;

import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.Parser;
import org.antlr.v4.runtime.tree.ParseTreeListener;

import java.io.File;

public class SqlXmlConverter {

    private String grammar = "oracle";
    String getGrammar() {
        return grammar;
    }
    void setGrammar(String grammar) throws Exception {
        switch(grammar) {
            case "oracle":
            case "sybase":
                break;
            default:
                throw new Exception("only oracle or sybase supported");
        }
        this.grammar = grammar;
    }

    public void convert(final File inFile, final File outFile, final String path) throws Exception {
        XmlAstWriter xmlAstWriter;
        switch(grammar) {
            case "oracle":
                 xmlAstWriter = new XmlAstWriter(PlSqlParser.class, PlSqlLexer.class, PlSqlWriter.class);
                break;
            case "sybase":
                 xmlAstWriter = new XmlAstWriter(TSqlParser.class,TSqlLexer.class,TSqlWriter.class);
                break;
            default:
                throw new Exception("only oracle or sybase supported");
        }
        ensureDirectoryFor(outFile);
        xmlAstWriter.convert(inFile,outFile,path);
    }

    private void ensureDirectoryFor(final File targetFile) throws Exception {
        final File directory = targetFile.getParentFile();
        if (!directory.exists()) {
            if (!(directory.mkdirs() || directory.isDirectory())) {
                throw new Exception("Unable to create directory: "
                        + directory.getAbsolutePath());
            }
        }
    }

}

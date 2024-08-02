package nl.xs4all.home.ei.parsers.antlr;

import java.io.File;

public class SqlXmlConverter {

    private String grammar = "oracle";
    private XmlAstWriter xmlAstWriter;

    String getGrammar() {
        return grammar;
    }
    void setGrammar(String grammar) throws Exception {
        switch(grammar) {
            case "oracle":
            case "sybase":
            case "antlr4":
            case "java8":
                break;
            default:
                throw new Exception("only oracle, sybase, java8 or antlr4 supported");
        }
        this.grammar = grammar;
    }

    public void convert(final File inFile, final File outFile, final String path) throws Exception {
        switch(grammar) {
            case "oracle":
                xmlAstWriter = new XmlAstWriter(PlSqlParser.class, PlSqlLexer.class, PlSqlWriter.class, grammar);
                break;
            case "sybase":
                xmlAstWriter = new XmlAstWriter(TSqlParser.class,TSqlLexer.class,TSqlWriter.class, grammar);
                break;
            case "java8":
                xmlAstWriter = new XmlAstWriter(Java8Parser.class,Java8Lexer.class,Java8Writer.class, grammar);
                break;
            case "antlr4":
                xmlAstWriter = new XmlAstWriter(ANTLRv4Parser.class,ANTLRv4Lexer.class,ANTLRv4Writer.class, grammar);
                break;
            default:
                throw new Exception("only oracle, sybase, java8 or antlr4 supported");
        }
        ensureDirectoryFor(outFile);
        xmlAstWriter.convert(inFile,outFile,path);
    }

    public void clearDFA() {
        xmlAstWriter.clearDFA();
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

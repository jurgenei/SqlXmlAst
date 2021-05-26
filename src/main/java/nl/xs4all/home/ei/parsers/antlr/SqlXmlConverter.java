package nl.xs4all.home.ei.parsers.antlr;

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
            case "antlr4":
                break;
            default:
                throw new Exception("only oracle, sybase or antlr4 supported");
        }
        this.grammar = grammar;
    }

    public void convert(final File inFile, final File outFile, final String path) throws Exception {
        XmlAstWriter xmlAstWriter;
        switch(grammar) {
            case "oracle":
                xmlAstWriter = new XmlAstWriter(PlSqlParser.class, PlSqlLexer.class, PlSqlWriter.class, grammar);
                break;
            case "sybase":
                xmlAstWriter = new XmlAstWriter(TSqlParser.class,TSqlLexer.class,TSqlWriter.class, grammar);
                break;
                /*
            case "antlr4":
                xmlAstWriter = new XmlAstWriter(ANTLRv4Parser.class,ANTLRv4Lexer.class,ANTLRv4Writer.class, grammar);
                break;
                 */
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

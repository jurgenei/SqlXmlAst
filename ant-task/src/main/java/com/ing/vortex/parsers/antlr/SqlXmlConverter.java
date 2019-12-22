package com.ing.vortex.parsers.antlr;


import java.io.File;

public class SqlXmlConverter {

    String grammar = "oracle";
    
    /** 
     * @return String
     */
    public String getGrammar() {
        return grammar;
    }
    
    /** 
     * @param grammar
     * @throws Exception
     */
    public void setGrammar(String grammar) throws Exception {
        switch(grammar) {
            case "oracle":
            case "sybase":
                break;
            default:
                throw new Exception("only oracle or sybase supported");
        }
        this.grammar = grammar;
    }

    
    /** 
     * @param inFile
     * @param outFile
     * @param path
     * @throws Exception
     */
    public void convert(final File inFile, final File outFile, final String path) throws Exception {
        SqlConverterInterace convertor;
        switch(grammar) {
            case "oracle":
                convertor = new PlSqlXmlConvertor();
                break;
            case "sybase":
                convertor = new TSqlXmlConvertor();
                break;
            default:
                throw new Exception("only oracle or sybase supported");
        }
        ensureDirectoryFor(outFile);
        convertor.convert(inFile,outFile,path);
    }
    
    /** 
     * @param targetFile
     * @throws Exception
     */
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

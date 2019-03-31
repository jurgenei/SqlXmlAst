import org.junit.Assert;
import org.junit.Test;
import org.snt.inmemantlr.GenericParser;
import java.io.File;

public class TestTsql {

    private static File [] ok = new File("../tsql/examples").
            listFiles(pathname -> pathname.isFile());

    private static String path = "src/main/antlr4/com/ing/vortex/parsers/antlr";

    private static File[] gfiles = new File[]{
            new File("../tsql" + path + "TSqlLexer.g4"),
            new File("../tsql" + path + "TSqlParser.g4")
    };

    @Test
    public void test(){
        Assert.assertTrue(GrammarTester.run(GenericParser.CaseSensitiveType
                .NONE,ok, "sql_script", gfiles));
    }

}

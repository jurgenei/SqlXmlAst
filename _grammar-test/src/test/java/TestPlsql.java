import org.junit.Assert;
import org.junit.Test;
import org.snt.inmemantlr.GenericParser;
import java.io.File;

public class TestPlsql {

    private static File[] ok1 = new File("../plsql/examples").
            listFiles(pathname -> pathname.isFile());

    private static String path = "src/main/antlr4/com/ing/vortex/parsers/antlr";

    private static File[] gfile = new File[]{
            new File("../plsql/" + path + "/PlSqlParser.g4"),
            new File("../plsql/" + path + "/PlSqlLexer.g4")
    };

    @Test
    public void test(){
        Assert.assertTrue(GrammarTester.run(GenericParser.CaseSensitiveType
                .NONE,ok1, "sql_script", gfile));
    }

}

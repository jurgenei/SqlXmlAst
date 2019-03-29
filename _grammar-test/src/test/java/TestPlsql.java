import org.junit.Assert;
import org.junit.Test;
import org.snt.inmemantlr.GenericParser;
import java.io.File;

public class TestPlsql {

    private static File[] ok1 = new File("../plsql/examples").
            listFiles(pathname -> pathname.isFile());

    private static File[] gfile = new File[]{
            new File("../plsql/PlSqlParser.g4"),
            new File("../plsql/PlSqlLexer.g4")
    };

    @Test
    public void test(){
        Assert.assertTrue(GrammarTester.run(GenericParser.CaseSensitiveType
                .NONE,ok, "sql_script", gfiles));
    }

}

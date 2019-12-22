import java.io.File;
import java.io.FileNotFoundException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.snt.inmemantlr.GenericParser;
import org.snt.inmemantlr.exceptions.CompilationException;
import org.snt.inmemantlr.exceptions.IllegalWorkflowException;
import org.snt.inmemantlr.exceptions.ParsingException;
import org.snt.inmemantlr.listener.DefaultTreeListener;
import org.snt.inmemantlr.stream.CasedStreamProvider;
import org.snt.inmemantlr.tree.Ast;

public class GrammarTester {

    private static final Logger LOGGER = LoggerFactory.getLogger(GrammarTester.class);

    private static GenericParser create(final File... gfile) {
        GenericParser gp = null;
        try {
            gp = new GenericParser(gfile);
        } catch (final FileNotFoundException e) {
            LOGGER.error(e.getMessage());
            return null;
        }
        final DefaultTreeListener t = new DefaultTreeListener();

        gp.setListener(t);

        try {
            gp.compile();
        } catch (final CompilationException e) {
            LOGGER.error(e.getMessage());
            return null;
        }

        return gp;
    }

    private static boolean excludeFile(final File f) {

        if (FilenameUtils.getExtension(f.getName()).equals("errors")
                || FilenameUtils.getExtension(f.getName()).equals("tree")) {
            return true;
        }
        return false;
    }

    public static boolean run(final File[] ok, final String ept, final File... gfile) {
        return run(GenericParser.CaseSensitiveType.NONE, ok, ept, gfile);
    }

    public static boolean run(final GenericParser.CaseSensitiveType t, final File[] ok, final String ept,
            final File... gfile) {
        final GenericParser gp = create(gfile);

        if (gp == null)
            return false;

        final DefaultTreeListener dt = new DefaultTreeListener();

        gp.setListener(dt);

        switch (t) {
        case UPPER:
            gp.setStreamProvider(new CasedStreamProvider(GenericParser.CaseSensitiveType.UPPER));
            break;
        case LOWER:
            gp.setStreamProvider(new CasedStreamProvider(GenericParser.CaseSensitiveType.LOWER));
            break;
        case NONE:
            break;

        }

        for (final File f : ok) {

            if (excludeFile(f)) {
                LOGGER.info("skip {}", f.getAbsoluteFile());
                continue;
            }

            LOGGER.info("parse {}", f.getAbsoluteFile());
            try {
                gp.parse(f, ept, GenericParser.CaseSensitiveType.NONE);
            } catch (FileNotFoundException | IllegalWorkflowException | ParsingException e) {
                LOGGER.error(e.getMessage());
                return false;
            }
        }
        return true;
    }

    public static Map<String, Ast> runAndGetAsts(final File[] ok, final File... gfile) {
        final GenericParser gp = create(gfile);

        final Map<String, Ast> ret = new HashMap<String, Ast>();

        for (final File f : ok) {

            if (excludeFile(f)) {
                LOGGER.info("skip {}", f.getAbsoluteFile());
                continue;
            }

            LOGGER.info("parse {}", f.getAbsoluteFile());

            try {
                // ParserRuleContext ctx =
                gp.parse(f);
            } catch (FileNotFoundException | IllegalWorkflowException | ParsingException e) {
                LOGGER.error(e.getMessage());
                return null;
            }

            final Path p = Paths.get(f.toURI());

            final DefaultTreeListener l = (DefaultTreeListener) gp.getListener();

            ret.put(p.getFileName().toString(), l.getAst());
        }

        return ret;
    }

    public static boolean run(final File... gfile) {
        final GenericParser gp = create(gfile);
        if (gp == null) {
            return false;
        }
        return true;
    }


}

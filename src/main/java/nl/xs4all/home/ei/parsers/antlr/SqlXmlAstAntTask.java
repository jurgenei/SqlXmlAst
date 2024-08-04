package nl.xs4all.home.ei.parsers.antlr;

import java.io.File;
import java.util.concurrent.TimeUnit;

import org.apache.commons.lang3.time.StopWatch;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.MatchingTask;
import org.apache.tools.ant.types.Mapper;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.Union;
import org.apache.tools.ant.util.FileNameMapper;


/**
 * @author Jurgen Hildebrand
 */

public class SqlXmlAstAntTask extends MatchingTask {

    private static int instanceCount = 0;

    private synchronized int incInstanceCount() {
        return ++instanceCount;
    }
    private synchronized int decInstanceCount() {
        return --instanceCount;
    }
    /**
     * destination directory
     */
    private File destDir = null;

    /**
     * where to find the source XML file, default is the project's basedir
     */
    private File baseDir = null;

    private SqlXmlConverter converter = new SqlXmlConverter();

    public String getGrammar() {
        return converter.getGrammar();
    }

    public void setGrammar(final String grammar) throws Exception {
        converter.setGrammar(grammar);
    }

    /**
     * extension of the files produced by XSL processing
     */
    private String targetExtension = ".xml";

 

    /**
     * Input XML document to be used
     */
    private final File inFile = null;

    /**
     * Output file
     */
 
    private boolean failOnError = true;
    private boolean failOnTransformationError = true;


    /**
     * force output of target files even if they already exist
     */
    private boolean force = false;

    private boolean useImplicitFileset = true;

    private boolean performDirectoryScan = true;

    private boolean failOnNoResources = true;

    private final Union resources = new Union();

    private Mapper mapperElement = null;

    private long averageInSecs = 0;
    private long execSampleSize = 5;
    private long execAvgBeforeClear = 10;
    /**
     * Defines the mapper to map source to destination files.
     *
     * @param mapper the mapper to use
     * @throws BuildException if more than one mapper is defined
     * @since Ant 1.6.2
     */
    public void addMapper(final Mapper mapper) {
        if (mapperElement != null) {
            handleError("Cannot define more than one mapper");
        } else {
            mapperElement = mapper;
        }
    }

    /**
     * Set the destination directory into which the XSL result
     * files should be copied to;
     * required, unless <tt>in</tt> and <tt>out</tt> are
     * specified.
     *
     * @param dir the name of the destination directory
     **/
    public void setDestdir(final File dir) {
        destDir = dir;
    }

    public void setExecSampleSize(long e) {
         execSampleSize = e;
    }

    public void setExecAvgBeforeClear(long e) {
        execAvgBeforeClear = e;
    }

    public void setScanIncludedDirectories(final boolean b) {
        performDirectoryScan = b;
    }

    public void setFailOnNoResources(final boolean b) {
        failOnNoResources = b;
    }

    public void add(final ResourceCollection rc) {
        resources.add(rc);
    }

    public void setUseImplicitFileset(final boolean useimplicitfileset) {
        useImplicitFileset = useimplicitfileset;
    }

    /**
     * Set whether to check dependencies, or always generate;
     * optional, default is false.
     *
     * @param force true if always generate.
     */


    public void setForce(final boolean force) {
        this.force = force;
    }

    /**
     * Whether any errors should make the build fail.
     */

    public void setFailOnError(final boolean b) {
        failOnError = b;
    }

    /**
     * Whether transformation errors should make the build fail.
     */

    public void setFailOnTransformationError(final boolean b) {
        failOnTransformationError = b;
    }

    /**
     * Set the base directory;
     * optional, default is the project's basedir.
     *
     * @param dir the base directory
     **/

    public void setBasedir(final File dir) {
        baseDir = dir;
    }

    /**
     * Set the desired file extension to be used for the target;
     * optional, default is xml.
     *
     * @param name the extension to use
     **/

    public void setExtension(final String name) {
        targetExtension = name;
    }

    protected void handleError(final String msg) {
        if (failOnError) {
            throw new BuildException(msg, getLocation());
        }
        log(msg, Project.MSG_WARN);
    }

    protected void handleError(final Throwable ex) {
        if (failOnError) {
            throw new BuildException(ex);
        } else {
            log("Caught an exception: " + ex, Project.MSG_WARN);
        }
    }

    protected void handleTransformationError(final Exception ex) {
        if (failOnError && failOnTransformationError) {
            throw new BuildException(ex);
        } else {
            log("Caught an error during transformation: " + ex, Project.MSG_WARN);
        }
    }

    private void checkDest() {
        if (destDir == null) {
            handleError("destdir attributes must be set!");
        }
    }

    /**
     * Mapper implementation of the "traditional" way &lt;xslt&gt;
     * mapped filenames.
     * <p>
     * <p>If the file has an extension, chop it off.  Append whatever
     * the user has specified as extension or ".html".</p>
     */
    private class StyleMapper implements FileNameMapper {
        public void setFrom(final String from) {
        }

        public void setTo(final String to) {
        }

        public String[] mapFileName(String baseName) {
            final int dotPos = baseName.lastIndexOf('.');
            if (dotPos > 0) {
                baseName = baseName.substring(0, dotPos);
            }
            return new String[]{baseName + targetExtension};
        }
    }


    /**
     * Processes the given input XML file and stores the result
     * in the given resultFile.
     *
     * @param baseDir  the base directory for resolving files.
     * @param baseName the input file
     * @param destDir  the destination directory
     * @throws BuildException if the processing fails.
     */
    private void process(final File baseDir, final String baseName, final File destDir)
            throws BuildException {

        File outF = null;
        File inF = null;

        try {

            inF = new File(baseDir, baseName);

            if (inF.isDirectory()) {
                log("Skipping " + inF + " it is a directory.", Project.MSG_VERBOSE);
                return;
            }
            FileNameMapper mapper = null;
            if (mapperElement != null) {
                mapper = mapperElement.getImplementation();
            } else {
                mapper = new StyleMapper();
            }

            final String[] outFileName = mapper.mapFileName(baseName);
            if (outFileName == null || outFileName.length == 0) {
                log("Skipping " + inFile + " it cannot get mapped to output.", Project.MSG_VERBOSE);
                return;
            } else if (outFileName == null || outFileName.length > 1) {
                log("Skipping " + inFile + " its mapping is ambiguous.", Project.MSG_VERBOSE);
                return;
            }
            outF = new File(destDir, outFileName[0]);

            process(inF, outF, baseName);

        } catch (final Exception ex) {
            // If failed to process document, must delete target document,
            // or it will not attempt to process it the second time
            log("Failed to process " + inFile, Project.MSG_INFO);
            if (outF != null) {
                outF.delete();
            }
            handleTransformationError(ex);
        }

    } //-- processXML



    private void process(final File inFile, final File outFile, final String path) throws BuildException {
        if (force || inFile.lastModified() >= outFile.lastModified() || outFile.length() == 0) {
            processFile(inFile, outFile, path);
        } else {
            log("SKIP " + inFile.getName(), Project.MSG_DEBUG);
        }
    }

    private void processFile(final File inFile, final File outFile, final String path) throws BuildException {
        StopWatch stopwatch = new StopWatch();
        stopwatch.start();
        try {
            log("BEGIN      " + inFile.getAbsolutePath(), Project.MSG_INFO);
            converter.convert(inFile,outFile,path);
            log("END        " + stopwatch, Project.MSG_INFO);
        } catch (final Exception ex) {
            log("FAILED     " + inFile, Project.MSG_ERR);
            if (outFile != null) {
                outFile.delete();
            }
            handleTransformationError(ex);
        } finally {
            long time = stopwatch.getTime(TimeUnit.SECONDS);

            // calculate sliding average
            averageInSecs -= averageInSecs / execSampleSize;
            averageInSecs += time / execSampleSize;

            if (averageInSecs > execAvgBeforeClear) {
                log("CLEAR DFA", Project.MSG_INFO);
                converter.clearDFA();
                averageInSecs = 0; // Reset to let average grow again from start
            }
        }
    }

    @Override
    public void execute() throws BuildException {

        final File savedBaseDir = baseDir;

        DirectoryScanner scanner;
        String[] list;
        String[] dirs;



        if (inFile != null && !inFile.exists()) {
            handleError("input file " + inFile + " does not exist");
            return;
        }
        try {

            if (baseDir == null) {
                baseDir = getProject().getBaseDir();
            }


            /*
             * if we get here, in and out have not been specified, we are
             * in batch processing mode.
             */

            //-- make sure destination directory exists...
            checkDest();

            if (useImplicitFileset) {
                scanner = getDirectoryScanner(baseDir);
                log("Transforming into " + destDir, Project.MSG_INFO);

                incInstanceCount();
                // Process all the files marked for styling
                list = scanner.getIncludedFiles();
                for (int i = 0; i < list.length; ++i) {
                    process(baseDir, list[i], destDir);
                }
                if (performDirectoryScan) {
                    // Process all the directories marked for styling
                    dirs = scanner.getIncludedDirectories();
                    for (int j = 0; j < dirs.length; ++j) {
                        list = new File(baseDir, dirs[j]).list();
                        for (int i = 0; i < list.length; ++i) {
                            process(baseDir, dirs[j] + File.separator + list[i], destDir);
                        }
                    }
                }
                if (decInstanceCount() == 0) {
                    log("CLEAR DFA END", Project.MSG_INFO);
                    converter.clearDFA();
                }
            } else { // only resource collections, there better be some
                if (resources.size() == 0) {
                    if (failOnNoResources) {
                        handleError("no resources specified");
                    }
                    return;
                }
            }

        } finally {
            baseDir = savedBaseDir;
        }
    }
}


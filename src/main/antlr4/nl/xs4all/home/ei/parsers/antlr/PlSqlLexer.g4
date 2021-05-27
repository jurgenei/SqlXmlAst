/**
 * Oracle(c) PL/SQL 12c Parser
 *
 * Copyright (c) 2009-2011 Alexandre Porcelli <alexandre.porcelli@gmail.com>
 * Copyright (c) 2015-2017 Ivan Kochurkin (KvanTTT, kvanttt@gmail.com, Positive Technologies).
 * Copyright (c) 2017 Mark Adams <madams51703@gmail.com>
 * Copyright (c) 2021 Jurgen Hildebrand <ei@xs4all.nl>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

lexer grammar PlSqlLexer;
// JH: case independent lexer
fragment A: [aA];
fragment B: [bB];
fragment C: [cC];
fragment D: [dD];
fragment E: [eE];
fragment F: [fF];
fragment G: [gG];
fragment H: [hH];
fragment I: [iI];
fragment J: [jJ];
fragment K: [kK];
fragment L: [lL];
fragment M: [mM];
fragment N: [nN];
fragment O: [oO];
fragment P: [pP];
fragment Q: [qQ];
fragment R: [rR];
fragment S: [sS];
fragment T: [tT];
fragment U: [uU];
fragment V: [vV];
fragment W: [wW];
fragment X: [xX];
fragment Y: [yY];
fragment Z: [zZ];
// JH: case independent lexemes
ABORT:                        A B O R T ;
ABS:                          A B S ;
ACCESS:                       A C C E S S ;
ACCESSED:                     A C C E S S E D ;
ACCOUNT:                      A C C O U N T ;
ACL:                          A C L ;
ACOS:                         A C O S ;
ACTION:                       A C T I O N ;
ACTIONS:                      A C T I O N S ;
ACTIVATE:                     A C T I V A T E ;
ACTIVE:                       A C T I V E ;
ACTIVE_COMPONENT:             A C T I V E '_' C O M P O N E N T ;
ACTIVE_DATA:                  A C T I V E '_' D A T A ;
ACTIVE_FUNCTION:              A C T I V E '_' F U N C T I O N ;
ACTIVE_TAG:                   A C T I V E '_' T A G ;
ACTIVITY:                     A C T I V I T Y ;
ADAPTIVE_PLAN:                A D A P T I V E '_' P L A N ;
ADD:                          A D D ;
ADD_COLUMN:                   A D D '_' C O L U M N ;
ADD_GROUP:                    A D D '_' G R O U P ;
ADD_MONTHS:                   A D D '_' M O N T H S ;
ADJ_DATE:                     A D J '_' D A T E ;
ADMIN:                        A D M I N ;
ADMINISTER:                   A D M I N I S T E R ;
ADMINISTRATOR:                A D M I N I S T R A T O R ;
ADVANCED:                     A D V A N C E D ;
ADVISE:                       A D V I S E ;
ADVISOR:                      A D V I S O R ;
AFD_DISKSTRING:               A F D '_' D I S K S T R I N G ;
AFTER:                        A F T E R ;
AGENT:                        A G E N T ;
AGGREGATE:                    A G G R E G A T E ;
A_LETTER:                     A ;
ALIAS:                        A L I A S ;
ALL:                          A L L ;
ALLOCATE:                     A L L O C A T E ;
ALLOW:                        A L L O W ;
ALL_ROWS:                     A L L '_' R O W S ;
ALTER:                        A L T E R ;
ALWAYS:                       A L W A Y S ;
ANALYZE:                      A N A L Y Z E ;
ANCILLARY:                    A N C I L L A R Y ;
AND:                          A N D ;
AND_EQUAL:                    A N D '_' E Q U A L ;
ANOMALY:                      A N O M A L Y ;
ANSI_REARCH:                  A N S I '_' R E A R C H ;
ANTIJOIN:                     A N T I J O I N ;
ANY:                          A N Y ;
ANYSCHEMA:                    A N Y S C H E M A ;
APPEND:                       A P P E N D ;
APPENDCHILDXML:               A P P E N D C H I L D X M L ;
APPEND_VALUES:                A P P E N D '_' V A L U E S ;
APPLICATION:                  A P P L I C A T I O N ;
APPLY:                        A P P L Y ;
APPROX_COUNT_DISTINCT:        A P P R O X '_' C O U N T '_' D I S T I N C T ;
ARCHIVAL:                     A R C H I V A L ;
ARCHIVE:                      A R C H I V E ;
ARCHIVED:                     A R C H I V E D ;
ARCHIVELOG:                   A R C H I V E L O G ;
ARRAY:                        A R R A Y ;
AS:                           A S ;
ASC:                          A S C ;
ASCII:                        A S C I I ;
ASCIISTR:                     A S C I I S T R ;
ASIN:                         A S I N ;
ASIS:                         A S I S ;
ASSEMBLY:                     A S S E M B L Y ;
ASSIGN:                       A S S I G N ;
ASSOCIATE:                    A S S O C I A T E ;
ASYNC:                        A S Y N C ;
ASYNCHRONOUS:                 A S Y N C H R O N O U S ;
ATAN2:                        A T A N '2' ;
ATAN:                         A T A N ;
AT:                           A T ;
ATTRIBUTE:                    A T T R I B U T E ;
ATTRIBUTES:                   A T T R I B U T E S ;
AUDIT:                        A U D I T ;
AUTHENTICATED:                A U T H E N T I C A T E D ;
AUTHENTICATION:               A U T H E N T I C A T I O N ;
AUTHID:                       A U T H I D ;
AUTHORIZATION:                A U T H O R I Z A T I O N ;
AUTOALLOCATE:                 A U T O A L L O C A T E ;
AUTO:                         A U T O ;
AUTOEXTEND:                   A U T O E X T E N D ;
AUTO_LOGIN:                   A U T O '_' L O G I N ;
AUTOMATIC:                    A U T O M A T I C ;
AUTONOMOUS_TRANSACTION:       A U T O N O M O U S '_' T R A N S A C T I O N ;
AUTO_REOPTIMIZE:              A U T O '_' R E O P T I M I Z E ;
AVAILABILITY:                 A V A I L A B I L I T Y ;
AVRO:                         A V R O ;
BACKGROUND:                   B A C K G R O U N D ;
BACKUP:                       B A C K U P ;
BASIC:                        B A S I C ;
BASICFILE:                    B A S I C F I L E ;
BATCH:                        B A T C H ;
BATCHSIZE:                    B A T C H S I Z E ;
BATCH_TABLE_ACCESS_BY_ROWID:  B A T C H '_' T A B L E '_' A C C E S S '_' B Y '_' R O W I D ;
BECOME:                       B E C O M E ;
BEFORE:                       B E F O R E ;
BEGIN:                        B E G I N ;
BEGINNING:                    B E G I N N I N G ;
BEGIN_OUTLINE_DATA:           B E G I N '_' O U T L I N E '_' D A T A ;
BEHALF:                       B E H A L F ;
BEQUEATH:                     B E Q U E A T H ;
BETWEEN:                      B E T W E E N ;
BFILE:                        B F I L E ;
BFILENAME:                    B F I L E N A M E ;
BIGFILE:                      B I G F I L E ;
BINARY:                       B I N A R Y ;
BINARY_DOUBLE:                B I N A R Y '_' D O U B L E ;
BINARY_DOUBLE_INFINITY:       B I N A R Y '_' D O U B L E '_' I N F I N I T Y ;
BINARY_DOUBLE_NAN:            B I N A R Y '_' D O U B L E '_' N A N ;
BINARY_FLOAT:                 B I N A R Y '_' F L O A T ;
BINARY_FLOAT_INFINITY:        B I N A R Y '_' F L O A T '_' I N F I N I T Y ;
BINARY_FLOAT_NAN:             B I N A R Y '_' F L O A T '_' N A N ;
BINARY_INTEGER:               B I N A R Y '_' I N T E G E R ;
BIND_AWARE:                   B I N D '_' A W A R E ;
BINDING:                      B I N D I N G ;
BIN_TO_NUM:                   B I N '_' T O '_' N U M ;
BITAND:                       B I T A N D ;
BITMAP_AND:                   B I T M A P '_' A N D ;
BITMAP:                       B I T M A P ;
BITMAPS:                      B I T M A P S ;
BITMAP_TREE:                  B I T M A P '_' T R E E ;
BITS:                         B I T S ;
BLOB:                         B L O B ;
BLOCK:                        B L O C K ;
BLOCK_RANGE:                  B L O C K '_' R A N G E ;
BLOCKS:                       B L O C K S ;
BLOCKSIZE:                    B L O C K S I Z E ;
BODY:                         B O D Y ;
BOOLEAN:                      B O O L E A N ;
BOTH:                         B O T H ;
BOUND:                        B O U N D ;
BRANCH:                       B R A N C H ;
BREADTH:                      B R E A D T H ;
BROADCAST:                    B R O A D C A S T ;
BSON:                         B S O N ;
BUFFER:                       B U F F E R ;
BUFFER_CACHE:                 B U F F E R '_' C A C H E ;
BUFFER_POOL:                  B U F F E R '_' P O O L ;
BUILD:                        B U I L D ;
BULK:                         B U L K ;
BY:                           B Y ;
BYPASS_RECURSIVE_CHECK:       B Y P A S S '_' R E C U R S I V E '_' C H E C K ;
BYPASS_UJVC:                  B Y P A S S '_' U J V C ;
BYTE:                         B Y T E ;
CACHE:                        C A C H E ;
CACHE_CB:                     C A C H E '_' C B ;
CACHE_INSTANCES:              C A C H E '_' I N S T A N C E S ;
CACHE_TEMP_TABLE:             C A C H E '_' T E M P '_' T A B L E ;
CACHING:                      C A C H I N G ;
CALCULATED:                   C A L C U L A T E D ;
CALLBACK:                     C A L L B A C K ;
CALL:                         C A L L ;
CANCEL:                       C A N C E L ;
CANONICAL:                    C A N O N I C A L ;
CAPACITY:                     C A P A C I T Y ;
CARDINALITY:                  C A R D I N A L I T Y ;
CASCADE:                      C A S C A D E ;
CASE:                         C A S E ;
CAST:                         C A S T ;
CATEGORY:                     C A T E G O R Y ;
CDBDEFAULT:                   C D B '$' D E F A U L T ;
CEIL:                         C E I L ;
CELL_FLASH_CACHE:             C E L L '_' F L A S H '_' C A C H E ;
CERTIFICATE:                  C E R T I F I C A T E ;
CFILE:                        C F I L E ;
CHAINED:                      C H A I N E D ;
CHANGE:                       C H A N G E ;
CHANGE_DUPKEY_ERROR_INDEX:    C H A N G E '_' D U P K E Y '_' E R R O R '_' I N D E X ;
CHARACTER:                    C H A R A C T E R ;
CHAR:                         C H A R ;
CHAR_CS:                      C H A R '_' C S ;
CHARTOROWID:                  C H A R T O R O W I D ;
CHECK_ACL_REWRITE:            C H E C K '_' A C L '_' R E W R I T E ;
CHECK:                        C H E C K ;
CHECKPOINT:                   C H E C K P O I N T ;
CHILD:                        C H I L D ;
CHOOSE:                       C H O O S E ;
CHR:                          C H R ;
CHUNK:                        C H U N K ;
CLASS:                        C L A S S ;
CLASSIFIER:                   C L A S S I F I E R ;
CLEANUP:                      C L E A N U P ;
CLEAR:                        C L E A R ;
C_LETTER:                     C ;
CLIENT:                       C L I E N T ;
CLOB:                         C L O B ;
CLONE:                        C L O N E ;
CLOSE_CACHED_OPEN_CURSORS:    C L O S E '_' C A C H E D '_' O P E N '_' C U R S O R S ;
CLOSE:                        C L O S E ;
CLUSTER_BY_ROWID:             C L U S T E R '_' B Y '_' R O W I D ;
CLUSTER:                      C L U S T E R ;
CLUSTER_DETAILS:              C L U S T E R '_' D E T A I L S ;
CLUSTER_DISTANCE:             C L U S T E R '_' D I S T A N C E ;
CLUSTER_ID:                   C L U S T E R '_' I D ;
CLUSTERING:                   C L U S T E R I N G ;
CLUSTERING_FACTOR:            C L U S T E R I N G '_' F A C T O R ;
CLUSTER_PROBABILITY:          C L U S T E R '_' P R O B A B I L I T Y ;
CLUSTER_SET:                  C L U S T E R '_' S E T ;
COALESCE:                     C O A L E S C E ;
COALESCE_SQ:                  C O A L E S C E '_' S Q ;
COARSE:                       C O A R S E ;
CO_AUTH_IND:                  C O '_' A U T H '_' I N D ;
COLD:                         C O L D ;
COLLECT:                      C O L L E C T ;
COLUMNAR:                     C O L U M N A R ;
COLUMN_AUTH_INDICATOR:        C O L U M N '_' A U T H '_' I N D I C A T O R ;
COLUMN:                       C O L U M N ;
COLUMNS:                      C O L U M N S ;
COLUMN_STATS:                 C O L U M N '_' S T A T S ;
COLUMN_VALUE:                 C O L U M N '_' V A L U E ;
COMMENT:                      C O M M E N T ;
COMMIT:                       C O M M I T ;
COMMITTED:                    C O M M I T T E D ;
COMMON_DATA:                  C O M M O N '_' D A T A ;
COMPACT:                      C O M P A C T ;
COMPATIBILITY:                C O M P A T I B I L I T Y ;
COMPILE:                      C O M P I L E ;
COMPLETE:                     C O M P L E T E ;
COMPLIANCE:                   C O M P L I A N C E ;
COMPONENT:                    C O M P O N E N T ;
COMPONENTS:                   C O M P O N E N T S ;
COMPOSE:                      C O M P O S E ;
COMPOSITE:                    C O M P O S I T E ;
COMPOSITE_LIMIT:              C O M P O S I T E '_' L I M I T ;
COMPOUND:                     C O M P O U N D ;
COMPRESS:                     C O M P R E S S ;
COMPUTE:                      C O M P U T E ;
CONCAT:                       C O N C A T ;
CON_DBID_TO_ID:               C O N '_' D B I D '_' T O '_' I D ;
CONDITIONAL:                  C O N D I T I O N A L ;
CONDITION:                    C O N D I T I O N ;
CONFIRM:                      C O N F I R M ;
CONFORMING:                   C O N F O R M I N G ;
CON_GUID_TO_ID:               C O N '_' G U I D '_' T O '_' I D ;
CON_ID:                       C O N '_' I D ;
CON_NAME_TO_ID:               C O N '_' N A M E '_' T O '_' I D ;
CONNECT_BY_CB_WHR_ONLY:       C O N N E C T '_' B Y '_' C B '_' W H R '_' O N L Y ;
CONNECT_BY_COMBINE_SW:        C O N N E C T '_' B Y '_' C O M B I N E '_' S W ;
CONNECT_BY_COST_BASED:        C O N N E C T '_' B Y '_' C O S T '_' B A S E D ;
CONNECT_BY_ELIM_DUPS:         C O N N E C T '_' B Y '_' E L I M '_' D U P S ;
CONNECT_BY_FILTERING:         C O N N E C T '_' B Y '_' F I L T E R I N G ;
CONNECT_BY_ISCYCLE:           C O N N E C T '_' B Y '_' I S C Y C L E ;
CONNECT_BY_ISLEAF:            C O N N E C T '_' B Y '_' I S L E A F ;
CONNECT_BY_ROOT:              C O N N E C T '_' B Y '_' R O O T ;
CONNECT:                      C O N N E C T ;
CONNECT_TIME:                 C O N N E C T '_' T I M E ;
CONSIDER:                     C O N S I D E R ;
CONSISTENT:                   C O N S I S T E N T ;
CONSTANT:                     C O N S T A N T ;
CONST:                        C O N S T ;
CONSTRAINT:                   C O N S T R A I N T ;
CONSTRAINTS:                  C O N S T R A I N T S ;
CONSTRUCTOR:                  C O N S T R U C T O R ;
CONTAINER:                    C O N T A I N E R ;
CONTAINER_DATA:               C O N T A I N E R '_' D A T A ;
CONTAINERS:                   C O N T A I N E R S ;
CONTENT:                      C O N T E N T ;
CONTENTS:                     C O N T E N T S ;
CONTEXT:                      C O N T E X T ;
CONTINUE:                     C O N T I N U E ;
CONTROLFILE:                  C O N T R O L F I L E ;
CON_UID_TO_ID:                C O N '_' U I D '_' T O '_' I D ;
CONVERT:                      C O N V E R T ;
COOKIE:                       C O O K I E ;
COPY:                         C O P Y ;
CORR_K:                       C O R R '_' K ;
CORR_S:                       C O R R '_' S ;
CORRUPTION:                   C O R R U P T I O N ;
CORRUPT_XID_ALL:              C O R R U P T '_' X I D '_' A L L ;
CORRUPT_XID:                  C O R R U P T '_' X I D ;
COS:                          C O S ;
COSH:                         C O S H ;
COST:                         C O S T ;
COST_XML_QUERY_REWRITE:       C O S T '_' X M L '_' Q U E R Y '_' R E W R I T E ;
COUNT:                        C O U N T ;
COVAR_POP:                    C O V A R '_' P O P ;
COVAR_SAMP:                   C O V A R '_' S A M P ;
CPU_COSTING:                  C P U '_' C O S T I N G ;
CPU_PER_CALL:                 C P U '_' P E R '_' C A L L ;
CPU_PER_SESSION:              C P U '_' P E R '_' S E S S I O N ;
CRASH:                        C R A S H ;
CREATE:                       C R E A T E ;
CREATE_FILE_DEST:             C R E A T E '_' F I L E '_' D E S T ;
CREATE_STORED_OUTLINES:       C R E A T E '_' S T O R E D '_' O U T L I N E S ;
CREATION:                     C R E A T I O N ;
CREDENTIAL:                   C R E D E N T I A L ;
CRITICAL:                     C R I T I C A L ;
CROSS:                        C R O S S ;
CROSSEDITION:                 C R O S S E D I T I O N ;
CSCONVERT:                    C S C O N V E R T ;
CUBE_AJ:                      C U B E '_' A J ;
CUBE:                         C U B E ;
CUBE_GB:                      C U B E '_' G B ;
CUBE_SJ:                      C U B E '_' S J ;
CUME_DISTM:                   C U M E '_' D I S T M ;
CURRENT:                      C U R R E N T ;
CURRENT_DATE:                 C U R R E N T '_' D A T E ;
CURRENT_SCHEMA:               C U R R E N T '_' S C H E M A ;
CURRENT_TIME:                 C U R R E N T '_' T I M E ;
CURRENT_TIMESTAMP:            C U R R E N T '_' T I M E S T A M P ;
CURRENT_USER:                 C U R R E N T '_' U S E R ;
CURRENTV:                     C U R R E N T V ;
CURSOR:                       C U R S O R ;
CURSOR_SHARING_EXACT:         C U R S O R '_' S H A R I N G '_' E X A C T ;
CURSOR_SPECIFIC_SEGMENT:      C U R S O R '_' S P E C I F I C '_' S E G M E N T ;
CUSTOMDATUM:                  C U S T O M D A T U M ;
CV:                           C V ;
CYCLE:                        C Y C L E ;
DANGLING:                     D A N G L I N G ;
DATABASE:                     D A T A B A S E ;
DATA:                         D A T A ;
DATAFILE:                     D A T A F I L E ;
DATAFILES:                    D A T A F I L E S ;
DATAMOVEMENT:                 D A T A M O V E M E N T ;
DATAOBJNO:                    D A T A O B J N O ;
DATAOBJ_TO_MAT_PARTITION:     D A T A O B J '_' T O '_' M A T '_' P A R T I T I O N ;
DATAOBJ_TO_PARTITION:         D A T A O B J '_' T O '_' P A R T I T I O N ;
DATAPUMP:                     D A T A P U M P ;
DATA_SECURITY_REWRITE_LIMIT:  D A T A '_' S E C U R I T Y '_' R E W R I T E '_' L I M I T ;
DATE:                         D A T E ;
DATE_MODE:                    D A T E '_' M O D E ;
DAY:                          D A Y ;
DAYS:                         D A Y S ;
DBA:                          D B A ;
DBA_RECYCLEBIN:               D B A '_' R E C Y C L E B I N ;
DBMS_STATS:                   D B M S '_' S T A T S ;
DB_ROLE_CHANGE:               D B '_' R O L E '_' C H A N G E ;
DBTIMEZONE:                   D B T I M E Z O N E ;
DB_UNIQUE_NAME:               D B '_' U N I Q U E '_' N A M E ;
DB_VERSION:                   D B '_' V E R S I O N ;
DDL:                          D D L ;
DEALLOCATE:                   D E A L L O C A T E ;
DEBUG:                        D E B U G ;
DEBUGGER:                     D E B U G G E R ;
DEC:                          D E C ;
DECIMAL:                      D E C I M A L ;
DECLARE:                      D E C L A R E ;
DECOMPOSE:                    D E C O M P O S E ;
DECORRELATE:                  D E C O R R E L A T E ;
DECR:                         D E C R ;
DECREMENT:                    D E C R E M E N T ;
DECRYPT:                      D E C R Y P T ;
DEDUPLICATE:                  D E D U P L I C A T E ;
DEFAULT:                      D E F A U L T ;
DEFAULTS:                     D E F A U L T S ;
DEFERRABLE:                   D E F E R R A B L E ;
DEFERRED:                     D E F E R R E D ;
DEFINED:                      D E F I N E D ;
DEFINE:                       D E F I N E ;
DEFINER:                      D E F I N E R ;
DEGREE:                       D E G R E E ;
DELAY:                        D E L A Y ;
DELEGATE:                     D E L E G A T E ;
DELETE_ALL:                   D E L E T E '_' A L L ;
DELETE:                       D E L E T E ;
DELETEXML:                    D E L E T E X M L ;
DEMAND:                       D E M A N D ;
DENSE_RANKM:                  D E N S E '_' R A N K M ;
DEPENDENT:                    D E P E N D E N T ;
DEPTH:                        D E P T H ;
DEQUEUE:                      D E Q U E U E ;
DEREF:                        D E R E F ;
DEREF_NO_REWRITE:             D E R E F '_' N O '_' R E W R I T E ;
DESC:                         D E S C ;
DESTROY:                      D E S T R O Y ;
DETACHED:                     D E T A C H E D ;
DETERMINES:                   D E T E R M I N E S ;
DETERMINISTIC:                D E T E R M I N I S T I C ;
DICTIONARY:                   D I C T I O N A R Y ;
DIMENSION:                    D I M E N S I O N ;
DIMENSIONS:                   D I M E N S I O N S ;
DIRECT_LOAD:                  D I R E C T '_' L O A D ;
DIRECTORY:                    D I R E C T O R Y ;
DIRECT_PATH:                  D I R E C T '_' P A T H ;
DISABLE_ALL:                  D I S A B L E '_' A L L ;
DISABLE:                      D I S A B L E ;
DISABLE_PARALLEL_DML:         D I S A B L E '_' P A R A L L E L '_' D M L ;
DISABLE_PRESET:               D I S A B L E '_' P R E S E T ;
DISABLE_RPKE:                 D I S A B L E '_' R P K E ;
DISALLOW:                     D I S A L L O W ;
DISASSOCIATE:                 D I S A S S O C I A T E ;
DISCARD:                      D I S C A R D ;
DISCONNECT:                   D I S C O N N E C T ;
DISK:                         D I S K ;
DISKGROUP:                    D I S K G R O U P ;
DISKS:                        D I S K S ;
DISMOUNT:                     D I S M O U N T ;
DISTINCT:                     D I S T I N C T ;
DISTINGUISHED:                D I S T I N G U I S H E D ;
DISTRIBUTED:                  D I S T R I B U T E D ;
DISTRIBUTE:                   D I S T R I B U T E ;
DML:                          D M L ;
DML_UPDATE:                   D M L '_' U P D A T E ;
DOCFIDELITY:                  D O C F I D E L I T Y ;
DOCUMENT:                     D O C U M E N T ;
DOMAIN_INDEX_FILTER:          D O M A I N '_' I N D E X '_' F I L T E R ;
DOMAIN_INDEX_NO_SORT:         D O M A I N '_' I N D E X '_' N O '_' S O R T ;
DOMAIN_INDEX_SORT:            D O M A I N '_' I N D E X '_' S O R T ;
DOUBLE:                       D O U B L E ;
DOWNGRADE:                    D O W N G R A D E ;
DRIVING_SITE:                 D R I V I N G '_' S I T E ;
DROP_COLUMN:                  D R O P '_' C O L U M N ;
DROP:                         D R O P ;
DROP_GROUP:                   D R O P '_' G R O U P ;
DSINTERVAL_UNCONSTRAINED:     D S I N T E R V A L '_' U N C O N S T R A I N E D ;
DST_UPGRADE_INSERT_CONV:      D S T '_' U P G R A D E '_' I N S E R T '_' C O N V ;
DUMP:                         D U M P ;
DUPLICATE:                    D U P L I C A T E ;
DV:                           D V ;
DYNAMIC:                      D Y N A M I C ;
DYNAMIC_SAMPLING:             D Y N A M I C '_' S A M P L I N G ;
DYNAMIC_SAMPLING_EST_CDN:     D Y N A M I C '_' S A M P L I N G '_' E S T '_' C D N ;
EACH:                         E A C H ;
EDITIONABLE:                  E D I T I O N A B L E ;
EDITION:                      E D I T I O N ;
EDITIONING:                   E D I T I O N I N G ;
EDITIONS:                     E D I T I O N S ;
ELEMENT:                      E L E M E N T ;
ELIM_GROUPBY:                 E L I M '_' G R O U P B Y ;
ELIMINATE_JOIN:               E L I M I N A T E '_' J O I N ;
ELIMINATE_OBY:                E L I M I N A T E '_' O B Y ;
ELIMINATE_OUTER_JOIN:         E L I M I N A T E '_' O U T E R '_' J O I N ;
ELSE:                         E L S E ;
ELSIF:                        E L S I F ;
EM:                           E M ;
EMPTY_BLOB:                   E M P T Y '_' B L O B ;
EMPTY_CLOB:                   E M P T Y '_' C L O B ;
EMPTY:                        E M P T Y ;
ENABLE_ALL:                   E N A B L E '_' A L L ;
ENABLE:                       E N A B L E ;
ENABLE_PARALLEL_DML:          E N A B L E '_' P A R A L L E L '_' D M L ;
ENABLE_PRESET:                E N A B L E '_' P R E S E T ;
ENCODING:                     E N C O D I N G ;
ENCRYPT:                      E N C R Y P T ;
ENCRYPTION:                   E N C R Y P T I O N ;
END:                          E N D ;
END_OUTLINE_DATA:             E N D '_' O U T L I N E '_' D A T A ;
ENFORCED:                     E N F O R C E D ;
ENFORCE:                      E N F O R C E ;
ENQUEUE:                      E N Q U E U E ;
ENTERPRISE:                   E N T E R P R I S E ;
ENTITYESCAPING:               E N T I T Y E S C A P I N G ;
ENTRY:                        E N T R Y ;
EQUIPART:                     E Q U I P A R T ;
ERR:                          E R R ;
ERRO:                         E R R O;
ERROR_ARGUMENT:               E R R O R '_' A R G U M E N T ;
ERROR:                        E R R O R ;
ERROR_ON_OVERLAP_TIME:        E R R O R '_' O N '_' O V E R L A P '_' T I M E ;
ERRORS:                       E R R O R S ;
ESCAPE:                       E S C A P E ;
ESTIMATE:                     E S T I M A T E ;
EVAL:                         E V A L ;
EVALNAME:                     E V A L N A M E ;
EVALUATE:                     E V A L U A T E ;
EVALUATION:                   E V A L U A T I O N ;
EVENTS:                       E V E N T S ;
EVERY:                        E V E R Y ;
EXCEPT:                       E X C E P T ;
EXCEPTION:                    E X C E P T I O N ;
EXCEPTION_INIT:               E X C E P T I O N '_' I N I T ;
EXCEPTIONS:                   E X C E P T I O N S ;
EXCHANGE:                     E X C H A N G E ;
EXCLUDE:                      E X C L U D E ;
EXCLUDING:                    E X C L U D I N G ;
EXCLUSIVE:                    E X C L U S I V E ;
EXECUTE:                      E X E C ( U T E )?;
EXEMPT:                       E X E M P T ;
EXISTING:                     E X I S T I N G ;
EXISTS:                       E X I S T S ;
EXISTSNODE:                   E X I S T S N O D E ;
EXIT:                         E X I T ;
EXPAND_GSET_TO_UNION:         E X P A N D '_' G S E T '_' T O '_' U N I O N ;
EXPAND_TABLE:                 E X P A N D '_' T A B L E ;
EXP:                          E X P ;
EXPIRE:                       E X P I R E ;
EXPLAIN:                      E X P L A I N ;
EXPLOSION:                    E X P L O S I O N ;
EXPORT:                       E X P O R T ;
EXPR_CORR_CHECK:              E X P R '_' C O R R '_' C H E C K ;
EXPRESS:                      E X P R E S S ;
EXTENDS:                      E X T E N D S ;
EXTENT:                       E X T E N T ;
EXTENTS:                      E X T E N T S ;
EXTERNAL:                     E X T E R N A L ;
EXTERNALLY:                   E X T E R N A L L Y ;
EXTRACTCLOBXML:               E X T R A C T C L O B X M L ;
EXTRACT:                      E X T R A C T ;
EXTRACTVALUE:                 E X T R A C T V A L U E ;
EXTRA:                        E X T R A ;
FACILITY:                     F A C I L I T Y ;
FACT:                         F A C T ;
FACTOR:                       F A C T O R ;
FACTORIZE_JOIN:               F A C T O R I Z E '_' J O I N ;
FAILED:                       F A I L E D ;
FAILED_LOGIN_ATTEMPTS:        F A I L E D '_' L O G I N '_' A T T E M P T S ;
FAILGROUP:                    F A I L G R O U P ;
FAILOVER:                     F A I L O V E R ;
FAILURE:                      F A I L U R E ;
FALSE:                        F A L S E ;
FAMILY:                       F A M I L Y ;
FAR:                          F A R ;
FAST:                         F A S T ;
FASTSTART:                    F A S T S T A R T ;
FBTSCAN:                      F B T S C A N ;
FEATURE_DETAILS:              F E A T U R E '_' D E T A I L S ;
FEATURE_ID:                   F E A T U R E '_' I D ;
FEATURE_SET:                  F E A T U R E '_' S E T ;
FEATURE_VALUE:                F E A T U R E '_' V A L U E ;
FETCH:                        F E T C H ;
FILE:                         F I L E ;
FILE_NAME_CONVERT:            F I L E '_' N A M E '_' C O N V E R T ;
FILESYSTEM_LIKE_LOGGING:      F I L E S Y S T E M '_' L I K E '_' L O G G I N G ;
FILTER:                       F I L T E R ;
FINAL:                        F I N A L ;
FINE:                         F I N E ;
FINISH:                       F I N I S H ;
FIRST:                        F I R S T ;
FIRSTM:                       F I R S T M ;
FIRST_ROWS:                   F I R S T '_' R O W S ;
FIRST_VALUE:                  F I R S T '_' V A L U E ;
FIXED_VIEW_DATA:              F I X E D '_' V I E W '_' D A T A ;
FLAGGER:                      F L A G G E R ;
FLASHBACK:                    F L A S H B A C K ;
FLASH_CACHE:                  F L A S H '_' C A C H E ;
FLOAT:                        F L O A T ;
FLOB:                         F L O B ;
FLOOR:                        F L O O R ;
FLUSH:                        F L U S H ;
FOLDER:                       F O L D E R ;
FOLLOWING:                    F O L L O W I N G ;
FOLLOWS:                      F O L L O W S ;
FORALL:                       F O R A L L ;
FORCE:                        F O R C E ;
FORCE_XML_QUERY_REWRITE:      F O R C E '_' X M L '_' Q U E R Y '_' R E W R I T E ;
FOREIGN:                      F O R E I G N ;
FOREVER:                      F O R E V E R ;
FOR:                          F O R ;
FORMAT:                       F O R M A T ;
FORWARD:                      F O R W A R D ;
FRAGMENT_NUMBER:              F R A G M E N T '_' N U M B E R ;
FREELIST:                     F R E E L I S T ;
FREELISTS:                    F R E E L I S T S ;
FREEPOOLS:                    F R E E P O O L S ;
FRESH:                        F R E S H ;
FROM:                         F R O M ;
FROM_TZ:                      F R O M '_' T Z ;
FULL:                         F U L L ;
FULL_OUTER_JOIN_TO_OUTER:     F U L L '_' O U T E R '_' J O I N '_' T O '_' O U T E R ;
FUNCTION:                     F U N C T I O N ;
FUNCTIONS:                    F U N C T I O N S ;
GATHER_OPTIMIZER_STATISTICS:  G A T H E R '_' O P T I M I Z E R '_' S T A T I S T I C S ;
GATHER_PLAN_STATISTICS:       G A T H E R '_' P L A N '_' S T A T I S T I C S ;
GBY_CONC_ROLLUP:              G B Y '_' C O N C '_' R O L L U P ;
GBY_PUSHDOWN:                 G B Y '_' P U S H D O W N ;
GENERATED:                    G E N E R A T E D ;
GET:                          G E T ;
GLOBAL:                       G L O B A L ;
GLOBALLY:                     G L O B A L L Y ;
GLOBAL_NAME:                  G L O B A L '_' N A M E ;
GLOBAL_TOPIC_ENABLED:         G L O B A L '_' T O P I C '_' E N A B L E D ;
GOTO:                         G O T O ;
GRANT:                        G R A N T ;
GROUP_BY:                     G R O U P '_' B Y ;
GROUP:                        G R O U P ;
GROUP_ID:                     G R O U P '_' I D ;
GROUPING:                     G R O U P I N G ;
GROUPING_ID:                  G R O U P I N G '_' I D ;
GROUPS:                       G R O U P S ;
GUARANTEED:                   G U A R A N T E E D ;
GUARANTEE:                    G U A R A N T E E ;
GUARD:                        G U A R D ;
HASH_AJ:                      H A S H '_' A J ;
HASH:                         H A S H ;
HASHKEYS:                     H A S H K E Y S ;
HASH_SJ:                      H A S H '_' S J ;
HAVING:                       H A V I N G ;
HEADER:                       H E A D E R ;
HEAP:                         H E A P ;
HELP:                         H E L P ;
HEXTORAW:                     H E X T O R A W ;
HEXTOREF:                     H E X T O R E F ;
HIDDEN_KEYWORD:               H I D D E N ;
HIDE:                         H I D E ;
HIERARCHY:                    H I E R A R C H Y ;
HIGH:                         H I G H ;
HINTSET_BEGIN:                H I N T S E T '_' B E G I N ;
HINTSET_END:                  H I N T S E T '_' E N D ;
HOT:                          H O T ;
HOUR:                         H O U R ;
HWM_BROKERED:                 H W M '_' B R O K E R E D ;
HYBRID:                       H Y B R I D ;
IDENTIFIED:                   I D E N T I F I E D ;
IDENTIFIER:                   I D E N T I F I E R ;
IDENTITY:                     I D E N T I T Y ;
IDGENERATORS:                 I D G E N E R A T O R S ;
ID:                           I D ;
IDLE_TIME:                    I D L E '_' T I M E ;
IF:                           I F ;
IGNORE:                       I G N O R E ;
IGNORE_OPTIM_EMBEDDED_HINTS:  I G N O R E '_' O P T I M '_' E M B E D D E D '_' H I N T S ;
IGNORE_ROW_ON_DUPKEY_INDEX:   I G N O R E '_' R O W '_' O N '_' D U P K E Y '_' I N D E X ;
IGNORE_WHERE_CLAUSE:          I G N O R E '_' W H E R E '_' C L A U S E ;
ILM:                          I L M ;
IMMEDIATE:                    I M M E D I A T E ;
IMPACT:                       I M P A C T ;
IMPORT:                       I M P O R T ;
INACTIVE:                     I N A C T I V E ;
INCLUDE:                      I N C L U D E ;
INCLUDE_VERSION:              I N C L U D E '_' V E R S I O N ;
INCLUDING:                    I N C L U D I N G ;
INCREMENTAL:                  I N C R E M E N T A L ;
INCREMENT:                    I N C R E M E N T ;
INCR:                         I N C R ;
INDENT:                       I N D E N T ;
INDEX_ASC:                    I N D E X '_' A S C ;
INDEX_COMBINE:                I N D E X '_' C O M B I N E ;
INDEX_DESC:                   I N D E X '_' D E S C ;
INDEXED:                      I N D E X E D ;
INDEXES:                      I N D E X E S ;
INDEX_FFS:                    I N D E X '_' F F S ;
INDEX_FILTER:                 I N D E X '_' F I L T E R ;
INDEX:                        I N D E X ;
INDEXING:                     I N D E X I N G ;
INDEX_JOIN:                   I N D E X '_' J O I N ;
INDEX_ROWS:                   I N D E X '_' R O W S ;
INDEX_RRS:                    I N D E X '_' R R S ;
INDEX_RS_ASC:                 I N D E X '_' R S '_' A S C ;
INDEX_RS_DESC:                I N D E X '_' R S '_' D E S C ;
INDEX_RS:                     I N D E X '_' R S ;
INDEX_SCAN:                   I N D E X '_' S C A N ;
INDEX_SKIP_SCAN:              I N D E X '_' S K I P '_' S C A N ;
INDEX_SS_ASC:                 I N D E X '_' S S '_' A S C ;
INDEX_SS_DESC:                I N D E X '_' S S '_' D E S C ;
INDEX_SS:                     I N D E X '_' S S ;
INDEX_STATS:                  I N D E X '_' S T A T S ;
INDEXTYPE:                    I N D E X T Y P E ;
INDEXTYPES:                   I N D E X T Y P E S ;
INDICATOR:                    I N D I C A T O R ;
INDICES:                      I N D I C E S ;
INFINITE:                     I N F I N I T E ;
INFORMATIONAL:                I N F O R M A T I O N A L ;
INHERIT:                      I N H E R I T ;
IN:                           I N ;
INITCAP:                      I N I T C A P ;
INITIAL:                      I N I T I A L ;
INITIALIZED:                  I N I T I A L I Z E D ;
INITIALLY:                    I N I T I A L L Y ;
INITRANS:                     I N I T R A N S ;
INLINE:                       I N L I N E ;
INLINE_XMLTYPE_NT:            I N L I N E '_' X M L T Y P E '_' N T ;
INMEMORY:                     I N M E M O R Y ;
IN_MEMORY_METADATA:           I N '_' M E M O R Y '_' M E T A D A T A ;
INMEMORY_PRUNING:             I N M E M O R Y '_' P R U N I N G ;
INNER:                        I N N E R ;
INOUT:                        I N O U T ;
INPLACE:                      I N P L A C E ;
INSERTCHILDXMLAFTER:          I N S E R T C H I L D X M L A F T E R ;
INSERTCHILDXMLBEFORE:         I N S E R T C H I L D X M L B E F O R E ;
INSERTCHILDXML:               I N S E R T C H I L D X M L ;
INSERT:                       I N S E R T ;
INSERTXMLAFTER:               I N S E R T X M L A F T E R ;
INSERTXMLBEFORE:              I N S E R T X M L B E F O R E ;
INSTANCE:                     I N S T A N C E ;
INSTANCES:                    I N S T A N C E S ;
INSTANTIABLE:                 I N S T A N T I A B L E ;
INSTANTLY:                    I N S T A N T L Y ;
INSTEAD:                      I N S T E A D ;
INSTR2:                       I N S T R '2' ;
INSTR4:                       I N S T R '4' ;
INSTRB:                       I N S T R B ;
INSTRC:                       I N S T R C ;
INSTR:                        I N S T R ;
INTEGER:                      I N T E G E R ;
INTERLEAVED:                  I N T E R L E A V E D ;
INTERMEDIATE:                 I N T E R M E D I A T E ;
INTERNAL_CONVERT:             I N T E R N A L '_' C O N V E R T ;
INTERNAL_USE:                 I N T E R N A L '_' U S E ;
INTERPRETED:                  I N T E R P R E T E D ;
INTERSECT:                    I N T E R S E C T ;
INTERVAL:                     I N T E R V A L ;
INT:                          I N T ;
INTO:                         I N T O ;
INVALIDATE:                   I N V A L I D A T E ;
INVISIBLE:                    I N V I S I B L E ;
IN_XQUERY:                    I N '_' X Q U E R Y ;
IS:                           I S ;
ISOPEN:                       I S O P E N;
ISOLATION:                    I S O L A T I O N ;
ISOLATION_LEVEL:              I S O L A T I O N '_' L E V E L ;
ITERATE:                      I T E R A T E ;
ITERATION_NUMBER:             I T E R A T I O N '_' N U M B E R ;
JAVA:                         J A V A ;
JOB:                          J O B ;
JOIN:                         J O I N ;
JSON_ARRAYAGG:                J S O N '_' A R R A Y A G G ;
JSON_ARRAY:                   J S O N '_' A R R A Y ;
JSON_EQUAL:                   J S O N '_' E Q U A L ;
JSON_EXISTS2:                 J S O N '_' E X I S T S '2' ;
JSON_EXISTS:                  J S O N '_' E X I S T S ;
JSONGET:                      J S O N G E T ;
JSON:                         J S O N ;
JSON_OBJECTAGG:               J S O N '_' O B J E C T A G G ;
JSON_OBJECT:                  J S O N '_' O B J E C T ;
JSONPARSE:                    J S O N P A R S E ;
JSON_QUERY:                   J S O N '_' Q U E R Y ;
JSON_SERIALIZE:               J S O N '_' S E R I A L I Z E ;
JSON_TABLE:                   J S O N '_' T A B L E ;
JSON_TEXTCONTAINS2:           J S O N '_' T E X T C O N T A I N S '2' ;
JSON_TEXTCONTAINS:            J S O N '_' T E X T C O N T A I N S ;
JSON_VALUE:                   J S O N '_' V A L U E ;
KEEP_DUPLICATES:              K E E P '_' D U P L I C A T E S ;
KEEP:                         K E E P ;
KERBEROS:                     K E R B E R O S ;
KEY:                          K E Y ;
KEY_LENGTH:                   K E Y '_' L E N G T H ;
KEYSIZE:                      K E Y S I Z E ;
KEYS:                         K E Y S ;
KEYSTORE:                     K E Y S T O R E ;
KILL:                         K I L L ;
LABEL:                        L A B E L ;
LANGUAGE:                     L A N G U A G E ;
LAST_DAY:                     L A S T '_' D A Y ;
LAST:                         L A S T ;
LAST_VALUE:                   L A S T '_' V A L U E ;
LATERAL:                      L A T E R A L ;
LAX:                          L A X ;
LAYER:                        L A Y E R ;
LDAP_REGISTRATION_ENABLED:    L D A P '_' R E G I S T R A T I O N '_' E N A B L E D ;
LDAP_REGISTRATION:            L D A P '_' R E G I S T R A T I O N ;
LDAP_REG_SYNC_INTERVAL:       L D A P '_' R E G '_' S Y N C '_' I N T E R V A L ;
LEADING:                      L E A D I N G ;
LEFT:                         L E F T ;
LENGTH2:                      L E N G T H '2' ;
LENGTH4:                      L E N G T H '4' ;
LENGTHB:                      L E N G T H B ;
LENGTHC:                      L E N G T H C ;
LENGTH:                       L E N G T H ;
LESS:                         L E S S ;
LEVEL:                        L E V E L ;
LEVELS:                       L E V E L S ;
LIBRARY:                      L I B R A R Y ;
LIFECYCLE:                    L I F E C Y C L E ;
LIFE:                         L I F E ;
LIFETIME:                     L I F E T I M E ;
LIKE2:                        L I K E '2' ;
LIKE4:                        L I K E '4' ;
LIKEC:                        L I K E C ;
LIKE_EXPAND:                  L I K E '_' E X P A N D ;
LIKE:                         L I K E ;
LIMIT:                        L I M I T ;
LINEAR:                       L I N E A R ;
LINK:                         L I N K ;
LIST:                         L I S T ;
LN:                           L N ;
LNNVL:                        L N N V L ;
LOAD:                         L O A D ;
LOB:                          L O B ;
LOBNVL:                       L O B N V L ;
LOBS:                         L O B S ;
LOCAL_INDEXES:                L O C A L '_' I N D E X E S ;
LOCAL:                        L O C A L ;
LOCALTIME:                    L O C A L T I M E ;
LOCALTIMESTAMP:               L O C A L T I M E S T A M P ;
LOCATION:                     L O C A T I O N ;
LOCATOR:                      L O C A T O R ;
LOCKED:                       L O C K E D ;
LOCKING:                      L O C K I N G ;
LOCK:                         L O C K ;
LOGFILE:                      L O G F I L E ;
LOGFILES:                     L O G F I L E S ;
LOGGING:                      L O G G I N G ;
LOGICAL:                      L O G I C A L ;
LOGICAL_READS_PER_CALL:       L O G I C A L '_' R E A D S '_' P E R '_' C A L L ;
LOGICAL_READS_PER_SESSION:    L O G I C A L '_' R E A D S '_' P E R '_' S E S S I O N ;
LOG:                          L O G ;
LOGMINING:                    L O G M I N I N G ;
LOGOFF:                       L O G O F F ;
LOGON:                        L O G O N ;
LOG_READ_ONLY_VIOLATIONS:     L O G '_' R E A D '_' O N L Y '_' V I O L A T I O N S ;
LONG:                         L O N G ;
LOOP:                         L O O P ;
LOWER:                        L O W E R ;
LOW:                          L O W ;
LPAD:                         L P A D ;
LTRIM:                        L T R I M ;
MAIN:                         M A I N ;
MAKE_REF:                     M A K E '_' R E F ;
MANAGED:                      M A N A G E D ;
MANAGE:                       M A N A G E ;
MANAGEMENT:                   M A N A G E M E N T ;
MANAGER:                      M A N A G E R ;
MANUAL:                       M A N U A L ;
MAP:                          M A P ;
MAPPING:                      M A P P I N G ;
MASTER:                       M A S T E R ;
MATCHED:                      M A T C H E D ;
MATCHES:                      M A T C H E S ;
MATCH:                        M A T C H ;
MATCH_NUMBER:                 M A T C H '_' N U M B E R ;
MATCH_RECOGNIZE:              M A T C H '_' R E C O G N I Z E ;
MATERIALIZED:                 M A T E R I A L I Z E D ;
MATERIALIZE:                  M A T E R I A L I Z E ;
MAXARCHLOGS:                  M A X A R C H L O G S ;
MAXDATAFILES:                 M A X D A T A F I L E S ;
MAXEXTENTS:                   M A X E X T E N T S ;
MAXIMIZE:                     M A X I M I Z E ;
MAXINSTANCES:                 M A X I N S T A N C E S ;
MAXLOGFILES:                  M A X L O G F I L E S ;
MAXLOGHISTORY:                M A X L O G H I S T O R Y ;
MAXLOGMEMBERS:                M A X L O G M E M B E R S ;
MAX_SHARED_TEMP_SIZE:         M A X '_' S H A R E D '_' T E M P '_' S I Z E ;
MAXSIZE:                      M A X S I Z E ;
MAXTRANS:                     M A X T R A N S ;
MAXVALUE:                     M A X V A L U E ;
MEASURE:                      M E A S U R E ;
MEASURES:                     M E A S U R E S ;
MEDIUM:                       M E D I U M ;
MEMBER:                       M E M B E R ;
MEMCOMPRESS:                  M E M C O M P R E S S ;
MEMORY:                       M E M O R Y ;
MERGEACTIONS:                 M E R G E '$' A C T I O N S ;
MERGE_AJ:                     M E R G E '_' A J ;
MERGE_CONST_ON:               M E R G E '_' C O N S T '_' O N ;
MERGE:                        M E R G E ;
MERGE_SJ:                     M E R G E '_' S J ;
METADATA:                     M E T A D A T A ;
METHOD:                       M E T H O D ;
MIGRATE:                      M I G R A T E ;
MIGRATION:                    M I G R A T I O N ;
MINEXTENTS:                   M I N E X T E N T S ;
MINIMIZE:                     M I N I M I Z E ;
MINIMUM:                      M I N I M U M ;
MINING:                       M I N I N G ;
MINUS:                        M I N U S ;
MINUS_NULL:                   M I N U S '_' N U L L ;
MINUTE:                       M I N U T E ;
MINVALUE:                     M I N V A L U E ;
MIRRORCOLD:                   M I R R O R C O L D ;
MIRRORHOT:                    M I R R O R H O T ;
MIRROR:                       M I R R O R ;
MLSLABEL:                     M L S L A B E L ;
MODEL_COMPILE_SUBQUERY:       M O D E L '_' C O M P I L E '_' S U B Q U E R Y ;
MODEL_DONTVERIFY_UNIQUENESS:  M O D E L '_' D O N T V E R I F Y '_' U N I Q U E N E S S ;
MODEL_DYNAMIC_SUBQUERY:       M O D E L '_' D Y N A M I C '_' S U B Q U E R Y ;
MODEL_MIN_ANALYSIS:           M O D E L '_' M I N '_' A N A L Y S I S ;
MODEL:                        M O D E L ;
MODEL_NB:                     M O D E L '_' N B ;
MODEL_NO_ANALYSIS:            M O D E L '_' N O '_' A N A L Y S I S ;
MODEL_PBY:                    M O D E L '_' P B Y ;
MODEL_PUSH_REF:               M O D E L '_' P U S H '_' R E F ;
MODEL_SV:                     M O D E L '_' S V ;
MODE:                         M O D E ;
MODIFICATION:                 M O D I F I C A T I O N ;
MODIFY_COLUMN_TYPE:           M O D I F Y '_' C O L U M N '_' T Y P E ;
MODIFY:                       M O D I F Y ;
MOD:                          M O D ;
MODULE:                       M O D U L E ;
MONITORING:                   M O N I T O R I N G ;
MONITOR:                      M O N I T O R ;
MONTH:                        M O N T H ;
MONTHS_BETWEEN:               M O N T H S '_' B E T W E E N ;
MONTHS:                       M O N T H S ;
MOUNT:                        M O U N T ;
MOUNTPATH:                    M O U N T P A T H ;
MOVEMENT:                     M O V E M E N T ;
MOVE:                         M O V E ;
MULTIDIMENSIONAL:             M U L T I D I M E N S I O N A L ;
MULTISET:                     M U L T I S E T ;
MV_MERGE:                     M V '_' M E R G E ;
NAMED:                        N A M E D ;
NAME:                         N A M E ;
NAMESPACE:                    N A M E S P A C E ;
NAN:                          N A N ;
NANVL:                        N A N V L ;
NATIONAL:                     N A T I O N A L ;
NATIVE_FULL_OUTER_JOIN:       N A T I V E '_' F U L L '_' O U T E R '_' J O I N ;
NATIVE:                       N A T I V E ;
NATURAL:                      N A T U R A L ;
NATURALN:                     N A T U R A L N ;
NAV:                          N A V ;
NCHAR_CS:                     N C H A R '_' C S ;
NCHAR:                        N C H A R ;
NCHR:                         N C H R ;
NCLOB:                        N C L O B ;
NEEDED:                       N E E D E D ;
NEG:                          N E G ;
NESTED:                       N E S T E D ;
NESTED_TABLE_FAST_INSERT:     N E S T E D '_' T A B L E '_' F A S T '_' I N S E R T ;
NESTED_TABLE_GET_REFS:        N E S T E D '_' T A B L E '_' G E T '_' R E F S ;
NESTED_TABLE_ID:              N E S T E D '_' T A B L E '_' I D ;
NESTED_TABLE_SET_REFS:        N E S T E D '_' T A B L E '_' S E T '_' R E F S ;
NESTED_TABLE_SET_SETID:       N E S T E D '_' T A B L E '_' S E T '_' S E T I D ;
NETWORK:                      N E T W O R K ;
NEVER:                        N E V E R ;
NEW:                          N E W ;
NEW_TIME:                     N E W '_' T I M E ;
NEXT_DAY:                     N E X T '_' D A Y ;
NEXT:                         N E X T ;
NL_AJ:                        N L '_' A J ;
NLJ_BATCHING:                 N L J '_' B A T C H I N G ;
NLJ_INDEX_FILTER:             N L J '_' I N D E X '_' F I L T E R ;
NLJ_INDEX_SCAN:               N L J '_' I N D E X '_' S C A N ;
NLJ_PREFETCH:                 N L J '_' P R E F E T C H ;
NLS_CALENDAR:                 N L S '_' C A L E N D A R ;
NLS_CHARACTERSET:             N L S '_' C H A R A C T E R S E T ;
NLS_CHARSET_DECL_LEN:         N L S '_' C H A R S E T '_' D E C L '_' L E N ;
NLS_CHARSET_ID:               N L S '_' C H A R S E T '_' I D ;
NLS_CHARSET_NAME:             N L S '_' C H A R S E T '_' N A M E ;
NLS_COMP:                     N L S '_' C O M P ;
NLS_CURRENCY:                 N L S '_' C U R R E N C Y ;
NLS_DATE_FORMAT:              N L S '_' D A T E '_' F O R M A T ;
NLS_DATE_LANGUAGE:            N L S '_' D A T E '_' L A N G U A G E ;
NLS_INITCAP:                  N L S '_' I N I T C A P ;
NLS_ISO_CURRENCY:             N L S '_' I S O '_' C U R R E N C Y ;
NL_SJ:                        N L '_' S J ;
NLS_LANG:                     N L S '_' L A N G ;
NLS_LANGUAGE:                 N L S '_' L A N G U A G E ;
NLS_LENGTH_SEMANTICS:         N L S '_' L E N G T H '_' S E M A N T I C S ;
NLS_LOWER:                    N L S '_' L O W E R ;
NLS_NCHAR_CONV_EXCP:          N L S '_' N C H A R '_' C O N V '_' E X C P ;
NLS_NUMERIC_CHARACTERS:       N L S '_' N U M E R I C '_' C H A R A C T E R S ;
NLS_SORT:                     N L S '_' S O R T ;
NLSSORT:                      N L S S O R T ;
NLS_SPECIAL_CHARS:            N L S '_' S P E C I A L '_' C H A R S ;
NLS_TERRITORY:                N L S '_' T E R R I T O R Y ;
NLS_UPPER:                    N L S '_' U P P E R ;
NO_ACCESS:                    N O '_' A C C E S S ;
NO_ADAPTIVE_PLAN:             N O '_' A D A P T I V E '_' P L A N ;
NO_ANSI_REARCH:               N O '_' A N S I '_' R E A R C H ;
NOAPPEND:                     N O A P P E N D ;
NOARCHIVELOG:                 N O A R C H I V E L O G ;
NOAUDIT:                      N O A U D I T ;
NO_AUTO_REOPTIMIZE:           N O '_' A U T O '_' R E O P T I M I Z E ;
NO_BASETABLE_MULTIMV_REWRITE: N O '_' B A S E T A B L E '_' M U L T I M V '_' R E W R I T E ;
NO_BATCH_TABLE_ACCESS_BY_ROWID: N O '_' B A T C H '_' T A B L E '_' A C C E S S '_' B Y '_' R O W I D ;
NO_BIND_AWARE:                N O '_' B I N D '_' A W A R E ;
NO_BUFFER:                    N O '_' B U F F E R ;
NOCACHE:                      N O C A C H E ;
NO_CARTESIAN:                 N O '_' C A R T E S I A N ;
NO_CHECK_ACL_REWRITE:         N O '_' C H E C K '_' A C L '_' R E W R I T E ;
NO_CLUSTER_BY_ROWID:          N O '_' C L U S T E R '_' B Y '_' R O W I D ;
NO_CLUSTERING:                N O '_' C L U S T E R I N G ;
NO_COALESCE_SQ:               N O '_' C O A L E S C E '_' S Q ;
NO_COMMON_DATA:               N O '_' C O M M O N '_' D A T A ;
NOCOMPRESS:                   N O C O M P R E S S ;
NO_CONNECT_BY_CB_WHR_ONLY:    N O '_' C O N N E C T '_' B Y '_' C B '_' W H R '_' O N L Y ;
NO_CONNECT_BY_COMBINE_SW:     N O '_' C O N N E C T '_' B Y '_' C O M B I N E '_' S W ;
NO_CONNECT_BY_COST_BASED:     N O '_' C O N N E C T '_' B Y '_' C O S T '_' B A S E D ;
NO_CONNECT_BY_ELIM_DUPS:      N O '_' C O N N E C T '_' B Y '_' E L I M '_' D U P S ;
NO_CONNECT_BY_FILTERING:      N O '_' C O N N E C T '_' B Y '_' F I L T E R I N G ;
NOCOPY:                       N O C O P Y ;
NO_COST_XML_QUERY_REWRITE:    N O '_' C O S T '_' X M L '_' Q U E R Y '_' R E W R I T E ;
NO_CPU_COSTING:               N O '_' C P U '_' C O S T I N G ;
NOCPU_COSTING:                N O C P U '_' C O S T I N G ;
NOCYCLE:                      N O C Y C L E ;
NO_DATA_SECURITY_REWRITE:     N O '_' D A T A '_' S E C U R I T Y '_' R E W R I T E ;
NO_DECORRELATE:               N O '_' D E C O R R E L A T E ;
NODELAY:                      N O D E L A Y ;
NO_DOMAIN_INDEX_FILTER:       N O '_' D O M A I N '_' I N D E X '_' F I L T E R ;
NO_DST_UPGRADE_INSERT_CONV:   N O '_' D S T '_' U P G R A D E '_' I N S E R T '_' C O N V ;
NO_ELIM_GROUPBY:              N O '_' E L I M '_' G R O U P B Y ;
NO_ELIMINATE_JOIN:            N O '_' E L I M I N A T E '_' J O I N ;
NO_ELIMINATE_OBY:             N O '_' E L I M I N A T E '_' O B Y ;
NO_ELIMINATE_OUTER_JOIN:      N O '_' E L I M I N A T E '_' O U T E R '_' J O I N ;
NOENTITYESCAPING:             N O E N T I T Y E S C A P I N G ;
NO_EXPAND_GSET_TO_UNION:      N O '_' E X P A N D '_' G S E T '_' T O '_' U N I O N ;
NO_EXPAND:                    N O '_' E X P A N D ;
NO_EXPAND_TABLE:              N O '_' E X P A N D '_' T A B L E ;
NO_FACT:                      N O '_' F A C T ;
NO_FACTORIZE_JOIN:            N O '_' F A C T O R I Z E '_' J O I N ;
NO_FILTERING:                 N O '_' F I L T E R I N G ;
NOFORCE:                      N O F O R C E ;
NO_FULL_OUTER_JOIN_TO_OUTER:  N O '_' F U L L '_' O U T E R '_' J O I N '_' T O '_' O U T E R ;
NO_GATHER_OPTIMIZER_STATISTICS: N O '_' G A T H E R '_' O P T I M I Z E R '_' S T A T I S T I C S ;
NO_GBY_PUSHDOWN:              N O '_' G B Y '_' P U S H D O W N ;
NOGUARANTEE:                  N O G U A R A N T E E ;
NO_INDEX_FFS:                 N O '_' I N D E X '_' F F S ;
NO_INDEX:                     N O '_' I N D E X ;
NO_INDEX_SS:                  N O '_' I N D E X '_' S S ;
NO_INMEMORY:                  N O '_' I N M E M O R Y ;
NO_INMEMORY_PRUNING:          N O '_' I N M E M O R Y '_' P R U N I N G ;
NOKEEP:                       N O K E E P ;
NO_LOAD:                      N O '_' L O A D ;
NOLOCAL:                      N O L O C A L ;
NOLOGGING:                    N O L O G G I N G ;
NOMAPPING:                    N O M A P P I N G ;
NOMAXVALUE:                   N O M A X V A L U E ;
NO_MERGE:                     N O '_' M E R G E ;
NOMINIMIZE:                   N O M I N I M I Z E ;
NOMINVALUE:                   N O M I N V A L U E ;
NO_MODEL_PUSH_REF:            N O '_' M O D E L '_' P U S H '_' R E F ;
NO_MONITORING:                N O '_' M O N I T O R I N G ;
NOMONITORING:                 N O M O N I T O R I N G ;
NO_MONITOR:                   N O '_' M O N I T O R ;
NO_MULTIMV_REWRITE:           N O '_' M U L T I M V '_' R E W R I T E ;
NO_NATIVE_FULL_OUTER_JOIN:    N O '_' N A T I V E '_' F U L L '_' O U T E R '_' J O I N ;
NONBLOCKING:                  N O N B L O C K I N G ;
NONEDITIONABLE:               N O N E D I T I O N A B L E ;
NONE:                         N O N E ;
NO_NLJ_BATCHING:              N O '_' N L J '_' B A T C H I N G ;
NO_NLJ_PREFETCH:              N O '_' N L J '_' P R E F E T C H ;
NO:                           N O ;
NONSCHEMA:                    N O N S C H E M A ;
NO_OBJECT_LINK:               N O '_' O B J E C T '_' L I N K ;
NOORDER:                      N O O R D E R ;
NO_ORDER_ROLLUPS:             N O '_' O R D E R '_' R O L L U P S ;
NO_OUTER_JOIN_TO_ANTI:        N O '_' O U T E R '_' J O I N '_' T O '_' A N T I ;
NO_OUTER_JOIN_TO_INNER:       N O '_' O U T E R '_' J O I N '_' T O '_' I N N E R ;
NOOVERRIDE:                   N O O V E R R I D E ;
NO_PARALLEL_INDEX:            N O '_' P A R A L L E L '_' I N D E X ;
NOPARALLEL_INDEX:             N O P A R A L L E L '_' I N D E X ;
NO_PARALLEL:                  N O '_' P A R A L L E L ;
NOPARALLEL:                   N O P A R A L L E L ;
NO_PARTIAL_COMMIT:            N O '_' P A R T I A L '_' C O M M I T ;
NO_PARTIAL_JOIN:              N O '_' P A R T I A L '_' J O I N ;
NO_PARTIAL_ROLLUP_PUSHDOWN:   N O '_' P A R T I A L '_' R O L L U P '_' P U S H D O W N ;
NOPARTITION:                  N O P A R T I T I O N ;
NO_PLACE_DISTINCT:            N O '_' P L A C E '_' D I S T I N C T ;
NO_PLACE_GROUP_BY:            N O '_' P L A C E '_' G R O U P '_' B Y ;
NO_PQ_CONCURRENT_UNION:       N O '_' P Q '_' C O N C U R R E N T '_' U N I O N ;
NO_PQ_MAP:                    N O '_' P Q '_' M A P ;
NO_PQ_REPLICATE:              N O '_' P Q '_' R E P L I C A T E ;
NO_PQ_SKEW:                   N O '_' P Q '_' S K E W ;
NO_PRUNE_GSETS:               N O '_' P R U N E '_' G S E T S ;
NO_PULL_PRED:                 N O '_' P U L L '_' P R E D ;
NO_PUSH_PRED:                 N O '_' P U S H '_' P R E D ;
NO_PUSH_SUBQ:                 N O '_' P U S H '_' S U B Q ;
NO_PX_FAULT_TOLERANCE:        N O '_' P X '_' F A U L T '_' T O L E R A N C E ;
NO_PX_JOIN_FILTER:            N O '_' P X '_' J O I N '_' F I L T E R ;
NO_QKN_BUFF:                  N O '_' Q K N '_' B U F F ;
NO_QUERY_TRANSFORMATION:      N O '_' Q U E R Y '_' T R A N S F O R M A T I O N ;
NO_REF_CASCADE:               N O '_' R E F '_' C A S C A D E ;
NORELOCATE:                   N O R E L O C A T E ;
NORELY:                       N O R E L Y ;
NOREPAIR:                     N O R E P A I R ;
NOREPLAY:                     N O R E P L A Y ;
NORESETLOGS:                  N O R E S E T L O G S ;
NO_RESULT_CACHE:              N O '_' R E S U L T '_' C A C H E ;
NOREVERSE:                    N O R E V E R S E ;
NO_REWRITE:                   N O '_' R E W R I T E ;
NOREWRITE:                    N O R E W R I T E ;
NORMAL:                       N O R M A L ;
NO_ROOT_SW_FOR_LOCAL:         N O '_' R O O T '_' S W '_' F O R '_' L O C A L ;
NOROWDEPENDENCIES:            N O R O W D E P E N D E N C I E S ;
NOSCALE:                      N O S C A L E;
NOSCHEMACHECK:                N O S C H E M A C H E C K ;
NOSEGMENT:                    N O S E G M E N T ;
NO_SEMIJOIN:                  N O '_' S E M I J O I N ;
NO_SEMI_TO_INNER:             N O '_' S E M I '_' T O '_' I N N E R ;
NO_SET_TO_JOIN:               N O '_' S E T '_' T O '_' J O I N ;
NOSORT:                       N O S O R T ;
NO_SQL_TRANSLATION:           N O '_' S Q L '_' T R A N S L A T I O N ;
NO_SQL_TUNE:                  N O '_' S Q L '_' T U N E ;
NO_STAR_TRANSFORMATION:       N O '_' S T A R '_' T R A N S F O R M A T I O N ;
NO_STATEMENT_QUEUING:         N O '_' S T A T E M E N T '_' Q U E U I N G ;
NO_STATS_GSETS:               N O '_' S T A T S '_' G S E T S ;
NOSTRICT:                     N O S T R I C T ;
NO_SUBQUERY_PRUNING:          N O '_' S U B Q U E R Y '_' P R U N I N G ;
NO_SUBSTRB_PAD:               N O '_' S U B S T R B '_' P A D ;
NO_SWAP_JOIN_INPUTS:          N O '_' S W A P '_' J O I N '_' I N P U T S ;
NOSWITCH:                     N O S W I T C H ;
NO_TABLE_LOOKUP_BY_NL:        N O '_' T A B L E '_' L O O K U P '_' B Y '_' N L ;
NO_TEMP_TABLE:                N O '_' T E M P '_' T A B L E ;
NOTHING:                      N O T H I N G ;
NOTIFICATION:                 N O T I F I C A T I O N ;
NOT:                          N O T ;
NO_TRANSFORM_DISTINCT_AGG:    N O '_' T R A N S F O R M '_' D I S T I N C T '_' A G G ;
NO_UNNEST:                    N O '_' U N N E S T ;
NO_USE_CUBE:                  N O '_' U S E '_' C U B E ;
NO_USE_HASH_AGGREGATION:      N O '_' U S E '_' H A S H '_' A G G R E G A T I O N ;
NO_USE_HASH_GBY_FOR_PUSHDOWN: N O '_' U S E '_' H A S H '_' G B Y '_' F O R '_' P U S H D O W N ;
NO_USE_HASH:                  N O '_' U S E '_' H A S H ;
NO_USE_INVISIBLE_INDEXES:     N O '_' U S E '_' I N V I S I B L E '_' I N D E X E S ;
NO_USE_MERGE:                 N O '_' U S E '_' M E R G E ;
NO_USE_NL:                    N O '_' U S E '_' N L ;
NO_USE_VECTOR_AGGREGATION:    N O '_' U S E '_' V E C T O R '_' A G G R E G A T I O N ;
NOVALIDATE:                   N O V A L I D A T E ;
NO_VECTOR_TRANSFORM_DIMS:     N O '_' V E C T O R '_' T R A N S F O R M '_' D I M S ;
NO_VECTOR_TRANSFORM_FACT:     N O '_' V E C T O R '_' T R A N S F O R M '_' F A C T ;
NO_VECTOR_TRANSFORM:          N O '_' V E C T O R '_' T R A N S F O R M ;
NOWAIT:                       N O W A I T ;
NO_XDB_FASTPATH_INSERT:       N O '_' X D B '_' F A S T P A T H '_' I N S E R T ;
NO_XML_DML_REWRITE:           N O '_' X M L '_' D M L '_' R E W R I T E ;
NO_XMLINDEX_REWRITE_IN_SELECT: N O '_' X M L I N D E X '_' R E W R I T E '_' I N '_' S E L E C T ;
NO_XMLINDEX_REWRITE:          N O '_' X M L I N D E X '_' R E W R I T E ;
NO_XML_QUERY_REWRITE:         N O '_' X M L '_' Q U E R Y '_' R E W R I T E ;
NO_ZONEMAP:                   N O '_' Z O N E M A P ;
NTH_VALUE:                    N T H '_' V A L U E ;
NULLIF:                       N U L L I F ;
NULL:                         N U L L ;
NULLS:                        N U L L S ;
NUMBER:                       N U M B E R ;
NUMERIC:                      N U M E R I C ;
NUM_INDEX_KEYS:               N U M '_' I N D E X '_' K E Y S ;
NUMTODSINTERVAL:              N U M T O D S I N T E R V A L ;
NUMTOYMINTERVAL:              N U M T O Y M I N T E R V A L ;
NVARCHAR2:                    N V A R C H A R '2' ;
NVL2:                         N V L '2' ;
OBJECT2XML:                   O B J E C T '2' X M L ;
OBJECT:                       O B J E C T ;
OBJ_ID:                       O B J '_' I D ;
OBJNO:                        O B J N O ;
OBJNO_REUSE:                  O B J N O '_' R E U S E ;
OCCURENCES:                   O C C U R E N C E S ;
OFFLINE:                      O F F L I N E ;
OFF:                          O F F ;
OFFSET:                       O F F S E T ;
OF:                           O F ;
OIDINDEX:                     O I D I N D E X ;
OID:                          O I D ;
OLAP:                         O L A P ;
OLD:                          O L D ;
OLD_PUSH_PRED:                O L D '_' P U S H '_' P R E D ;
OLS:                          O L S ;
OLTP:                         O L T P ;
OMIT:                         O M I T ;
ONE:                          O N E ;
ONLINE:                       O N L I N E ;
ONLY:                         O N L Y ;
ON:                           O N ;
OPAQUE:                       O P A Q U E ;
OPAQUE_TRANSFORM:             O P A Q U E '_' T R A N S F O R M ;
OPAQUE_XCANONICAL:            O P A Q U E '_' X C A N O N I C A L ;
OPCODE:                       O P C O D E ;
OPEN:                         O P E N ;
OPERATIONS:                   O P E R A T I O N S ;
OPERATOR:                     O P E R A T O R ;
OPT_ESTIMATE:                 O P T '_' E S T I M A T E ;
OPTIMAL:                      O P T I M A L ;
OPTIMIZE:                     O P T I M I Z E ;
OPTIMIZER_FEATURES_ENABLE:    O P T I M I Z E R '_' F E A T U R E S '_' E N A B L E ;
OPTIMIZER_GOAL:               O P T I M I Z E R '_' G O A L ;
OPTION:                       O P T I O N ;
OPT_PARAM:                    O P T '_' P A R A M ;
ORA_BRANCH:                   O R A '_' B R A N C H ;
ORA_CHECK_ACL:                O R A '_' C H E C K '_' A C L ;
ORA_CHECK_PRIVILEGE:          O R A '_' C H E C K '_' P R I V I L E G E ;
ORA_CLUSTERING:               O R A '_' C L U S T E R I N G ;
ORADATA:                      O R A D A T A ;
ORADEBUG:                     O R A D E B U G ;
ORA_DST_AFFECTED:             O R A '_' D S T '_' A F F E C T E D ;
ORA_DST_CONVERT:              O R A '_' D S T '_' C O N V E R T ;
ORA_DST_ERROR:                O R A '_' D S T '_' E R R O R ;
ORA_GET_ACLIDS:               O R A '_' G E T '_' A C L I D S ;
ORA_GET_PRIVILEGES:           O R A '_' G E T '_' P R I V I L E G E S ;
ORA_HASH:                     O R A '_' H A S H ;
ORA_INVOKING_USERID:          O R A '_' I N V O K I N G '_' U S E R I D ;
ORA_INVOKING_USER:            O R A '_' I N V O K I N G '_' U S E R ;
ORA_INVOKING_XS_USER_GUID:    O R A '_' I N V O K I N G '_' X S '_' U S E R '_' G U I D ;
ORA_INVOKING_XS_USER:         O R A '_' I N V O K I N G '_' X S '_' U S E R ;
ORA_RAWCOMPARE:               O R A '_' R A W C O M P A R E ;
ORA_RAWCONCAT:                O R A '_' R A W C O N C A T ;
ORA_ROWSCN:                   O R A '_' R O W S C N ;
ORA_ROWSCN_RAW:               O R A '_' R O W S C N '_' R A W ;
ORA_ROWVERSION:               O R A '_' R O W V E R S I O N ;
ORA_TABVERSION:               O R A '_' T A B V E R S I O N ;
ORA_WRITE_TIME:               O R A '_' W R I T E '_' T I M E ;
ORDERED:                      O R D E R E D ;
ORDERED_PREDICATES:           O R D E R E D '_' P R E D I C A T E S ;
ORDER:                        O R D E R ;
ORDINALITY:                   O R D I N A L I T Y ;
OR_EXPAND:                    O R '_' E X P A N D ;
ORGANIZATION:                 O R G A N I Z A T I O N ;
OR:                           O R ;
OR_PREDICATES:                O R '_' P R E D I C A T E S ;
OSERROR:                      O S E R R O R ;
OTHER:                        O T H E R ;
OUTER_JOIN_TO_ANTI:           O U T E R '_' J O I N '_' T O '_' A N T I ;
OUTER_JOIN_TO_INNER:          O U T E R '_' J O I N '_' T O '_' I N N E R ;
OUTER:                        O U T E R ;
OUTLINE_LEAF:                 O U T L I N E '_' L E A F ;
OUTLINE:                      O U T L I N E ;
OUT_OF_LINE:                  O U T '_' O F '_' L I N E ;
OUT:                          O U T ;
OVERFLOW_NOMOVE:              O V E R F L O W '_' N O M O V E ;
OVERFLOW:                     O V E R F L O W ;
OVERLAPS:                     O V E R L A P S ;
OVER:                         O V E R ;
OVERRIDING:                   O V E R R I D I N G ;
OWNER:                        O W N E R ;
OWNERSHIP:                    O W N E R S H I P ;
OWN:                          O W N ;
PACKAGE:                      P A C K A G E ;
PACKAGES:                     P A C K A G E S ;
PARALLEL_ENABLE:              P A R A L L E L '_' E N A B L E ;
PARALLEL_INDEX:               P A R A L L E L '_' I N D E X ;
PARALLEL:                     P A R A L L E L ;
PARAMETERS:                   P A R A M E T E R S ;
PARAM:                        P A R A M ;
PARENT:                       P A R E N T ;
PARITY:                       P A R I T Y ;
PARTIAL_JOIN:                 P A R T I A L '_' J O I N ;
PARTIALLY:                    P A R T I A L L Y ;
PARTIAL:                      P A R T I A L ;
PARTIAL_ROLLUP_PUSHDOWN:      P A R T I A L '_' R O L L U P '_' P U S H D O W N ;
PARTITION_HASH:               P A R T I T I O N '_' H A S H ;
PARTITION_LIST:               P A R T I T I O N '_' L I S T ;
PARTITION:                    P A R T I T I O N ;
PARTITION_RANGE:              P A R T I T I O N '_' R A N G E ;
PARTITIONS:                   P A R T I T I O N S ;
PARTNUMINST:                  P A R T '$' N U M '$' I N S T ;
PASSING:                      P A S S I N G ;
PASSWORD_GRACE_TIME:          P A S S W O R D '_' G R A C E '_' T I M E ;
PASSWORD_LIFE_TIME:           P A S S W O R D '_' L I F E '_' T I M E ;
PASSWORD_LOCK_TIME:           P A S S W O R D '_' L O C K '_' T I M E ;
PASSWORD:                     P A S S W O R D ;
PASSWORD_REUSE_MAX:           P A S S W O R D '_' R E U S E '_' M A X ;
PASSWORD_REUSE_TIME:          P A S S W O R D '_' R E U S E '_' T I M E ;
PASSWORD_VERIFY_FUNCTION:     P A S S W O R D '_' V E R I F Y '_' F U N C T I O N ;
PAST:                         P A S T ;
PATCH:                        P A T C H ;
PATH:                         P A T H ;
PATH_PREFIX:                  P A T H '_' P R E F I X ;
PATHS:                        P A T H S ;
PATTERN:                      P A T T E R N ;
PBL_HS_BEGIN:                 P B L '_' H S '_' B E G I N ;
PBL_HS_END:                   P B L '_' H S '_' E N D ;
PCTFREE:                      P C T F R E E ;
PCTINCREASE:                  P C T I N C R E A S E ;
PCTTHRESHOLD:                 P C T T H R E S H O L D ;
PCTUSED:                      P C T U S E D ;
PCTVERSION:                   P C T V E R S I O N ;
PENDING:                      P E N D I N G ;
PERCENT_FOUND:                '%' F O U N D ;
PERCENT_ISOPEN:               '%' I S O P E N ;
PERCENT_NOTFOUND:             '%' N O T F O U N D ;
PERCENT_KEYWORD:              P E R C E N T ;
PERCENT_RANKM:                P E R C E N T '_' R A N K M ;
PERCENT_ROWCOUNT:             '%' R O W C O U N T ;
PERCENT_ROWTYPE:              '%' R O W T Y P E ;
PERCENT_TYPE:                 '%' T Y P E ;

FOUND:                        F O U N D;
NOTFOUND:                     N O T F O U N D;
ROWCOUNT:                     R O W C O U N T ;


PERFORMANCE:                  P E R F O R M A N C E ;
PERIOD_KEYWORD:               P E R I O D ;
PERMANENT:                    P E R M A N E N T ;
PERMISSION:                   P E R M I S S I O N ;
PERMUTE:                      P E R M U T E ;
PER:                          P E R ;
PFILE:                        P F I L E ;
PHYSICAL:                     P H Y S I C A L ;
PIKEY:                        P I K E Y ;
PIPELINED:                    P I P E L I N E D ;
PIPE:                         P I P E ;
PIV_GB:                       P I V '_' G B ;
PIVOT:                        P I V O T ;
PIV_SSF:                      P I V '_' S S F ;
PLACE_DISTINCT:               P L A C E '_' D I S T I N C T ;
PLACE_GROUP_BY:               P L A C E '_' G R O U P '_' B Y ;
PLAN:                         P L A N ;
PLSCOPE_SETTINGS:             P L S C O P E '_' S E T T I N G S ;
PLS_INTEGER:                  P L S '_' I N T E G E R ;
PLSQL_CCFLAGS:                P L S Q L '_' C C F L A G S ;
PLSQL_CODE_TYPE:              P L S Q L '_' C O D E '_' T Y P E ;
PLSQL_DEBUG:                  P L S Q L '_' D E B U G ;
PLSQL_OPTIMIZE_LEVEL:         P L S Q L '_' O P T I M I Z E '_' L E V E L ;
PLSQL_WARNINGS:               P L S Q L '_' W A R N I N G S ;
PLUGGABLE:                    P L U G G A B L E ;
POINT:                        P O I N T ;
POLICY:                       P O L I C Y ;
POOL_16K:                     P O O L '_' '1' '6' K ;
POOL_2K:                      P O O L '_' '2' K ;
POOL_32K:                     P O O L '_' '3' '2' K ;
POOL_4K:                      P O O L '_' '4' K ;
POOL_8K:                      P O O L '_' '8' K ;
POSITIVEN:                    P O S I T I V E N ;
POSITIVE:                     P O S I T I V E ;
POST_TRANSACTION:             P O S T '_' T R A N S A C T I O N ;
POWERMULTISET_BY_CARDINALITY: P O W E R M U L T I S E T '_' B Y '_' C A R D I N A L I T Y ;
POWERMULTISET:                P O W E R M U L T I S E T ;
POWER:                        P O W E R ;
PQ_CONCURRENT_UNION:          P Q '_' C O N C U R R E N T '_' U N I O N ;
PQ_DISTRIBUTE:                P Q '_' D I S T R I B U T E ;
PQ_DISTRIBUTE_WINDOW:         P Q '_' D I S T R I B U T E '_' W I N D O W ;
PQ_FILTER:                    P Q '_' F I L T E R ;
PQ_MAP:                       P Q '_' M A P ;
PQ_NOMAP:                     P Q '_' N O M A P ;
PQ_REPLICATE:                 P Q '_' R E P L I C A T E ;
PQ_SKEW:                      P Q '_' S K E W ;
PRAGMA:                       P R A G M A ;
PREBUILT:                     P R E B U I L T ;
PRECEDES:                     P R E C E D E S ;
PRECEDING:                    P R E C E D I N G ;
PRECISION:                    P R E C I S I O N ;
PRECOMPUTE_SUBQUERY:          P R E C O M P U T E '_' S U B Q U E R Y ;
PREDICATE_REORDERS:           P R E D I C A T E '_' R E O R D E R S ;
PRELOAD:                      P R E L O A D ;
PREPARE:                      P R E P A R E ;
PRESENTNNV:                   P R E S E N T N N V ;
PRESENT:                      P R E S E N T ;
PRESENTV:                     P R E S E N T V ;
PRESERVE_OID:                 P R E S E R V E '_' O I D ;
PRESERVE:                     P R E S E R V E ;
PRETTY:                       P R E T T Y ;
PREVIOUS:                     P R E V I O U S ;
PREV:                         P R E V ;
PRIMARY:                      P R I M A R Y ;
PRINTBLOBTOCLOB:              P R I N T B L O B T O C L O B ;
PRIORITY:                     P R I O R I T Y ;
PRIOR:                        P R I O R ;
PRIVATE:                      P R I V A T E ;
PRIVATE_SGA:                  P R I V A T E '_' S G A ;
PRIVILEGED:                   P R I V I L E G E D ;
PRIVILEGE:                    P R I V I L E G E ;
PRIVILEGES:                   P R I V I L E G E S ;
PROCEDURAL:                   P R O C E D U R A L ;
PROCEDURE:                    P R O C E D U R E ;
PROCESS:                      P R O C E S S ;
PROFILE:                      P R O F I L E ;
PROGRAM:                      P R O G R A M ;
PROJECT:                      P R O J E C T ;
PROMPT:                       P R O M P T;
PROPAGATE:                    P R O P A G A T E ;
PROTECTED:                    P R O T E C T E D ;
PROTECTION:                   P R O T E C T I O N ;
PROXY:                        P R O X Y ;
PRUNING:                      P R U N I N G ;
PUBLIC:                       P U B L I C ;
PULL_PRED:                    P U L L '_' P R E D ;
PURGE:                        P U R G E ;
PUSH_PRED:                    P U S H '_' P R E D ;
PUSH_SUBQ:                    P U S H '_' S U B Q ;
PX_FAULT_TOLERANCE:           P X '_' F A U L T '_' T O L E R A N C E ;
PX_GRANULE:                   P X '_' G R A N U L E ;
PX_JOIN_FILTER:               P X '_' J O I N '_' F I L T E R ;
QB_NAME:                      Q B '_' N A M E ;
QUERY_BLOCK:                  Q U E R Y '_' B L O C K ;
QUERY:                        Q U E R Y ;
QUEUE_CURR:                   Q U E U E '_' C U R R ;
QUEUE:                        Q U E U E ;
QUEUE_ROWP:                   Q U E U E '_' R O W P ;
QUIESCE:                      Q U I E S C E ;
QUORUM:                       Q U O R U M ;
QUOTA:                        Q U O T A ;
RAISE:                        R A I S E ;
RANDOM_LOCAL:                 R A N D O M '_' L O C A L ;
RANDOM:                       R A N D O M ;
RANGE:                        R A N G E ;
RANKM:                        R A N K M ;
RAPIDLY:                      R A P I D L Y ;
RAW:                          R A W ;
RAWTOHEX:                     R A W T O H E X ;
RAWTONHEX:                    R A W T O N H E X ;
RBA:                          R B A ;
RBO_OUTLINE:                  R B O '_' O U T L I N E ;
RDBA:                         R D B A ;
READ:                         R E A D ;
READS:                        R E A D S ;
REALM:                        R E A L M ;
REAL:                         R E A L ;
REBALANCE:                    R E B A L A N C E ;
REBUILD:                      R E B U I L D ;
RECORD:                       R E C O R D ;
RECORDS_PER_BLOCK:            R E C O R D S '_' P E R '_' B L O C K ;
RECOVERABLE:                  R E C O V E R A B L E ;
RECOVER:                      R E C O V E R ;
RECOVERY:                     R E C O V E R Y ;
RECYCLEBIN:                   R E C Y C L E B I N ;
RECYCLE:                      R E C Y C L E ;
REDACTION:                    R E D A C T I O N ;
REDEFINE:                     R E D E F I N E ;
REDO:                         R E D O ;
REDUCED:                      R E D U C E D ;
REDUNDANCY:                   R E D U N D A N C Y ;
REF_CASCADE_CURSOR:           R E F '_' C A S C A D E '_' C U R S O R ;
REFERENCED:                   R E F E R E N C E D ;
REFERENCE:                    R E F E R E N C E ;
REFERENCES:                   R E F E R E N C E S ;
REFERENCING:                  R E F E R E N C I N G ;
REF:                          R E F ;
REFRESH:                      R E F R E S H ;
REFTOHEX:                     R E F T O H E X ;
REGEXP_COUNT:                 R E G E X P '_' C O U N T ;
REGEXP_INSTR:                 R E G E X P '_' I N S T R ;
REGEXP_LIKE:                  R E G E X P '_' L I K E ;
REGEXP_REPLACE:               R E G E X P '_' R E P L A C E ;
REGEXP_SUBSTR:                R E G E X P '_' S U B S T R ;
REGISTER:                     R E G I S T E R ;
REGR_AVGX:                    R E G R '_' A V G X ;
REGR_AVGY:                    R E G R '_' A V G Y ;
REGR_COUNT:                   R E G R '_' C O U N T ;
REGR_INTERCEPT:               R E G R '_' I N T E R C E P T ;
REGR_R2:                      R E G R '_' R '2' ;
REGR_SLOPE:                   R E G R '_' S L O P E ;
REGR_SXX:                     R E G R '_' S X X ;
REGR_SXY:                     R E G R '_' S X Y ;
REGR_SYY:                     R E G R '_' S Y Y ;
REGULAR:                      R E G U L A R ;
REJECT:                       R E J E C T ;
REKEY:                        R E K E Y ;
RELATIONAL:                   R E L A T I O N A L ;
RELIES_ON:                    R E L I E S '_' O N ;
RELOCATE:                     R E L O C A T E ;
RELY:                         R E L Y ;
REMAINDER:                    R E M A I N D E R ;
REMOTE_MAPPED:                R E M O T E '_' M A P P E D ;
REMOVE:                       R E M O V E ;
REM:                          R E M;
RENAME:                       R E N A M E ;
REPAIR:                       R E P A I R ;
REPEAT:                       R E P E A T ;
REPLACE:                      R E P L A C E ;
REPLICATION:                  R E P L I C A T I O N ;
REQUIRED:                     R E Q U I R E D ;
RESETLOGS:                    R E S E T L O G S ;
RESET:                        R E S E T ;
RESIZE:                       R E S I Z E ;
RESOLVE:                      R E S O L V E ;
RESOLVER:                     R E S O L V E R ;
RESOURCE:                     R E S O U R C E ;
RESPECT:                      R E S P E C T ;
RESTART:                      R E S T A R T ;
RESTORE_AS_INTERVALS:         R E S T O R E '_' A S '_' I N T E R V A L S ;
RESTORE:                      R E S T O R E ;
RESTRICT_ALL_REF_CONS:        R E S T R I C T '_' A L L '_' R E F '_' C O N S ;
RESTRICTED:                   R E S T R I C T E D ;
RESTRICT_REFERENCES:          R E S T R I C T '_' R E F E R E N C E S ;
RESTRICT:                     R E S T R I C T ;
RESULT_CACHE:                 R E S U L T '_' C A C H E ;
RESULT:                       R E S U L T ;
RESUMABLE:                    R E S U M A B L E ;
RESUME:                       R E S U M E ;
RETENTION:                    R E T E N T I O N ;
RETRY_ON_ROW_CHANGE:          R E T R Y '_' O N '_' R O W '_' C H A N G E ;
RETURNING:                    R E T U R N I N G ;
RETURN:                       R E T U R N ;
REUSE:                        R E U S E ;
REVERSE:                      R E V E R S E ;
REVOKE:                       R E V O K E ;
REWRITE_OR_ERROR:             R E W R I T E '_' O R '_' E R R O R ;
REWRITE:                      R E W R I T E ;
RIGHT:                        R I G H T ;
ROLE:                         R O L E ;
ROLESET:                      R O L E S E T ;
ROLES:                        R O L E S ;
ROLLBACK:                     R O L L B A C K ;
ROLLING:                      R O L L I N G ;
ROLLUP:                       R O L L U P ;
ROWDEPENDENCIES:              R O W D E P E N D E N C I E S ;
ROWID_MAPPING_TABLE:          R O W I D '_' M A P P I N G '_' T A B L E ;
ROWID:                        R O W I D ;
ROWIDTOCHAR:                  R O W I D T O C H A R ;
ROWIDTONCHAR:                 R O W I D T O N C H A R ;
ROW_LENGTH:                   R O W '_' L E N G T H ;
ROWNUM:                       R O W N U M ;
ROW:                          R O W ;
ROWS:                         R O W S ;
RPAD:                         R P A D ;
RTRIM:                        R T R I M ;
RULE:                         R U L E ;
RULES:                        R U L E S ;
RUNNING:                      R U N N I N G ;
SALT:                         S A L T ;
SAMPLE:                       S A M P L E ;
SAVE_AS_INTERVALS:            S A V E '_' A S '_' I N T E R V A L S ;
SAVEPOINT:                    S A V E P O I N T ;
SAVE:                         S A V E ;
SB4:                          S B '4' ;
SCALE_ROWS:                   S C A L E '_' R O W S ;
SCALE:                        S C A L E ;
SCAN_INSTANCES:               S C A N '_' I N S T A N C E S ;
SCAN:                         S C A N ;
SCHEDULER:                    S C H E D U L E R ;
SCHEMACHECK:                  S C H E M A C H E C K ;
SCHEMA:                       S C H E M A ;
SCN_ASCENDING:                S C N '_' A S C E N D I N G ;
SCN:                          S C N ;
SCOPE:                        S C O P E ;
SCRUB:                        S C R U B ;
SD_ALL:                       S D '_' A L L ;
SD_INHIBIT:                   S D '_' I N H I B I T ;
SDO_GEOM_MBR:                 S D O '_' G E O M '_' M B R ;
SD_SHOW:                      S D '_' S H O W ;
SEARCH:                       S E A R C H ;
SECOND:                       S E C O N D ;
SECRET:                       S E C R E T ;
SECUREFILE_DBA:               S E C U R E F I L E '_' D B A ;
SECUREFILE:                   S E C U R E F I L E ;
SECURITY:                     S E C U R I T Y ;
SEED:                         S E E D ;
SEG_BLOCK:                    S E G '_' B L O C K ;
SEG_FILE:                     S E G '_' F I L E ;
SEGMENT:                      S E G M E N T ;
SELECTIVITY:                  S E L E C T I V I T Y ;
SELECT:                       S E L E C T ;
SELF:                         S E L F ;
SEMIJOIN_DRIVER:              S E M I J O I N '_' D R I V E R ;
SEMIJOIN:                     S E M I J O I N ;
SEMI_TO_INNER:                S E M I '_' T O '_' I N N E R ;
SEQUENCED:                    S E Q U E N C E D ;
SEQUENCE:                     S E Q U E N C E ;
SEQUENTIAL:                   S E Q U E N T I A L ;
SERIALIZABLE:                 S E R I A L I Z A B L E ;
SERIALLY_REUSABLE:            S E R I A L L Y '_' R E U S A B L E ;
SERIAL:                       S E R I A L ;
SERVERERROR:                  S E R V E R E R R O R ;
SERVICE_NAME_CONVERT:         S E R V I C E '_' N A M E '_' C O N V E R T ;
SERVICES:                     S E R V I C E S ;
SESSION_CACHED_CURSORS:       S E S S I O N '_' C A C H E D '_' C U R S O R S ;
SESSION:                      S E S S I O N ;
SESSIONS_PER_USER:            S E S S I O N S '_' P E R '_' U S E R ;
SESSIONTIMEZONE:              S E S S I O N T I M E Z O N E ;
SESSIONTZNAME:                S E S S I O N T Z N A M E ;
SET:                          S E T ;
SETS:                         S E T S ;
SETTINGS:                     S E T T I N G S ;
SET_TO_JOIN:                  S E T '_' T O '_' J O I N ;
SEVERE:                       S E V E R E ;
SHARED_POOL:                  S H A R E D '_' P O O L ;
SHARED:                       S H A R E D ;
SHARE:                        S H A R E ;
SHARING:                      S H A R I N G ;
SHELFLIFE:                    S H E L F L I F E ;
SHOW:                         S H O W ;
SHRINK:                       S H R I N K ;
SHUTDOWN:                     S H U T D O W N ;
SIBLINGS:                     S I B L I N G S ;
SID:                          S I D ;
SIGNAL_COMPONENT:             S I G N A L '_' C O M P O N E N T ;
SIGNAL_FUNCTION:              S I G N A L '_' F U N C T I O N ;
SIGN:                         S I G N ;
SIGNTYPE:                     S I G N T Y P E ;
SIMPLE_INTEGER:               S I M P L E '_' I N T E G E R ;
SIMPLE:                       S I M P L E ;
SINGLE:                       S I N G L E ;
SINGLETASK:                   S I N G L E T A S K ;
SINH:                         S I N H ;
SIN:                          S I N ;
SIZE:                         S I Z E ;
SKIP_EXT_OPTIMIZER:           S K I P '_' E X T '_' O P T I M I Z E R ;
SKIP_       :                 S K I P ;
SKIP_UNQ_UNUSABLE_IDX:        S K I P '_' U N Q '_' U N U S A B L E '_' I D X ;
SKIP_UNUSABLE_INDEXES:        S K I P '_' U N U S A B L E '_' I N D E X E S ;
SMALLFILE:                    S M A L L F I L E ;
SMALLINT:                     S M A L L I N T ;
SNAPSHOT:                     S N A P S H O T ;
SOME:                         S O M E ;
SORT:                         S O R T ;
SOUNDEX:                      S O U N D E X ;
SOURCE_FILE_DIRECTORY:        S O U R C E '_' F I L E '_' D I R E C T O R Y ;
SOURCE_FILE_NAME_CONVERT:     S O U R C E '_' F I L E '_' N A M E '_' C O N V E R T ;
SOURCE:                       S O U R C E ;
SPACE_KEYWORD:                S P A C E ;
SPECIFICATION:                S P E C I F I C A T I O N ;
SPFILE:                       S P F I L E ;
SPLIT:                        S P L I T ;
SPREADSHEET:                  S P R E A D S H E E T ;
SQLDATA:                      S Q L D A T A ;
SQLERROR:                     S Q L E R R O R ;
SQLLDR:                       S Q L L D R ;
SQL:                          S Q L ;
SQL_TRACE:                    S Q L '_' T R A C E ;
SQL_TRANSLATION_PROFILE:      S Q L '_' T R A N S L A T I O N '_' P R O F I L E ;
SQRT:                         S Q R T ;
STALE:                        S T A L E ;
STANDALONE:                   S T A N D A L O N E ;
STANDARD_HASH:                S T A N D A R D '_' H A S H ;
STANDBY_MAX_DATA_DELAY:       S T A N D B Y '_' M A X '_' D A T A '_' D E L A Y ;
STANDBYS:                     S T A N D B Y S ;
STANDBY:                      S T A N D B Y ;
STAR:                         S T A R ;
STAR_TRANSFORMATION:          S T A R '_' T R A N S F O R M A T I O N ;
START:                        S T A R T ;
STARTUP:                      S T A R T U P ;
STATEMENT_ID:                 S T A T E M E N T '_' I D ;
STATEMENT_QUEUING:            S T A T E M E N T '_' Q U E U I N G ;
STATEMENTS:                   S T A T E M E N T S ;
STATEMENT:                    S T A T E M E N T ;
STATE:                        S T A T E ;
STATIC:                       S T A T I C ;
STATISTICS:                   S T A T I S T I C S ;
STATS_BINOMIAL_TEST:          S T A T S '_' B I N O M I A L '_' T E S T ;
STATS_CROSSTAB:               S T A T S '_' C R O S S T A B ;
STATS_F_TEST:                 S T A T S '_' F '_' T E S T ;
STATS_KS_TEST:                S T A T S '_' K S '_' T E S T ;
STATS_MODE:                   S T A T S '_' M O D E ;
STATS_MW_TEST:                S T A T S '_' M W '_' T E S T ;
STATS_ONE_WAY_ANOVA:          S T A T S '_' O N E '_' W A Y '_' A N O V A ;
STATS_T_TEST_INDEP:           S T A T S '_' T '_' T E S T '_' I N D E P ;
STATS_T_TEST_INDEPU:          S T A T S '_' T '_' T E S T '_' I N D E P U ;
STATS_T_TEST_ONE:             S T A T S '_' T '_' T E S T '_' O N E ;
STATS_T_TEST_PAIRED:          S T A T S '_' T '_' T E S T '_' P A I R E D ;
STATS_WSR_TEST:               S T A T S '_' W S R '_' T E S T ;
STDDEV_POP:                   S T D D E V '_' P O P ;
STDDEV_SAMP:                  S T D D E V '_' S A M P ;
STOP:                         S T O P ;
STORAGE:                      S T O R A G E ;
STORE:                        S T O R E ;
STREAMS:                      S T R E A M S ;
STREAM:                       S T R E A M ;
STRICT:                       S T R I C T ;
STRING:                       S T R I N G ;
STRIPE_COLUMNS:               S T R I P E '_' C O L U M N S ;
STRIPE_WIDTH:                 S T R I P E '_' W I D T H ;
STRIP:                        S T R I P ;
STRUCTURE:                    S T R U C T U R E ;
SUBMULTISET:                  S U B M U L T I S E T ;
SUBPARTITION_REL:             S U B P A R T I T I O N '_' R E L ;
SUBPARTITIONS:                S U B P A R T I T I O N S ;
SUBPARTITION:                 S U B P A R T I T I O N ;
SUBQUERIES:                   S U B Q U E R I E S ;
SUBQUERY_PRUNING:             S U B Q U E R Y '_' P R U N I N G ;
SUBSCRIBE:                    S U B S C R I B E ;
SUBSET:                       S U B S E T ;
SUBSTITUTABLE:                S U B S T I T U T A B L E ;
SUBSTR2:                      S U B S T R '2' ;
SUBSTR4:                      S U B S T R '4' ;
SUBSTRB:                      S U B S T R B ;
SUBSTRC:                      S U B S T R C ;
SUBTYPE:                      S U B T Y P E ;
SUCCESSFUL:                   S U C C E S S F U L ;
SUCCESS:                      S U C C E S S ;
SUMMARY:                      S U M M A R Y ;
SUPPLEMENTAL:                 S U P P L E M E N T A L ;
SUSPEND:                      S U S P E N D ;
SWAP_JOIN_INPUTS:             S W A P '_' J O I N '_' I N P U T S ;
SWITCHOVER:                   S W I T C H O V E R ;
SWITCH:                       S W I T C H ;
SYNCHRONOUS:                  S Y N C H R O N O U S ;
SYNC:                         S Y N C ;
SYNONYM:                      S Y N O N Y M ;
SYSASM:                       S Y S A S M ;
SYS_AUDIT:                    S Y S '_' A U D I T ;
SYSAUX:                       S Y S A U X ;
SYSBACKUP:                    S Y S B A C K U P ;
SYS_CHECKACL:                 S Y S '_' C H E C K A C L ;
SYS_CHECK_PRIVILEGE:          S Y S '_' C H E C K '_' P R I V I L E G E ;
SYS_CONNECT_BY_PATH:          S Y S '_' C O N N E C T '_' B Y '_' P A T H ;
SYS_CONTEXT:                  S Y S '_' C O N T E X T ;
SYSDATE:                      S Y S D A T E ;
SYSDBA:                       S Y S D B A ;
SYS_DBURIGEN:                 S Y S '_' D B U R I G E N ;
SYSDG:                        S Y S D G ;
SYS_DL_CURSOR:                S Y S '_' D L '_' C U R S O R ;
SYS_DM_RXFORM_CHR:            S Y S '_' D M '_' R X F O R M '_' C H R ;
SYS_DM_RXFORM_NUM:            S Y S '_' D M '_' R X F O R M '_' N U M ;
SYS_DOM_COMPARE:              S Y S '_' D O M '_' C O M P A R E ;
SYS_DST_PRIM2SEC:             S Y S '_' D S T '_' P R I M '2' S E C ;
SYS_DST_SEC2PRIM:             S Y S '_' D S T '_' S E C '2' P R I M ;
SYS_ET_BFILE_TO_RAW:          S Y S '_' E T '_' B F I L E '_' T O '_' R A W ;
SYS_ET_BLOB_TO_IMAGE:         S Y S '_' E T '_' B L O B '_' T O '_' I M A G E ;
SYS_ET_IMAGE_TO_BLOB:         S Y S '_' E T '_' I M A G E '_' T O '_' B L O B ;
SYS_ET_RAW_TO_BFILE:          S Y S '_' E T '_' R A W '_' T O '_' B F I L E ;
SYS_EXTPDTXT:                 S Y S '_' E X T P D T X T ;
SYS_EXTRACT_UTC:              S Y S '_' E X T R A C T '_' U T C ;
SYS_FBT_INSDEL:               S Y S '_' F B T '_' I N S D E L ;
SYS_FILTER_ACLS:              S Y S '_' F I L T E R '_' A C L S ;
SYS_FNMATCHES:                S Y S '_' F N M A T C H E S ;
SYS_FNREPLACE:                S Y S '_' F N R E P L A C E ;
SYS_GET_ACLIDS:               S Y S '_' G E T '_' A C L I D S ;
SYS_GET_COL_ACLIDS:           S Y S '_' G E T '_' C O L '_' A C L I D S ;
SYS_GET_PRIVILEGES:           S Y S '_' G E T '_' P R I V I L E G E S ;
SYS_GETTOKENID:               S Y S '_' G E T T O K E N I D ;
SYS_GETXTIVAL:                S Y S '_' G E T X T I V A L ;
SYS_GUID:                     S Y S '_' G U I D ;
SYSGUID:                      S Y S G U I D ;
SYSKM:                        S Y S K M ;
SYS_MAKE_XMLNODEID:           S Y S '_' M A K E '_' X M L N O D E I D ;
SYS_MAKEXML:                  S Y S '_' M A K E X M L ;
SYS_MKXMLATTR:                S Y S '_' M K X M L A T T R ;
SYS_MKXTI:                    S Y S '_' M K X T I ;
SYSOBJ:                       S Y S O B J ;
SYS_OP_ADT2BIN:               S Y S '_' O P '_' A D T '2' B I N ;
SYS_OP_ADTCONS:               S Y S '_' O P '_' A D T C O N S ;
SYS_OP_ALSCRVAL:              S Y S '_' O P '_' A L S C R V A L ;
SYS_OP_ATG:                   S Y S '_' O P '_' A T G ;
SYS_OP_BIN2ADT:               S Y S '_' O P '_' B I N '2' A D T ;
SYS_OP_BITVEC:                S Y S '_' O P '_' B I T V E C ;
SYS_OP_BL2R:                  S Y S '_' O P '_' B L '2' R ;
SYS_OP_BLOOM_FILTER_LIST:     S Y S '_' O P '_' B L O O M '_' F I L T E R '_' L I S T ;
SYS_OP_BLOOM_FILTER:          S Y S '_' O P '_' B L O O M '_' F I L T E R ;
SYS_OP_C2C:                   S Y S '_' O P '_' C '2' C ;
SYS_OP_CAST:                  S Y S '_' O P '_' C A S T ;
SYS_OP_CEG:                   S Y S '_' O P '_' C E G ;
SYS_OP_CL2C:                  S Y S '_' O P '_' C L '2' C ;
SYS_OP_COMBINED_HASH:         S Y S '_' O P '_' C O M B I N E D '_' H A S H ;
SYS_OP_COMP:                  S Y S '_' O P '_' C O M P ;
SYS_OP_CONVERT:               S Y S '_' O P '_' C O N V E R T ;
SYS_OP_COUNTCHG:              S Y S '_' O P '_' C O U N T C H G ;
SYS_OP_CSCONV:                S Y S '_' O P '_' C S C O N V ;
SYS_OP_CSCONVTEST:            S Y S '_' O P '_' C S C O N V T E S T ;
SYS_OP_CSR:                   S Y S '_' O P '_' C S R ;
SYS_OP_CSX_PATCH:             S Y S '_' O P '_' C S X '_' P A T C H ;
SYS_OP_CYCLED_SEQ:            S Y S '_' O P '_' C Y C L E D '_' S E Q ;
SYS_OP_DECOMP:                S Y S '_' O P '_' D E C O M P ;
SYS_OP_DESCEND:               S Y S '_' O P '_' D E S C E N D ;
SYS_OP_DISTINCT:              S Y S '_' O P '_' D I S T I N C T ;
SYS_OP_DRA:                   S Y S '_' O P '_' D R A ;
SYS_OP_DUMP:                  S Y S '_' O P '_' D U M P ;
SYS_OP_DV_CHECK:              S Y S '_' O P '_' D V '_' C H E C K ;
SYS_OP_ENFORCE_NOT_NULL:      S Y S '_' O P '_' E N F O R C E '_' N O T '_' N U L L '$' ;
SYSOPER:                      S Y S O P E R ;
SYS_OP_EXTRACT:               S Y S '_' O P '_' E X T R A C T ;
SYS_OP_GROUPING:              S Y S '_' O P '_' G R O U P I N G ;
SYS_OP_GUID:                  S Y S '_' O P '_' G U I D ;
SYS_OP_HASH:                  S Y S '_' O P '_' H A S H ;
SYS_OP_IIX:                   S Y S '_' O P '_' I I X ;
SYS_OP_ITR:                   S Y S '_' O P '_' I T R ;
SYS_OP_KEY_VECTOR_CREATE:     S Y S '_' O P '_' K E Y '_' V E C T O R '_' C R E A T E ;
SYS_OP_KEY_VECTOR_FILTER_LIST: S Y S '_' O P '_' K E Y '_' V E C T O R '_' F I L T E R '_' L I S T ;
SYS_OP_KEY_VECTOR_FILTER:     S Y S '_' O P '_' K E Y '_' V E C T O R '_' F I L T E R ;
SYS_OP_KEY_VECTOR_SUCCEEDED:  S Y S '_' O P '_' K E Y '_' V E C T O R '_' S U C C E E D E D ;
SYS_OP_KEY_VECTOR_USE:        S Y S '_' O P '_' K E Y '_' V E C T O R '_' U S E ;
SYS_OP_LBID:                  S Y S '_' O P '_' L B I D ;
SYS_OP_LOBLOC2BLOB:           S Y S '_' O P '_' L O B L O C '2' B L O B ;
SYS_OP_LOBLOC2CLOB:           S Y S '_' O P '_' L O B L O C '2' C L O B ;
SYS_OP_LOBLOC2ID:             S Y S '_' O P '_' L O B L O C '2' I D ;
SYS_OP_LOBLOC2NCLOB:          S Y S '_' O P '_' L O B L O C '2' N C L O B ;
SYS_OP_LOBLOC2TYP:            S Y S '_' O P '_' L O B L O C '2' T Y P ;
SYS_OP_LSVI:                  S Y S '_' O P '_' L S V I ;
SYS_OP_LVL:                   S Y S '_' O P '_' L V L ;
SYS_OP_MAKEOID:               S Y S '_' O P '_' M A K E O I D ;
SYS_OP_MAP_NONNULL:           S Y S '_' O P '_' M A P '_' N O N N U L L ;
SYS_OP_MSR:                   S Y S '_' O P '_' M S R ;
SYS_OP_NICOMBINE:             S Y S '_' O P '_' N I C O M B I N E ;
SYS_OP_NIEXTRACT:             S Y S '_' O P '_' N I E X T R A C T ;
SYS_OP_NII:                   S Y S '_' O P '_' N I I ;
SYS_OP_NIX:                   S Y S '_' O P '_' N I X ;
SYS_OP_NOEXPAND:              S Y S '_' O P '_' N O E X P A N D ;
SYS_OP_NTCIMG:                S Y S '_' O P '_' N T C I M G '$' ;
SYS_OP_NUMTORAW:              S Y S '_' O P '_' N U M T O R A W ;
SYS_OP_OIDVALUE:              S Y S '_' O P '_' O I D V A L U E ;
SYS_OP_OPNSIZE:               S Y S '_' O P '_' O P N S I Z E ;
SYS_OP_PAR_1:                 S Y S '_' O P '_' P A R '_' '1' ;
SYS_OP_PARGID_1:              S Y S '_' O P '_' P A R G I D '_' '1' ;
SYS_OP_PARGID:                S Y S '_' O P '_' P A R G I D ;
SYS_OP_PAR:                   S Y S '_' O P '_' P A R ;
SYS_OP_PART_ID:               S Y S '_' O P '_' P A R T '_' I D ;
SYS_OP_PIVOT:                 S Y S '_' O P '_' P I V O T ;
SYS_OP_R2O:                   S Y S '_' O P '_' R '2' O ;
SYS_OP_RAWTONUM:              S Y S '_' O P '_' R A W T O N U M ;
SYS_OP_RDTM:                  S Y S '_' O P '_' R D T M ;
SYS_OP_REF:                   S Y S '_' O P '_' R E F ;
SYS_OP_RMTD:                  S Y S '_' O P '_' R M T D ;
SYS_OP_ROWIDTOOBJ:            S Y S '_' O P '_' R O W I D T O O B J ;
SYS_OP_RPB:                   S Y S '_' O P '_' R P B ;
SYS_OPTLOBPRBSC:              S Y S '_' O P T L O B P R B S C ;
SYS_OP_TOSETID:               S Y S '_' O P '_' T O S E T I D ;
SYS_OP_TPR:                   S Y S '_' O P '_' T P R ;
SYS_OP_TRTB:                  S Y S '_' O P '_' T R T B ;
SYS_OPTXICMP:                 S Y S '_' O P T X I C M P ;
SYS_OPTXQCASTASNQ:            S Y S '_' O P T X Q C A S T A S N Q ;
SYS_OP_UNDESCEND:             S Y S '_' O P '_' U N D E S C E N D ;
SYS_OP_VECAND:                S Y S '_' O P '_' V E C A N D ;
SYS_OP_VECBIT:                S Y S '_' O P '_' V E C B I T ;
SYS_OP_VECOR:                 S Y S '_' O P '_' V E C O R ;
SYS_OP_VECXOR:                S Y S '_' O P '_' V E C X O R ;
SYS_OP_VERSION:               S Y S '_' O P '_' V E R S I O N ;
SYS_OP_VREF:                  S Y S '_' O P '_' V R E F ;
SYS_OP_VVD:                   S Y S '_' O P '_' V V D ;
SYS_OP_XMLCONS_FOR_CSX:       S Y S '_' O P '_' X M L C O N S '_' F O R '_' C S X ;
SYS_OP_XPTHATG:               S Y S '_' O P '_' X P T H A T G ;
SYS_OP_XPTHIDX:               S Y S '_' O P '_' X P T H I D X ;
SYS_OP_XPTHOP:                S Y S '_' O P '_' X P T H O P ;
SYS_OP_XTXT2SQLT:             S Y S '_' O P '_' X T X T '2' S Q L T ;
SYS_OP_ZONE_ID:               S Y S '_' O P '_' Z O N E '_' I D ;
SYS_ORDERKEY_DEPTH:           S Y S '_' O R D E R K E Y '_' D E P T H ;
SYS_ORDERKEY_MAXCHILD:        S Y S '_' O R D E R K E Y '_' M A X C H I L D ;
SYS_ORDERKEY_PARENT:          S Y S '_' O R D E R K E Y '_' P A R E N T ;
SYS_PARALLEL_TXN:             S Y S '_' P A R A L L E L '_' T X N ;
SYS_PATHID_IS_ATTR:           S Y S '_' P A T H I D '_' I S '_' A T T R ;
SYS_PATHID_IS_NMSPC:          S Y S '_' P A T H I D '_' I S '_' N M S P C ;
SYS_PATHID_LASTNAME:          S Y S '_' P A T H I D '_' L A S T N A M E ;
SYS_PATHID_LASTNMSPC:         S Y S '_' P A T H I D '_' L A S T N M S P C ;
SYS_PATH_REVERSE:             S Y S '_' P A T H '_' R E V E R S E ;
SYS_PXQEXTRACT:               S Y S '_' P X Q E X T R A C T ;
SYS_RAW_TO_XSID:              S Y S '_' R A W '_' T O '_' X S I D ;
SYS_RID_ORDER:                S Y S '_' R I D '_' O R D E R ;
SYS_ROW_DELTA:                S Y S '_' R O W '_' D E L T A ;
SYS_SC_2_XMLT:                S Y S '_' S C '_' '2' '_' X M L T ;
SYS_SYNRCIREDO:               S Y S '_' S Y N R C I R E D O ;
SYSTEM_DEFINED:               S Y S T E M '_' D E F I N E D ;
SYSTEM:                       S Y S T E M ;
SYSTIMESTAMP:                 S Y S T I M E S T A M P ;
SYS_TYPEID:                   S Y S '_' T Y P E I D ;
SYS_UMAKEXML:                 S Y S '_' U M A K E X M L ;
SYS_XMLANALYZE:               S Y S '_' X M L A N A L Y Z E ;
SYS_XMLCONTAINS:              S Y S '_' X M L C O N T A I N S ;
SYS_XMLCONV:                  S Y S '_' X M L C O N V ;
SYS_XMLEXNSURI:               S Y S '_' X M L E X N S U R I ;
SYS_XMLGEN:                   S Y S '_' X M L G E N ;
SYS_XMLI_LOC_ISNODE:          S Y S '_' X M L I '_' L O C '_' I S N O D E ;
SYS_XMLI_LOC_ISTEXT:          S Y S '_' X M L I '_' L O C '_' I S T E X T ;
SYS_XMLINSTR:                 S Y S '_' X M L I N S T R ;
SYS_XMLLOCATOR_GETSVAL:       S Y S '_' X M L L O C A T O R '_' G E T S V A L ;
SYS_XMLNODEID_GETCID:         S Y S '_' X M L N O D E I D '_' G E T C I D ;
SYS_XMLNODEID_GETLOCATOR:     S Y S '_' X M L N O D E I D '_' G E T L O C A T O R ;
SYS_XMLNODEID_GETOKEY:        S Y S '_' X M L N O D E I D '_' G E T O K E Y ;
SYS_XMLNODEID_GETPATHID:      S Y S '_' X M L N O D E I D '_' G E T P A T H I D ;
SYS_XMLNODEID_GETPTRID:       S Y S '_' X M L N O D E I D '_' G E T P T R I D ;
SYS_XMLNODEID_GETRID:         S Y S '_' X M L N O D E I D '_' G E T R I D ;
SYS_XMLNODEID_GETSVAL:        S Y S '_' X M L N O D E I D '_' G E T S V A L ;
SYS_XMLNODEID_GETTID:         S Y S '_' X M L N O D E I D '_' G E T T I D ;
SYS_XMLNODEID:                S Y S '_' X M L N O D E I D ;
SYS_XMLT_2_SC:                S Y S '_' X M L T '_' '2' '_' S C ;
SYS_XMLTRANSLATE:             S Y S '_' X M L T R A N S L A T E ;
SYS_XMLTYPE2SQL:              S Y S '_' X M L T Y P E '2' S Q L ;
SYS_XQ_ASQLCNV:               S Y S '_' X Q '_' A S Q L C N V ;
SYS_XQ_ATOMCNVCHK:            S Y S '_' X Q '_' A T O M C N V C H K ;
SYS_XQBASEURI:                S Y S '_' X Q B A S E U R I ;
SYS_XQCASTABLEERRH:           S Y S '_' X Q C A S T A B L E E R R H ;
SYS_XQCODEP2STR:              S Y S '_' X Q C O D E P '2' S T R ;
SYS_XQCODEPEQ:                S Y S '_' X Q C O D E P E Q ;
SYS_XQCON2SEQ:                S Y S '_' X Q C O N '2' S E Q ;
SYS_XQCONCAT:                 S Y S '_' X Q C O N C A T ;
SYS_XQDELETE:                 S Y S '_' X Q D E L E T E ;
SYS_XQDFLTCOLATION:           S Y S '_' X Q D F L T C O L A T I O N ;
SYS_XQDOC:                    S Y S '_' X Q D O C ;
SYS_XQDOCURI:                 S Y S '_' X Q D O C U R I ;
SYS_XQDURDIV:                 S Y S '_' X Q D U R D I V ;
SYS_XQED4URI:                 S Y S '_' X Q E D '4' U R I ;
SYS_XQENDSWITH:               S Y S '_' X Q E N D S W I T H ;
SYS_XQERRH:                   S Y S '_' X Q E R R H ;
SYS_XQERR:                    S Y S '_' X Q E R R ;
SYS_XQESHTMLURI:              S Y S '_' X Q E S H T M L U R I ;
SYS_XQEXLOBVAL:               S Y S '_' X Q E X L O B V A L ;
SYS_XQEXSTWRP:                S Y S '_' X Q E X S T W R P ;
SYS_XQEXTRACT:                S Y S '_' X Q E X T R A C T ;
SYS_XQEXTRREF:                S Y S '_' X Q E X T R R E F ;
SYS_XQEXVAL:                  S Y S '_' X Q E X V A L ;
SYS_XQFB2STR:                 S Y S '_' X Q F B '2' S T R ;
SYS_XQFNBOOL:                 S Y S '_' X Q F N B O O L ;
SYS_XQFNCMP:                  S Y S '_' X Q F N C M P ;
SYS_XQFNDATIM:                S Y S '_' X Q F N D A T I M ;
SYS_XQFNLNAME:                S Y S '_' X Q F N L N A M E ;
SYS_XQFNNM:                   S Y S '_' X Q F N N M ;
SYS_XQFNNSURI:                S Y S '_' X Q F N N S U R I ;
SYS_XQFNPREDTRUTH:            S Y S '_' X Q F N P R E D T R U T H ;
SYS_XQFNQNM:                  S Y S '_' X Q F N Q N M ;
SYS_XQFNROOT:                 S Y S '_' X Q F N R O O T ;
SYS_XQFORMATNUM:              S Y S '_' X Q F O R M A T N U M ;
SYS_XQFTCONTAIN:              S Y S '_' X Q F T C O N T A I N ;
SYS_XQFUNCR:                  S Y S '_' X Q F U N C R ;
SYS_XQGETCONTENT:             S Y S '_' X Q G E T C O N T E N T ;
SYS_XQINDXOF:                 S Y S '_' X Q I N D X O F ;
SYS_XQINSERT:                 S Y S '_' X Q I N S E R T ;
SYS_XQINSPFX:                 S Y S '_' X Q I N S P F X ;
SYS_XQIRI2URI:                S Y S '_' X Q I R I '2' U R I ;
SYS_XQLANG:                   S Y S '_' X Q L A N G ;
SYS_XQLLNMFRMQNM:             S Y S '_' X Q L L N M F R M Q N M ;
SYS_XQMKNODEREF:              S Y S '_' X Q M K N O D E R E F ;
SYS_XQNILLED:                 S Y S '_' X Q N I L L E D ;
SYS_XQNODENAME:               S Y S '_' X Q N O D E N A M E ;
SYS_XQNORMSPACE:              S Y S '_' X Q N O R M S P A C E ;
SYS_XQNORMUCODE:              S Y S '_' X Q N O R M U C O D E ;
SYS_XQ_NRNG:                  S Y S '_' X Q '_' N R N G ;
SYS_XQNSP4PFX:                S Y S '_' X Q N S P '4' P F X ;
SYS_XQNSPFRMQNM:              S Y S '_' X Q N S P F R M Q N M ;
SYS_XQPFXFRMQNM:              S Y S '_' X Q P F X F R M Q N M ;
SYS_XQ_PKSQL2XML:             S Y S '_' X Q '_' P K S Q L '2' X M L ;
SYS_XQPOLYABS:                S Y S '_' X Q P O L Y A B S ;
SYS_XQPOLYADD:                S Y S '_' X Q P O L Y A D D ;
SYS_XQPOLYCEL:                S Y S '_' X Q P O L Y C E L ;
SYS_XQPOLYCSTBL:              S Y S '_' X Q P O L Y C S T B L ;
SYS_XQPOLYCST:                S Y S '_' X Q P O L Y C S T ;
SYS_XQPOLYDIV:                S Y S '_' X Q P O L Y D I V ;
SYS_XQPOLYFLR:                S Y S '_' X Q P O L Y F L R ;
SYS_XQPOLYMOD:                S Y S '_' X Q P O L Y M O D ;
SYS_XQPOLYMUL:                S Y S '_' X Q P O L Y M U L ;
SYS_XQPOLYRND:                S Y S '_' X Q P O L Y R N D ;
SYS_XQPOLYSQRT:               S Y S '_' X Q P O L Y S Q R T ;
SYS_XQPOLYSUB:                S Y S '_' X Q P O L Y S U B ;
SYS_XQPOLYUMUS:               S Y S '_' X Q P O L Y U M U S ;
SYS_XQPOLYUPLS:               S Y S '_' X Q P O L Y U P L S ;
SYS_XQPOLYVEQ:                S Y S '_' X Q P O L Y V E Q ;
SYS_XQPOLYVGE:                S Y S '_' X Q P O L Y V G E ;
SYS_XQPOLYVGT:                S Y S '_' X Q P O L Y V G T ;
SYS_XQPOLYVLE:                S Y S '_' X Q P O L Y V L E ;
SYS_XQPOLYVLT:                S Y S '_' X Q P O L Y V L T ;
SYS_XQPOLYVNE:                S Y S '_' X Q P O L Y V N E ;
SYS_XQREF2VAL:                S Y S '_' X Q R E F '2' V A L ;
SYS_XQRENAME:                 S Y S '_' X Q R E N A M E ;
SYS_XQREPLACE:                S Y S '_' X Q R E P L A C E ;
SYS_XQRESVURI:                S Y S '_' X Q R E S V U R I ;
SYS_XQRNDHALF2EVN:            S Y S '_' X Q R N D H A L F '2' E V N ;
SYS_XQRSLVQNM:                S Y S '_' X Q R S L V Q N M ;
SYS_XQRYENVPGET:              S Y S '_' X Q R Y E N V P G E T ;
SYS_XQRYVARGET:               S Y S '_' X Q R Y V A R G E T ;
SYS_XQRYWRP:                  S Y S '_' X Q R Y W R P ;
SYS_XQSEQ2CON4XC:             S Y S '_' X Q S E Q '2' C O N '4' X C ;
SYS_XQSEQ2CON:                S Y S '_' X Q S E Q '2' C O N ;
SYS_XQSEQDEEPEQ:              S Y S '_' X Q S E Q D E E P E Q ;
SYS_XQSEQINSB:                S Y S '_' X Q S E Q I N S B ;
SYS_XQSEQRM:                  S Y S '_' X Q S E Q R M ;
SYS_XQSEQRVS:                 S Y S '_' X Q S E Q R V S ;
SYS_XQSEQSUB:                 S Y S '_' X Q S E Q S U B ;
SYS_XQSEQTYPMATCH:            S Y S '_' X Q S E Q T Y P M A T C H ;
SYS_XQSTARTSWITH:             S Y S '_' X Q S T A R T S W I T H ;
SYS_XQSTATBURI:               S Y S '_' X Q S T A T B U R I ;
SYS_XQSTR2CODEP:              S Y S '_' X Q S T R '2' C O D E P ;
SYS_XQSTRJOIN:                S Y S '_' X Q S T R J O I N ;
SYS_XQSUBSTRAFT:              S Y S '_' X Q S U B S T R A F T ;
SYS_XQSUBSTRBEF:              S Y S '_' X Q S U B S T R B E F ;
SYS_XQTOKENIZE:               S Y S '_' X Q T O K E N I Z E ;
SYS_XQTREATAS:                S Y S '_' X Q T R E A T A S ;
SYS_XQ_UPKXML2SQL:            S Y S '_' X Q '_' U P K X M L '2' S Q L ;
SYS_XQXFORM:                  S Y S '_' X Q X F O R M ;
SYS_XSID_TO_RAW:              S Y S '_' X S I D '_' T O '_' R A W ;
SYS_ZMAP_FILTER:              S Y S '_' Z M A P '_' F I L T E R ;
SYS_ZMAP_REFRESH:             S Y S '_' Z M A P '_' R E F R E S H ;
TABLE_LOOKUP_BY_NL:           T A B L E '_' L O O K U P '_' B Y '_' N L ;
TABLESPACE_NO:                T A B L E S P A C E '_' N O ;
TABLESPACE:                   T A B L E S P A C E ;
TABLES:                       T A B L E S ;
TABLE_STATS:                  T A B L E '_' S T A T S ;
TABLE:                        T A B L E ;
TABNO:                        T A B N O ;
TAG:                          T A G ;
TANH:                         T A N H ;
TAN:                          T A N ;
TBLORIDXPARTNUM:              T B L '$' O R '$' I D X '$' P A R T '$' N U M ;
TEMPFILE:                     T E M P F I L E ;
TEMPLATE:                     T E M P L A T E ;
TEMPORARY:                    T E M P O R A R Y ;
TEMP_TABLE:                   T E M P '_' T A B L E ;
TEST:                         T E S T ;
TEXT:                         T E X T ;
THAN:                         T H A N ;
THEN:                         T H E N ;
THE:                          T H E ;
THREAD:                       T H R E A D ;
THROUGH:                      T H R O U G H ;
TIER:                         T I E R ;
TIES:                         T I E S ;
TIMEOUT:                      T I M E O U T ;
TIMESTAMP_LTZ_UNCONSTRAINED:  T I M E S T A M P '_' L T Z '_' U N C O N S T R A I N E D ;
TIMESTAMP:                    T I M E S T A M P ;
TIMESTAMP_TZ_UNCONSTRAINED:   T I M E S T A M P '_' T Z '_' U N C O N S T R A I N E D ;
TIMESTAMP_UNCONSTRAINED:      T I M E S T A M P '_' U N C O N S T R A I N E D ;
TIMES:                        T I M E S ;
TIME:                         T I M E ;
TIMEZONE:                     T I M E Z O N E ;
TIMEZONE_ABBR:                T I M E Z O N E '_' A B B R ;
TIMEZONE_HOUR:                T I M E Z O N E '_' H O U R ;
TIMEZONE_MINUTE:              T I M E Z O N E '_' M I N U T E ;
TIMEZONE_OFFSET:              T I M E Z O N E '_' O F F S E T ;
TIMEZONE_REGION:              T I M E Z O N E '_' R E G I O N ;
TIME_ZONE:                    T I M E '_' Z O N E ;
TIV_GB:                       T I V '_' G B ;
TIV_SSF:                      T I V '_' S S F ;
TO_ACLID:                     T O '_' A C L I D ;
TO_BINARY_DOUBLE:             T O '_' B I N A R Y '_' D O U B L E ;
TO_BINARY_FLOAT:              T O '_' B I N A R Y '_' F L O A T ;
TO_BLOB:                      T O '_' B L O B ;
TO_CLOB:                      T O '_' C L O B ;
TO_DSINTERVAL:                T O '_' D S I N T E R V A L ;
TO_LOB:                       T O '_' L O B ;
TO_MULTI_BYTE:                T O '_' M U L T I '_' B Y T E ;
TO_NCHAR:                     T O '_' N C H A R ;
TO_NCLOB:                     T O '_' N C L O B ;
TO_NUMBER:                    T O '_' N U M B E R ;
TOPLEVEL:                     T O P L E V E L ;
TO_SINGLE_BYTE:               T O '_' S I N G L E '_' B Y T E ;
TO_TIMESTAMP:                 T O '_' T I M E S T A M P ;
TO_TIMESTAMP_TZ:              T O '_' T I M E S T A M P '_' T Z ;
TO_TIME:                      T O '_' T I M E ;
TO_TIME_TZ:                   T O '_' T I M E '_' T Z ;
TO:                           T O ;
TO_YMINTERVAL:                T O '_' Y M I N T E R V A L ;
TRACE:                        T R A C E ;
TRACING:                      T R A C I N G ;
TRACKING:                     T R A C K I N G ;
TRAILING:                     T R A I L I N G ;
TRANSACTION:                  T R A N S A C T I O N ;
TRANSFORM_DISTINCT_AGG:       T R A N S F O R M '_' D I S T I N C T '_' A G G ;
TRANSITIONAL:                 T R A N S I T I O N A L ;
TRANSITION:                   T R A N S I T I O N ;
TRANSLATE:                    T R A N S L A T E ;
TRANSLATION:                  T R A N S L A T I O N ;
TREAT:                        T R E A T ;
TRIGGERS:                     T R I G G E R S ;
TRIGGER:                      T R I G G E R ;
TRUE:                         T R U E ;
TRUNCATE:                     T R U N C A T E ;
TRUNC:                        T R U N C ;
TRUSTED:                      T R U S T E D ;
TRUST:                        T R U S T ;
TUNING:                       T U N I N G ;
TX:                           T X ;
TYPES:                        T Y P E S ;
TYPE:                         T Y P E ;
TZ_OFFSET:                    T Z '_' O F F S E T ;
UB2:                          U B '2' ;
UBA:                          U B A ;
UCS2:                         U C S '2' ;
UID:                          U I D ;
UNARCHIVED:                   U N A R C H I V E D ;
UNBOUNDED:                    U N B O U N D E D ;
UNBOUND:                      U N B O U N D ;
UNCONDITIONAL:                U N C O N D I T I O N A L ;
UNDER:                        U N D E R ;
UNDO:                         U N D O ;
UNDROP:                       U N D R O P ;
UNIFORM:                      U N I F O R M ;
UNION:                        U N I O N ;
UNIQUE:                       U N I Q U E ;
UNISTR:                       U N I S T R ;
UNLIMITED:                    U N L I M I T E D ;
UNLOAD:                       U N L O A D ;
UNLOCK:                       U N L O C K ;
UNMATCHED:                    U N M A T C H E D ;
UNNEST_INNERJ_DISTINCT_VIEW:  U N N E S T '_' I N N E R J '_' D I S T I N C T '_' V I E W ;
UNNEST_NOSEMIJ_NODISTINCTVIEW: U N N E S T '_' N O S E M I J '_' N O D I S T I N C T V I E W ;
UNNEST_SEMIJ_VIEW:            U N N E S T '_' S E M I J '_' V I E W ;
UNNEST:                       U N N E S T ;
UNPACKED:                     U N P A C K E D ;
UNPIVOT:                      U N P I V O T ;
UNPLUG:                       U N P L U G ;
UNPROTECTED:                  U N P R O T E C T E D ;
UNQUIESCE:                    U N Q U I E S C E ;
UNRECOVERABLE:                U N R E C O V E R A B L E ;
UNRESTRICTED:                 U N R E S T R I C T E D ;
UNSUBSCRIBE:                  U N S U B S C R I B E ;
UNTIL:                        U N T I L ;
UNUSABLE:                     U N U S A B L E ;
UNUSED:                       U N U S E D ;
UPDATABLE:                    U P D A T A B L E ;
UPDATED:                      U P D A T E D ;
UPDATE:                       U P D A T E ;
UPDATEXML:                    U P D A T E X M L ;
UPD_INDEXES:                  U P D '_' I N D E X E S ;
UPD_JOININDEX:                U P D '_' J O I N I N D E X ;
UPGRADE:                      U P G R A D E ;
UPPER:                        U P P E R ;
UPSERT:                       U P S E R T ;
UROWID:                       U R O W I D ;
USABLE:                       U S A B L E ;
USAGE:                        U S A G E ;
USE_ANTI:                     U S E '_' A N T I ;
USE_CONCAT:                   U S E '_' C O N C A T ;
USE_CUBE:                     U S E '_' C U B E ;
USE_HASH_AGGREGATION:         U S E '_' H A S H '_' A G G R E G A T I O N ;
USE_HASH_GBY_FOR_PUSHDOWN:    U S E '_' H A S H '_' G B Y '_' F O R '_' P U S H D O W N ;
USE_HASH:                     U S E '_' H A S H ;
USE_HIDDEN_PARTITIONS:        U S E '_' H I D D E N '_' P A R T I T I O N S ;
USE_INVISIBLE_INDEXES:        U S E '_' I N V I S I B L E '_' I N D E X E S ;
USE_MERGE_CARTESIAN:          U S E '_' M E R G E '_' C A R T E S I A N ;
USE_MERGE:                    U S E '_' M E R G E ;
USE_NL:                       U S E '_' N L ;
USE_NL_WITH_INDEX:            U S E '_' N L '_' W I T H '_' I N D E X ;
USE_PRIVATE_OUTLINES:         U S E '_' P R I V A T E '_' O U T L I N E S ;
USER_DATA:                    U S E R '_' D A T A ;
USER_DEFINED:                 U S E R '_' D E F I N E D ;
USERENV:                      U S E R E N V ;
USERGROUP:                    U S E R G R O U P ;
USER_RECYCLEBIN:              U S E R '_' R E C Y C L E B I N ;
USERS:                        U S E R S ;
USER_TABLESPACES:             U S E R '_' T A B L E S P A C E S ;
USER:                         U S E R ;
USE_SEMI:                     U S E '_' S E M I ;
USE_STORED_OUTLINES:          U S E '_' S T O R E D '_' O U T L I N E S ;
USE_TTT_FOR_GSETS:            U S E '_' T T T '_' F O R '_' G S E T S ;
USE:                          U S E ;
USE_VECTOR_AGGREGATION:       U S E '_' V E C T O R '_' A G G R E G A T I O N ;
USE_WEAK_NAME_RESL:           U S E '_' W E A K '_' N A M E '_' R E S L ;
USING_NO_EXPAND:              U S I N G '_' N O '_' E X P A N D ;
USING:                        U S I N G ;
UTF16BE:                      U T F '1' '6' B E ;
UTF16LE:                      U T F '1' '6' L E ;
UTF32:                        U T F '3' '2' ;
UTF8:                         U T F '8' ;
V1:                           V '1' ;
V2:                           V '2' ;
VALIDATE:                     V A L I D A T E ;
VALIDATION:                   V A L I D A T I O N ;
VALID_TIME_END:               V A L I D '_' T I M E '_' E N D ;
VALUES:                       V A L U E S ;
VALUE:                        V A L U E ;
VARCHAR2:                     V A R C H A R '2' ;
VARCHAR:                      V A R C H A R ;
VARIABLE:                     V A R I A B L E ;
VAR_POP:                      V A R '_' P O P ;
VARRAYS:                      V A R R A Y S ;
VARRAY:                       V A R R A Y ;
VAR_SAMP:                     V A R '_' S A M P ;
VARYING:                      V A R Y I N G ;
VECTOR_READ_TRACE:            V E C T O R '_' R E A D '_' T R A C E ;
VECTOR_READ:                  V E C T O R '_' R E A D ;
VECTOR_TRANSFORM_DIMS:        V E C T O R '_' T R A N S F O R M '_' D I M S ;
VECTOR_TRANSFORM_FACT:        V E C T O R '_' T R A N S F O R M '_' F A C T ;
VECTOR_TRANSFORM:             V E C T O R '_' T R A N S F O R M ;
VERIFIER:                     V E R I F I E R ;
VERIFY:                       V E R I F Y ;
VERSIONING:                   V E R S I O N I N G ;
VERSIONS_ENDSCN:              V E R S I O N S '_' E N D S C N ;
VERSIONS_ENDTIME:             V E R S I O N S '_' E N D T I M E ;
VERSIONS_OPERATION:           V E R S I O N S '_' O P E R A T I O N ;
VERSIONS_STARTSCN:            V E R S I O N S '_' S T A R T S C N ;
VERSIONS_STARTTIME:           V E R S I O N S '_' S T A R T T I M E ;
VERSIONS:                     V E R S I O N S ;
VERSIONS_XID:                 V E R S I O N S '_' X I D ;
VERSION:                      V E R S I O N ;
VIEW:                         V I E W ;
VIOLATION:                    V I O L A T I O N ;
VIRTUAL:                      V I R T U A L ;
VISIBILITY:                   V I S I B I L I T Y ;
VISIBLE:                      V I S I B L E ;
VOLUME:                       V O L U M E ;
VSIZE:                        V S I Z E ;
WAIT:                         W A I T ;
WALLET:                       W A L L E T ;
WARNING:                      W A R N I N G ;
WEEKS:                        W E E K S ;
WEEK:                         W E E K ;
WELLFORMED:                   W E L L F O R M E D ;
WHENEVER:                     W H E N E V E R ;
WHEN:                         W H E N ;
WHERE:                        W H E R E ;
WHILE:                        W H I L E ;
WHITESPACE:                   W H I T E S P A C E ;
WIDTH_BUCKET:                 W I D T H '_' B U C K E T ;
WITHIN:                       W I T H I N ;
WITHOUT:                      W I T H O U T ;
WITH_PLSQL:                   W I T H '_' P L S Q L ;
WITH:                         W I T H ;
WORK:                         W O R K ;
WRAPPED:                      W R A P P E D ;
WRAPPER:                      W R A P P E R ;
WRITE:                        W R I T E ;
XDB_FASTPATH_INSERT:          X D B '_' F A S T P A T H '_' I N S E R T ;
XDB:                          X D B ;
X_DYN_PRUNE:                  X '_' D Y N '_' P R U N E ;
XID:                          X I D ;
XML2OBJECT:                   X M L '2' O B J E C T ;
XMLAGG:                       X M L A G G ;
XMLATTRIBUTES:                X M L A T T R I B U T E S ;
XMLCAST:                      X M L C A S T ;
XMLCDATA:                     X M L C D A T A ;
XMLCOLATTVAL:                 X M L C O L A T T V A L ;
XMLCOMMENT:                   X M L C O M M E N T ;
XMLCONCAT:                    X M L C O N C A T ;
XMLDIFF:                      X M L D I F F ;
XML_DML_RWT_STMT:             X M L '_' D M L '_' R W T '_' S T M T ;
XMLELEMENT:                   X M L E L E M E N T ;
XMLEXISTS2:                   X M L E X I S T S '2' ;
XMLEXISTS:                    X M L E X I S T S ;
XMLFOREST:                    X M L F O R E S T ;
XMLINDEX:                     X M L I N D E X ;
XMLINDEX_REWRITE_IN_SELECT:   X M L I N D E X '_' R E W R I T E '_' I N '_' S E L E C T ;
XMLINDEX_REWRITE:             X M L I N D E X '_' R E W R I T E ;
XMLINDEX_SEL_IDX_TBL:         X M L I N D E X '_' S E L '_' I D X '_' T B L ;
XMLISNODE:                    X M L I S N O D E ;
XMLISVALID:                   X M L I S V A L I D ;
XMLNAMESPACES:                X M L N A M E S P A C E S ;
XMLPARSE:                     X M L P A R S E ;
XMLPATCH:                     X M L P A T C H ;
XMLPI:                        X M L P I ;
XMLQUERYVAL:                  X M L Q U E R Y V A L ;
XMLQUERY:                     X M L Q U E R Y ;
XMLROOT:                      X M L R O O T ;
XMLSCHEMA:                    X M L S C H E M A ;
XMLSERIALIZE:                 X M L S E R I A L I Z E ;
XMLTABLE:                     X M L T A B L E ;
XMLTRANSFORMBLOB:             X M L T R A N S F O R M B L O B ;
XMLTRANSFORM:                 X M L T R A N S F O R M ;
XMLTYPE:                      X M L T Y P E ;
XML:                          X M L ;
XPATHTABLE:                   X P A T H T A B L E ;
XS_SYS_CONTEXT:               X S '_' S Y S '_' C O N T E X T ;
XS:                           X S ;
YEARS:                        Y E A R S ;
YEAR:                         Y E A R ;
YES:                          Y E S ;
YMINTERVAL_UNCONSTRAINED:     Y M I N T E R V A L '_' U N C O N S T R A I N E D ;
ZONEMAP:                      Z O N E M A P ;
ZONE:                         Z O N E ;
PREDICTION:                   P R E D I C T I O N ;
PREDICTION_BOUNDS:            P R E D I C T I O N '_' B O U N D S ;
PREDICTION_COST:              P R E D I C T I O N '_' C O S T ;
PREDICTION_DETAILS:           P R E D I C T I O N '_' D E T A I L S ;
PREDICTION_PROBABILITY:       P R E D I C T I O N '_' P R O B A B I L I T Y ;
PREDICTION_SET:               P R E D I C T I O N '_' S E T ;

CUME_DIST:                    C U M E '_' D I S T ;
DENSE_RANK:                   D E N S E '_' R A N K ;
LISTAGG:                      L I S T A G G ;
PERCENT_RANK:                 P E R C E N T '_' R A N K ;
PERCENTILE_CONT:              P E R C E N T I L E '_' C O N T ;
PERCENTILE_DISC:              P E R C E N T I L E '_' D I S C ;
RANK:                         R A N K ;

AVG:                          A V G ;
CORR:                         C O R R ;
COVAR_:                       C O V A R '_' ;
DECODE:                       D E C O D E ;
LAG:                          L A G ;
LEAD:                         L E A D ;
MAX:                          M A X ;
MEDIAN:                       M E D I A N ;
MIN:                          M I N ;
NTILE:                        N T I L E ;
NVL:                          N V L ;
RATIO_TO_REPORT:              R A T I O '_' T O '_' R E P O R T ;
REGR_:                        R E G R '_' ;
ROUND:                        R O U N D ;
ROW_NUMBER:                   R O W '_' N U M B E R ;
SUBSTR:                       S U B S T R ;
TO_CHAR:                      T O '_' C H A R ;
TRIM:                         T R I M ;
SUM:                          S U M ;
STDDEV:                       S T D D E V ;
VAR_:                         V A R '_' ;
VARIANCE:                     V A R I A N C E ;
LEAST:                        L E A S T ;
GREATEST:                     G R E A T E S T ;
TO_DATE:                      T O '_' D A T E ;

// jurgen added conditional compile
DLR_IF:                       '$' I F ;
DLR_THEN:                     '$' T H E N ;
DLR_ELSE:                     '$' E L S E;
DLR_END:                      '$' E N D;

// Rule #358 <NATIONAL_CHAR_STRING_LIT> - subtoken typecast in <REGULAR_ID>, it also incorporates <character_representation>
//  Lowercase 'n' is a usual addition to the standard

NATIONAL_CHAR_STRING_LIT: 'N' '\'' (~('\'' | '\r' | '\n' ) | '\'' '\'' | NEWLINE)* '\'';

//  Rule #040 <BIT_STRING_LIT> - subtoken typecast in <REGULAR_ID>
//  Lowercase 'b' is a usual addition to the standard

BIT_STRING_LIT: 'B' ('\'' [01]* '\'')+;

//  Rule #284 <HEX_STRING_LIT> - subtoken typecast in <REGULAR_ID>
//  Lowercase 'x' is a usual addition to the standard

HEX_STRING_LIT: 'X' ('\'' [A-F0-9]* '\'')+;
DOUBLE_PERIOD:  '..';
PERIOD:         '.';

//{ Rule #238 <EXACT_NUM_LIT>
//  This rule is a bit tricky - it resolves the ambiguity with <PERIOD>
//  It also incorporates <mantisa> and <exponent> for the <APPROXIMATE_NUM_LIT>
//  Rule #501 <signed_integer> was incorporated directly in the token <APPROXIMATE_NUM_LIT>
//  See also the rule #617 <unsigned_num_lit>
/*
    : (
            UNSIGNED_INTEGER
            ( '.' UNSIGNED_INTEGER
            | {$type = UNSIGNED_INTEGER;}
            ) ( E ('+' | '-')? UNSIGNED_INTEGER {$type = APPROXIMATE_NUM_LIT;} )?
    | '.' UNSIGNED_INTEGER ( E ('+' | '-')? UNSIGNED_INTEGER {$type = APPROXIMATE_NUM_LIT;} )?
    )
    (D | F)?
    ;*/

UNSIGNED_INTEGER:    [0-9]+;
APPROXIMATE_NUM_LIT: FLOAT_FRAGMENT ('E' ('+'|'-')? (FLOAT_FRAGMENT | [0-9]+))? ('D' | 'd' | 'F' | 'f')?;

// Rule #--- <CHAR_STRING> is a base for Rule #065 <char_string_lit> , it incorporates <character_representation>
// and a superfluous subtoken typecasting of the "QUOTE"
CHAR_STRING:  '\'' (~('\'' | '\r' | '\n') | '\'' '\'' | NEWLINE)* '\'';

// Perl-style quoted string, see Oracle SQL reference, chapter String Literals
CHAR_STRING_PERL    : Q ( QS_ANGLE | QS_BRACE | QS_BRACK | QS_PAREN | QS_HASH) -> type(CHAR_STRING);
fragment QUOTE      : '\'' ;
fragment QS_ANGLE   : QUOTE '<' .*? '>' QUOTE ;
fragment QS_BRACE   : QUOTE '{' .*? '}' QUOTE ;
fragment QS_BRACK   : QUOTE '[' .*? ']' QUOTE ;
fragment QS_PAREN   : QUOTE '(' .*? ')' QUOTE ;
fragment QS_HASH    : QUOTE '#' .*? '#' QUOTE ;

fragment QS_OTHER_CH: ~('<' | '{' | '[' | '(' | ' ' | '\t' | '\n' | '\r');

DELIMITED_ID: '"' (~('"' | '\r' | '\n') | '"' '"')+ '"' ;

// SQL_SPECIAL_CHAR was split into single rules

PERCENT:                   '%';
AMPERSAND:                 '&';
LEFT_PAREN:                '(';
RIGHT_PAREN:               ')';
DOUBLE_ASTERISK:           '**';
ASTERISK:                  '*';
PLUS_SIGN:                 '+';
MINUS_SIGN:                '-';
COMMA:                     ',';
SOLIDUS:                   '/';
AT_SIGN:                   '@';
ASSIGN_OP:                 ':=';

// See OCI reference for more information about this

BINDVAR
    : ':' SIMPLE_LETTER  (SIMPLE_LETTER | [0-9] | '_')*
    | ':' DELIMITED_ID  // not used in SQL but spotted in v$sqltext when using cursor_sharing
    | ':' UNSIGNED_INTEGER
    | QUESTION_MARK // not in SQL, not in Oracle, not in OCI, use this for JDBC
    ;

NOT_EQUAL_OP:              '!='
            |              '<>'
            |              '^='
            |              '~='
            ;
ARROW_OP:                  '=>';
CARRET_OPERATOR_PART:      '^';
TILDE_OPERATOR_PART:       '~';
EXCLAMATION_OPERATOR_PART: '!';
GREATER_THAN_OP:           '>';
LESS_THAN_OP:              '<';
COLON:                     ':';
SEMICOLON:                 ';';

fragment
QUESTION_MARK: '?';

// protected UNDERSCORE : '_' SEPARATOR ; // subtoken typecast within <INTRODUCER>
BAR: '|';
EQUALS_OP: '=';

// Rule #532 <SQL_EMBDD_LANGUAGE_CHAR> was split into single rules:
LEFT_BRACKET: '[';
RIGHT_BRACKET: ']';

//{ Rule #319 <INTRODUCER>
INTRODUCER
    : '_' //(SEPARATOR {$type = UNDERSCORE;})?
    ;

//{ Rule #479 <SEPARATOR>
//  It was originally a protected rule set to be filtered out but the <COMMENT> and <'-'> clashed.
/*SEPARATOR
    : '-' -> type('-')
    | COMMENT -> channel(HIDDEN)
    | (SPACE | NEWLINE)+ -> channel(HIDDEN)
    ;*/
//}

SPACES: [ \t\r\n]+ -> channel(HIDDEN);


// Rule #504 <SIMPLE_LETTER> - simple_latin _letter was generalised into SIMPLE_LETTER
//  Unicode is yet to be implemented - see NSF0
// JH extended with lowe case
fragment
SIMPLE_LETTER
    : [A-Za-z]
    ;

fragment
FLOAT_FRAGMENT
    : UNSIGNED_INTEGER* '.'? UNSIGNED_INTEGER+
    ;

// Rule #097 <COMMENT>

SINGLE_LINE_COMMENT: '--'  ~('\r' | '\n')* (NEWLINE | EOF)  -> channel(HIDDEN);
MULTI_LINE_COMMENT:  '/*' .*? '*/' (SPACES)? EOF? -> channel(HIDDEN);

REM_COMMENT:          REM SPACE ~('\r' | '\n')* (NEWLINE | EOF)   -> channel(HIDDEN);
PROMPT_COMMENT:       PROMPT SPACE ~('\r' | '\n')* (NEWLINE | EOF)   -> channel(HIDDEN);

START_CMD
    // TODO When using full word START there is a conflict with START WITH in sequences and CONNECT BY queries
    // 'start' SPACE ( ~( '\r' | '\n') )* (NEWLINE|EOF)
    : 'sta' SPACE ( ~('\r' | '\n') )* (NEWLINE|EOF)
    // TODO Single @ conflicts with a database link name, like employees@remote
    // | '@' ( ~('\r' | '\n') )* (NEWLINE|EOF)
    | '@@' ( ~('\r' | '\n') )* (NEWLINE|EOF)
    ;

fragment
NEWLINE: '\r'? '\n';

fragment
SPACE: [ \t];

//{ Rule #442 <REGULAR_ID> additionally encapsulates a few STRING_LITs.
//  Within testLiterals all reserved and non-reserved words are being resolved

REGULAR_ID: SIMPLE_LETTER (SIMPLE_LETTER | '$' | '_' | '#' | [0-9])*;
DOLLAR2_ID: '$' '$' SIMPLE_LETTER (SIMPLE_LETTER | '$' | '_' | '#' | [0-9])*; // added jurgen

ZV: '@!' -> channel(HIDDEN);


NON_RESERVED_KEYWORDS_PRE12C
    : ABORT
    | ABS
    | ACCESSED
    | ACCESS
    | ACCOUNT
    | ACOS
    | ACTIVATE
    | ACTIVE_COMPONENT
    | ACTIVE_FUNCTION
    | ACTIVE_TAG
    | ADD_COLUMN
    | ADD_GROUP
    | ADD_MONTHS
    | ADD
    | ADJ_DATE
    | ADMINISTER
    | ADMINISTRATOR
    | ADMIN
    | ADVISE
    | ADVISOR
    | AFTER
    | ALIAS
    | ALLOCATE
    | ALLOW
    | ALL_ROWS
    | ALWAYS
    | ANALYZE
    | ANCILLARY
    | AND_EQUAL
    | ANTIJOIN
    | ANYSCHEMA
    | APPENDCHILDXML
    | APPEND
    | APPEND_VALUES
    | APPLY
    | ARCHIVELOG
    | ARCHIVE
    | ARRAY
    | ASCII
    | ASCIISTR
    | ASIN
    | ASSEMBLY
    | ASSOCIATE
    | ASYNCHRONOUS
    | ASYNC
    | ATAN2
    | ATAN
    | AT
    | ATTRIBUTE
    | ATTRIBUTES
    | AUTHENTICATED
    | AUTHENTICATION
    | AUTHID
    | AUTHORIZATION
    | AUTOALLOCATE
    | AUTOEXTEND
    | AUTOMATIC
    | AUTO
    | AVAILABILITY
    | AVG
    | BACKUP
    | BASICFILE
    | BASIC
    | BATCH
    | BECOME
    | BEFORE
    | BEGIN
    | BEGIN_OUTLINE_DATA
    | BEHALF
    | BFILE
    | BFILENAME
    | BIGFILE
    | BINARY_DOUBLE_INFINITY
    | BINARY_DOUBLE
    | BINARY_DOUBLE_NAN
    | BINARY_FLOAT_INFINITY
    | BINARY_FLOAT
    | BINARY_FLOAT_NAN
    | BINARY
    | BIND_AWARE
    | BINDING
    | BIN_TO_NUM
    | BITAND
    | BITMAP
    | BITMAPS
    | BITMAP_TREE
    | BITS
    | BLOB
    | BLOCK
    | BLOCK_RANGE
    | BLOCKSIZE
    | BLOCKS
    | BODY
    | BOTH
    | BOUND
    | BRANCH
    | BREADTH
    | BROADCAST
    | BUFFER_CACHE
    | BUFFER
    | BUFFER_POOL
    | BUILD
    | BULK
    | BYPASS_RECURSIVE_CHECK
    | BYPASS_UJVC
    | BYTE
    | CACHE_CB
    | CACHE_INSTANCES
    | CACHE
    | CACHE_TEMP_TABLE
    | CALL
    | CANCEL
    | CARDINALITY
    | CASCADE
    | CASE
    | CAST
    | CATEGORY
    | CEIL
    | CELL_FLASH_CACHE
    | CERTIFICATE
    | CFILE
    | CHAINED
    | CHANGE_DUPKEY_ERROR_INDEX
    | CHANGE
    | CHARACTER
    | CHAR_CS
    | CHARTOROWID
    | CHECK_ACL_REWRITE
    | CHECKPOINT
    | CHILD
    | CHOOSE
    | CHR
    | CHUNK
    | CLASS
    | CLEAR
    | CLOB
    | CLONE
    | CLOSE_CACHED_OPEN_CURSORS
    | CLOSE
    | CLUSTER_BY_ROWID
    | CLUSTER_ID
    | CLUSTERING_FACTOR
    | CLUSTER_PROBABILITY
    | CLUSTER_SET
    | COALESCE
    | COALESCE_SQ
    | COARSE
    | CO_AUTH_IND
    | COLD
    | COLLECT
    | COLUMNAR
    | COLUMN_AUTH_INDICATOR
    | COLUMN
    | COLUMNS
    | COLUMN_STATS
    | COLUMN_VALUE
    | COMMENT
    | COMMIT
    | COMMITTED
    | COMPACT
    | COMPATIBILITY
    | COMPILE
    | COMPLETE
    | COMPLIANCE
    | COMPOSE
    | COMPOSITE_LIMIT
    | COMPOSITE
    | COMPOUND
    | COMPUTE
    | CONCAT
    | CONFIRM
    | CONFORMING
    | CONNECT_BY_CB_WHR_ONLY
    | CONNECT_BY_COMBINE_SW
    | CONNECT_BY_COST_BASED
    | CONNECT_BY_ELIM_DUPS
    | CONNECT_BY_FILTERING
    | CONNECT_BY_ISCYCLE
    | CONNECT_BY_ISLEAF
    | CONNECT_BY_ROOT
    | CONNECT_TIME
    | CONSIDER
    | CONSISTENT
    | CONSTANT
    | CONST
    | CONSTRAINT
    | CONSTRAINTS
    | CONTAINER
    | CONTENT
    | CONTENTS
    | CONTEXT
    | CONTINUE
    | CONTROLFILE
    | CONVERT
    | CORR_K
    | CORR
    | CORR_S
    | CORRUPTION
    | CORRUPT_XID_ALL
    | CORRUPT_XID
    | COSH
    | COS
    | COST
    | COST_XML_QUERY_REWRITE
    | COUNT
    | COVAR_POP
    | COVAR_SAMP
    | CPU_COSTING
    | CPU_PER_CALL
    | CPU_PER_SESSION
    | CRASH
    | CREATE_STORED_OUTLINES
    | CREATION
    | CROSSEDITION
    | CROSS
    | CSCONVERT
    | CUBE_GB
    | CUBE
    | CUME_DISTM
    | CUME_DIST
    | CURRENT_DATE
    | CURRENT
    | CURRENT_SCHEMA
    | CURRENT_TIME
    | CURRENT_TIMESTAMP
    | CURRENT_USER
    | CURRENTV
    | CURSOR
    | CURSOR_SHARING_EXACT
    | CURSOR_SPECIFIC_SEGMENT
    | CV
    | CYCLE
    | DANGLING
    | DATABASE
    | DATAFILE
    | DATAFILES
    | DATA
    | DATAOBJNO
    | DATAOBJ_TO_PARTITION
    | DATE_MODE
    | DAY
    | DBA
    | DBA_RECYCLEBIN
    | DBMS_STATS
    | DB_ROLE_CHANGE
    | DBTIMEZONE
    | DB_VERSION
    | DDL
    | DEALLOCATE
    | DEBUGGER
    | DEBUG
    | DECLARE
    | DEC
    | DECOMPOSE
    | DECREMENT
    | DECR
    | DECRYPT
    | DEDUPLICATE
    | DEFAULTS
    | DEFERRABLE
    | DEFERRED
    | DEFINED
    | DEFINER
    | DEGREE
    | DELAY
    | DELETEXML
    | DEMAND
    | DENSE_RANKM
    | DENSE_RANK
    | DEPENDENT
    | DEPTH
    | DEQUEUE
    | DEREF
    | DEREF_NO_REWRITE
    | DETACHED
    | DETERMINES
    | DICTIONARY
    | DIMENSION
    | DIRECT_LOAD
    | DIRECTORY
    | DIRECT_PATH
    | DISABLE
    | DISABLE_PRESET
    | DISABLE_RPKE
    | DISALLOW
    | DISASSOCIATE
    | DISCONNECT
    | DISKGROUP
    | DISK
    | DISKS
    | DISMOUNT
    | DISTINGUISHED
    | DISTRIBUTED
    | DML
    | DML_UPDATE
    | DOCFIDELITY
    | DOCUMENT
    | DOMAIN_INDEX_FILTER
    | DOMAIN_INDEX_NO_SORT
    | DOMAIN_INDEX_SORT
    | DOUBLE
    | DOWNGRADE
    | DRIVING_SITE
    | DROP_COLUMN
    | DROP_GROUP
    | DST_UPGRADE_INSERT_CONV
    | DUMP
    | DYNAMIC
    | DYNAMIC_SAMPLING_EST_CDN
    | DYNAMIC_SAMPLING
    | EACH
    | EDITIONING
    | EDITION
    | EDITIONS
    | ELEMENT
    | ELIMINATE_JOIN
    | ELIMINATE_OBY
    | ELIMINATE_OUTER_JOIN
    | EMPTY_BLOB
    | EMPTY_CLOB
    | EMPTY
    | ENABLE
    | ENABLE_PRESET
    | ENCODING
    | ENCRYPTION
    | ENCRYPT
    | END
    | END_OUTLINE_DATA
    | ENFORCED
    | ENFORCE
    | ENQUEUE
    | ENTERPRISE
    | ENTITYESCAPING
    | ENTRY
    | ERROR_ARGUMENT
    | ERROR
    | ERROR_ON_OVERLAP_TIME
    | ERRORS
    | ESCAPE
    | ESTIMATE
    | EVALNAME
    | EVALUATION
    | EVENTS
    | EVERY
    | EXCEPTIONS
    | EXCEPT
    | EXCHANGE
    | EXCLUDE
    | EXCLUDING
    | EXECUTE
    | EXEMPT
    | EXISTSNODE
    | EXPAND_GSET_TO_UNION
    | EXPAND_TABLE
    | EXPIRE
    | EXPLAIN
    | EXPLOSION
    | EXP
    | EXPORT
    | EXPR_CORR_CHECK
    | EXTENDS
    | EXTENT
    | EXTENTS
    | EXTERNALLY
    | EXTERNAL
    | EXTRACT
    | EXTRACTVALUE
    | EXTRA
    | FACILITY
    | FACT
    | FACTORIZE_JOIN
    | FAILED_LOGIN_ATTEMPTS
    | FAILED
    | FAILGROUP
    | FALSE
    | FAST
    | FBTSCAN
    | FEATURE_ID
    | FEATURE_SET
    | FEATURE_VALUE
    | FILE
    | FILESYSTEM_LIKE_LOGGING
    | FILTER
    | FINAL
    | FINE
    | FINISH
    | FIRSTM
    | FIRST
    | FIRST_ROWS
    | FIRST_VALUE
    | FLAGGER
    | FLASHBACK
    | FLASH_CACHE
    | FLOB
    | FLOOR
    | FLUSH
    | FOLDER
    | FOLLOWING
    | FOLLOWS
    | FORCE
    | FORCE_XML_QUERY_REWRITE
    | FOREIGN
    | FOREVER
    | FORWARD
    | FRAGMENT_NUMBER
    | FREELIST
    | FREELISTS
    | FREEPOOLS
    | FRESH
    | FROM_TZ
    | FULL
    | FULL_OUTER_JOIN_TO_OUTER
    | FUNCTION
    | FUNCTIONS
    | GATHER_PLAN_STATISTICS
    | GBY_CONC_ROLLUP
    | GBY_PUSHDOWN
    | GENERATED
    | GLOBALLY
    | GLOBAL
    | GLOBAL_NAME
    | GLOBAL_TOPIC_ENABLED
    | GREATEST
    | GROUP_BY
    | GROUP_ID
    | GROUPING_ID
    | GROUPING
    | GROUPS
    | GUARANTEED
    | GUARANTEE
    | GUARD
    | HASH_AJ
    | HASHKEYS
    | HASH
    | HASH_SJ
    | HEADER
    | HEAP
    | HELP
    | HEXTORAW
    | HEXTOREF
    | HIDDEN_KEYWORD
    | HIDE
    | HIERARCHY
    | HIGH
    | HINTSET_BEGIN
    | HINTSET_END
    | HOT
    | HOUR
    | HWM_BROKERED
    | HYBRID
    | IDENTIFIER
    | IDENTITY
    | IDGENERATORS
    | IDLE_TIME
    | ID
    | IF
    | IGNORE
    | IGNORE_OPTIM_EMBEDDED_HINTS
    | IGNORE_ROW_ON_DUPKEY_INDEX
    | IGNORE_WHERE_CLAUSE
    | IMMEDIATE
    | IMPACT
    | IMPORT
    | INCLUDE
    | INCLUDE_VERSION
    | INCLUDING
    | INCREMENTAL
    | INCREMENT
    | INCR
    | INDENT
    | INDEX_ASC
    | INDEX_COMBINE
    | INDEX_DESC
    | INDEXED
    | INDEXES
    | INDEX_FFS
    | INDEX_FILTER
    | INDEX_JOIN
    | INDEX_ROWS
    | INDEX_RRS
    | INDEX_RS_ASC
    | INDEX_RS_DESC
    | INDEX_RS
    | INDEX_SCAN
    | INDEX_SKIP_SCAN
    | INDEX_SS_ASC
    | INDEX_SS_DESC
    | INDEX_SS
    | INDEX_STATS
    | INDEXTYPE
    | INDEXTYPES
    | INDICATOR
    | INFINITE
    | INFORMATIONAL
    | INITCAP
    | INITIALIZED
    | INITIALLY
    | INITIAL
    | INITRANS
    | INLINE
    | INLINE_XMLTYPE_NT
    | IN_MEMORY_METADATA
    | INNER
    | INSERTCHILDXMLAFTER
    | INSERTCHILDXMLBEFORE
    | INSERTCHILDXML
    | INSERTXMLAFTER
    | INSERTXMLBEFORE
    | INSTANCE
    | INSTANCES
    | INSTANTIABLE
    | INSTANTLY
    | INSTEAD
    | INSTR2
    | INSTR4
    | INSTRB
    | INSTRC
    | INSTR
    | INTERMEDIATE
    | INTERNAL_CONVERT
    | INTERNAL_USE
    | INTERPRETED
    | INTERVAL
    | INT
    | INVALIDATE
    | INVISIBLE
    | IN_XQUERY
    | ISOLATION_LEVEL
    | ISOLATION
    | ITERATE
    | ITERATION_NUMBER
    | JAVA
    | JOB
    | JOIN
    | KEEP_DUPLICATES
    | KEEP
    | KERBEROS
    | KEY_LENGTH
    | KEY
    | KEYSIZE
    | KEYS
    | KILL
    | LAG
    | LAST_DAY
    | LAST
    | LAST_VALUE
    | LATERAL
    | LAYER
    | LDAP_REGISTRATION_ENABLED
    | LDAP_REGISTRATION
    | LDAP_REG_SYNC_INTERVAL
    | LEADING
    | LEAD
    | LEAST
    | LEFT
    | LENGTH2
    | LENGTH4
    | LENGTHB
    | LENGTHC
    | LENGTH
    | LESS
    | LEVEL
    | LEVELS
    | LIBRARY
    | LIFE
    | LIFETIME
    | LIKE2
    | LIKE4
    | LIKEC
    | LIKE_EXPAND
    | LIMIT
    | LINK
    | LISTAGG
    | LIST
    | LN
    | LNNVL
    | LOAD
    | LOB
    | LOBNVL
    | LOBS
    | LOCAL_INDEXES
    | LOCAL
    | LOCALTIME
    | LOCALTIMESTAMP
    | LOCATION
    | LOCATOR
    | LOCKED
    | LOGFILE
    | LOGFILES
    | LOGGING
    | LOGICAL
    | LOGICAL_READS_PER_CALL
    | LOGICAL_READS_PER_SESSION
    | LOG
    | LOGOFF
    | LOGON
    | LOG_READ_ONLY_VIOLATIONS
    | LOWER
    | LOW
    | LPAD
    | LTRIM
    | MAIN
    | MAKE_REF
    | MANAGED
    | MANAGEMENT
    | MANAGE
    | MANAGER
    | MANUAL
    | MAPPING
    | MASTER
    | MATCHED
    | MATERIALIZED
    | MATERIALIZE
    | MAXARCHLOGS
    | MAXDATAFILES
    | MAXEXTENTS
    | MAXIMIZE
    | MAXINSTANCES
    | MAXLOGFILES
    | MAXLOGHISTORY
    | MAXLOGMEMBERS
    | MAX
    | MAXSIZE
    | MAXTRANS
    | MAXVALUE
    | MEASURE
    | MEASURES
    | MEDIAN
    | MEDIUM
    | MEMBER
    | MEMORY
    | MERGEACTIONS
    | MERGE_AJ
    | MERGE_CONST_ON
    | MERGE
    | MERGE_SJ
    | METHOD
    | MIGRATE
    | MIGRATION
    | MINEXTENTS
    | MINIMIZE
    | MINIMUM
    | MINING
    | MIN
    | MINUS_NULL
    | MINUTE
    | MINVALUE
    | MIRRORCOLD
    | MIRRORHOT
    | MIRROR
    | MLSLABEL
    | MODEL_COMPILE_SUBQUERY
    | MODEL_DONTVERIFY_UNIQUENESS
    | MODEL_DYNAMIC_SUBQUERY
    | MODEL_MIN_ANALYSIS
    | MODEL
    | MODEL_NO_ANALYSIS
    | MODEL_PBY
    | MODEL_PUSH_REF
    | MODIFY_COLUMN_TYPE
    | MODIFY
    | MOD
    | MONITORING
    | MONITOR
    | MONTH
    | MONTHS_BETWEEN
    | MOUNT
    | MOUNTPATH
    | MOVEMENT
    | MOVE
    | MULTISET
    | MV_MERGE
    | NAMED
    | NAME
    | NAMESPACE
    | NAN
    | NANVL
    | NATIONAL
    | NATIVE_FULL_OUTER_JOIN
    | NATIVE
    | NATURAL
    | NAV
    | NCHAR_CS
    | NCHAR
    | NCHR
    | NCLOB
    | NEEDED
    | NESTED
    | NESTED_TABLE_FAST_INSERT
    | NESTED_TABLE_GET_REFS
    | NESTED_TABLE_ID
    | NESTED_TABLE_SET_REFS
    | NESTED_TABLE_SET_SETID
    | NETWORK
    | NEVER
    | NEW
    | NEW_TIME
    | NEXT_DAY
    | NEXT
    | NL_AJ
    | NLJ_BATCHING
    | NLJ_INDEX_FILTER
    | NLJ_INDEX_SCAN
    | NLJ_PREFETCH
    | NLS_CALENDAR
    | NLS_CHARACTERSET
    | NLS_CHARSET_DECL_LEN
    | NLS_CHARSET_ID
    | NLS_CHARSET_NAME
    | NLS_COMP
    | NLS_CURRENCY
    | NLS_DATE_FORMAT
    | NLS_DATE_LANGUAGE
    | NLS_INITCAP
    | NLS_ISO_CURRENCY
    | NL_SJ
    | NLS_LANG
    | NLS_LANGUAGE
    | NLS_LENGTH_SEMANTICS
    | NLS_LOWER
    | NLS_NCHAR_CONV_EXCP
    | NLS_NUMERIC_CHARACTERS
    | NLS_SORT
    | NLSSORT
    | NLS_SPECIAL_CHARS
    | NLS_TERRITORY
    | NLS_UPPER
    | NO_ACCESS
    | NOAPPEND
    | NOARCHIVELOG
    | NOAUDIT
    | NO_BASETABLE_MULTIMV_REWRITE
    | NO_BIND_AWARE
    | NO_BUFFER
    | NOCACHE
    | NO_CARTESIAN
    | NO_CHECK_ACL_REWRITE
    | NO_CLUSTER_BY_ROWID
    | NO_COALESCE_SQ
    | NO_CONNECT_BY_CB_WHR_ONLY
    | NO_CONNECT_BY_COMBINE_SW
    | NO_CONNECT_BY_COST_BASED
    | NO_CONNECT_BY_ELIM_DUPS
    | NO_CONNECT_BY_FILTERING
    | NO_COST_XML_QUERY_REWRITE
    | NO_CPU_COSTING
    | NOCPU_COSTING
    | NOCYCLE
    | NODELAY
    | NO_DOMAIN_INDEX_FILTER
    | NO_DST_UPGRADE_INSERT_CONV
    | NO_ELIMINATE_JOIN
    | NO_ELIMINATE_OBY
    | NO_ELIMINATE_OUTER_JOIN
    | NOENTITYESCAPING
    | NO_EXPAND_GSET_TO_UNION
    | NO_EXPAND
    | NO_EXPAND_TABLE
    | NO_FACT
    | NO_FACTORIZE_JOIN
    | NO_FILTERING
    | NOFORCE
    | NO_FULL_OUTER_JOIN_TO_OUTER
    | NO_GBY_PUSHDOWN
    | NOGUARANTEE
    | NO_INDEX_FFS
    | NO_INDEX
    | NO_INDEX_SS
    | NO_LOAD
    | NOLOCAL
    | NOLOGGING
    | NOMAPPING
    | NOMAXVALUE
    | NO_MERGE
    | NOMINIMIZE
    | NOMINVALUE
    | NO_MODEL_PUSH_REF
    | NO_MONITORING
    | NOMONITORING
    | NO_MONITOR
    | NO_MULTIMV_REWRITE
    | NO
    | NO_NATIVE_FULL_OUTER_JOIN
    | NONBLOCKING
    | NONE
    | NO_NLJ_BATCHING
    | NO_NLJ_PREFETCH
    | NONSCHEMA
    | NOORDER
    | NO_ORDER_ROLLUPS
    | NO_OUTER_JOIN_TO_ANTI
    | NO_OUTER_JOIN_TO_INNER
    | NOOVERRIDE
    | NO_PARALLEL_INDEX
    | NOPARALLEL_INDEX
    | NO_PARALLEL
    | NOPARALLEL
    | NO_PARTIAL_COMMIT
    | NO_PLACE_DISTINCT
    | NO_PLACE_GROUP_BY
    | NO_PQ_MAP
    | NO_PRUNE_GSETS
    | NO_PULL_PRED
    | NO_PUSH_PRED
    | NO_PUSH_SUBQ
    | NO_PX_JOIN_FILTER
    | NO_QKN_BUFF
    | NO_QUERY_TRANSFORMATION
    | NO_REF_CASCADE
    | NORELY
    | NOREPAIR
    | NORESETLOGS
    | NO_RESULT_CACHE
    | NOREVERSE
    | NO_REWRITE
    | NOREWRITE
    | NORMAL
    | NOROWDEPENDENCIES
    | NOSCHEMACHECK
    | NOSEGMENT
    | NO_SEMIJOIN
    | NO_SEMI_TO_INNER
    | NO_SET_TO_JOIN
    | NOSORT
    | NO_SQL_TUNE
    | NO_STAR_TRANSFORMATION
    | NO_STATEMENT_QUEUING
    | NO_STATS_GSETS
    | NOSTRICT
    | NO_SUBQUERY_PRUNING
    | NO_SUBSTRB_PAD
    | NO_SWAP_JOIN_INPUTS
    | NOSWITCH
    | NO_TABLE_LOOKUP_BY_NL
    | NO_TEMP_TABLE
    | NOTHING
    | NOTIFICATION
    | NO_TRANSFORM_DISTINCT_AGG
    | NO_UNNEST
    | NO_USE_HASH_AGGREGATION
    | NO_USE_HASH_GBY_FOR_PUSHDOWN
    | NO_USE_HASH
    | NO_USE_INVISIBLE_INDEXES
    | NO_USE_MERGE
    | NO_USE_NL
    | NOVALIDATE
    | NO_XDB_FASTPATH_INSERT
    | NO_XML_DML_REWRITE
    | NO_XMLINDEX_REWRITE_IN_SELECT
    | NO_XMLINDEX_REWRITE
    | NO_XML_QUERY_REWRITE
    | NTH_VALUE
    | NTILE
    | NULLIF
    | NULLS
    | NUMERIC
    | NUM_INDEX_KEYS
    | NUMTODSINTERVAL
    | NUMTOYMINTERVAL
    | NVARCHAR2
    | NVL2
    | NVL
    | OBJECT2XML
    | OBJECT
    | OBJNO
    | OBJNO_REUSE
    | OCCURENCES
    | OFFLINE
    | OFF
    | OIDINDEX
    | OID
    | OLAP
    | OLD
    | OLD_PUSH_PRED
    | OLTP
    | ONLINE
    | ONLY
    | OPAQUE
    | OPAQUE_TRANSFORM
    | OPAQUE_XCANONICAL
    | OPCODE
    | OPEN
    | OPERATIONS
    | OPERATOR
    | OPT_ESTIMATE
    | OPTIMAL
    | OPTIMIZE
    | OPTIMIZER_FEATURES_ENABLE
    | OPTIMIZER_GOAL
    | OPT_PARAM
    | ORA_BRANCH
    | ORADEBUG
    | ORA_DST_AFFECTED
    | ORA_DST_CONVERT
    | ORA_DST_ERROR
    | ORA_GET_ACLIDS
    | ORA_GET_PRIVILEGES
    | ORA_HASH
    | ORA_ROWSCN
    | ORA_ROWSCN_RAW
    | ORA_ROWVERSION
    | ORA_TABVERSION
    | ORDERED
    | ORDERED_PREDICATES
    | ORDINALITY
    | OR_EXPAND
    | ORGANIZATION
    | OR_PREDICATES
    | OTHER
    | OUTER_JOIN_TO_ANTI
    | OUTER_JOIN_TO_INNER
    | OUTER
    | OUTLINE_LEAF
    | OUTLINE
    | OUT_OF_LINE
    | OVERFLOW
    | OVERFLOW_NOMOVE
    | OVERLAPS
    | OVER
    | OWNER
    | OWNERSHIP
    | OWN
    | PACKAGE
    | PACKAGES
    | PARALLEL_INDEX
    | PARALLEL
    | PARAMETERS
    | PARAM
    | PARENT
    | PARITY
    | PARTIALLY
    | PARTITION_HASH
    | PARTITION_LIST
    | PARTITION
    | PARTITION_RANGE
    | PARTITIONS
    | PARTNUMINST
    | PASSING
    | PASSWORD_GRACE_TIME
    | PASSWORD_LIFE_TIME
    | PASSWORD_LOCK_TIME
    | PASSWORD
    | PASSWORD_REUSE_MAX
    | PASSWORD_REUSE_TIME
    | PASSWORD_VERIFY_FUNCTION
    | PATH
    | PATHS
    | PBL_HS_BEGIN
    | PBL_HS_END
    | PCTINCREASE
    | PCTTHRESHOLD
    | PCTUSED
    | PCTVERSION
    | PENDING
    | PERCENTILE_CONT
    | PERCENTILE_DISC
    | PERCENT_KEYWORD
    | PERCENT_RANKM
    | PERCENT_RANK
    | PERFORMANCE
    | PERMANENT
    | PERMISSION
    | PFILE
    | PHYSICAL
    | PIKEY
    | PIV_GB
    | PIVOT
    | PIV_SSF
    | PLACE_DISTINCT
    | PLACE_GROUP_BY
    | PLAN
    | PLSCOPE_SETTINGS
    | PLSQL_CCFLAGS
    | PLSQL_CODE_TYPE
    | PLSQL_DEBUG
    | PLSQL_OPTIMIZE_LEVEL
    | PLSQL_WARNINGS
    | POINT
    | POLICY
    | POST_TRANSACTION
    | POWERMULTISET_BY_CARDINALITY
    | POWERMULTISET
    | POWER
    | PQ_DISTRIBUTE
    | PQ_MAP
    | PQ_NOMAP
    | PREBUILT
    | PRECEDES
    | PRECEDING
    | PRECISION
    | PRECOMPUTE_SUBQUERY
    | PREDICATE_REORDERS
    | PREDICTION_BOUNDS
    | PREDICTION_COST
    | PREDICTION_DETAILS
    | PREDICTION
    | PREDICTION_PROBABILITY
    | PREDICTION_SET
    | PREPARE
    | PRESENT
    | PRESENTNNV
    | PRESENTV
    | PRESERVE
    | PRESERVE_OID
    | PREVIOUS
    | PRIMARY
    | PRIVATE
    | PRIVATE_SGA
    | PRIVILEGE
    | PRIVILEGES
    | PROCEDURAL
    | PROCEDURE
    | PROCESS
    | PROFILE
    | PROGRAM
    | PROJECT
    | PROPAGATE
    | PROTECTED
    | PROTECTION
    | PULL_PRED
    | PURGE
    | PUSH_PRED
    | PUSH_SUBQ
    | PX_GRANULE
    | PX_JOIN_FILTER
    | QB_NAME
    | QUERY_BLOCK
    | QUERY
    | QUEUE_CURR
    | QUEUE
    | QUEUE_ROWP
    | QUIESCE
    | QUORUM
    | QUOTA
    | RANDOM_LOCAL
    | RANDOM
    | RANGE
    | RANKM
    | RANK
    | RAPIDLY
    | RATIO_TO_REPORT
    | RAWTOHEX
    | RAWTONHEX
    | RBA
    | RBO_OUTLINE
    | RDBA
    | READ
    | READS
    | REAL
    | REBALANCE
    | REBUILD
    | RECORDS_PER_BLOCK
    | RECOVERABLE
    | RECOVER
    | RECOVERY
    | RECYCLEBIN
    | RECYCLE
    | REDACTION
    | REDO
    | REDUCED
    | REDUNDANCY
    | REF_CASCADE_CURSOR
    | REFERENCED
    | REFERENCE
    | REFERENCES
    | REFERENCING
    | REF
    | REFRESH
    | REFTOHEX
    | REGEXP_COUNT
    | REGEXP_INSTR
    | REGEXP_LIKE
    | REGEXP_REPLACE
    | REGEXP_SUBSTR
    | REGISTER
    | REGR_AVGX
    | REGR_AVGY
    | REGR_COUNT
    | REGR_INTERCEPT
    | REGR_R2
    | REGR_SLOPE
    | REGR_SXX
    | REGR_SXY
    | REGR_SYY
    | REGULAR
    | REJECT
    | REKEY
    | RELATIONAL
    | RELY
    | REMAINDER
    | REMOTE_MAPPED
    | REMOVE
    | REPAIR
    | REPEAT
    | REPLACE
    | REPLICATION
    | REQUIRED
    | RESETLOGS
    | RESET
    | RESIZE
    | RESOLVE
    | RESOLVER
    | RESPECT
    | RESTORE_AS_INTERVALS
    | RESTORE
    | RESTRICT_ALL_REF_CONS
    | RESTRICTED
    | RESTRICT
    | RESULT_CACHE
    | RESUMABLE
    | RESUME
    | RETENTION
    | RETRY_ON_ROW_CHANGE
    | RETURNING
    | RETURN
    | REUSE
    | REVERSE
    | REWRITE
    | REWRITE_OR_ERROR
    | RIGHT
    | ROLE
    | ROLES
    | ROLLBACK
    | ROLLING
    | ROLLUP
    | ROUND
    | ROWDEPENDENCIES
    | ROWID
    | ROWIDTOCHAR
    | ROWIDTONCHAR
    | ROW_LENGTH
    | ROW
    | ROW_NUMBER
    | ROWNUM
    | ROWS
    | RPAD
    | RTRIM
    | RULE
    | RULES
    | SALT
    | SAMPLE
    | SAVE_AS_INTERVALS
    | SAVEPOINT
    | SB4
    | SCALE
    | SCALE_ROWS
    | SCAN_INSTANCES
    | SCAN
    | SCHEDULER
    | SCHEMACHECK
    | SCHEMA
    | SCN_ASCENDING
    | SCN
    | SCOPE
    | SD_ALL
    | SD_INHIBIT
    | SD_SHOW
    | SEARCH
    | SECOND
    | SECUREFILE_DBA
    | SECUREFILE
    | SECURITY
    | SEED
    | SEG_BLOCK
    | SEG_FILE
    | SEGMENT
    | SELECTIVITY
    | SEMIJOIN_DRIVER
    | SEMIJOIN
    | SEMI_TO_INNER
    | SEQUENCED
    | SEQUENCE
    | SEQUENTIAL
    | SERIALIZABLE
    | SERVERERROR
    | SESSION_CACHED_CURSORS
    | SESSION
    | SESSIONS_PER_USER
    | SESSIONTIMEZONE
    | SESSIONTZNAME
    | SETS
    | SETTINGS
    | SET_TO_JOIN
    | SEVERE
    | SHARED
    | SHARED_POOL
    | SHOW
    | SHRINK
    | SHUTDOWN
    | SIBLINGS
    | SID
    | SIGNAL_COMPONENT
    | SIGNAL_FUNCTION
    | SIGN
    | SIMPLE
    | SINGLE
    | SINGLETASK
    | SINH
    | SIN
    | SKIP_EXT_OPTIMIZER
    | SKIP_
    | SKIP_UNQ_UNUSABLE_IDX
    | SKIP_UNUSABLE_INDEXES
    | SMALLFILE
    | SNAPSHOT
    | SOME
    | SORT
    | SOUNDEX
    | SOURCE
    | SPACE_KEYWORD
    | SPECIFICATION
    | SPFILE
    | SPLIT
    | SPREADSHEET
    | SQLLDR
    | SQL
    | SQL_TRACE
    | SQRT
    | STALE
    | STANDALONE
    | STANDBY_MAX_DATA_DELAY
    | STANDBY
    | STAR
    | STAR_TRANSFORMATION
    | STARTUP
    | STATEMENT_ID
    | STATEMENT_QUEUING
    | STATEMENTS
    | STATIC
    | STATISTICS
    | STATS_BINOMIAL_TEST
    | STATS_CROSSTAB
    | STATS_F_TEST
    | STATS_KS_TEST
    | STATS_MODE
    | STATS_MW_TEST
    | STATS_ONE_WAY_ANOVA
    | STATS_T_TEST_INDEP
    | STATS_T_TEST_INDEPU
    | STATS_T_TEST_ONE
    | STATS_T_TEST_PAIRED
    | STATS_WSR_TEST
    | STDDEV
    | STDDEV_POP
    | STDDEV_SAMP
    | STOP
    | STORAGE
    | STORE
    | STREAMS
    | STRICT
    | STRING
    | STRIPE_COLUMNS
    | STRIPE_WIDTH
    | STRIP
    | STRUCTURE
    | SUBMULTISET
    | SUBPARTITION
    | SUBPARTITION_REL
    | SUBPARTITIONS
    | SUBQUERIES
    | SUBQUERY_PRUNING
    | SUBSTITUTABLE
    | SUBSTR2
    | SUBSTR4
    | SUBSTRB
    | SUBSTRC
    | SUBSTR
    | SUCCESSFUL
    | SUMMARY
    | SUM
    | SUPPLEMENTAL
    | SUSPEND
    | SWAP_JOIN_INPUTS
    | SWITCH
    | SWITCHOVER
    | SYNCHRONOUS
    | SYNC
    | SYSASM
    | SYS_AUDIT
    | SYSAUX
    | SYS_CHECKACL
    | SYS_CONNECT_BY_PATH
    | SYS_CONTEXT
    | SYSDATE
    | SYSDBA
    | SYS_DBURIGEN
    | SYS_DL_CURSOR
    | SYS_DM_RXFORM_CHR
    | SYS_DM_RXFORM_NUM
    | SYS_DOM_COMPARE
    | SYS_DST_PRIM2SEC
    | SYS_DST_SEC2PRIM
    | SYS_ET_BFILE_TO_RAW
    | SYS_ET_BLOB_TO_IMAGE
    | SYS_ET_IMAGE_TO_BLOB
    | SYS_ET_RAW_TO_BFILE
    | SYS_EXTPDTXT
    | SYS_EXTRACT_UTC
    | SYS_FBT_INSDEL
    | SYS_FILTER_ACLS
    | SYS_FNMATCHES
    | SYS_FNREPLACE
    | SYS_GET_ACLIDS
    | SYS_GET_PRIVILEGES
    | SYS_GETTOKENID
    | SYS_GETXTIVAL
    | SYS_GUID
    | SYS_MAKEXML
    | SYS_MAKE_XMLNODEID
    | SYS_MKXMLATTR
    | SYS_OP_ADT2BIN
    | SYS_OP_ADTCONS
    | SYS_OP_ALSCRVAL
    | SYS_OP_ATG
    | SYS_OP_BIN2ADT
    | SYS_OP_BITVEC
    | SYS_OP_BL2R
    | SYS_OP_BLOOM_FILTER_LIST
    | SYS_OP_BLOOM_FILTER
    | SYS_OP_C2C
    | SYS_OP_CAST
    | SYS_OP_CEG
    | SYS_OP_CL2C
    | SYS_OP_COMBINED_HASH
    | SYS_OP_COMP
    | SYS_OP_CONVERT
    | SYS_OP_COUNTCHG
    | SYS_OP_CSCONV
    | SYS_OP_CSCONVTEST
    | SYS_OP_CSR
    | SYS_OP_CSX_PATCH
    | SYS_OP_DECOMP
    | SYS_OP_DESCEND
    | SYS_OP_DISTINCT
    | SYS_OP_DRA
    | SYS_OP_DUMP
    | SYS_OP_DV_CHECK
    | SYS_OP_ENFORCE_NOT_NULL
    | SYSOPER
    | SYS_OP_EXTRACT
    | SYS_OP_GROUPING
    | SYS_OP_GUID
    | SYS_OP_IIX
    | SYS_OP_ITR
    | SYS_OP_LBID
    | SYS_OP_LOBLOC2BLOB
    | SYS_OP_LOBLOC2CLOB
    | SYS_OP_LOBLOC2ID
    | SYS_OP_LOBLOC2NCLOB
    | SYS_OP_LOBLOC2TYP
    | SYS_OP_LSVI
    | SYS_OP_LVL
    | SYS_OP_MAKEOID
    | SYS_OP_MAP_NONNULL
    | SYS_OP_MSR
    | SYS_OP_NICOMBINE
    | SYS_OP_NIEXTRACT
    | SYS_OP_NII
    | SYS_OP_NIX
    | SYS_OP_NOEXPAND
    | SYS_OP_NTCIMG
    | SYS_OP_NUMTORAW
    | SYS_OP_OIDVALUE
    | SYS_OP_OPNSIZE
    | SYS_OP_PAR_1
    | SYS_OP_PARGID_1
    | SYS_OP_PARGID
    | SYS_OP_PAR
    | SYS_OP_PIVOT
    | SYS_OP_R2O
    | SYS_OP_RAWTONUM
    | SYS_OP_RDTM
    | SYS_OP_REF
    | SYS_OP_RMTD
    | SYS_OP_ROWIDTOOBJ
    | SYS_OP_RPB
    | SYS_OPTLOBPRBSC
    | SYS_OP_TOSETID
    | SYS_OP_TPR
    | SYS_OP_TRTB
    | SYS_OPTXICMP
    | SYS_OPTXQCASTASNQ
    | SYS_OP_UNDESCEND
    | SYS_OP_VECAND
    | SYS_OP_VECBIT
    | SYS_OP_VECOR
    | SYS_OP_VECXOR
    | SYS_OP_VERSION
    | SYS_OP_VREF
    | SYS_OP_VVD
    | SYS_OP_XMLCONS_FOR_CSX
    | SYS_OP_XPTHATG
    | SYS_OP_XPTHIDX
    | SYS_OP_XPTHOP
    | SYS_OP_XTXT2SQLT
    | SYS_ORDERKEY_DEPTH
    | SYS_ORDERKEY_MAXCHILD
    | SYS_ORDERKEY_PARENT
    | SYS_PARALLEL_TXN
    | SYS_PATHID_IS_ATTR
    | SYS_PATHID_IS_NMSPC
    | SYS_PATHID_LASTNAME
    | SYS_PATHID_LASTNMSPC
    | SYS_PATH_REVERSE
    | SYS_PXQEXTRACT
    | SYS_RID_ORDER
    | SYS_ROW_DELTA
    | SYS_SC_2_XMLT
    | SYS_SYNRCIREDO
    | SYSTEM_DEFINED
    | SYSTEM
    | SYSTIMESTAMP
    | SYS_TYPEID
    | SYS_UMAKEXML
    | SYS_XMLANALYZE
    | SYS_XMLCONTAINS
    | SYS_XMLCONV
    | SYS_XMLEXNSURI
    | SYS_XMLGEN
    | SYS_XMLI_LOC_ISNODE
    | SYS_XMLI_LOC_ISTEXT
    | SYS_XMLINSTR
    | SYS_XMLLOCATOR_GETSVAL
    | SYS_XMLNODEID_GETCID
    | SYS_XMLNODEID_GETLOCATOR
    | SYS_XMLNODEID_GETOKEY
    | SYS_XMLNODEID_GETPATHID
    | SYS_XMLNODEID_GETPTRID
    | SYS_XMLNODEID_GETRID
    | SYS_XMLNODEID_GETSVAL
    | SYS_XMLNODEID_GETTID
    | SYS_XMLNODEID
    | SYS_XMLT_2_SC
    | SYS_XMLTRANSLATE
    | SYS_XMLTYPE2SQL
    | SYS_XQ_ASQLCNV
    | SYS_XQ_ATOMCNVCHK
    | SYS_XQBASEURI
    | SYS_XQCASTABLEERRH
    | SYS_XQCODEP2STR
    | SYS_XQCODEPEQ
    | SYS_XQCON2SEQ
    | SYS_XQCONCAT
    | SYS_XQDELETE
    | SYS_XQDFLTCOLATION
    | SYS_XQDOC
    | SYS_XQDOCURI
    | SYS_XQDURDIV
    | SYS_XQED4URI
    | SYS_XQENDSWITH
    | SYS_XQERRH
    | SYS_XQERR
    | SYS_XQESHTMLURI
    | SYS_XQEXLOBVAL
    | SYS_XQEXSTWRP
    | SYS_XQEXTRACT
    | SYS_XQEXTRREF
    | SYS_XQEXVAL
    | SYS_XQFB2STR
    | SYS_XQFNBOOL
    | SYS_XQFNCMP
    | SYS_XQFNDATIM
    | SYS_XQFNLNAME
    | SYS_XQFNNM
    | SYS_XQFNNSURI
    | SYS_XQFNPREDTRUTH
    | SYS_XQFNQNM
    | SYS_XQFNROOT
    | SYS_XQFORMATNUM
    | SYS_XQFTCONTAIN
    | SYS_XQFUNCR
    | SYS_XQGETCONTENT
    | SYS_XQINDXOF
    | SYS_XQINSERT
    | SYS_XQINSPFX
    | SYS_XQIRI2URI
    | SYS_XQLANG
    | SYS_XQLLNMFRMQNM
    | SYS_XQMKNODEREF
    | SYS_XQNILLED
    | SYS_XQNODENAME
    | SYS_XQNORMSPACE
    | SYS_XQNORMUCODE
    | SYS_XQ_NRNG
    | SYS_XQNSP4PFX
    | SYS_XQNSPFRMQNM
    | SYS_XQPFXFRMQNM
    | SYS_XQ_PKSQL2XML
    | SYS_XQPOLYABS
    | SYS_XQPOLYADD
    | SYS_XQPOLYCEL
    | SYS_XQPOLYCSTBL
    | SYS_XQPOLYCST
    | SYS_XQPOLYDIV
    | SYS_XQPOLYFLR
    | SYS_XQPOLYMOD
    | SYS_XQPOLYMUL
    | SYS_XQPOLYRND
    | SYS_XQPOLYSQRT
    | SYS_XQPOLYSUB
    | SYS_XQPOLYUMUS
    | SYS_XQPOLYUPLS
    | SYS_XQPOLYVEQ
    | SYS_XQPOLYVGE
    | SYS_XQPOLYVGT
    | SYS_XQPOLYVLE
    | SYS_XQPOLYVLT
    | SYS_XQPOLYVNE
    | SYS_XQREF2VAL
    | SYS_XQRENAME
    | SYS_XQREPLACE
    | SYS_XQRESVURI
    | SYS_XQRNDHALF2EVN
    | SYS_XQRSLVQNM
    | SYS_XQRYENVPGET
    | SYS_XQRYVARGET
    | SYS_XQRYWRP
    | SYS_XQSEQ2CON4XC
    | SYS_XQSEQ2CON
    | SYS_XQSEQDEEPEQ
    | SYS_XQSEQINSB
    | SYS_XQSEQRM
    | SYS_XQSEQRVS
    | SYS_XQSEQSUB
    | SYS_XQSEQTYPMATCH
    | SYS_XQSTARTSWITH
    | SYS_XQSTATBURI
    | SYS_XQSTR2CODEP
    | SYS_XQSTRJOIN
    | SYS_XQSUBSTRAFT
    | SYS_XQSUBSTRBEF
    | SYS_XQTOKENIZE
    | SYS_XQTREATAS
    | SYS_XQ_UPKXML2SQL
    | SYS_XQXFORM
    | TABLE
    | TABLE_LOOKUP_BY_NL
    | TABLES
    | TABLESPACE
    | TABLESPACE_NO
    | TABLE_STATS
    | TABNO
    | TANH
    | TAN
    | TBLORIDXPARTNUM
    | TEMPFILE
    | TEMPLATE
    | TEMPORARY
    | TEMP_TABLE
    | TEST
    | THAN
    | THE
    | THEN
    | THREAD
    | THROUGH
    | TIME
    | TIMEOUT
    | TIMES
    | TIMESTAMP
    | TIMEZONE_ABBR
    | TIMEZONE_HOUR
    | TIMEZONE_MINUTE
    | TIME_ZONE
    | TIMEZONE_OFFSET
    | TIMEZONE_REGION
    | TIV_GB
    | TIV_SSF
    | TO_BINARY_DOUBLE
    | TO_BINARY_FLOAT
    | TO_BLOB
    | TO_CHAR
    | TO_CLOB
    | TO_DATE
    | TO_DSINTERVAL
    | TO_LOB
    | TO_MULTI_BYTE
    | TO_NCHAR
    | TO_NCLOB
    | TO_NUMBER
    | TOPLEVEL
    | TO_SINGLE_BYTE
    | TO_TIME
    | TO_TIMESTAMP
    | TO_TIMESTAMP_TZ
    | TO_TIME_TZ
    | TO_YMINTERVAL
    | TRACE
    | TRACING
    | TRACKING
    | TRAILING
    | TRANSACTION
    | TRANSFORM_DISTINCT_AGG
    | TRANSITIONAL
    | TRANSITION
    | TRANSLATE
    | TREAT
    | TRIGGERS
    | TRIM
    | TRUE
    | TRUNCATE
    | TRUNC
    | TRUSTED
    | TUNING
    | TX
    | TYPE
    | TYPES
    | TZ_OFFSET
    | UB2
    | UBA
    | UID
    | UNARCHIVED
    | UNBOUNDED
    | UNBOUND
    | UNDER
    | UNDO
    | UNDROP
    | UNIFORM
    | UNISTR
    | UNLIMITED
    | UNLOAD
    | UNLOCK
    | UNNEST_INNERJ_DISTINCT_VIEW
    | UNNEST
    | UNNEST_NOSEMIJ_NODISTINCTVIEW
    | UNNEST_SEMIJ_VIEW
    | UNPACKED
    | UNPIVOT
    | UNPROTECTED
    | UNQUIESCE
    | UNRECOVERABLE
    | UNRESTRICTED
    | UNTIL
    | UNUSABLE
    | UNUSED
    | UPDATABLE
    | UPDATED
    | UPDATEXML
    | UPD_INDEXES
    | UPD_JOININDEX
    | UPGRADE
    | UPPER
    | UPSERT
    | UROWID
    | USAGE
    | USE_ANTI
    | USE_CONCAT
    | USE_HASH_AGGREGATION
    | USE_HASH_GBY_FOR_PUSHDOWN
    | USE_HASH
    | USE_INVISIBLE_INDEXES
    | USE_MERGE_CARTESIAN
    | USE_MERGE
    | USE
    | USE_NL
    | USE_NL_WITH_INDEX
    | USE_PRIVATE_OUTLINES
    | USER_DEFINED
    | USERENV
    | USERGROUP
    | USER
    | USER_RECYCLEBIN
    | USERS
    | USE_SEMI
    | USE_STORED_OUTLINES
    | USE_TTT_FOR_GSETS
    | USE_WEAK_NAME_RESL
    | USING
    | VALIDATE
    | VALIDATION
    | VALUE
    | VARIANCE
    | VAR_POP
    | VARRAY
    | VARRAYS
    | VAR_SAMP
    | VARYING
    | VECTOR_READ
    | VECTOR_READ_TRACE
    | VERIFY
    | VERSIONING
    | VERSION
    | VERSIONS_ENDSCN
    | VERSIONS_ENDTIME
    | VERSIONS
    | VERSIONS_OPERATION
    | VERSIONS_STARTSCN
    | VERSIONS_STARTTIME
    | VERSIONS_XID
    | VIRTUAL
    | VISIBLE
    | VOLUME
    | VSIZE
    | WAIT
    | WALLET
    | WELLFORMED
    | WHENEVER
    | WHEN
    | WHITESPACE
    | WIDTH_BUCKET
    | WITHIN
    | WITHOUT
    | WORK
    | WRAPPED
    | WRITE
    | XDB_FASTPATH_INSERT
    | X_DYN_PRUNE
    | XID
    | XML2OBJECT
    | XMLATTRIBUTES
    | XMLCAST
    | XMLCDATA
    | XMLCOLATTVAL
    | XMLCOMMENT
    | XMLCONCAT
    | XMLDIFF
    | XML_DML_RWT_STMT
    | XMLELEMENT
    | XMLEXISTS2
    | XMLEXISTS
    | XMLFOREST
    | XMLINDEX_REWRITE_IN_SELECT
    | XMLINDEX_REWRITE
    | XMLINDEX_SEL_IDX_TBL
    | XMLISNODE
    | XMLISVALID
    | XML
    | XMLNAMESPACES
    | XMLPARSE
    | XMLPATCH
    | XMLPI
    | XMLQUERY
    | XMLQUERYVAL
    | XMLROOT
    | XMLSCHEMA
    | XMLSERIALIZE
    | XMLTABLE
    | XMLTRANSFORMBLOB
    | XMLTRANSFORM
    | XMLTYPE
    | XPATHTABLE
    | XS_SYS_CONTEXT
    | YEAR
    | YES
    | ZONE
    ;

NON_RESERVED_KEYWORDS_IN_12C
    : DOLLAR2_ID // added jurgen
    | ACL
    | ACTION
    | ACTIONS
    | ACTIVE
    | ACTIVE_DATA
    | ACTIVITY
    | ADAPTIVE_PLAN
    | ADVANCED
    | AFD_DISKSTRING
    | ANOMALY
    | ANSI_REARCH
    | APPLICATION
    | APPROX_COUNT_DISTINCT
    | ARCHIVAL
    | ARCHIVED
    | ASIS
    | ASSIGN
    | AUTO_LOGIN
    | AUTO_REOPTIMIZE
    | AVRO
    | BACKGROUND
    | BATCHSIZE
    | BATCH_TABLE_ACCESS_BY_ROWID
    | BEGINNING
    | BEQUEATH
    | BITMAP_AND
    | BSON
    | CACHING
    | CALCULATED
    | CALLBACK
    | CAPACITY
    | CDBDEFAULT
    | CLASSIFIER
    | CLEANUP
    | CLIENT
    | CLUSTER_DETAILS
    | CLUSTER_DISTANCE
    | CLUSTERING
    | COMMON_DATA
    | COMPONENT
    | COMPONENTS
    | CON_DBID_TO_ID
    | CONDITION
    | CONDITIONAL
    | CON_GUID_TO_ID
    | CON_ID
    | CON_NAME_TO_ID
    | CONTAINER_DATA
    | CONTAINERS
    | CON_UID_TO_ID
    | COOKIE
    | COPY
    | CREATE_FILE_DEST
    | CREDENTIAL
    | CRITICAL
    | CUBE_AJ
    | CUBE_SJ
    | DATAMOVEMENT
    | DATAOBJ_TO_MAT_PARTITION
    | DATAPUMP
    | DATA_SECURITY_REWRITE_LIMIT
    | DAYS
    | DB_UNIQUE_NAME
    | DECORRELATE
    | DEFINE
    | DELEGATE
    | DELETE_ALL
    | DESTROY
    | DIMENSIONS
    | DISABLE_ALL
    | DISABLE_PARALLEL_DML
    | DISCARD
    | DISTRIBUTE
    | DUPLICATE
    | DV
    | EDITIONABLE
    | ELIM_GROUPBY
    | EM
    | ENABLE_ALL
    | ENABLE_PARALLEL_DML
    | EQUIPART
    | EVAL
    | EVALUATE
    | EXISTING
    | EXPRESS
    | EXTRACTCLOBXML
    | FACTOR
    | FAILOVER
    | FAILURE
    | FAMILY
    | FAR
    | FASTSTART
    | FEATURE_DETAILS
    | FETCH
    | FILE_NAME_CONVERT
    | FIXED_VIEW_DATA
    | FORMAT
    | GATHER_OPTIMIZER_STATISTICS
    | GET
    | ILM
    | INACTIVE
    | INDEXING
    | INHERIT
    | INMEMORY
    | INMEMORY_PRUNING
    | INPLACE
    | INTERLEAVED
    | JSON
    | JSON_ARRAY
    | JSON_ARRAYAGG
    | JSON_EQUAL
    | JSON_EXISTS
    | JSON_EXISTS2
    | JSONGET
    | JSON_OBJECT
    | JSON_OBJECTAGG
    | JSONPARSE
    | JSON_QUERY
    | JSON_SERIALIZE
    | JSON_TABLE
    | JSON_TEXTCONTAINS
    | JSON_TEXTCONTAINS2
    | JSON_VALUE
    | KEYSTORE
    | LABEL
    | LAX
    | LIFECYCLE
    | LINEAR
    | LOCKING
    | LOGMINING
    | MAP
    | MATCH
    | MATCHES
    | MATCH_NUMBER
    | MATCH_RECOGNIZE
    | MAX_SHARED_TEMP_SIZE
    | MEMCOMPRESS
    | METADATA
    | MODEL_NB
    | MODEL_SV
    | MODIFICATION
    | MODULE
    | MONTHS
    | MULTIDIMENSIONAL
    | NEG
    | NO_ADAPTIVE_PLAN
    | NO_ANSI_REARCH
    | NO_AUTO_REOPTIMIZE
    | NO_BATCH_TABLE_ACCESS_BY_ROWID
    | NO_CLUSTERING
    | NO_COMMON_DATA
    | NOCOPY
    | NO_DATA_SECURITY_REWRITE
    | NO_DECORRELATE
    | NO_ELIM_GROUPBY
    | NO_GATHER_OPTIMIZER_STATISTICS
    | NO_INMEMORY
    | NO_INMEMORY_PRUNING
    | NOKEEP
    | NONEDITIONABLE
    | NO_OBJECT_LINK
    | NO_PARTIAL_JOIN
    | NO_PARTIAL_ROLLUP_PUSHDOWN
    | NOPARTITION
    | NO_PQ_CONCURRENT_UNION
    | NO_PQ_REPLICATE
    | NO_PQ_SKEW
    | NO_PX_FAULT_TOLERANCE
    | NORELOCATE
    | NOREPLAY
    | NO_ROOT_SW_FOR_LOCAL
    | NO_SQL_TRANSLATION
    | NO_USE_CUBE
    | NO_USE_VECTOR_AGGREGATION
    | NO_VECTOR_TRANSFORM
    | NO_VECTOR_TRANSFORM_DIMS
    | NO_VECTOR_TRANSFORM_FACT
    | NO_ZONEMAP
    | OBJ_ID
    | OFFSET
    | OLS
    | OMIT
    | ONE
    | ORA_CHECK_ACL
    | ORA_CHECK_PRIVILEGE
    | ORA_CLUSTERING
    | ORA_INVOKING_USER
    | ORA_INVOKING_USERID
    | ORA_INVOKING_XS_USER
    | ORA_INVOKING_XS_USER_GUID
    | ORA_RAWCOMPARE
    | ORA_RAWCONCAT
    | ORA_WRITE_TIME
    | PARTIAL
    | PARTIAL_JOIN
    | PARTIAL_ROLLUP_PUSHDOWN
    | PAST
    | PATCH
    | PATH_PREFIX
    | PATTERN
    | PER
    | PERIOD
    | PERMUTE
    | PLUGGABLE
    | POOL_16K
    | POOL_2K
    | POOL_32K
    | POOL_4K
    | POOL_8K
    | PQ_CONCURRENT_UNION
    | PQ_DISTRIBUTE_WINDOW
    | PQ_FILTER
    | PQ_REPLICATE
    | PQ_SKEW
    | PRELOAD
    | PRETTY
    | PREV
    | PRINTBLOBTOCLOB
    | PRIORITY
    | PRIVILEGED
    | PROXY
    | PRUNING
    | PX_FAULT_TOLERANCE
    | REALM
    | REDEFINE
    | RELOCATE
    | RESTART
    | ROLESET
    | ROWID_MAPPING_TABLE
    | RUNNING
    | SAVE
    | SCRUB
    | SDO_GEOM_MBR
    | SECRET
    | SERIAL
    | SERVICE_NAME_CONVERT
    | SERVICES
    | SHARING
    | SHELFLIFE
    | SOURCE_FILE_DIRECTORY
    | SOURCE_FILE_NAME_CONVERT
    | SQL_TRANSLATION_PROFILE
    | STANDARD_HASH
    | STANDBYS
    | STATE
    | STATEMENT
    | STREAM
    | SUBSCRIBE
    | SUBSET
    | SUCCESS
    | SYSBACKUP
    | SYS_CHECK_PRIVILEGE
    | SYSDG
    | SYS_GET_COL_ACLIDS
    | SYSGUID
    | SYSKM
    | SYS_MKXTI
    | SYSOBJ
    | SYS_OP_CYCLED_SEQ
    | SYS_OP_HASH
    | SYS_OP_KEY_VECTOR_CREATE
    | SYS_OP_KEY_VECTOR_FILTER
    | SYS_OP_KEY_VECTOR_FILTER_LIST
    | SYS_OP_KEY_VECTOR_SUCCEEDED
    | SYS_OP_KEY_VECTOR_USE
    | SYS_OP_PART_ID
    | SYS_OP_ZONE_ID
    | SYS_RAW_TO_XSID
    | SYS_XSID_TO_RAW
    | SYS_ZMAP_FILTER
    | SYS_ZMAP_REFRESH
    | TAG
    | TEXT
    | TIER
    | TIES
    | TO_ACLID
    | TRANSLATION
    | TRUST
    | UCS2
    | UNCONDITIONAL
    | UNMATCHED
    | UNPLUG
    | UNSUBSCRIBE
    | USABLE
    | USE_CUBE
    | USE_HIDDEN_PARTITIONS
    | USER_DATA
    | USER_TABLESPACES
    | USE_VECTOR_AGGREGATION
    | USING_NO_EXPAND
    | UTF16BE
    | UTF16LE
    | UTF32
    | UTF8
    | V1
    | V2
    | VALID_TIME_END
    | VECTOR_TRANSFORM
    | VECTOR_TRANSFORM_DIMS
    | VECTOR_TRANSFORM_FACT
    | VERIFIER
    | VIOLATION
    | VISIBILITY
    | WEEK
    | WEEKS
    | WITH_PLSQL
    | WRAPPER
    | XS
    | YEARS
    | ZONEMAP
    ;

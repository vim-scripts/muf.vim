" Vim syntax file
" Language:		MUF
" Maintainer:	Revar Desmera <revar@belfry.com>
" Last Change:	Fri 26 Jul 2002 18:23:01 PST

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Synchronization method
syn sync ccomment maxlines=200

" Forth is not case sensitive
syn case ignore

" Some special, non-FORTH keywords
syn keyword mufTodo contained TODO: FIXME: HACK: NOTE:
syn keyword mufTodo contained TODO FIXME HACK NOTE
syn match mufTodo contained 'Copyright\(\s([Cc])\)\=\(\s[0-9]\{2,4}\)\=\s\='

" Characters allowed in keywords
set iskeyword=#,$,!,?,a-z,A-Z,48-57,+,-,/,&,>,{,},_,.

" Keywords

" * variable declarations
syn keyword mufVarDef LVAR VAR!
syn keyword mufVarDef VAR

" * basic (return)stack manipulation and control words
syn keyword mufStack ROTATE POPN LDUP DUPN LREVERSE
syn keyword mufStack DEPTH POP DUP REVERSE
syn keyword mufStack OVER PICK PUT ROT SWAP
syn keyword mufStack ! LOCALVAR VARIABLE
syn match mufArray '@'

" * array operators
syn match mufArray '->\[]'
syn match mufArray '\[]'
syn match mufArray '\[..]'
syn keyword mufArray { }LIST }DICT ARRAY_MAKE_DICT ARRAY_MAKE
syn keyword mufArray } }JOIN ARRAY_EXCLUDEVAL ARRAY_DELITEM
syn keyword mufArray ARRAY_GETITEM ARRAY_SETITEM ARRAY_INSERTITEM
syn keyword mufArray ARRAY_APPENDITEM ARRAY_GETRANGE ARRAY_SETRANGE
syn keyword mufArray ARRAY_INSERTRANGE ARRAY_DELRANGE ARRAY_EXPLODE
syn keyword mufArray ARRAY_SORT_INDEXED ARRAY_FIRST ARRAY_LAST ARRAY_PREV
syn keyword mufArray ARRAY_SORT ARRAY_NEXT ARRAY_KEYS ARRAY_VALS
syn keyword mufArray ARRAY_COUNT ARRAY_NUNION ARRAY_UNION
syn keyword mufArray ARRAY_NDIFF ARRAY_DIFF ARRAY_NINTERSECT
syn keyword mufArray ARRAY_INTERSECT ARRAY_FINDVAL ARRAY_JOIN
syn keyword mufArray ARRAY_GET_REFLIST ARRAY_PUT_REFLIST
syn keyword mufArray ARRAY_GET_PROPLIST ARRAY_PUT_PROPLIST
syn keyword mufArray ARRAY_GET_PROPVALS ARRAY_PUT_PROPVALS
syn keyword mufArray ARRAY_GET_PROPDIRS ARRAY_FILTER_PROP
syn keyword mufArray ARRAY_MATCHKEY ARRAY_MATCHVAL ARRAY_EXTRACT
syn keyword mufArray ARRAY_COMPARE

" * basic character operations
syn keyword mufCharOps ANSI_STRIP ANSI_STRLEN ANSI_STRCUT ANSI_MIDSTR
syn keyword mufCharOps STRIPLEAD STRIPTAIL RSPLIT TOUPPER TOLOWER
syn keyword mufCharOps STRCMP STRINGCMP STRNCMP STRLEN STRCAT
syn keyword mufCharOps STRIP SPLIT RINSTR SMATCH STRINGPFX
syn keyword mufCharOps INSTRING RINSTRING UNPARSEOBJ STRCUT
syn keyword mufCharOps RINSTR EXPLODE_ARRAY PRONOUN_SUB SUBST MIDSTR
syn keyword mufCharOps INSTR EXLODE FMTSTRING TOKENSPLIT TEXTATTR
syn keyword mufCharOps STOD STRTOF FTOSTR

" * char-number converion
syn keyword mufConversion INT? DBREF? FLOAT? LOCK? ADDRESS? NUMBER?
syn keyword mufConversion STRING? ARRAY? DICTIONARY?
syn keyword mufConversion PLAYER? THING? PROGRAM? EXIT? ROOM? OK?
syn keyword mufConversion INT DBREF FLOAT ATOI INTOSTR CTOI ITOC

" * Exceptions
syn keyword mufException ABORT TRY ENDCATCH
syn keyword mufException CATCH

" * Execution calls and returns
syn keyword mufExec EXECUTE EXIT CALL

" * MCP and GUI stuff
syn keyword mufMCP MCP_REGISTER MCP_BIND MCP_SUPPORTS MCP_SEND
syn keyword mufMCP GUI_DLOG_CREATE GUI_DLOG_SIMPLE GUI_DLOG_TABBED
syn keyword mufMCP GUI_DLOG_HELPER GUI_AVAILABLE GUI_DLOG_SHOW
syn keyword mufMCP GUI_DLOG_CLOSE GUI_CTRL_CREATE GUI_VALUES_GET
syn keyword mufMCP GUI_VALUE_GET GUI_VALUE_SET GUI_CTRL_COMMAND
syn keyword mufMCP D_SIMPLE D_TABBED D_HELPER
syn keyword mufMCP C_DATUM C_LABEL C_IMAGE C_HRULE C_VRULE
syn keyword mufMCP C_BUTTON C_CHECKBOX C_RADIO C_EDIT C_MULTIEDIT
syn keyword mufMCP C_COMBOBOX C_LISTBOX C_SPINNER C_SCALE C_MENU
syn keyword mufMCP C_FRAME C_NOTEBOOK C_TREE C_PASSWORD
syn keyword mufMCP {SIMPLE_DLOG {TABBED_DLOG {HELPER_DLOG
syn keyword mufMCP {DATUM {LABEL {IMAGE {HRULE {VRULE
syn keyword mufMCP {BUTTON {CHECKBOX {RADIO {EDIT {MULTIEDIT
syn keyword mufMCP {COMBOBOX {LISTBOX {SPINNER {SCALE {MENU
syn keyword mufMCP {FRAME }CTRL {NOTEBOOK {PANE }PANE }DLOG
syn keyword mufMCP {TREE {PASSWORD

" * Process management operators
syn keyword mufProcess PREEMPT BACKGROUND FOREGROUND
syn keyword mufProcess PR_MODE BG_MODE FG_MODE SETMODE MODE
syn keyword mufProcess GETPIDS GETPIDINFO ISPID? PID KILL INTERP
syn keyword mufProcess PID FORK QUEUE INSTANCES COMPILED? UNCOMPILE
syn keyword mufProcess COMPILE PROGRAM_GETLINES DEBUGGER_BREAK

" * basic mathematical and logical operators
syn keyword mufOperators * + - / % ++ -- ABS SIGN AND
syn keyword mufOperators POW FABS FMOD MODF SIN ASIN COS ACOS TAN ATAN2
syn keyword mufOperators ATAN PI INF SQRT EXP LOG10
syn keyword mufOperators LOG FLOOR CIEL ROUND FRAND
syn keyword mufOperators BITSHIFT BITOR BITAND BITXOR BITNOT
syn keyword mufOperators ERROR? IS_SET? SET_ERROR CLEAR_ERROR
syn keyword mufOperators CLEAR ERROR_BIT ERROR_NAME ERROR_NUM ERROR_STRING
syn keyword mufOperators NOT OR

" Misc MUF operations
syn keyword mufMisc ADDPENNIES CALLER CANCALL? CHECKARGS CHECKPASSWORD
syn keyword mufMisc CONTENTS CONTENTS_ARRAY CONTROLS COPYOBJ COPYPLAYER
syn keyword mufMisc DBTOP EXITS EXITS_ARRAY FINDNEXT FLAG?
syn keyword mufMisc FORCE FORCE_LEVEL GETLINK GETLINKS GETLINKS_ARRAY
syn keyword mufMisc GETSEED LOCATION MATCH MLEVEL MOVETO
syn keyword mufMisc NAME-OK? NEWEXIT NEWOBJECT NEWPASSWORD NEWPLAYER
syn keyword mufMisc NEWPROGRAM NEWROOM NEXT NEXTENTRANCE NEXTOWNED
syn keyword mufMisc OBJMEM OWNER PART_PMATCH PENNIES PMATCH
syn keyword mufMisc PNAME-OK? PROG RANDOM RECYCLE RMATCH
syn keyword mufMisc SETLINK SETOWN SETSEED SETSYSPARM SYSPARM_ARRAY
syn keyword mufMisc SRAND STATS SYSPARM TIMESTAMPS TOADPLAYER
syn keyword mufMisc TRIG USERLOG VERSION SET

" * connection management operations
syn keyword mufConnect AWAKE? ONLINE_ARRAY CONCOUNT
syn keyword mufConnect CONDESCR CONDBREF CONHOST CONUSER
syn keyword mufConnect DESCRCON DESCRDBREF DESCRHOST DESCRUSER
syn keyword mufConnect CONTIME CONIDLE CONNOTIFY CONBOOT
syn keyword mufConnect DESCRTIME DESCRIDLE DESCRNOTIFY DESCRBOOT
syn keyword mufConnect DESCRIPTORS NEXTDESCR FIRSTDESCR LASTDESCR
syn keyword mufConnect DESCRFLUSH DESCR_SETUSER DESCRLEASTIDLE DESCRMOSTIDLE
syn keyword mufConnect DESCRSECURE? DESCRBUFSIZE DESCR_ARRAY DESCR
syn keyword mufConnect DESCR ONLINE

" * DB management operations
syn keyword mufDB GETPROPSTR GETPROPVAL GETPROPFVAL ADDPROP SETPROP
syn keyword mufDB GETPROP ENVPROPSTR REMOVE_PROP NEXTPROP PROPDIR?
syn keyword mufDB ENVPROP PARSEPROP UNBLESSPROP REFLIST_ADD
syn keyword mufDB BLESSPROP BLESSED? REFLIST_DEL REFLIST_FIND
syn keyword mufDB SETDESC SETSUCC SETFAIL SETDROP SETOSUCC SETOFAIL SETODROP
syn keyword mufDB DESC SUCC FAIL DROP OSUCC OFAIL ODROP TRUENAME SETNAME
syn keyword mufDB NAME

" * IO management operations
syn keyword mufIO TREAD NOTIFY_EXCEPT NOTIFY_EXCLUDE ARRAY_NOTIFY
syn keyword mufIO READ NOTIFY }TELL EVENT_WAITFOR EVENT_COUNT
syn keyword mufIO EVENT_WAIT EVENT_EXISTS TIMER_START TIMER_STOP

" * time management operations
syn keyword mufTime DATE GMTOFFSET SYSTIME TIMESPLIT TIMEFMT SLEEP
syn keyword mufTime TIME

" * lock management operations
syn keyword mufLock LOCKED? GETLOCKSTR SETLOCKSTR UNPARSELOCK
syn keyword mufLock PARSELOCK TESTLOCK PRETTYLOCK

" * Iterations
syn keyword mufIteration BEGIN WHILE REPEAT UNTIL BREAK CONTINUE FOREACH
syn keyword mufIteration FOR JMP

" * Conditionals
syn keyword mufConditional CASE WHEN DEFAULT ENDCASE IF ELSE THEN
syn keyword mufConditional < <= > >= END
syn keyword mufConditional = DBCMP

" Numbers
syn match mufDBRef '\<#-\=[0-9.]*[0-9]\+\>'
syn match mufInteger '\<-\=[0-9.]*[0-9]\+\>'
syn match mufFloat '\<-\=[0-9]*[.]\=[0-9]\+[Ee][0-9]\+\>'

" Comments
syn region mufComment start='(' end=')' contains=mufTodo

" Defines
syn match mufDefine '\<\$DEF\s.*$'
syn region mufDefine start='\<\$DEFINE\s' end='\<\$ENDDEF\>'
syn match mufDefine '\<\$UNDEF\s\+\k\+'
syn match mufDefine '\<\$AUTHOR\s.*$'
syn match mufDefine '\<\$NOTE\s.*$'
syn match mufDefine '\<\$PUBDEF\s.*$'
syn match mufDefine '\<\$CLEARDEFS\s\+\k\+'
syn match mufDefine '\<\$VERSION\s\+\k\+'
syn match mufDefine '\<\$LIB-VERSION\s\+\k\+'

" Includes
syn match mufInclude '\<\$INCLUDE\s\+\k\+'

" Preconditionals
syn match mufPreCondit '\<\$IFDEF\s\+\k\+'
syn match mufPreCondit '\<\$IFNDEF\s\+\k\+'
syn match mufPreCondit '\<\$IFVER\s\+\k\+'
syn match mufPreCondit '\<\$IFNVER\s\+\k\+'
syn match mufPreCondit '\<\$IFLIBVER\s\+\k\+'
syn match mufPreCondit '\<\$IFNLIBVER\s\+\k\+'
syn match mufPreCondit '\<\$IFLIB\s\+\k\+'
syn match mufPreCondit '\<\$IFNLIB\s\+\k\+'
syn match mufPreCondit '\<\$IFCANCALL\s\+\k\+'
syn match mufPreCondit '\<\$IFNCANCALL\s\+\k\+'
syn match mufPreCondit '\<\$ELSE\>'
syn match mufPreCondit '\<\$ENDIF\>'
syn match mufPreCondit '\<\$ABORT\s.*$'
syn match mufPreCondit '\<\$ECHO\s.*$'

" Definition of new words
syn match mufFuncArgType contained '\<\([^ \t:]\+:\)'
syn match mufFuncArgSep contained '\(--\)'
syn match mufFunction "'[^ \t[]\+"
syn match mufFunction '\<PUBLIC\s\+[^ \t[]\+\>'
syn match mufFunction '\<WIZCALL\s\+[^ \t[]\+\>'
syn region mufFunction start=':\s\+[^ \t[]\+\[' end=']' contains=mufFuncArgType contains=mufFuncArgSep
syn match mufFunction '^\s*:\s\+[^ \t[]\+\s'
syn match mufFunction '^\s*:\s\+[^ \t[]\+$'
syn match mufEndOfFunction '\s*;\s*$'

" Strings
syn region mufString start=+\"+ skip=+\\"+ end=+"+

" The default highlighting.
hi def link mufTodo Todo
hi def link mufInteger Number
hi def link mufDBRef Constant
hi def link mufFloat Float
hi def link mufComment Comment
hi def link mufInclude Include
hi def link mufDefine Define
hi def link mufPreCondit PreCondit
hi def link mufString String
hi def link mufStack Statement
hi def link mufArray mufStack
hi def link mufConnect mufStack
hi def link mufLock mufStack
hi def link mufTime mufStack
hi def link mufIO mufStack
hi def link mufDB mufStack
hi def link mufMCP mufStack
hi def link mufMisc mufStack
hi def link mufProcess mufStack
hi def link mufCharOps Character
hi def link mufConversion SpecialChar
hi def link mufException Exception
hi def link mufExec Special
hi def link mufOperators Operator
hi def link mufIteration Repeat
hi def link mufConditional Conditional
hi def link mufVarDef TypeDef
hi def link mufFuncArgType Type
hi def link mufFunction Function
hi def link mufFuncArgSep mufFunction
hi def link mufEndOfFunction mufFunction

" You can uncomment the following if you have a fast machine.
syn sync minlines=500

let b:current_syntax = "muf"

setlocal expandtab
setlocal sw=4
setlocal ts=4
setlocal autoindent

" vim:ts=4:sw=4:autoindent

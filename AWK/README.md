# Linux

AWK program consists of a sequence of
1. optional directives
2. pattern-action statement
3. optional function definitions
	
	@include "filename"
	@load "filename" -> load extension functions into program -> equivalent to --load
	@namespace "name" 
	pattern { action statements }
	function name (parameter list) { statements }

program source - [arguments] 
	--source
	--include-file filename -> equivalent to @include
	-f filename
	'' -> Inline

AWK execution order
1. all variables assignment specified via the -v option
2. compile the program
3. executes BEGIN rules if any
4. read each file named in the ARGV array -> if no file then reads from std input
	if file name is in the form of var=val, it is treated as var assignment. 
	if each file is associated with BEGIN rules then executes the associated code before processing the content of file
5. each record in the input, it matches any pattern in awk program executes the associated action. [in order they occur]
6. executes END rule if any

Note: awk command line must be text file.

Variables, Records & Fields:
	variables: floating-point, string, regular expression, array
	records: separated by a new line char. Control how records are separated by using RS.
		RS = null, records are separated by empty lines
		RS is any single character otherwise it is an regular expression.
	fields: as each input record is read, it split's into fields. FS is used as a field separated
		FS is any single character otherwise empty lines
		FS = null, each individual char become a separate field.
		
each field in a record can we referenced using it's position
ex. print$n
		where n = 0,1,2,........,n
		0 -> all fields in each record

NF - total no. of fields in the input record
	After NF, null string (non existent field).
	assigning of non existent field will increase value of NF
	ex. 
	$(NF+2) = 5
	Note - NF can be added, removed, assigned

In built variables:
	ARGC - no. of command line arg
	ARGIND - index of ARGV of current file being processed
	ARGV - array of cmd line arg. index -> 0 to ARGC -1
	BINMODE - use of binary mode for all file i/p
		1 or r -> input file
		2 or w -> o/p file
		3 or rw or wr -> all files - default
	CONVFMT - format conversion for numbers, "%.6g" - default
	ENVIRON - arr containing values of current env.
		ex. ENVIRON["HOME"] might be "/home/user_name/"
	ERRNO - descibe the error
	FIELDWIDTHS - whitespace separated list of fields widths.
	FILENAME - name of the current input file.
		If no file are specified on the cmd line, the value is "-"
		value is undefined inside the BEGIN rule
	FNR - input record no. in the current input file.
	FPAT - regular expresssion describing the content of fields in a record.
		when set, parses the input into fields where field matches regular expression inseted of using the value of FS.
	FS - input field separator, default is space
	FUNCTAB - array whose indices & corresponding values are the names of all the user defined functions
		Note - may not use the delete statement.
	IGNORECASE - controls the case sensitivity of all regular expression and the string operations.
		if 0 then case sensitive
		else not case sensitive.
		Ignore while doing regular expression - 
		FS, FPAT, RS, regular expression with ~ and!~, gensub(), gsub(), index(), match(), patsplit(), split(), sub()
		Effect - asort() & asorti()
	LINT - contril of the --lint option.
		true - sprint lint warnnig
		false - not print
	NF - no. of fields in the current input record
	NR - total no. of input records seen so far
	OFMT - o/p format for numbers, "%.6g: by default
	ORS - o/p field separator, default space
	ORS - o/p record separator, newline by default
	PREC - working precision of floating point number, 53 by default
	PROCINFO - elements of this array provide access to info about the running AWK program.
		PROCINFO["argv"] - comd line args
		PROCINFO["egid"] - value of s/m calls for getegid
		PROCINFO["errno"] - value of when set to associated error msg
		PROCINFO["euid"] - value of s/m call for geteuid
		PROCINFO["FS"] - if field splitting with FS is in effect, lly FPAT, FIELDWIDTH or API, if it is in effect
		PROCINFO["gid"] - the value of getgid s/m call
		PROCINFO["identifiers"] - subarray indexed by the names of all identifiers used in the text of the AWK program.
			array
			builtin
			extensino
			scalar
			untyped
			user
		PROCINFO["pgrpid"] - value of getprp s/m call
		PROCINFO["pid"] - value of getpid s/m call
		PROCINFO["strftime"] - default time format string
		PROCINFO["uid"] - value of getuid s/m call
		PROCINFO["version"] - version of awk
		PROCINFO["platform"] - indicating the platform for which awk was compiled.
			"djgpp", "mingw" - windows using either
			"os2" - OS2
			"poix" - linux, cygwin, mac os, legacy unix
			"vms" - openVMS or Vax/VMS
		PROCINFO["ppid"] - the valud of getppid s/m call
		PROCINFO["api_major"] - major version of api
		PROCINFO["api_minor"] - minor version of api
		PROCINFO["gmp_version"] - gnu gymp lib version
		PROCINFO["mpfr_version"] - gnu mpfr lib version
		PROCINFO["prec_max"] - max precision supported by MPFR lib
		PROCINFO["prec_min"] - min precision supported by MPFR lib
		PROCINFO["NONFATAL"] - i/o error becomes non fatal
		PROCINFO["name", "NONFATAL"] - make i/o error for name be nonfatal
		PROCINFO["command", "pty"] - use pseudo-tty for 2 way communication with cmd
		PROCINFO["input", "READ_TIMEOUT"] - timeout in milliseconds for reading data from i/p
			if <=0 then no timeout
		PROCINFO["input", "RETRY"] - if an i/o error occur then retry while reading the data from input.
		PROCINFO["sorted_in"] - if elements exist in PROCINFO, then its value controls the order in which array elements are traversed in for loops.
			other values can be.
				ind_str_asc
				ind_num_asc
				val_type_asc
				val_str_asc
				val_num_asc
				ind_str_desc
				ind_num_desc
				val_type_desc
				val_str_desc
				val_num_desc
				unsorted

	ROUNDMODE - rounding precision number
		A/a - round away from 0
		D/d - round towards -ve
		N/n - round ties to even - default
		U/u - round towards +ve
		Z/z - round towards 0
	RS - i/p record separator
	RT - record terminator
	RSTART - index of 1st char matches, 0 if no match
	RLENGTH - length of string matches, -1 if no match
	SUBSEP - string used to separate multiple subscripts in array
	SYMTAB - indirect access to read or write the value of a variable
		ex. foo = 5
			SYMTAB["foo"] = 4
			print foo #prints 4
	TEXTDOMAIN - find the localized translation


note - force a variable to be treated as number, add zero; force to be treated as string, add null/""
	un-initialized var

note - all number in AWK are floating point
	CONVFMT = "%2.2f"
	a = 12
	b = a ""
	o/p of b - "12"
			
	comparison of 2 var are numeric, they are compared numerically.
	cmp of 1 var as number & 2 var as string, they are compared as numerically or are converted to string & then compared.
	cmp of 2 var are string, they are compared as string.

	note - 
		string constant such as "57" are not numeric string
		this only applies to fields, getline input, FILENAME, ARGV, ENVIRON, elements of array created by split() or patslipt()
		\\ - backslash
		\a - alert
		\b - backspace
		\n - new line
		\r - carriage return
		\t - horizontal tab
		\v - vertical tab
		\xhex digits - ex. \x1B
		\ddd - 1, 2, or 3 digit sequence of octal digits . ex. "\033"
		\c - literal char

Regexp Constants
	sequence of char enclosed between forward slashes like /value/
	strongly typed regular expression constants, written with a leading @ ex. @/value/

PATTERNS & ACTION
	line oriented lang. pattern comes first & then action.
	action are enclosed in { & }
	either pattern may be missing or action may be missing, but not both.
		if pattern is missing, the action executes for every single record of input.
		missing action is equivalent to { print } which entire records

		comments #
		empty lines may be used to separate statements, this is not case for lines ending in a , { ? : && or ||
		a line can be continued by ending it with a "\"
		multiple statements may be put on one line by separating them with ";" - applies to pattern & action

	BEGIN
	END
	BEGINFILE
	ENDFILE
	/ regular expression /
	relational expression
	pattern && pattern
	pattern || pattern
	pattern ? pattern : pattern
	(pattern)
	! pattern
	pattern1, pattern - range patten

	BEGIN & END patter can't be without action

Regular Expressions
	c - match non meta character 
	\c - match literal char
	. - match any char including new char
	^ - match the beginning of string
	$ - match end of string 
	[abc...] - match any char 
	[^abc...] - match any char except 
	r1|r2 - match either 
	r1r2 - concatenate 
	r+ - match one or more 
	r* - match 0 or more 
	r? - match 0 or 1 
	(r) - grouping 
	r{n} - r is repeated n times
	r{n,} - r is repeated at least n times 
	r{n,m} - r is repeated from n to m 
	\y - match empty string at either the beginning or end of word 
	\B - match empty string within a word 
	|< - match empty string at the beginning of word 
	\> - match empty string at the end of word 
	\s - mach whitespace char 
	\S - match non whitespace char 
	\w - mach any word constituent char (letter, digit or underscore) 
	\W - match any char that is not word constituent 
	\` - match empty str at beginning of buffer 
	\' - match empty str at end of buffer 

Character classes
	valid in regular expression inside the brackets
	[:alnum:] - alphanumeric char
	[:alpha:] - alphabetic char
	[:blank:] - space or tab char
	[:cntrl:] - control char
	[:digit:] - numeric char
	[:graph:] - char that are printable & visible
	[:lower:] - lower case alphabetic
	[:print:] - printable char
	[:punct:] - punctuation char (not letter, digits, control char or space)
	[:space:] - space such as space, tab, formfeed
	[:upper:] - upper case alphabetic
	[:xdigit:] - char that are hexa decimal digits

	use ex. /[A-Za-z0-9]/ can be now /[[:alnum:]]/

	[ch] - regular expression that matches either c or h
	[[.ch.]] - regular expression that matches collating element, ie ch
	[[=e=]] - regular expression that matches any of e, ` or '
	valuable in non english speaking locales

	--posix - only posix regular expression are supported.
	--traditional - unix regular expression are matched.
	--re-interval - allow interval expression in regular expressions

Actions:
	action statements are enclosed in { }
	contains:
		assignment
		conditional
		looping
		operators
		control statements
		i/p o/p statements
	
	operators:
		(..) - grouping
		$ - field ref
		++ -- inc & decrement
		^ exponential
		+ - ! plus, minus, negation
		* / % multiple divide modulus
		+ - add & sub
		space
		| |& pipe i/o for getline, print, printf
		< > <= >= == != relational operator
		~ !~ matches, not matches. Only use at right side .ex. /foo/ ~
		in arrary membership
		&& logical AND
		|| logical OR
		?: ternory operator
		= += -+ *= /= %= ^= assignment

Control Statements:
	if (condition) statement [ else statement ]
	while (condition) statement
	do statement while (condition)
	for (exp1;exp2; exp3) statement
	break
	continue
	delete array[index]
	delete array
	exit [expression]
	{ statements }
	switch (expressino) {
	case value|regex : statement
	...
	[default: statement]
	}

I/O statements:
	close(file [, how]) - close file - how should be used when closing one end of 2 way pipe. either "to" or "from"
	getline - set $0 from the next i/p record; set NF, NR, FNR, RT
	getline <file - set $0 from next record of file; set NF, RT
	getline var - set var from next i/p record; set NR, FNR, RT
	getline var <file - set var from the next record of file; set RT
	1 on success
	0 on end of file
	-1 on an error
	cmd |& getline [va] - run command as coprocessor piping the o/p either into $0 or var & RT
	next - stop processing the current i/p record, read next i/p & start processing over with the 1st pattern 
	nextfile - stop processing current i/p file, the next i/p record read comes from the next i/p file. update FILENAME & ARGIND, reset FNR to 1, start processing over with the 1st pattern in the file.
	print - print the current record
	print expre-lsit - print expressions
	print expr-list > file - print exp on file
	printf fmt, expr-list - format & print
	print fmt, exp-list > file - format & print on file

	o/p of print terminated with ORS

	system(cmd-line) - exec the cmd-line & return to exit status
	fflush([file]) - flush any buffer associated with open o/p file or pipe file
		if file name is missing then flush all open files & pipes
	
	print ... >> file - append o/p to file
	print ... || cmd - write on a pipe
	print ... |& cmd - send data toa a coprocessor or socket
	
	note - if 2 way socket result in non fatal error then use close() to create a new instance of cmd or socket. AWK not auto close pipes, sockets or coprocesses

printf statements formats"
	%a, %A - float number
	%c - a char
	%d, %i - integer
	%e, %E - float point number
	%f, %F - float point number
	%g, %G - use %e or %f conversion, which ever is shorter
	%o - unsigned octal no.
	%u - unsigned decimal no.
	%s - string
	%x, %X - unsigned hexa decimal number
	%% - no arg is converted
	Optional, additional parameter may lie between % & control letter
	count$ - positional specifier
	- - left justified within its field, sign for numeric conversion to -ve value
	space - for numeric conversion, prefix +ve value with a space, -ve value with minus sign
	+ - used before width modifier, sign for numeric conversion
	# - alternative form for certain control letters
		ex. $o for leading zero
			%x and %X supply a leading 0x or 0X for a non zero result.
			%e, %E, %f, %F - result will always contain decimal value.
			%g, %G - trailing 0 are not removed from the result
	0 - leading 0 act as flag indicating the o/p should be padded with zeros instead of space
		applies only to the numeric o/p format
		flag only had an effect when the field width is wider than the value to be printed
	width - field should be padded to this width. normally padded with spaces, with 0 flag, padded with 0
	.prec - a number that specifies the precision to use when printing.
		for %e, %E, %f & %F - specifies the no. of digits you want printed to the right of decimal point
		for %g & %G - specifies the max no. of significant digits
		for %d, %i, %o, %u, %x & %X - specifies min no. of digits to print.
		for %s - it specifies the max no. of char from the string that should be printed.

special file names:
	- - std i/p
	/dev/stdin - std i/p
	/dev/stdout - std o/p
	/dev/stderr - std error o/p
	/dev/fd/n - file associated with the open file descriptor
	print "you blew it!" > "/dev/stderr"

	following files used with |& coprocessor operator for creating TCP/IP n/w connections.
	/inet/tcp/lport/rhost/rport
	/inet4/tcp/lport/rhost/rport
	/inet6/tcp/lport/rhost/rport

	/inet/udp/lport/rhost/rport
	/inet4/udp/lport/rhost/rport
	/inet6/udp/lport/rhost/rport

Numeric Function:
	atan2(y,x)
	cos(expr)
	exp(expr)
	int(expr)
	log(expr)
	rand()
	sin(expr)
	sqrt(expr)
	srand([expr])

AWK supports in generating the transaltion of code, an o/p in .gmo files


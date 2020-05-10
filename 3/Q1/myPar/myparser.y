%include {
#ifndef YYSTYPE
#define YYSTYPE double
#endif
}

%name expr
// class definition
{
	// place any extra class members here
	virtual int yygettoken();
}
// constructor
{
	// place any extra initialisation code here
}

// destructor
{
	// place any extra cleanup code here
}

// place any declarations here

%token ADD SUB MUL DIV
%token LP RP

%left ADD SUB
%left MUL DIV
%right UMINUS

%%

lines	:	lines expr '\n'	{cout<<$2<<endl;}
		|	lines '\n'
		|
		;

expr	:	expr ADD expr	{ $$ = $1 + $3; }
		|	expr SUB expr	{ $$ = $1 - $3; }
		|	expr MUL expr	{ $$ = $1 * $3; }
		|	expr DIV expr	{ $$ = $1 / $3; }
		|	LP expr RP	{ $$ = $2; }
		|	SUB expr %prec UMINUS	{ $$ = -$2; }
		|	NUMBER {$$=$1;} //$$=$1 can be ignored
		;
		
NUMBER	:	'0'	{$$=0.0;}
		|	'1'	{$$=1.0;}  
		|	'2'	{$$=2.0;}
		|	'3'	{$$=3.0;}
		|	'4'	{$$=4.0;}
		|	'5'	{$$=5.0;}
		|	'6'	{$$=6.0;}
		|	'7'	{$$=7.0;}
		|	'8'	{$$=8.0;}
		|	'9'	{$$=9.0;}
		;
%%

int YYPARSERNAME::yygettoken()
{
	// place your token retrieving code here
	int t;
	t=getchar();
	if(t=='+')
		return ADD;
	else if(t=='-')
		return SUB;
	else if(t=='*')
		return MUL;
	else if(t=='/')
		return DIV;
	else if(t=='(')
		return LP;
	else if(t==')')
		return RP;
	else
		return t;
}

int main(void)
{
	int n = 1;
	expr parser;
	if (parser.yycreate()) {
		n = parser.yyparse();
	}
	return n;
}

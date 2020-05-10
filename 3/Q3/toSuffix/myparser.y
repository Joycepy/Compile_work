%{
/****************************************************************************
myparser.y
ParserWizard generated YACC file.

Date: 2019Äê10ÔÂ11ÈÕ
****************************************************************************/
%}

/////////////////////////////////////////////////////////////////////////////
// declarations section
%include{
#ifndef YYSTYPE
#define YYSTYPE char*
#endif
}
// parser name
%name myparser

// class definition
{
	// place any extra class members here
	virtual int yygettoken();
	string num;
	string str;
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
%token NUMBER ID
%token ADD SUB MUL DIV
%token LP RP

%left ADD SUB
%left MUL DIV
%right UMINUS

%%

lines	:	lines expr ';'	{cout<<$2<<endl;}
		|	lines ';'
		|
		;

expr	:	expr ADD expr	{ $$ = new char[50]; strcpy($$,$1); strcat($$,$3); strcat($$,"+");}
		|	expr SUB expr	{ $$ = new char[50]; strcpy($$,$1); strcat($$,$3); strcat($$,"-");}
		|	expr MUL expr	{ $$ = new char[50]; strcpy($$,$1); strcat($$,$3); strcat($$,"*");}
		|	expr DIV expr	{ $$ = new char[50]; strcpy($$,$1); strcat($$,$3); strcat($$,"/");}
		|	LP expr RP	{ $$ = new char[50]; strcpy($$,$2); }
		|	SUB expr %prec UMINUS	{ $$ = new char[50]; strcpy($$,"-"); strcat($$,$2);}
		|	NUMBER {$$ = new char[50]; strcpy($$,num.c_str());strcat($$," ");}
		|	ID	{$$ = new char[50]; strcpy($$,str.c_str());strcat($$," ");}
		;
/*		
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
*/
%%

/////////////////////////////////////////////////////////////////////////////
// programs section

int YYPARSERNAME::yygettoken()
{
	// place your token retrieving code here
	int t;
	while(1)
	{
		t=getchar();
		if(t==' '||t=='\t'||t=='\n');
		else if (isdigit(t)){
			string tmp="";
			while(isdigit(t)){
				tmp.append(1,t);
				t=getchar();
			}
			num=tmp;
			ungetc(t,stdin);
			return NUMBER;
		}
		else if((t>='a'&&t<='z')||(t>='A'&&t<='Z')||(t=='_'))
		{
			string tmp2="";
			while((t>='a'&&t<='z')||(t>='A'&&t<='Z')||(t=='_')||(isdigit(t)))
			{
				tmp2.append(1,t);
				t=getchar();
			}
			str=tmp2;
			ungetc(t,stdin);
			return ID;
		}
		else if(t=='+')
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
		else{
		return t;
		}
	}	
}

int main(void)
{
	int n = 1;
	myparser parser;
	if (parser.yycreate()) {
		n = parser.yyparse();
	}
	return n;
}


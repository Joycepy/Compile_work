%include {
#include<bits/stdc++.h>
using namespace std;

#ifndef YYSTYPE
#define YYSTYPE double
#endif
}

%name expr
// class definition
{
	// place any extra class members here
	virtual int yygettoken();
	double num;
	string str;
	map<string,float> tokenTable;
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

%right '='
%left ADD SUB
%left MUL DIV
%right UMINUS

%%

lines	:	lines expr ';'	{cout<<$2<<endl;}
		|	lines ';'
		|
		;

expr	:	expr ADD expr	{ $$ = $1 + $3; }
		|	expr SUB expr	{ $$ = $1 - $3; }
		|	expr MUL expr	{ $$ = $1 * $3; }
		|	expr DIV expr	{ $$ = $1 / $3; }
		|	LP expr RP	{ $$ = $2; }
		|	SUB expr %prec UMINUS	{ $$ = -$2; }
		|	NUMBER {$$=num;} 
		|	ID	{if(!tokenTable.count(str)) {$$=0;tokenTable.insert(pair<string,float>(str,0));} else $$=tokenTable[str]; }
		|	expr '=' expr	{tokenTable[str]=$3;$$=$3; cout<<setw(15)<<str<<setw(15)<<tokenTable[str]<<endl;}
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
int YYPARSERNAME::yygettoken()
{
	// place your token retrieving code here
	int t;
	while(1)
	{
		t=getchar();
		if(t==' '||t=='\t'||t=='\n');
		else if (isdigit(t)){
			int tmp=0;
			while(isdigit(t)){
				tmp=t+tmp*10-'0';
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
		else if(t=='=')
			return '=';
		else
			return t;
	}	
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

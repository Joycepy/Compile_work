#############################################################################
#                     U N R E G I S T E R E D   C O P Y
# 
# You are on day 23 of your 30 day trial period.
# 
# This file was produced by an UNREGISTERED COPY of Parser Generator. It is
# for evaluation purposes only. If you continue to use Parser Generator 30
# days after installation then you are required to purchase a license. For
# more information see the online help or go to the Bumble-Bee Software
# homepage at:
# 
# http://www.bumblebeesoftware.com
# 
# This notice must remain present in the file. It cannot be removed.
#############################################################################

#############################################################################
# myparser.v
# YACC verbose file generated from myparser.y.
# 
# Date: 10/11/19
# Time: 20:19:46
# 
# AYACC Version: 2.07
#############################################################################


##############################################################################
# Rules
##############################################################################

    0  $accept : lines $end

    1  lines : lines expr ';'
    2        | lines ';'
    3        |

    4  expr : expr ADD expr
    5       | expr SUB expr
    6       | expr MUL expr
    7       | expr DIV expr
    8       | LP expr RP
    9       | SUB expr
   10       | NUMBER
   11       | ID
   12       | expr '=' expr


##############################################################################
# States
##############################################################################

state 0
	$accept : . lines $end
	lines : .  (3)

	.  reduce 3

	lines  goto 1


state 1
	$accept : lines . $end  (0)
	lines : lines . expr ';'
	lines : lines . ';'

	$end  accept
	';'  shift 2
	NUMBER  shift 3
	ID  shift 4
	SUB  shift 5
	LP  shift 6

	expr  goto 7


state 2
	lines : lines ';' .  (2)

	.  reduce 2


state 3
	expr : NUMBER .  (10)

	.  reduce 10


state 4
	expr : ID .  (11)

	.  reduce 11


state 5
	expr : SUB . expr

	NUMBER  shift 3
	ID  shift 4
	SUB  shift 5
	LP  shift 6

	expr  goto 8


state 6
	expr : LP . expr RP

	NUMBER  shift 3
	ID  shift 4
	SUB  shift 5
	LP  shift 6

	expr  goto 9


state 7
	lines : lines expr . ';'
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr
	expr : expr . '=' expr

	';'  shift 10
	'='  shift 11
	ADD  shift 12
	SUB  shift 13
	MUL  shift 14
	DIV  shift 15


state 8
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr
	expr : SUB expr .  (9)
	expr : expr . '=' expr

	.  reduce 9


state 9
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr
	expr : LP expr . RP
	expr : expr . '=' expr

	'='  shift 11
	ADD  shift 12
	SUB  shift 13
	MUL  shift 14
	DIV  shift 15
	RP  shift 16


state 10
	lines : lines expr ';' .  (1)

	.  reduce 1


state 11
	expr : expr '=' . expr

	NUMBER  shift 3
	ID  shift 4
	SUB  shift 5
	LP  shift 6

	expr  goto 17


state 12
	expr : expr ADD . expr

	NUMBER  shift 3
	ID  shift 4
	SUB  shift 5
	LP  shift 6

	expr  goto 18


state 13
	expr : expr SUB . expr

	NUMBER  shift 3
	ID  shift 4
	SUB  shift 5
	LP  shift 6

	expr  goto 19


state 14
	expr : expr MUL . expr

	NUMBER  shift 3
	ID  shift 4
	SUB  shift 5
	LP  shift 6

	expr  goto 20


state 15
	expr : expr DIV . expr

	NUMBER  shift 3
	ID  shift 4
	SUB  shift 5
	LP  shift 6

	expr  goto 21


state 16
	expr : LP expr RP .  (8)

	.  reduce 8


state 17
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr
	expr : expr '=' expr .  (12)
	expr : expr . '=' expr

	'='  shift 11
	ADD  shift 12
	SUB  shift 13
	MUL  shift 14
	DIV  shift 15
	.  reduce 12


state 18
	expr : expr ADD expr .  (4)
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr
	expr : expr . '=' expr

	MUL  shift 14
	DIV  shift 15
	.  reduce 4


state 19
	expr : expr . ADD expr
	expr : expr SUB expr .  (5)
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr
	expr : expr . '=' expr

	MUL  shift 14
	DIV  shift 15
	.  reduce 5


state 20
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr MUL expr .  (6)
	expr : expr . MUL expr
	expr : expr . DIV expr
	expr : expr . '=' expr

	.  reduce 6


state 21
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr DIV expr .  (7)
	expr : expr . DIV expr
	expr : expr . '=' expr

	.  reduce 7


##############################################################################
# Summary
##############################################################################

13 token(s), 3 nonterminal(s)
13 grammar rule(s), 22 state(s)


##############################################################################
# End of File
##############################################################################

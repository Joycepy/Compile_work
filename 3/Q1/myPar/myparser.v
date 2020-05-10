#############################################################################
#                     U N R E G I S T E R E D   C O P Y
# 
# You are on day 22 of your 30 day trial period.
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
# Time: 10:20:05
# 
# AYACC Version: 2.07
#############################################################################


##############################################################################
# Rules
##############################################################################

    0  $accept : lines $end

    1  lines : lines expr '\n'
    2        | lines '\n'
    3        |

    4  expr : expr ADD expr
    5       | expr SUB expr
    6       | expr MUL expr
    7       | expr DIV expr
    8       | LP expr RP
    9       | SUB expr
   10       | NUMBER

   11  NUMBER : '0'
   12         | '1'
   13         | '2'
   14         | '3'
   15         | '4'
   16         | '5'
   17         | '6'
   18         | '7'
   19         | '8'
   20         | '9'


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
	lines : lines . expr '\n'
	lines : lines . '\n'

	$end  accept
	'\n'  shift 2
	'0'  shift 3
	'1'  shift 4
	'2'  shift 5
	'3'  shift 6
	'4'  shift 7
	'5'  shift 8
	'6'  shift 9
	'7'  shift 10
	'8'  shift 11
	'9'  shift 12
	SUB  shift 13
	LP  shift 14

	expr  goto 15
	NUMBER  goto 16


state 2
	lines : lines '\n' .  (2)

	.  reduce 2


state 3
	NUMBER : '0' .  (11)

	.  reduce 11


state 4
	NUMBER : '1' .  (12)

	.  reduce 12


state 5
	NUMBER : '2' .  (13)

	.  reduce 13


state 6
	NUMBER : '3' .  (14)

	.  reduce 14


state 7
	NUMBER : '4' .  (15)

	.  reduce 15


state 8
	NUMBER : '5' .  (16)

	.  reduce 16


state 9
	NUMBER : '6' .  (17)

	.  reduce 17


state 10
	NUMBER : '7' .  (18)

	.  reduce 18


state 11
	NUMBER : '8' .  (19)

	.  reduce 19


state 12
	NUMBER : '9' .  (20)

	.  reduce 20


state 13
	expr : SUB . expr

	'0'  shift 3
	'1'  shift 4
	'2'  shift 5
	'3'  shift 6
	'4'  shift 7
	'5'  shift 8
	'6'  shift 9
	'7'  shift 10
	'8'  shift 11
	'9'  shift 12
	SUB  shift 13
	LP  shift 14

	expr  goto 17
	NUMBER  goto 16


state 14
	expr : LP . expr RP

	'0'  shift 3
	'1'  shift 4
	'2'  shift 5
	'3'  shift 6
	'4'  shift 7
	'5'  shift 8
	'6'  shift 9
	'7'  shift 10
	'8'  shift 11
	'9'  shift 12
	SUB  shift 13
	LP  shift 14

	expr  goto 18
	NUMBER  goto 16


state 15
	lines : lines expr . '\n'
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr

	'\n'  shift 19
	ADD  shift 20
	SUB  shift 21
	MUL  shift 22
	DIV  shift 23


state 16
	expr : NUMBER .  (10)

	.  reduce 10


state 17
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr
	expr : SUB expr .  (9)

	.  reduce 9


state 18
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr
	expr : LP expr . RP

	ADD  shift 20
	SUB  shift 21
	MUL  shift 22
	DIV  shift 23
	RP  shift 24


state 19
	lines : lines expr '\n' .  (1)

	.  reduce 1


state 20
	expr : expr ADD . expr

	'0'  shift 3
	'1'  shift 4
	'2'  shift 5
	'3'  shift 6
	'4'  shift 7
	'5'  shift 8
	'6'  shift 9
	'7'  shift 10
	'8'  shift 11
	'9'  shift 12
	SUB  shift 13
	LP  shift 14

	expr  goto 25
	NUMBER  goto 16


state 21
	expr : expr SUB . expr

	'0'  shift 3
	'1'  shift 4
	'2'  shift 5
	'3'  shift 6
	'4'  shift 7
	'5'  shift 8
	'6'  shift 9
	'7'  shift 10
	'8'  shift 11
	'9'  shift 12
	SUB  shift 13
	LP  shift 14

	expr  goto 26
	NUMBER  goto 16


state 22
	expr : expr MUL . expr

	'0'  shift 3
	'1'  shift 4
	'2'  shift 5
	'3'  shift 6
	'4'  shift 7
	'5'  shift 8
	'6'  shift 9
	'7'  shift 10
	'8'  shift 11
	'9'  shift 12
	SUB  shift 13
	LP  shift 14

	expr  goto 27
	NUMBER  goto 16


state 23
	expr : expr DIV . expr

	'0'  shift 3
	'1'  shift 4
	'2'  shift 5
	'3'  shift 6
	'4'  shift 7
	'5'  shift 8
	'6'  shift 9
	'7'  shift 10
	'8'  shift 11
	'9'  shift 12
	SUB  shift 13
	LP  shift 14

	expr  goto 28
	NUMBER  goto 16


state 24
	expr : LP expr RP .  (8)

	.  reduce 8


state 25
	expr : expr ADD expr .  (4)
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr

	MUL  shift 22
	DIV  shift 23
	.  reduce 4


state 26
	expr : expr . ADD expr
	expr : expr SUB expr .  (5)
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr . DIV expr

	MUL  shift 22
	DIV  shift 23
	.  reduce 5


state 27
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr MUL expr .  (6)
	expr : expr . MUL expr
	expr : expr . DIV expr

	.  reduce 6


state 28
	expr : expr . ADD expr
	expr : expr . SUB expr
	expr : expr . MUL expr
	expr : expr DIV expr .  (7)
	expr : expr . DIV expr

	.  reduce 7


##############################################################################
# Summary
##############################################################################

20 token(s), 4 nonterminal(s)
21 grammar rule(s), 29 state(s)


##############################################################################
# End of File
##############################################################################

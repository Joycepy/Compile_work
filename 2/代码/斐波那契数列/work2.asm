.486 ;使用486处理器
.model flat,stdcall 
include \masm32\include\msvcrt.inc
includelib \masm32\lib\msvcrt.lib

.data 
result0 dd 0;存储最终结果的倒数第一个 
result1 dd 1;存储最终结果的倒数第二个
input dd ?;输入的斐波那契数列的个数
type0 db '%d',0
data1 db '请输入斐波那契数列个数: ',0
data2 db '结果为: ',0
data3 db ' ',0

.code 
start:
invoke crt_printf,addr data1
invoke crt_scanf,addr type0,addr input
invoke crt_printf,addr data2
mov ecx,1

$1:
mov eax,result0
mov ebx,result1
mov result0,ebx
add ebx,eax
mov result1,ebx

inc ecx
cmp ecx,input
jL $1;小于则跳转

invoke crt_printf,addr type0,result1

INVOKE crt__getch
ret

END start
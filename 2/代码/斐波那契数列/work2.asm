.486 ;ʹ��486������
.model flat,stdcall 
include \masm32\include\msvcrt.inc
includelib \masm32\lib\msvcrt.lib

.data 
result0 dd 0;�洢���ս���ĵ�����һ�� 
result1 dd 1;�洢���ս���ĵ����ڶ���
input dd ?;�����쳲��������еĸ���
type0 db '%d',0
data1 db '������쳲��������и���: ',0
data2 db '���Ϊ: ',0
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
jL $1;С������ת

invoke crt_printf,addr type0,result1

INVOKE crt__getch
ret

END start
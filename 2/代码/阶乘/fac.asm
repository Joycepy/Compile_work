.486 ;ʹ��486������
.model flat,stdcall 
include \masm32\include\msvcrt.inc
includelib \masm32\lib\msvcrt.lib

.data 
result dd 1;��������dd����˫�����ͱ�����ռ4���ֽ�
tmp dd 2
inputdata dd ?;����Ľ׳˵����ֵ
strtype db '%d',0;0��Ϊ�ַ��������ı�ǣ��������û���Զ�����Ĺ��ܡ�
data1 db '������׳����ֵ: ',0;db��b��byte����д��ռ1���ֽ�
data2 db '�׳˽��Ϊ: ',0

.code 
start:

invoke crt_printf,addr data1;��ӡ�ַ���
invoke crt_scanf,addr strtype,addr inputdata;strtype��ʾ����ĸ�ʽ��inputdata�洢�����ֵ
push eax;�����ֳ�
push ecx
mov eax,result 
mov ecx,result
 
cmp ecx,inputdata
jNB $2

mov ecx,tmp 
$1:
mul ecx;�˻�����AX��
inc ecx
cmp ecx,inputdata
jNG $1;����������ת
$2:
mov result,eax
pop ecx;��ԭ�ֳ�
pop eax


invoke crt_printf,addr data2 
invoke crt_printf,addr strtype,result
INVOKE crt__getch
ret

END start
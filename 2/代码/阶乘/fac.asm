.486 ;使用486处理器
.model flat,stdcall 
include \masm32\include\msvcrt.inc
includelib \masm32\lib\msvcrt.lib

.data 
result dd 1;计算结果，dd定义双字类型变量，占4个字节
tmp dd 2
inputdata dd ?;输入的阶乘的最大值
strtype db '%d',0;0作为字符串结束的标记，编译软件没有自动加零的功能。
data1 db '请输入阶乘最大值: ',0;db的b是byte的缩写，占1个字节
data2 db '阶乘结果为: ',0

.code 
start:

invoke crt_printf,addr data1;打印字符串
invoke crt_scanf,addr strtype,addr inputdata;strtype表示输入的格式，inputdata存储输入的值
push eax;保存现场
push ecx
mov eax,result 
mov ecx,result
 
cmp ecx,inputdata
jNB $2

mov ecx,tmp 
$1:
mul ecx;乘积存于AX中
inc ecx
cmp ecx,inputdata
jNG $1;不大于则跳转
$2:
mov result,eax
pop ecx;还原现场
pop eax


invoke crt_printf,addr data2 
invoke crt_printf,addr strtype,result
INVOKE crt__getch
ret

END start
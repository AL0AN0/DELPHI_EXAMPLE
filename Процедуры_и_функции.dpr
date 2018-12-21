 program Процедуры_и_функции;

{$APPTYPE CONSOLE}

uses
 System.SysUtils, windows;

Type
 aos = array of string;
 aoi = array of integer;

var s:string;
 n,k,i:integer;
 a:aos;
 b:aoi;
 aver:single;
 t:boolean;

procedure wordc (var s:string; var n,k:integer);
var i,j:integer;
begin
for I := 1 to n do
 for j := i+1 to n do
 if (s[j]=chr(32)) and (s[j+1]=chr(32)) then delete(s,j,1);
k:=0;
for I := 1 to n do
 if s[i]=chr(32) then k:=k+1;
k:=k+1;
end;

procedure strtoarr (var s:string; var a:aos);
var i,Li,j,l:integer;
begin
l:=length(s);
li:=0;
j:=0;
for i := 1 to l do
 if s[i]=chr(32) then
 begin
 a[j]:='';
 a[j]:=copy(s,Li,i-li);
 Li:=i+1;
 j:=j+1;
 end;
a[j]:=copy(s,li,l-Li+1);
end;

Procedure sortW (var a:aos; var b:aoi; var k:integer);
var i,j:integer;
 s:string;
begin
for I := 0 to k-1 do
 for j := 0 to k-i-2 do
 if length(a[j])>length(a[j+1]) then
 begin
 s:=a[j];
 a[j]:=a[j+1];
 a[j+1]:=s;
 end;
for I := 0 to k-1 do
 b[i]:=length(a[i]);
end;

Function Fmin (var b:aoi; k:integer):integer;
var i:integer;
begin
result:=0;
for i := 0 to k-1 do
 if b[i]<b[result] then result:=i;
end;

Function Fmax (var b:aoi; k:integer):integer;
var i:integer;
begin
result:=0;
for i := k-1 downto 0 do
 if b[i]>b[result] then result:=i;
end;

Function Palindrom (var s:string):boolean;
var i,l:integer;
begin
result:=true;
l:=length(s);
for I := 1 to l do
 if s[i]<>s[l+1-i] then
 begin
 result:=false;
 break;
 end;
end;

begin
setconsolecp(1251);
setconsoleoutputcp(1251);
writeln('Введите строку: ');
readln(s);
s:=lowercase(s);
s:=trim(s);
n:=length(s);
wordc(s,n,k);
writeln(k);
readln;
setlength(a,k);
setlength(b,k);
strtoarr(s,a);
aver:=0;
writeln('Слов в строке: ', k);
for i := 0 to k-1 do
 begin
 a[i]:=trim(a[i]);
 b[i]:=length(a[i]);
 //write(b[i]);
 //writeln(a[i]);
 aver:=aver+b[i];
 end;
aver:=aver/k;
aver:=round(aver*10)/10;
readln;
writeln('Самое короткое слово №',Fmin(b,k)+1,' (',a[Fmin(b,k)],')');
writeln;
writeln('Самое длинное слово №',Fmax(b,k)+1,' (',a[Fmax(b,k)],')');
writeln;
writeln('Средняя длина слова равна ', aver:3:1);
readln;
SortW(a,b,k);
for i := 0 to k-1 do
 writeln(a[i]);
readln;
t:=false;
write('Палиндромы ');
for i := 0 to k-1 do
 if Palindrom(a[i]) then
 begin
 writeln;
 t:=true;
 write(a[i]);
 end;
if t=false then write('в строке не обнаружены.');
readln;
end.

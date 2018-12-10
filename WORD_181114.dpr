program WORD_181114;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, windows;


Type
 aos = array of string;
 aoi = array of integer;

var
 s:string;
 n,k,i:integer;

 a:aos;
 b:aoi;
 aver:single;
 t:boolean;


// по смыслу должна сжимать двойные пробелы
// и выдавать в переменную k число пробелов (или слов?)
procedure wordc (var s:string; var n,k:integer);

var i,j:integer;



begin

 for i := 1 to n do
   for j := i+1 to n do
     if (s[j]=chr(32)) and (s[j+1]=chr(32)) then
        delete(s,j,1);
k:=0;

 for i := 1 to n do
   if s[i]=chr(32) then k:=k+1;

k:=k+1;

end;





// по смыслу должна вырезать слова и помещать их в строковый массив
procedure strtoarr (var s:string; var a:aos);

var
i,Li,j,L:integer;

begin

 L:=length(s);
 Li:=0;
 j:=0;

 for i := 1 to L do
   if s[i]=chr(32) then
    begin
     a[j]:='';
     a[j]:=copy(s,Li,i-Li);
     Li:=i+1;
     j:=j+1;
    end;

a[j]:=copy(s,Li,L-Li+1);      // последнее слово

end;



// пузырьковый метод сортировки + дополнительно пишет длины слов в отдельный массив
Procedure sortW (var a:aos; var b:aoi; var k:integer);

var
 i,j:integer;
 s:string;

begin
  for i := 0 to k-1 do
    for j := 0 to k-i-2 do
      if length(a[j])>length(a[j+1]) then
       begin
        s:=a[j];
        a[j]:=a[j+1];
        a[j+1]:=s;
       end;

  for i := 0 to k-1 do
   b[i]:=length(a[i]);

end;


Function findw ( var s: string; w:string): boolean;

var
h:aos;
i,n,k,x:integer;

begin
   result:=false;
   s:=lowercase(s);
   s:=trim(s);
   n:=length(s);
   wordc(s,n,k);
   setlength(h,k);
   strtoarr(s,h);

   x:=0;
   for i := 0  to k-1 do
     begin
       if w = h[i] then
         x:=x+1;
     end;

  if x>1 then result:=true;

end;










Function Fmin (var b:aoi; k:integer):integer;

var
 i:integer;

begin

 result:=0;

 for i := 0 to k-1 do
   if b[i]<b[result] then
     result:=i;

end;




Function Fmax (var b:aoi; k:integer):integer;

var
 i:integer;

begin

 result:=0;

 for i := k-1 downto 0 do
   if b[i] > b[result] then
      result:=i;

end;




Function Palindrom (var s:string):boolean;

var
  i,L:integer;

begin

 result:=true;
 L:=length(s);

  for i := 1 to l do
   if s[i]<>s[l+1-i] then
     begin
     result:=false;
     break;
     end;
end;



begin

//setconsolecp(1251);
//setconsoleoutputcp(1251);

writeln('¬ведите строку: ');
readln(s);

s:=lowercase(s);
s:=trim(s);
n:=length(s);

wordc(s,n,k);
writeln(k); // выводит число пробелов (или слов?)

readln;
setlength(a,k);
setlength(b,k);

strtoarr(s,a);

writeln('—лов в строке: ', k);

aver:=0;
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
writeln('—амое короткое слово є',Fmin(b,k)+1,' (',a[Fmin(b,k)],')');
writeln;
writeln('—амое длинное слово є',Fmax(b,k)+1,' (',a[Fmax(b,k)],')');
writeln;
writeln('—редн€€ длина слова равна ', aver:3:1);


readln;
SortW(a,b,k);
for i := 0 to k-1 do
 writeln(a[i]);
readln;
t:=false;

write('ѕалиндромы ');
   for i := 0 to k-1 do
    if Palindrom(a[i]) then
       begin
          writeln;
          t:=true; // флаг означающий что найден хоть один палиндром
          write(a[i]);
       end;

if t=false then write('в строке не обнаружены.');

if findw(s,a[0]) then write('ѕервое слово встречаетс€ более 1 раза');


readln; // чтобы "завесить" консоль и прочитать все что в ней записано
end.

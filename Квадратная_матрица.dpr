program Квадратная_матрица;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;


type
TDynMatrix = array of array of Integer;

var
a:TDynMatrix;
i,j,b : Integer;
L,H: Integer;


function numbern (a:TDynMatrix; n:Integer): Integer;

var
i,j,res:integer;

begin

res:=0;
  for i:= low(a)  to high(a) do
  begin
    writeln;
    for j:=0  to H-1 do

      begin

       if a[i][j] = n then
       res:=res+1;
      end;

  end;



result:=res;
end;









 // Основная программа

begin

write ('L = '); readln(L);
write ('H = '); readln(H);

setlength(a,L,H);
randomize;
for i:=0  to L-1 do
  begin
    writeln;
    for j:=0  to H-1 do

      begin
        a[i][j]:=random(10);
        write(a[i][j]:3);
      end;

  end;

b:=random(10);

write ('Элемент ', b , ' встречается ', numbern(a,5), ' раз');


readln;
end.

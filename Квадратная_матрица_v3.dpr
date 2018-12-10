program Квадратная_матрица_v3;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
 TDynMatrix = array of array of Integer;
 TDynMassive = array of Integer;

var
i,j: Integer;
m1:TDynMatrix;
l,h:Integer;
m2,m3: TdynMassive;
k,s:Integer;


 Function generate_matrix_m1 (out l:Integer; out h:Integer):TDynMatrix;

 var
 i,j:Integer;
 m1:TDynMatrix;

 begin


randomize;
write ('l = '); readln(l);
write ('h = '); readln(h);
setlength(m1,l,h);
// writeln; write('l = ',l,'  '); write('h = ',h);


for i := 0 to l-1 do
begin
  writeln;

 for j :=0 to h-1 do
 begin
   m1[i][j]:=random(100);
   write(m1[i][j]:3);
 end;
 end;
 result:= m1;
 end;


 Function check_matrix (m1:TdynMatrix): TDynMassive;

 var
i,j: Integer;
m2: TdynMassive;
k:Integer;


   begin
    k:=0;
  setlength(m2,l*h);
for i := 0 to l-1 do
 for j :=0 to h-1 do
 begin
   if (m1[i][j] mod 2 = 0)  then
   begin
   m2[k]:=m1[i][j];
   k:=k+1;
   end;
 end;

result:=m2;
   end;


Procedure print_massive(m2:TDynMassive);
  var
k:Integer;

   begin
   k:=0;
  for k := low(m2) to high(m2) do
  if m2[k] <> 0  then
 begin
  write (m2[k]:3);
 end;

   end;


 Procedure sort_massive (m2:TDynMassive);
  var
i,j: Integer;
s:Integer;

 begin
 for i := 0 to high(m2) do
   for j := 0 to high(m2)-i-1  do
    begin
     if m2[j] > m2[j+1] then
     begin
       s:=m2[j];
       m2[j]:=m2[j+1];
       m2[j+1]:=s;
     end;
   end;

 end;

 Function print_and_change(l:Integer; h:Integer; m2:TDynMassive): TDynMassive;

   var
i,j: Integer;
k:Integer;
m3:TDynMassive;
  begin
  i:=0;
  j:=0;
  k:=0;

 setlength(m3,l*h);

  for i := 0 to high(m2) do
  if (m2[i]<> 0) and (m2[i]<>m2[i+1]) then
   begin
      m3[k]:=m2[i];
      write (m3[k]:3);
      k:=k+1;
   end;
   result:=m3;
  end;







 begin       //Основная программа


   m1:=generate_matrix_m1(l,h);
  // writeln; write('gen l = ',l,'  ');  write('gen h = ',h);

  m2:= check_matrix(m1);
 writeln;
 writeln;
  print_massive(m2);
  sort_massive (m2);


 writeln;
 writeln;

  m3:= print_and_change(l,h,m2);



readln;
end.

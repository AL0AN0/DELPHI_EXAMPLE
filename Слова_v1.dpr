program Слова_v1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

  var
  str:string;
  aow: array of string;
  k:Integer;
  n:Integer;

  //Считает кол-во слов
  Function number_of_words(var str:string):Integer;
  var
  i,j:Integer;
  l:Integer;
   k:Integer;
  begin
  lowercase(str);
  str:= trim(str);
  // writeln; write('xxx_', str, '_xxx');

  l:=length(str);
  for i:=1 to l do
   for j := i+1 to l do
      begin
        if (str[i]=chr(32)) and (str[i+1]=chr(32)) then
         delete(str,i,1);
      end;

  l:=length(str);
   k:=1;
   for i := 1 to l do
    begin
      if str[i]=chr(32) then
      k:=k+1;
    end;
    result:=k;
    end;


    // Преобразование строки в массив слов
    Procedure arr_of_words (var str:string; var aos :array of string);

    var
    i:Integer;
    l:Integer;
    w:Integer;
    j:Integer;

    begin
    w:=0;
    j:=0;
     l:=length(str);
     for i := 1 to l do
      if str[i]=chr(32) then
       begin
        aos[j]:=copy(str,w,i-w);
        write(aos[j],'  ');
        w:=i+1;
        j:=j+1;
        end;
        aos[j]:=copy(str,w,l-w+1);
        write(aos[j]);
    end;









   // Function lngst_word (

begin  //Основная программа

  write('Введите строку '); readln(str);
  writeln;
  k:=number_of_words(str);  //Считает кол-во слов
  write('Количество слов: ',k );

  writeln;
  setlength(aow,k);
  arr_of_words(str,aow);   // Преобразование строки в массив слов

 readln;
end.

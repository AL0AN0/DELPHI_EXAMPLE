program Слова_v1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Classes;
type
ArrOfString = array of string;
  var
  str:string;
  aow: array of string;
  k:Integer;
  n:Integer;
  f1,f2:File;
  TSL1,TSL2: TStringList;







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


    // Открытие файла по пути str
  Function open_file (str_patch: string):TStringList;
  var F : File;
      stemp: string;
      slist: TStringList;
   begin
    AssignFile (F,str_patch);
    Reset(F);
    while SeekEof(F)=False do
     begin
       ReadLn(F,Stemp);
       slist.Add(Stemp);
     end;

    result:= slist;
   end;





  // Обработка списка строк - удаляет из списка строки с заданным словом
  Function change_stringlist (wrd: string; slist:TStringList):TStringList;
  var
  I,J,k:Integer;
  slistTMP: TStringList;
  strx: string;
  arrwrd: array of string;
  flg:boolean;
  begin
     flg:=false;
     for I := 0 to slist.count do
         begin
         strx:=slist[I];
         k:=number_of_words(strx);  //Считает кол-во слов
         setlength(arrwrd,k);
         arr_of_words(strx,arrwrd);   // Преобразование строки в массив слов

        for J := 0 to k do         // Ищет нужную строку
          if arrwrd[j]=wrd then
           flg:=true;
         end;
         if NOT flg then slistTMP.Add(slist[I]);   // Добавляет нужную строку во временный список строк
         result:=slistTMP;
  end;





   Procedure create_and_write_textfile (slist:TStringList;str_patch:string);
     var
     F2:File;
     I:Integer;
     begin
       AssignFile (F2,str_patch);
       Rewrite(F2);

        Append(F2);                           //Открывает файл на добавление
        for I := 0 to slist.count do
            WriteLn(slist[I]);                //Заполняет буфер строками
        Flush(F2);                            //Сброс строк избуфера в файл
        Closefile(f2);
     end;



    Procedure write_file_to_console (str_patch:string);
    var F: File;
    stemp:string;
    begin
    AssignFile (F,str_patch);
    while SeekEof(F)=False do
     begin
       ReadLn(F,stemp);
       WriteLn(stemp);
     end;

    end







begin  //Основная программа

 TSL1:= open_file('Slova_1.txt');

 write('Введите строку '); readln(str);
  writeln;
  TSL2:= change_stringlist(str);

  create_and_write_textfile(TSL2, 'Slova_2.txt');

  write_file_to_console('Slova_1.txt');
  writeln;
  write_file_to_console('Slova_2.txt');



readln;
end.









 {
  write('Введите строку '); readln(str);
  writeln;
  k:=number_of_words(str);  //Считает кол-во слов
  write('Количество слов: ',k );

  writeln;
  setlength(aow,k);
  arr_of_words(str,aow);   // Преобразование строки в массив слов

}

program �����_v1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,Classes;
type
ArrOfString = array of string;
  var
  str:string;
  aow: array of string;
  k:Integer;
  n:Integer;
  f1,f2:File;
  TSL1,TSL2: TStringList;


  //������� ���-�� ����
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


    // �������������� ������ � ������ ����
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


    // �������� ����� �� ���� str
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





  // ��������� ������ ����� - ������� �� ������ ������ � �������� ������
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
         k:=number_of_words(strx);  //������� ���-�� ����
         setlength(arrwrd,k);
         arr_of_words(strx,arrwrd);   // �������������� ������ � ������ ����

        for J := 0 to k do         // ���� ������ ������
          if arrwrd[j]=wrd then
           flg:=true;
         end;
         if NOT flg then slistTMP.Add(slist[I]);   // ��������� ������ ������ �� ��������� ������ �����
         result:=slistTMP;
  end;





   Procedure create_and_write_textfile (slist:TStringList;str_patch:string);
     var
     F2:File;
     I:Integer;
     begin
       AssignFile (F2,str_patch);
       Rewrite(F2);

        Append(F2);                           //��������� ���� �� ����������
        for I := 0 to slist.count do
            WriteLn(slist[I]);                //��������� ����� ��������
        Flush(F2);                            //����� ����� �������� � ����
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







begin  //�������� ���������

 TSL1:= open_file('Slova_1.txt');

 write('������� ������ '); readln(str);
  writeln;
  TSL2:= change_stringlist(str);

  create_and_write_textfile(TSL2, 'Slova_2.txt');

  write_file_to_console('Slova_1.txt');
  writeln;
  write_file_to_console('Slova_2.txt');



readln;
end.









 {
  write('������� ������ '); readln(str);
  writeln;
  k:=number_of_words(str);  //������� ���-�� ����
  write('���������� ����: ',k );

  writeln;
  setlength(aow,k);
  arr_of_words(str,aow);   // �������������� ������ � ������ ����

}

program �����_v1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Classes, SysUtils;
type
ArrOfString = array of string;
  var
  str:string;
  aow: array of string;
  k:Integer;
  n:Integer;

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
  Function open_file (str: string):TStringList;
  var F : File;
      stemp: string;
      slist: TStringList;
   begin
    Assign (F,str);

    while SeekEof(f)=False do
     begin
       ReadLn(F,Stemp);
       slist.Add(Stemp);
     end;

    result:= slist;
   end;






   // Function lngst_word (

begin  //�������� ���������

  write('������� ������ '); readln(str);
  writeln;
  k:=number_of_words(str);  //������� ���-�� ����
  write('���������� ����: ',k );

  writeln;
  setlength(aow,k);
  arr_of_words(str,aow);   // �������������� ������ � ������ ����

 readln;
end.

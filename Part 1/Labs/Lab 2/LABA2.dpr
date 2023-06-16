Program LABA2;
{��������� ���� ��� ������� 106 ����������� �����, ������� �������� ������������
 ��� � ����������, ��� � � �������� �������� ���������}

{$APPTYPE CONSOLE}

Var
  DecStr,BinStr:string;
  Error:integer;
  // DecStr - �������� �������� ������
  // Error - �������� �������� ������
  // BinStr - ����� ����� � �������� �������}

  Num,NumSaved:integer;
  // Num - �������� �����
  // NumSaved - ������ �������� ������������� ��������
 
  I,CountDec,CountBin:integer;
  // I - ������� � ������ �1 - �8
  // CountDec - ������ ����� � ���������� �������
  // CountBin - ������ ����� � �������� ������� 

  Binary:array[1..20] of integer;
  Decimal:array[1..6] of integer;
  PalDec:array[1..6] of integer;
  PalBin:array[1..20] of integer;
  // Binary - ����� ����� � �������� ������� 
  // Decimal - ����� ����� � ���������� �������
  // PalDec - ��������������� ����� � ���������� �������
  // PalBin - ��������������� ����� � �������� �������

  FlagDec,FlagBin:boolean;
  // FlagDec - �������� ����� �� ��������� � ���������� �������
  // FlagBin - �������� ����� �� ��������� � �������� �������

begin

 CountBin:=0;
 CountDec:=0;
 
  // �������� ��������� ������������� �����
  repeat
    writeln('Enter a natural number less than 1000000.');
    readln(DecStr);
    val(DecStr,Num,Error);
    if (Num>1000000) or (Error<>0) or (Num<=0) then
      writeln('Incorrect data')
  until (Num<1000000) and (Error=0) and (Num>0);

  // ��������� ��������� ������������� �����
  NumSaved:=Num;

  // ���������� ������� ��������� ����� �����������
  FlagDec:=true;
  FlagBin:=true;

  {������ ����� �1. ��������� ������ ����� � ���������� �������}
  repeat
    Num:=Num div 10;
    CountDec:=CountDec+1;
  until Num=0;
  // ����� ����� �1.

  // ���������� Num �������� ��������
  Num:=NumSaved;

  {������ ����� �2 �� I. I ������ ���� �������� �� 1 �� CountDec � ����� 1.
   ���������� ����� ����� � ������ � ������ �������}
  for I:=1 to CountDec do
  begin
    Decimal[I]:=Num mod 10;
    Num:=Num div 10;
  end;
  // ����� ����� �2

  // ���������� Num �������� ��������
  Num:=NumSaved;

  {������ ����� �3 �� I. I ������ ���� �������� �� CountDec �� 1 � ����� 1.
   ���������� ����� ����� � ������ � �������� �������}
  for I:=CountDec downto 1 do
    PalDec[I]:=Decimal[CountDec-I+1];
  // ����� ����� �3

  {������ ����� �4 �� I. I ������ ���� �������� �� 1 �� CountDec � ����� 1.
   �������� ����� �� �������� � ���������� �������}
  for I:=1 to CountDec div 2 do
    if PalDec[I]<>Decimal[I] then
      FlagDec:=false;
  // ����� ����� �4

  {����� ��������� � ���, �������� �� ����� ����������� � ���������� �������}
  if FlagDec=false then
    writeln('Number ',NumSaved,' is not a decimal palindrome.')
  else
    writeln('Number ',NumSaved,' is a decimal palindrome');

  {������ ����� �5. ��������� ������ ����� � �������� �������}
  repeat
    Num:=Num div 2;
    CountBin:=CountBin+1;
  until Num=0;
  // ����� ����� �5

  // ���������� Num ����������� ��������
  Num:=NumSaved;

  {������ ����� �6 �� I. I ������ ���� �������� �� 1 �� CountBin � ����� 1.
   ������� ����� � �������� �������. ����� �������� � ������ � ������ �������}
  for I:=1 to CountBin do
  Begin
    if Num mod 2=0 then
    begin
      Binary[I]:=0;
      BinStr:='0'+BinStr;
    end
    else
    begin
      Binary[I]:=1;
      BinStr:='1'+BinStr;
    end;
    Num:=Num div 2;
  end;
  // ����� ����� �6


  // ���������� Num ����������� ��������
  Num:=NumSaved;

  {������ ����� �7 �� I. I ������ ���� �������� �� CountBin �� 1 � ����� 1.
   ���� ����� � �������� ������� � ������ � �������� �������}
  for I:=CountBin downto 1 do
    PalBin[I]:=Binary[CountBin-I+1];
  // ����� ����� �7

  {������ ����� �8 �� I. I ������ ���� �������� �� 1 �� CountBin � ����� 1.
   �������� ����� �� ��������� � �������� �������}
  for I:=1 to CountBin div 2 do
    if PalBin[I]<>Binary[I] then
      FlagBin:=false;
  // ����� ����� �8

  {����� ��������� � ���, �������� �� ����� ����������� � �������� �������}
  if FlagBin=false then
    writeln('Number ',NumSaved,' is equal to ',BinStr,' in binary system and is not a palindrome')
  else
    writeln('Number ',NumSaved,' is equal to ',BinStr,' in binary system and is a palindrome');

  {����� ��������� � ���, ��� ����� �������� ����������� � ����� ��������}
  if (FlagDec=true) and (FlagBin=true) then
    writeln(NumSaved,' is a palindrome in both systems');

  readln;
end.


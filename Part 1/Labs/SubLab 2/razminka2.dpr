{�������� ����� ���� ���� ������: ������� � �������. ������� �������� �� ����
 ���� ������� ������ ���� ���� �� �������, � ������� ������� �� ������� �
 �������. ������� ����� �������� (������� � �������) ����� ����� K ������
 �������, ���� ���������� ���� N ������� ��������.
 ������� ����������� ����� �������� �� ������� ����� �� ����� �������� ��
 ���������� ������.
 �������� ����������� ����� ����� ������� ��������.}
Program razminka2;

{$APPTYPE CONSOLE}

Var
  Flag,Flag1:boolean;
  K,N,Red,Green,GreenSave,RedSave:integer;
  {Flag - �������� ������������ ����������. � ������ ������������ ���������
   �������� false � ���������� ������������
   K - ����� ������
   N - ������� ����� ������. � ������ ���������������� ���������� ����������
   ������� ��������� ���� � ����������� �������
   Red - ����� ������� ��������, ����� �������� �� ������� �����
   Green - ����� ������� �������� �� ������� ����
   GreenSave - ����� ������� �������� �� ���������� �����. ������������ ���
   ������ ����� ������� ��������
   RedSave - ����� ������� �������� �� ���������� ����
   ������������ ��� ������ ����� ������� ��������}

  RedTemp1,GreenTemp1,RedTemp2,GreenTemp2,GreenTemp:integer;
  {RedTemp1 - ����� ������� �������� �� �������� ������
   GreenTemp1 - ����� ������� �������� �� �������� ������
   RedTemp2 - ����� ������� �������� �� ������ ������
   GreenTemp2 - ����� ������� �������� �� �������� ������
   GreenTemp - ������ ��������� ����� ������� ��������}

  Error:integer;
  KStr,RedStr,GreenStr:string;
  {Error - �������� �������� ������
   KStr - �������� ����� ������
   RedStr - �������� ����� ������� ��������
   GreenStr - �������� ����� ������� ��������}

begin

  //���� � �������� ����� ������
  repeat
  writeln('Enter the number of steps');
  readln(KStr);
  val(KStr,K,Error);
  if (Error<>0) or (K<0) then
    writeln('Incorrect data');
  until (Error=0) and (K>=0);

  //���� � �������� ����� ������� ��������
  repeat
  writeln('Enter the number of red bacteria');
  readln(RedStr);
  val(RedStr,Red,Error);
  if (Error<>0) or (Red<0) then
    writeln('Incorrect data');
  until (Error=0) and (Red>=0);

  //���� � �������� ����� ������� ��������
  repeat
  Flag1:=true;
  writeln('Enter the number of green bacteria');
  readln(GreenStr);
  val(GreenStr,Green,Error);
  if (Green=Red) and (Red=0) then
  begin
    writeln('Incorrect data');
    Flag1:=false;
  end;
  if (Error<>0) or (Green<0) then
    writeln('Incorrect data');
  until (Error=0) and (Green>=0) and (Flag1=true);

  writeln;
  GreenTemp:=Green;
  GreenSave:=0;
  RedSave:=0;
  RedTemp1:=Green;
  GreenTemp1:=Red+Green;
  RedTemp2:=Red;
  GreenTemp2:=Green;
  Flag:=true;
  N:=0;

  //������ ������� ������� �������, ��������� ����� ������� �� ���������� ����
  writeln('First variant:');

  {������ ����� �1. ���� �����������, ���� ������� ���������� ������ �� ������
   ������ ����������, ���� �� ���������� ������������. N ���������� �� 0 �� K �
   ����� 1}
  while (Flag=true) and (K>=N) do
  begin
    RedSave:=Red;     //��������� ����� ������� ��������.
    GreenSave:=Green; //��������� �������� ������� ��������, �.�. ����� ��� ����������� � �������.
    Green:=Green+Red; //� ������ ���������� �������, ������� ������������ � �������.
    Red:=GreenSave;   //������������ ����� ������� � ����� ������� �� ���������� ����.
    N:=N+1;           //����������� ����� ������ �� 1.

    {���� ��������� ������, � ��������� �� ����� ��������� ����� ��������
     ���������, �� ��������� ��������� � ������������� ���������� ����������,
     ��������� ���������� ���� � ���������� �������� �� ���� �����.}
    if GreenSave>Green then
    begin
      writeln('Impossible to count. Last valid step number: ',N-1);
      Flag:=false;
    end;
  end;
  //����� ����� �1.

  writeln('Red bacteria: ',RedSave,'. Green bacteria: ',GreenSave);
  writeln;

  {������ ������� �������� �������, ��������� ����� �������� 2 ����� �����.
   ����� ������ ���������� ����� 2, �.�. ���������� ��
   ��������� ��� ������ ����� �������� 2 ����� �����.}
  writeln('Second variant:');
  Green:=GreenTemp; //���������� ���������� ����� ������� ��������
  Flag:=true;       //���������� ���������� ��������
  N:=2;             //���������� �������� ��� ����� ������ >= 2

  {���� ����� ������ ������ 2, ��������� ������� �� ������ � ����������
   ����������� �� �����, ���� ������������ �� ������ ���������� ������.}
  if K<N then
  begin
    writeln('Incorrect data. Enter more than one step');
    writeln('You entered: ');
    writeln('Number of steps: ',K);
    Flag:=false;
  end;

  {������ ����� �2. ���� �����������, ���� ������� ���������� ������ �� ������
   ������ ����������, ���� �� ���������� ������������.}
  while (Flag=true) and (K>=N) do
  begin
    Red:=RedTemp2+GreenTemp2;
    Green:=Red+GreenTemp2;
    N:=N+1;

    {���� ��������� ������������, �� ��������� ������� �� ���� � �������
     ��������� ���������� ����}
    if Green<0 then
    begin
      writeln('Impossible to count. Last valid step number: ',N-2);
      Flag:=false;
    end
    else
    begin
      RedTemp2:=Red;
      GreenTemp2:=Green;
      Red:=RedTemp1+GreenTemp1;
      Green:=Red+GreenTemp1;
      RedTemp1:=Red;
      GreenTemp1:=Green;
      N:=N+1;
    end;

    if (Green<0) and (Flag=true) then
    begin
      writeln('Impossible to count. Last valid step number: ',N-2);
      Flag:=false;
    end;
  end;
  //����� ����� �2.

  {���� � ���� ���������� ��������� �� �������� �� ������, �� ����������
   ���������� ������ ����� ����������}
  if Flag=true then
    N:=K;

    {���� ���� �������� ������ ���������� ������, �� ��������� ������� ��������,
     ����������� � ���������� ��� ������� ����� ������.
     ���� ���� �������� �������� ���������� ������, �� ��������� ������� ��������,
     ����������� � ���������� ��� ��������� ����� ������.}
    if N mod 2 = 0 then
      writeln('Red bacteria: ',RedTemp2,'. Green bacteria: ',GreenTemp2)
    else
      writeln('Red bacteria: ',RedTemp1,'. Green bacteria: ',GreenTemp1);
  readln;
end.


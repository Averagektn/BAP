Program razminka1;
  {Monahi ������� ����� pirogi �������.
   ������ ������ ���� ������ �� ����.
   ������� �� PVed, ������� �� PProst, ������� �� PUchen.
   ������� ���� ������� �������, ������� � ��������.}

{$APPTYPE CONSOLE}

uses
  SysUtils;

Var
  DataUchen,DataProst,DataVed,DataM,DataP:string;
  Pirogi,PVed,PProst,PUchen,K:real;
  Ved,Prost,Uchen,Monahi,error:integer;
  Flag:boolean;
  {Pirogi - ����� ����� �������. ������������ � ��������.
   PVed - ����� �������, ������� ���� ������� ������. ������������ � ��������.
   PProst - ����� �������, ������� ���� ������� ������. ������������ � ��������.
   PUchen - ����� �������, ������� ���� �������. ������������ � ��������.
   K - ����������, ������� ���������� �������������� �
   ����� �������, ������� ���� ������ ������. ���� ������
   ������ ��������, �� ���������� �������� ��������, ������
   ����� �������.
   Ved - ����� ������� �������.
   Prost - ����� ������� �������.
   Uchen - ����� ��������.
   Monahi - ����� ����� �������. ������������ � ��������.
   Flag - � ������, ���� ������� ���, ��������� �������
   ��������� �� ����.
   Error - ������������ ��� �������� �������� ������������� ������.
   DataUchen - ����������� ����� ��������� ����� �������, ������� ���� �������.
   DataProst - ����������� ����� ��������� ����� �������, ������� ���� ������� ������.
   DataVed - ����������� ����� ��������� ����� �������, ������� ���� ������� ������.
   DataP - ����������� ����� ��������� ����� �������.
   DataM - ����������� ����� ��������� ����� �������.}

Begin

  {���� ����������� ��� ��������� ��������: ����� �������,
   �������,���������� �������, ������� ���� ������ ���������.
   �������� ������������ ��������� ������.
   ���������� ���������� �������� ��� Flag �  K.}
  repeat
    writeln('Enter the number of pies.');
    readln(DataP);
    val(DataP,Pirogi,Error);
    if (Error<>0) or (Pirogi<0) then
      writeln('Incorrect data.');
  until (Error=0) and (Pirogi>=0);
  repeat
    writeln('Enter the number of monks.');
    readln(DataM);
    val(DataM,Monahi,Error);
    if (Error<>0) or (Monahi<0) then
      writeln('Incorrect data.');
  until (Error=0) and (Monahi>=0);
  repeat
    writeln('Enter the number of pies the leading monks eat.');
    readln(DataVed);
    val(DataVed,PVed,Error);
    if (Error<>0) or (PVed<0) then
      writeln('Incorrect data.');
  until(Error=0) and (Pved>=0);
  repeat
    writeln('Enter the number of pies the ordinary monks eat.');
    readln(DataProst);
    val(DataProst,PProst,Error);
    if (Error<>0) or (PProst<0) or (PProst=PVed) then
      writeln('Incorrect data.');
  until (Error=0) and (PProst>=0) and (PProst<>PVed);
  repeat
    writeln('Enter the number of pies the students eat.');
    readln(DataUchen);
    val(DataUchen,PUchen,Error);
    if (Error<>0) or (PUchen<0) or (PProst=PUchen) or (PVed=PUchen) then
      writeln('Incorrect data.');
  until (Error=0) and (PUchen>=0) and (PProst<>PUchen) and (PVed<>PUchen);
  Flag := false;

  {���� ������� ������ ���� 0 �������, �� ����������
   ���������� ����������, ������� ������ ���������� K,
   �������� �������� ���������� � ����������� �� ����,
   ���� �� ������ ������ ������.}
  if PVed = 0 then
    K := 1
  else
    K:=PVed;

  {������ ����� �1 ��� ������ ����� ������� �������.
   ���� ���� �� 0 �� ������������� �������� ������� ����-
   ��� � ����� 1.}
  for Ved := 0 to trunc(Pirogi/K) do
  begin

    {���� ��� ��������� ������� ���� ������ ����������
     �������, �� ������� ����� ����������� �� ��������� �������:}
    Prost := trunc((PUchen*Ved+Pirogi-PVed*Ved-PUchen*Monahi)/(PProst-PUchen));
    if Prost >=0 then
      Uchen := Monahi-Prost-Ved;

    {�������� ������������ �������� � ����� ����������.}
    if (Uchen+Ved+Prost = Monahi) and (Ved*PVed+Prost*PProst+Uchen*PUchen = Pirogi) and (Uchen >= 0) then
    begin
      writeln;
      writeln('Leading monks:',Ved);
      writeln('Ordinary monks:',Prost);
      writeln('Students:',Uchen);
      writeln;
      Flag := true;
    end;
  end;
  {����� ����� �1.}

  {���� �� ������ ������� �� ���� �������, �� ��������� �������� �� ����.}
  if Flag = false then
    writeln('No solutions.');

  readln;

end.








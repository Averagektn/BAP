Program LABA1_Final;

{$APPTYPE CONSOLE}

Var

  {N ��������� �������� �� 10 �� 15 � ����� 1 � ������������ ��� �������� ����� � ��������� ��������.
  K ��������� �������� �� 1 �� N � ����� 1 � ������������ ��� �������� �����.
  X ��������� �������� �� 0.6 �� 1.1 � ����� 0.1 � ������������ ��� �������� ����� � �������� ��������.
  F - �������� �������� �������.
  Sum - ������������� �������� �����.}
  N,K:integer;  
  X,Sum,F:real;
  

Begin
  X := 0.6;

  {������ ����� �1 �� X.
  X ���������� �� 0.6 �� 1.1 � ����� 1 � ������������ ��� �������� �������� ����� � �������� ��������.}
  While X <= 1.1 do
  Begin

    {������ ����� �1.1 �� N.
    N ���������� �� 10 �� 15 � ����� 1 � ������������ ��� �������� �������� ����� � �������� �����-���.}
    for N := 10 to 15 do
    Begin
      Sum := 0;

      {������ ����� �1.1.1 �� K.
      K ���������� �� 1 �� N � ����� 1 � ������������ ��� �������� �������� �����.}
      for K := 1 to N do
        Sum := Sum+ln(X+K)*ln(X+K)*cos((K*K+X)/N)/(K+5);          
      {����� ����� �1.1.1 �� K.}

      {���������� ��������� ��������.
      ����� ����������� ����������.}
      F:=Sum*exp(-cos(2*N*X))*exp((N*X/2)*ln(2))/5;
      writeln(' N=',N,' X=',X:4:1,' F=',F:11:8);
    end;
    {����� ����� A1.1 �� N.}

    writeln;
    X:=X+0.1;
  end;
  {����� ����� �1 �� X.}

  readln;
end.

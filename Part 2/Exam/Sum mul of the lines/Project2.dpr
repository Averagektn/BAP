program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  N = 3;
  M = 4;

Type
  TArr = Array [1..N,1..M] of Integer;

Var
  Arr: TArr;
  I,J,K: Integer;

Procedure Count(Const A: TArr; Const L: Integer);
Var
  I,Sum,Mul: Integer;
begin
  Sum := 0;
  Mul := 1;
  for I := low(A[L]) to high(A[L]) do
  begin
    Sum := Sum + A[L,I];
    Mul := Mul * A[L,I];
  end;
  writeln('Summa of ',L,' line: ',Sum,' multiplication: ',Mul);
end;

begin
  Randomize;
  for I := low(Arr) to high(Arr) do
    begin
      for J := low(Arr[I]) to high(Arr[I]) do
      begin
        Arr[I,J] := Random(10);
        write(Arr[I,J],' ');
      end;
    writeln;
  end;
  K := 2;

  Count(Arr,K);

  readln;
end.
 
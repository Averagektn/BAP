program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  N = 6;
  L = 2;
  K = 3;

Type
  TArr = Array[1..N] of Integer;

Var
  Arr: TArr;
  I: Integer;

Procedure Sum(Const A: TArr; Const Left,Right: Integer);
Var
  I,S: Integer;
begin
  S := 0;
  for I := low(A) to Left - 1 do
    S := S + A[I];

  for I := Right + 1 to high(A) do
    S := S + A[I];

  writeln('Summa = ',S);
end;

begin
  Randomize;

  for I := low(Arr) to high(Arr) do
  begin
    Arr[I] := Random(10);
    write(Arr[I],' ');
  end;

  Sum(Arr,L,K);

  readln;
end.

program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  Name = 'input.txt';
  N = 5;

Type
  TArr = Array [0..N] of Integer;

Var
  Arr: TArr;
  F: TextFile;
  I: Integer;

Procedure SetZero(Var A: TArr);
Var
  Min,Max,I: Integer;

begin
  Min := low(A);
  Max := low(A);
  for I := low(A) + 1 to high(A) do
  begin
    if A[I] < A[Min] then
      Min := I;
    if A[I] > A[Max] then
      Max := I;
  end;

  for I := Min + 1 to Max - 1 do
    A[I] := 0;

  for I := low(A) to high(A) do
    writeln(A[I]);
end;

begin
  AssignFile(F,Name);
  {Rewrite(F);
  for I := low(Arr) to high(Arr) do
    writeln(F,Random(100));  }
  Reset(F);
  for I := low(Arr) to high(Arr) do
    readln(F,Arr[I]);
  CloseFile(F);

  SetZero(Arr);

  readln;
end.

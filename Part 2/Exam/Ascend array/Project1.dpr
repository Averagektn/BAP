program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  M = 3;
  N = 4;
  Name = 'input.txt';

Type
  TArr = Array [1..M,1..N] of Integer;

Var
  I,J: Integer;
  F: TextFile;
  Arr: TArr;

Procedure Count(Const A: TArr);
Var
  I,J: Integer;
  Flag: Boolean;
begin
  for I := low(A) to high(A) do
  begin
    Flag := true;
    for J := low(A[I]) to high(A[I]) - 1 do
      if A[I,J] > A[I,J + 1] then
        Flag := false;
    if Flag then
      writeln('Elements of ',I,' line are sorted by ascend');
  end;
end;

begin
  Randomize;
  AssignFile(F,Name);
  {Rewrite(F);
  for I := 1 to M * N do
    writeln(F,Random(100));}
  Reset(F);
  for I := low(Arr) to high(Arr) do
    for J := low(Arr[I]) to high(Arr[I]) do
      readln(F,Arr[I,J]);

  Count(Arr);

  readln;
end.

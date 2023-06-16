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

Procedure Compare(Const A: TArr);
Var
  I,J: Integer;
  Flag: Boolean;
begin
  for I := low(A) + 1 to high(A) do
  begin
    Flag := true;
    for J := low(A[I]) to high(A[I]) do
      if A[I,J] <> A[low(A),J] then
        Flag := false;
    if Flag then
      writeln('1 line is equal to ', I,' line');
  end;
end;

begin
  Randomize;
  AssignFile(F,Name);
  {Rewrite(F);
  for I := 1 to M * N do
    writeln(F,Random(100)); }
  Reset(F);
  for I := low(Arr) to high(Arr) do
    for J := low(Arr[I]) to high(Arr[I]) do
      readln(F,Arr[I,J]);
  CloseFile(F);

  for I := low(Arr) to high(Arr) do
  begin
    for J := low(Arr[I]) to high(Arr[I]) do
      write(Arr[I,J],' ');
    writeln;
  end;

  Compare(Arr);

  readln;
end.

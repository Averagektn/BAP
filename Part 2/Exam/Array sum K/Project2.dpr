program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  N = 5;
  Name = 'input.txt';

Type
  TArr = Array [1..N] of Integer;

Var
  F: TextFile;
  Arr: TArr;
  I: Integer;

Procedure Form(Const A: TArr);
Var
  B: TArr;
  I,J: Integer;
begin
  for I := low(B) to high(B) do
    B[I] := 0;

  for I := low(A) to high(A) do
    for J := low(A) to I do
      B[I] := B[I] + A[J];

  for I := low(A) to high(A) do
    write(A[I],' ');
  writeln;
  for I := low(B) to high(B) do
    write(B[I],' ');
  writeln;

end;

begin
  Randomize;
  AssignFile(F,Name);
  Rewrite(F);
  for I := low(Arr) to high(Arr) do
    writeln(F,Random(100));
  CloseFile(F);

  Reset(F);
  for I := low(Arr) to high(Arr) do
    readln(F,Arr[I]);
  CloseFile(F);

  Form(Arr);

  readln;
end.

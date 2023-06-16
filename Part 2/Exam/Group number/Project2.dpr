program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  N = 5;
  Name = 'input.txt';

Type
  TLen = 1..3;

  TRec = Record
    Surname: String[10];
    Number: TLen;
    Year: Integer;
  end;

  TArr = Array [1..N] of TRec;

Var
  F: TextFile;
  I: Integer;
  Arr: TArr;

Procedure Find(Const A: TArr);
Var
  I,Tmp: Integer;
  Students: Array [TLen] of Integer;
begin
  for I := low(Students) to high(Students) do
    Students[I] := 0;

  for I := low(A) to high(A) do
    Inc(Students[A[I].Number]);

  Tmp := low(Students);
  for I := low(Students) + 1 to high(Students) do
    if Students[I] > Students[Tmp] then
      Tmp := I;

  writeln('Number of students in ',Tmp,' group is: ', Students[Tmp]);
end;

begin
  AssignFile(F,Name);
  Reset(F);
  for I := low(Arr) to high(Arr) do
    with Arr[I] do
    begin
      readln(F,Surname);
      readln(F,Number);
      readln(F,Year);
    end;

  Find(Arr);

  readln;
end.

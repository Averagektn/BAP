program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  N = 5;
  M = 3;
  Name = 'input.txt';

Type
  TRec = Record
    Surname,Department: String[20];
    Year,Salary: Integer;
  end;

  TArr = Array [1..N] of TRec;

  TDep = Array[1..M] of String[20];

Const
  Dep: TDep = ('X','Y','Z');

Var
  F: TextFile;
  Arr: TArr;
  I: Integer;

Procedure Find(Const A: TArr; Const D: TDep);
Var
  I,J,Id,Ind: Integer;
  TA: Array [low(D)..high(D)] of Real;
  TP: Array [low(D)..high(D)] of Integer;
begin
  for I := low(TA) to high(TA) do
  begin
    TA[I] := 0;
    TP[I] := 0;
  end;

  for I := low(D) to high(D) do
    for J := low(A) to high(A) do
      if A[J].Department = D[I] then
      begin
        TA[I] := TA[I] + A[J].Salary;
        inc(TP[I]);
      end;

  for I := low(TA) to high(TA) do
    TA[I] := TA[I]/TP[I];

  Ind := 1;
  for I := low(TA) + 1 to high(TA) do
    if TA[Ind] < TA[I] then
      Ind := I;

  writeln('The best department is ',D[Ind],' with salary = ',TA[Ind]:0:2);
end;

begin
  AssignFile(F,Name);
  Reset(F);
  for I := low(Arr) to high(Arr) do
    with Arr[I] do
    begin
      readln(F,Surname);
      readln(F,Department);
      readln(F,Year);
      readln(F,Salary);
    end;
  CloseFile(F);

  Find(Arr,Dep);

  readln;
end.

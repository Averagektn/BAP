Program Z23;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  N = 2;
  Name = 'file.txt';

Type
  TRec = Record
    Book,Author: String[40];
    Num,Cost,Delivery: Integer;
  end;

  TArr = Array [0..N] of TRec;

Var
  F: TextFile;
  Arr: TArr;
  I: Integer;

Procedure Find(Const A: TArr);
Var
  Curr,Total,I: Integer;
  R: TRec;
begin
  Total := maxint;
  for I := low(A) to high(A) do
    with A[I] do
    begin
      Curr := Cost * Num + Delivery;
      if Total >= Curr then
      begin
        Total := Curr;
        R := A[I];
      end;
    end;

  writeln(R.Book);
end;

Begin
  AssignFile(F,Name);
  Reset(F);
  for I := low(Arr) to high(Arr) do
    with Arr[I] do
    begin
      readln(F,Book);
      readln(F,Author);
      readln(F,Num);
      readln(F,Cost);
      readln(F,Delivery);
    end;
  CloseFile(F);
  
  Find(Arr);

  readln;
end.

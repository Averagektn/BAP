program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  N = 6;
  Name = 'input.txt';

Type
  TRec = Record
    Name: String[15];
    Likes,Messages,Friends: Integer;
  end;

  TArr = Array [1..N] of TRec;

Var
  F: TextFile;
  Arr: TArr;
  I: Integer;

Procedure Find(A: TArr);
Var
  I,J,Ind: Integer;
begin
  writeln('People with the biggest amount of likes');
  for I := 1 to 5 do
  begin
    Ind := low(A);
    for J := low(A) + 1 to high(A) do
      if A[J].Likes > A[Ind].Likes then
        Ind := J;
    A[Ind].Likes := 0;
    writeln(I,': ',A[Ind].Name);
  end;
end;

begin
  AssignFile(F,Name);
  Reset(F);
  for I := low(Arr) to high(Arr) do
    with Arr[I] do
    begin
      readln(F,Name);
      readln(F,Likes);
      readln(F,Messages);
      readln(F,Friends);
    end;
  CloseFile(F);

  Find(Arr);

  readln;
end.
 
Program ZN;

{$APPTYPE CONSOLE}

Const
  Name = 'A.txt';
  N = 5;

Type
  TRec = Record
    Surname,Language,Date: String[40];
  end;

  TArr = Array [0..N] of TRec;
  TNum = Array [0..N] of Integer;

Var
  F: TextFile;
  S: String;
  I: Integer;
  Arr: TArr;

Procedure Find(Const A: TArr);
Var
  I,Ind: Integer;
  Num: TNum;
  R: TRec;
begin
  for I := low(Num) to high(Num) do
    Num[I] := 0;
  for I := low(A) to high(A) - 1 do
    if A[I].Surname = A[I + 1].Surname then
      Inc(Num[I]);

  Ind := low(Num);
  for I := low(Num) + 1 to high(Num) do
    if Num[I] > Num[Ind] then
      Ind := I;

  writeln(A[Ind].Surname);
  writeln(A[Ind].Language);
  writeln(A[Ind].Date);


end;

Begin
  AssignFile(F,Name);
  Reset(F);
  for I := low(Arr) to high(Arr) do
    with Arr[I] do
    begin
      readln(F,Surname);
      readln(F,Language);
      readln(F,Date)
    end;
  CloseFile(F);

  Find(Arr);


  readln;
end.

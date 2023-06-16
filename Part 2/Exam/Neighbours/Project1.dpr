program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  N = 5;

Type
  TArr = Array [1..N] of Integer;

Var
  I: Integer;
  Arr: TArr;

Procedure Find(Const A: TArr);
Var
  I,Ind,Sum: Integer;
begin
  Sum := 0;
  for I := low(A) to high(A) - 1 do
    if A[I] + A[I + 1] > Sum then
    begin
      Sum := A[I] + A[I + 1];
      Ind := I;
    end;

  writeln(A[Ind],' + ',A[Ind + 1],' = ',Sum);
end;

begin
  for I := low(Arr) to high(Arr) do
  begin
    Arr[I] := Random(100);
    write(Arr[I],' ');
  end;

  Find(Arr);

  readln;
end.

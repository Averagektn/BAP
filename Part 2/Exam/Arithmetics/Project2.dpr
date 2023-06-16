program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  N = 5;

Type
  TArr = Array [1..N] of Real;

Var
  Arr: TArr;
  I: Integer;

Procedure Exchange(Var A: TArr);
Var
  I: Integer;
  B: TArr;
begin
  B := A;
  A[low(A)] := (B[low(B)] + B[low(B) + 1])/2;

  for I := low(A) + 1 to high(A) - 1 do
    A[I] := (B[I - 1] + B[I] + B[I + 1])/3;

  A[high(A)] := (B[high(B) - 1] + B[high(B)])/2;

  for I := low(A) to high(A) do
    write(A[I]:0:1,' ');


end;

begin
  Randomize;
  for I := low(Arr) to high(Arr) do
  begin
    Arr[I] := Random(10);
    write(Arr[I]:0:0,' ');
  end;
  writeln;
  Exchange(Arr);

  readln;
end.
 
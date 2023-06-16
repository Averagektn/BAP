program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  N = 6;

Type
  TArr = Array [1..N] of Integer;

Var
  Arr: TArr;
  I: Integer;

Procedure Swap (Var Param1,Param2: Integer);
Var
  Tmp: Integer;
begin
  Tmp := Param1;
  Param1 := Param2;
  Param2 := Tmp;
end;

Procedure Exchange(Var A: TArr);
Var
  I,Tmp: Integer;
begin
  I := 1;
  while I < high(A) do
  begin
    Swap(A[I],A[I + 1]);
    I := I + 2;
  end;

  for I := low(A) to high(A) do
    write(A[I],' ');

end;

begin
  Randomize;
  for I := low(Arr) to high(Arr) do
    Arr[I] := Random(100);

  for I := low(Arr) to high(Arr) do
    write(Arr[I],' ');

  writeln;

  Exchange(Arr);

  readln;
end.

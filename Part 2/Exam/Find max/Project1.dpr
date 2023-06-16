program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  M = 3;
  N = 4;

Type
  TArr = Array [1..M,1..N] of Integer;

Var
  I,J: Integer;
  Arr: TArr;

Procedure Find(Const A: TArr);
Var
  I,J,Ind: Integer;
  Tmp: Array[low(A)..high(A)] of Integer;
begin
  for I := low(Tmp) to high(Tmp) do
    Tmp[I] := 0;

  for I := low(A) to high(A) do
    for J := low(A[I]) to high(A[I]) do
      Tmp[I] := Tmp[I] + A[I,J];

  Ind := low(Tmp);
  for I := low(Tmp) + 1 to high(Tmp) do
    if Tmp[I] > Tmp[Ind] then
      Ind := I;

  writeln('Line: ',Ind,' Summa: ',Tmp[Ind]);

end;

begin
  Randomize;
  for I := low(Arr) to high(Arr) do
  begin
    for J := low(Arr[I]) to high(Arr[I]) do
    begin
      Arr[I,J] := Random(10);
      write(Arr[I,J],' ');
    end;
    writeln;
  end;

  Find(Arr);

  readln;
end.
 
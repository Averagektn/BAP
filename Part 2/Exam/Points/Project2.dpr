program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  N = 5;

Type
  TRec = Record
    X,Y: Integer;
  end;

  TArr = Array[1..N] of TRec;

Var
  Point: TRec = (X:10; Y:20);
  Arr: TArr;
  I: Integer;

Procedure Find(Const A: TArr; Const R: TRec);
Var
  I,Len,Tmp:Integer;
  P: TRec;
begin
  Tmp := Maxint;
  for I := low(A) to high(A) do
  begin
    Len := (R.X - A[I].X) * (R.X - A[I].X) + (R.Y - A[I].Y) * (R.Y - A[I].Y);
    if Len < Tmp then
    begin
      P := A[I];
      Tmp := Len;
    end;
  end;
  writeln('X: ',P.X,' Y: ',P.Y);
end;

begin
  Randomize;
  writeln('X: ',Point.X,' Y: ',Point.Y);
  writeln;
  for I := low(Arr) to high(Arr) do
  begin
    Arr[I].X := Random(200) - 100;
    Arr[I].Y := Random(200) - 100;
    writeln('X: ',Arr[I].X,' Y: ',Arr[I].Y);
  end;

  writeln;
  writeln;

  Find(Arr,Point);

  readln;
end.

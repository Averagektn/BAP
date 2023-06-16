Unit Lib;

Interface
Const
  Max=9;
  Min=0;

Type
  TArray = Array [Min..Max,0..1] of Real;
  Function CheckInput: Real;
  Procedure Input(Var Arr: TArray);
  Procedure Output(Const Elem);

Implementation

// Input of precession
Function CheckInput;
Var
  Error: Integer;
  Check: String;
begin
  repeat
    readln(Check);
    val(Check,Result,Error);
    if (Error <> 0) or (Result<=0) then
      writeln('Incorrect input');
  until (Error = 0) and (Result>0);
end;

// Input of points
Procedure Input;
Var
  I,J: Integer;
begin
  Randomize;
  for I := low(Arr) to high(Arr) do
    for J := low(Arr[I]) to high(Arr[I]) do
      Arr[I,J] := Random(999999)/1000;
  writeln;
end;

// Output of points
Procedure Output;
Var
  I,J: Integer;
  Arr: TArray Absolute Elem;
begin
  for I := low(Arr) to high(Arr) do
  begin
    for J := low(Arr[I]) to high(Arr[I]) do
      write(Arr[I,J]:7:3,' ');
    writeln;
  end;
  writeln;
end;


end.

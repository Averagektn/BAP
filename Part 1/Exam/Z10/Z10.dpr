Program Z10;

{$APPTYPE CONSOLE}

Const
  N = 8;

Var
  Letters,Words:string;
  Sum:array [1..N] of integer;
  Arr:array [1..N,1..N] of integer;
  Up,Down,I,J,Min,Max,Temp:integer;
  Flag,NonEven:boolean;

begin

  Randomize;
  for I:=1 to N do
    for J:=1 to N do
      Arr[I,J]:=Random(100)-50;

  for I:=1 to N do
  begin
    writeln;
    for J:=1 to N do
      write(Arr[I,J]:3);
  end;

  writeln;

  for I:=1 to N do
    for J:=1 to N do
    begin
      NonEven:=Odd(I+J);
      if NonEven then
        Arr[I,J]:=-Arr[I,J]
      else
        Arr[I,J]:=abs(Arr[I,J]);
    end;

  writeln;

  for I:=1 to N do
  begin
    writeln;
    for J:=1 to N do
      write(Arr[I,J]:3);
  end;

  readln;
end.


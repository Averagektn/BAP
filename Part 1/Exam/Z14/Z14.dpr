Program Z14;

{$APPTYPE CONSOLE}

Const
  N = 10;

Var
  Letters,Words,Number,Code,Convert,Name:string;
  Sum:array [1..N] of integer;
  Arr:array [1..N,1..N] of integer;
  Up,Down,I,J,Min,Max,Temp,Error:integer;
  Flag,NonEven:boolean;
  BigLetters:set of char = ['A'..'Z'];
  SmallLetters:set of char = ['a'..'z'];

begin

  Randomize;
  for I:=1 to N do
    for J:=1 to N do
      Arr[I,J]:=random(100);

  for I:=1 to N do
  begin
    writeln;
    for J:=1 to N do
      write(Arr[I,J]:3);
  end;

  for I:=1 to N do
    Arr[I,N]:=0;

  for I:=1 to N do
    for J:=1 to N-1 do
      Arr[I,N]:=Arr[I,N]+Arr[I,J];

  writeln;

  for I:=1 to N do
  begin
    writeln;
    for J:=1 to N-1 do
      write(Arr[I,J]:3);
    write(' ',Arr[I,N]);
  end;

  readln;
end.


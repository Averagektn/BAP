Program Z5;

{$APPTYPE CONSOLE}

Const
  N = 5;

Var
  Letters,Words:string;
  Arr:array [1..N,1..N] of integer;
  Up,Down,I,J,Min:integer;

begin

  Randomize;
  for I:=1 to N do
    for J:=1 to N do
      Arr[I,J]:=Random(5);

  for I:=1 to N do
  begin
    writeln;
    for J:=1 to N do
      write(Arr[I,J]:2);
  end;

  Min:=Arr[1,N];
  for I:=2 to N do
    if Arr[I,N-I+1]<Min then
      Min:=Arr[I,N-I+1];

  for I:=1 to N do
    for J:=1 to N do
      if Arr[I,J]=0 then
        Arr[I,J]:=Min;

  for I:=1 to N do
  begin
    writeln;
    for J:=1 to N do
      write(Arr[I,J]:3);
  end;

  readln;
end.


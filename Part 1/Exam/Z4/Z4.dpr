Program Z4;

{$APPTYPE CONSOLE}

Const
  N = 100;

Var
  Letters,Words:string;
  Arr:array [1..N,1..N] of integer;
  Up,Down,I,J:integer;

begin

  Randomize;
  for I:=1 to N do
    for J:=1 to N do
      Arr[I,J]:=Random(10);

  for I:=1 to N do
  begin
    writeln;
    for J:=1 to N do
      write(Arr[I,J]:2);
  end;

  Up:=0;

  for I:=1 to N-1 do
    for J:=I+1 to N do
      Up:=Up+Arr[I,J];

  Down:=0;
  for I:=2 to N do
    for J:=1 to I-1 do
      Down:=Down+Arr[I,J];

  writeln;
  if Up=Down then
    writeln('Yes')
  else
    writeln('No');


  readln;
end.


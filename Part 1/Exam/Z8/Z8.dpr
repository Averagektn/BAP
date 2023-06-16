Program Z8;

{$APPTYPE CONSOLE}

Const
  N = 5;

Var
  Letters,Words:string;
  Sum:array [1..N] of integer;
  Arr:array [1..N,1..N] of integer;
  Up,Down,I,J,Min,Max,Temp:integer;
  Flag:boolean;

begin

  Randomize;
  for I:=1 to N do
    for J:=1 to N do
      readln(Arr[I,J]);

  for I:=1 to N do
  begin
    writeln;
    for J:=1 to N do
      write(Arr[I,J]:3);
  end;

  writeln;

  for I:=1 to N do
    for J:=1 to N do
      Sum[I]:=Sum[I]+Arr[I,J];

  writeln;

  for I:=1 to N do
    write(Sum[I],' ');



  Min:=1;

  for I:=N downto 2 do
  begin
    if Sum[I]<=Sum[Min] then
      Min:=I;
  end;

  if Sum[1]=Sum[Min] then
    Min:=1;

  writeln(Min);

  for J:=1 to N do
    write(Arr[Min,J]:3);

  readln;
end.


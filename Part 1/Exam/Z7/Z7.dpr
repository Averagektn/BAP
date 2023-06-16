Program Z7;

{$APPTYPE CONSOLE}

Const
  N = 10;

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
      Arr[I,J]:=random(100);

  for I:=1 to N do
  begin
    writeln;
    for J:=1 to N do
      write(Arr[I,J]:3);
  end;

  writeln;

  for J:=1 to N do
    for I:=1 to N do
      Sum[J]:=Sum[J]+Arr[I,J];

  writeln;

  for I:=1 to N do
    write(Sum[I],' ');

  writeln;

  Min:=1;
  Max:=1;

  for I:=2 to N do
  begin
    if Sum[I]>Sum[Max] then
      Max:=I;
    if Sum[I]<Sum[Min] then
      Min:=I;
  end;

  for I:=1 to N do
  begin
    Temp:=Arr[I,Max];
    Arr[I,Max]:=Arr[I,Min];
    Arr[I,Min]:=Temp;
  end;

  for I:=1 to N do
  begin
    writeln;
    for J:=1 to N do
      write(Arr[I,J]:3);
  end;

  readln;
end.


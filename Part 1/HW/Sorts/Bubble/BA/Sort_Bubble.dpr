Program Sort_Bubble;

{$APPTYPE CONSOLE}

Const
  N=50;

Var
  Arr:array[1..N] of integer;
  I,J,Temp:integer;

begin
  randomize;
  for I:=1 to N do
    Arr[I]:=Random(100);

  for I:=1 to N do
    write(Arr[I],' ');

  writeln;

  for I:=1 to N-1 do
    for J:=1 to N-1 do
      if Arr[J]>Arr[J+1] then
      begin
        Temp:=Arr[J];
        Arr[J]:=Arr[J+1];
        Arr[J+1]:=Temp;
      end;

  for I:=1 to N do
    write(Arr[I],' ');

  readln;
end.

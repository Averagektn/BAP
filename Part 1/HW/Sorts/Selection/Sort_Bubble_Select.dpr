Program Sort_Bubble_Select;

{$APPTYPE CONSOLE}

Const
  N=50;

Var
  Arr:array[1..N] of integer;
  I,J,Temp:integer;

begin
  randomize;
  for I:=1 to N do
    Arr[I]:=Random(1000);

  for I:=1 to N do
    write(Arr[I],' ');

  writeln;

  for I:=1 to N-1 do
    for J:=I to N do
      if Arr[J]<Arr[I] then
      begin
        Temp:=Arr[J];
        Arr[J]:=Arr[I];
        Arr[I]:=Temp;
      end;

  for I:=1 to N do
    write(Arr[I],' ');

  readln;
end.

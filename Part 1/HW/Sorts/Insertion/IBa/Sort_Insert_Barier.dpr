Program Sort_Insert_Barier;

{$APPTYPE CONSOLE}

Const
  N=50;

Var
  Arr:array[0..N] of integer;
  I,J,Temp:integer;

begin
  randomize;
  for I:=1 to N do
    Arr[I]:=Random(100);

  for I:=1 to N do
    write(Arr[I],' ');

  writeln;

  for I:=2 to N do
  begin
    Arr[0]:=Arr[I];
    J:=I-1;
    while (Arr[J]>Arr[0]) and (J>=1) do
    begin
      Arr[J+1]:=Arr[J];
      J:=J-1;
    end;
    Arr[J+1]:=Arr[0];
  end;

  for I:=1 to N do
    write(Arr[I],' ');

  readln;
end.

Program Sort_Insert;

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

  for I:=2 to N do
  begin
    Temp:=Arr[I];
    J:=I-1;
    while (Arr[J]>Temp) and (J>=1) do
    begin
      Arr[J+1]:=Arr[J];
      J:=J-1;
    end;
    Arr[J+1]:=Temp;
  end;

  for I:=1 to N do
    write(Arr[I],' ');

  readln;
end.

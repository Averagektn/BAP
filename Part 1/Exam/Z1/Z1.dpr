Program Z1;

{$APPTYPE CONSOLE}

Const
  N=40;

Var
  Arr:array[1..N] of integer;
  I,J,Temp,Left,Right,Middle:integer;

begin

  Randomize;
  for I:=1 to N do
    Arr[I]:=Random(100);

  writeln('Entered array');
  for I:=1 to N do
    write(Arr[I]:3);

  for I:=2 to N do
  begin

    Temp:=Arr[I];
    Left:=1;
    Right:=I;

    while Left<Right do
    begin
      Middle:=(Left+Right) div 2;
      if Temp<=Arr[Middle] then
        Left:=Middle+1
      else
        Right:=Middle;
    end;

    for J:=I downto Right+1 do
      Arr[J]:=Arr[J-1];
    Arr[Right]:=Temp;

  end;

  writeln;
  writeln('Sorted array');
  for I:=1 to N do
    write(Arr[I]:3);

  readln;
end.

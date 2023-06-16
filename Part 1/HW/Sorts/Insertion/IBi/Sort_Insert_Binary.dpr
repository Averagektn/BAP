Program Sort_Insert_Binary;

{$APPTYPE CONSOLE}

Const
  N=50;

Var
  Arr:array[1..N] of integer;
  I,J,Temp,Left,Right,Middle:integer;

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
    Left:=1;
    Right:=I;
    while Left<Right do
    begin
      Middle:=(Left+Right) div 2;
      if Arr[Middle]<=Temp then
        Left:=Middle+1
      else
        Right:=Middle;
    end;
    for J:=I downto Right+1 do
      Arr[J]:=Arr[J-1];
    Arr[Right]:=Temp;
  end;

  for I:=1 to N do
    write(Arr[I],' ');

  readln;
end.

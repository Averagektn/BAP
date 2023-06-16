Program Z23;

{$APPTYPE CONSOLE}

Const
  N=10;

Var
  Arr:array [1..N,1..N] of integer;
  Sum:array[1..N] of integer;
  Num,I,J:integer;
  Flag:boolean;

begin

  Randomize;
  for I:=1 to N do
    for J:=1 to N do
      Arr[I,J]:=random(10);

  for I:=1 to N do
  begin
    writeln;
    for J:=1 to N do
      write(Arr[I,J]:2);
  end;

  for I:=1 to N do
  begin
    Flag:=false;
    for J:=1 to N do
    begin
      if Arr[I,J]=0 then
        Flag:=true;
      if Flag then
        Sum[I]:=Sum[I]+Arr[I,J];
    end;
  end;

  writeln;
  for I:=1 to N do
    writeln('Raw ',I,' Sum=',Sum[I]);

  readln;
end.



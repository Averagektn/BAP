Program Z29;

{$APPTYPE CONSOLE}

Const
  N=10;

Var
  ID:string;
  Arr:array [1..N,1..N] of integer;
  Num,Sum,Temp,I,J:integer;
  Flag:boolean;

begin

  Randomize;
  for I:=1 to N do
    for J:=1 to N do
      Arr[I,J]:=Random(100);

  for I:=1 to N do
  begin
    writeln;
    for J:=1 to N do
      write(Arr[I,J]:3);
  end;

  for I:=1 to N do
  begin
    Temp:=Arr[I,I];
    Arr[I,I]:=Arr[I,N-I+1];
    Arr[I,N-I+1]:=Temp;
  end;

  writeln;

  for I:=1 to N do
  begin
    writeln;
    for J:=1 to N do
      write(Arr[I,J]:3);
  end;

  readln;
end.



Program Z6;

{$APPTYPE CONSOLE}

Const
  N = 100;

Var
  Letters,Words:string;
  Arr:array [1..N] of integer;
  Up,Down,I,J,Min:integer;
  Flag:boolean;

begin

  Randomize;
  for I:=1 to N do
    Arr[I]:=random(100);

  for I:=1 to N do
    write(Arr[I]:3);

  writeln;

  Flag:=true;
  I:=2;

  While Flag and (I<=N) do
  begin
    if Arr[I]<Arr[I-1] then
    begin
      flag:=false;
      writeln('No');
    end;
    Inc(I);
  end;

  if Flag then
    writeln('Yes');

  readln;
end.


Program DZ4;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Var
  X,Y,I:integer;


begin

  readln(X);
  readln(Y);

  if X>Y then
    I:=X
  else
    I:=Y;

  repeat
    I:=I+1
  until (I mod X=0) and (I mod Y=0);

  writeln(I);

readln;
end.

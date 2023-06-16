program DZ2_2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Var
I,Num,K: integer;
Chislo: array of boolean;
begin
  readln(Num);
  setlength(Chislo,Num);
  for I:= 1 to Num do
    Chislo[I]:=true;
  for I:=2 to trunc(exp(ln(Num)/2)) do
  begin
    K:=I*I;
    if Chislo[I]=true then
    begin
      while K<=Num do
      begin
        Chislo[K]:=false;
        K:=K+I;
      end;
    end;
  end;
  for I:=2 to Num do
    if Chislo[I]=true then
      writeln(I);
readln;
end.

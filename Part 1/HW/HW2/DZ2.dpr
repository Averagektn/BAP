program DZ2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Var
M,sum,k,i:integer;
flag:boolean;

begin
  write('Enter the border of the range: ');
  readln(M);
  write('Prime numbers: ');
  for i:=2 to M do
  begin
    flag:=true;
    for k:=2 to trunc(exp(ln(I)/2)) do
      if I mod K = 0 then
        flag:=false;
    if flag=true then
      write(I,' ');
  end;
  readln;
end.
 
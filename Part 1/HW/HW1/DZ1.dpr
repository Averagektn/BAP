program DZ1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Var
M,N,sum,i,k:integer;
begin
  writeln('¬ведите M');
  readln(M);
  writeln('¬ведите N');
  readln(N);
  for k:=M to N do
  begin
    sum:=0;
    for i:=1 to k div 2 do
      if k mod i = 0 then
        sum:=sum+i;
    if sum=k then
        writeln('Sovershennoe chislo:',k);
    end;
  readln;
end.
 
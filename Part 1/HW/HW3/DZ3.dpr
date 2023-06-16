program DZ3;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Var
Num,S1,S2,S3:integer;
begin
readln(Num);
for S3:=0 to Num do
  for S2:=0 to Num-S3 do
  begin
    S1:=Num-S2-S3;
    if (S1+S2+S3=Num) then
      writeln(S1,'+',S2,'+',S3);
  end;
  readln;
end.

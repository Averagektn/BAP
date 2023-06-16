Program Z21;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Const
  Name = 'A.txt';

Var
  F: TextFile;
  S: String;


Procedure Find(Const Str: String);
Var
  Letters: Set of Char;
  I: Integer;
begin
  for I := 1 to length(Str) do
    if not (Str[I] in Letters) then
    begin
      Include(Letters,Str[I]);
      write(Str[I]);
    end;
end;

Begin
  AssignFile(F,Name);
  Reset(F);
  readln(F,S);
  Find(S);
  CloseFile(F);
  readln;
end.

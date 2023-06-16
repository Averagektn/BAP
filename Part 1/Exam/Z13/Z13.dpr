Program Z13;

{$APPTYPE CONSOLE}

Const
  N = 8;

Var
  Letters,Words,Number,Code,Convert,Name:string;
  Sum:array [1..N] of integer;
  Arr:array [1..N,1..N] of integer;
  Up,Down,I,J,Min,Max,Temp,Error:integer;
  Flag,NonEven:boolean;
  BigLetters:set of char = ['A'..'Z'];
  SmallLetters:set of char = ['a'..'z'];

begin

  writeln('Enter name');
  readln(Name);

  I:=length(Name);
  Flag:=true;

  while Flag do
  begin
    if Name[I]='.' then
    begin
      Flag:=false;
      delete(Name,I,length(Name));
    end;
    Dec(I);
    if I<2 then
    begin
      writeln('Incorrect data');
      Flag:=false;
    end;
  end;

  writeln(Name);

  readln;
end.


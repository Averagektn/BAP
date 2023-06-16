Program Z12;

{$APPTYPE CONSOLE}

Const
  N = 8;

Var
  Letters,Words,Number,Code,Convert:string;
  Sum:array [1..N] of integer;
  Arr:array [1..N,1..N] of integer;
  Up,Down,I,J,Min,Max,Temp,Error:integer;
  Flag,NonEven:boolean;
  BigLetters:set of char = ['A'..'Z'];
  SmallLetters:set of char = ['a'..'z'];

begin

  writeln('Enter letters');
  readln(Letters);

  for I:=1 to length(Letters) do
    if Letters[I] in BigLetters then
    begin
      Code:=Code + Chr((ord(Letters[I]) + 3 - ord('A')) mod 26 + ord('A'));
    end
    else
      if Letters[I] in SmallLetters then
      begin
        Code:=Code + Chr((ord(Letters[I]) + 3 - ord('a')) mod 26 + ord('a'));
      end
      else
        writeln(Letters[I],' is incorrect symbol');

  writeln(Code);

  readln;
end.


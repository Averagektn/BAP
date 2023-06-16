Program Z15;

{$APPTYPE CONSOLE}

Const
  N = 10;

Var
  Letters,Words,Number,Code,Convert,Name,Copy:string;
  Sum:array [0..N-1] of integer;
  Arr:array [1..N,1..N] of integer;
  L:char;
  Up,Down,I,J,Min,Max,Temp,Error:integer;
  Flag,NonEven:boolean;
  BigLetters:set of char = ['A'..'Z'];
  SmallLetters:set of char = ['a'..'z'];

begin

  repeat
    writeln('Enter number');
    readln(Number);
    val(Number,Temp,Error);
    if Error<>0 then
      writeln('Incorrect data');
  until Error=0;

  Copy:=Number;

  for L:='0' to '9' do
    for J:=1 to length(Number) do
      if Number[J]=L then
        Inc(Sum[ord(L)-ord('0')]);

  for I:=0 to 9 do
    writeln('Number ',I,' repeats ',Sum[I],' times');

  readln;
end.


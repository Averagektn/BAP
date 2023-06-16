Program Z22;

{$APPTYPE CONSOLE}

Type
  THours=0..23;
  TMinutes=0..59;
  TSeconds=0..59;

Var
  Numbers,Letters,Convertion,Time:string;
  Hours:THours;
  Minutes:TMinutes;
  Seconds:TSeconds;
  Days:array [1..12] of integer = (31,28,31,30,31,30,31,31,30,31,30,31);
  I,Y,Error:integer;
  ValidLetters:set of char = ['A'..'Z'];
  FlagYear,InputHour,InputMinute,InputSecond:boolean;


begin

  writeln('Enter the time');
  readln(Time);

  Convertion:=copy(Time,1,pos(':',Time)-1);
  delete(Time,1,pos(':',Time));
  val(Convertion,Hours,Error);
  if Error<>0 then
    writeln('Incorrect number of hours');

  Convertion:=copy(Time,1,pos(':',Time)-1);
  delete(Time,1,pos(':',Time));
  val(Convertion,Minutes,Error);
  if Error<>0 then
    writeln('Incorrect number of minutes');

  Convertion:=Time;
  val(Convertion,Seconds,Error);
  if Error<>0 then
    writeln('Incorrect number of seconds');

  if (Hours<0) or (Minutes<0) or (Seconds<0) or (Hours>23) or (Minutes>59) or (Seconds>59) then
    writeln('No')
  else
    writeln('Yes');

  readln;
end.



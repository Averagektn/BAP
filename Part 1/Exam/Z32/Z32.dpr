Program Z32;

{$APPTYPE CONSOLE}

Var
  Numbers,Letters,Convertion,Time:string;
  Hours,Minutes,Seconds:Integer;
  Plus:integer;
  Days:array [1..12] of integer = (31,28,31,30,31,30,31,31,30,31,30,31);
  I,Y,Error:integer;
  ValidLetters:set of char = ['A'..'Z'];
  FlagYear,InputHour,InputMinute,InputSecond:boolean;


begin

  writeln('Enter the time');
  readln(Time);
  writeln('Enter the number of seconds');
  readln(Plus);

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
    writeln('Incorrect input');

  Seconds:=Seconds+Plus;
  Minutes:=Seconds div 60 + Minutes;
  Hours:=Minutes div 60 + Hours;
  if Hours=24 then
    Hours:=0;
  Seconds:=Seconds mod 60;
  Minutes:=Minutes mod 60;

  writeln('Time is: ',Hours,':',Minutes,':',Seconds);



  readln;
end.



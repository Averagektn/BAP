Program Laba6;

{$APPTYPE CONSOLE}

Type
  TDayOfWeek=1..7;
  TDayOfMonth=1..31;
  TMonthDate=1..12;
  TMonthDate2=1..13;
  TMonthConvert=3..14;
  TMonths=(January,February,March,April,May,June,July,August,September,October,November,December);
  TDays=(Mon,Tue,Wed,Thi,Fri,Sat,Sun);

Const
  ArrMonth:array [TMonthDate2] of string=('January','February','March','April','May','June','July','August','September','October','November','December','January');
  ArrDay:array [TDays] of string=('Monday','Tuesday','Wednesday','Thirthday','Friday','Saturday','Sunday');

Var
  InputDay,InputYear,InputMonth:String;
  CurrentDay,NextDay:TDayOfMonth;
  CurrentMonth,MonthSaved:TMonthDate;
  DayOfWeek:TDayOfWeek;
  CurrentYear,Error,CenturyYear,ZCentury,YearSaved,NextYear,I:integer;
  FlagMonth,FlagYear,FlagLeap:boolean;
  Day:TDays;
  Month:TMonths;

begin

  repeat
    writeln('Enter the day');
    readln(InputDay);
    val(InputDay,CurrentDay,Error);
    if (Error<>0) or (CurrentDay<1) or (CurrentDay>31) then
      writeln('Incorrect data');
  until (Error=0) and (CurrentDay>=1) and (CurrentDay<=31);

  repeat
    FlagMonth:=true;
    writeln('Enter the month');
    readln(InputMonth);
    val(InputMonth,CurrentMonth,Error);
    if (Error<>0) or (CurrentMonth<1) or (CurrentMonth>12) then
    begin
      writeln('Incorrect data');
      FlagMonth:=false;
    end;
    case CurrentMonth of
    4,6,9,11:
      if CurrentDay>30 then
      begin
        writeln('Incorrect data');
        FlagMonth:=false;
      end;
    2:
      if CurrentDay>29 then
      begin
        writeln('Incorrect data');
        FlagMonth:=false;
      end
    end;
  until (Error=0) and (CurrentMonth>=1) and (CurrentMonth<=12) and (FlagMonth=true);

  repeat
    FlagYear:=true;
    writeln('Enter the year');
    readln(InputYear);
    val(InputYear,CurrentYear,Error);
    if (Error<>0) or (CurrentYear<1) then
    begin
      writeln('Incorrect data');
      FlagYear:=false;
    end;
    if (CurrentMonth=2) and (CurrentDay=29) then
      if (CurrentYear mod 4<>0) then
      begin
        writeln('Incorrect day');
        FlagYear:=false;
      end
      else
        if (CurrentYear mod 100=0) then
          if (CurrentYear mod 400=0) then
          else
          begin
            writeln('Incorrect data');
            FlagYear:=false;
        end;
    until (Error=0) and (CurrentYear>=1) and (FlagYear=true);

  I:=1;
  Month:=January;
  While I<>CurrentMonth do
  begin
    I:=I+1;
    Month:=succ(Month);
  end;

  if CurrentMonth<=2 then
  begin
    MonthSaved:=CurrentMonth+12;
    YearSaved:=CurrentYear-1;
  end
  else
  begin
    MonthSaved:=CurrentMonth;
    YearSaved:=CurrentYear;
  end;

  CenturyYear:=YearSaved mod 100;
  ZCentury:=YearSaved div 100;

  DayOfWeek:=(CurrentDay+13*(MonthSaved+1) div 5 + 5*(CenturyYear) div 4 + 21*(ZCentury) div 4 ) mod 7;
  DayOfWeek:=((DayOfWeek+5) mod 7)+1;

  I:=1;
  Day:=Mon;
  while DayOfWeek<>I do
  begin
    I:=I+1;
    Day:=succ(Day);
  end;

  writeln;
  writeln('Current date is ',CurrentDay,' ',ArrMonth[ord(Month)+1],' ',CurrentYear);
  writeln('Current day is ',ArrDay[Day]);

  FlagLeap:=false;
  if CurrentYear mod 4 =0 then
  begin
    FlagLeap:=true;
    if CurrentYear mod 100 = 0 then
    begin
      FlagLeap:=False;
      if CurrentYear mod 400 = 0 then
        FlagLeap:=true;
    end;
  end;

  NextYear:=CurrentYear;

  case CurrentMonth of
  1,3,5,7,8,10:
    if CurrentDay=31 then
    begin
      NextDay:=1;
      Month:=Succ(Month);
    end
    else
      NextDay:=CurrentDay+1;
  4,6,9,11:
    if CurrentDay=30 then
    begin
      NextDay:=1;
      Month:=Succ(Month);
    end
    else
      NextDay:=CurrentDay+1;
  2:
    if FlagLeap=true then
      if CurrentDay=29 then
      begin
        NextDay:=1;
        Month:=Succ(Month);
      end
      else
        NextDay:=CurrentDay+1
    else
      if CurrentDay=28 then
      begin
        NextDay:=1;
        Month:=Succ(Month);
      end
      else
        NextDay:=CurrentDay+1;
  12:
    if CurrentDay=31 then
    begin
      NextDay:=1;
      Month:=Succ(Month);
      NextYear:=NextYear+1;
    end
    else
      NextDay:=CurrentDay+1
  else
    writeln('Error');
  end;

  if DayOfWeek=7 then
    Day:=Mon
  else
    Day:=succ(Day);

  writeln;
  writeln('The next date is ',NextDay,' ',ArrMonth[ord(Month)+1],' ',NextYear);
  writeln('The next day is ',ArrDay[Day]);

  readln;
end.


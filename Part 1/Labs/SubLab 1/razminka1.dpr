Program razminka1;
  {Monahi монахов имели pirogi пирогов.
   Монахи должны есть пироги по чину.
   Ведущие по PVed, простые по PProst, ученики по PUchen.
   Сколько было ведущих монахов, простых и учеников.}

{$APPTYPE CONSOLE}

uses
  SysUtils;

Var
  DataUchen,DataProst,DataVed,DataM,DataP:string;
  Pirogi,PVed,PProst,PUchen,K:real;
  Ved,Prost,Uchen,Monahi,error:integer;
  Flag:boolean;
  {Pirogi - общее число пирогов. Используется в расчетах.
   PVed - число пирогов, которое едят ведущие монахи. Используется в расчетах.
   PProst - число пирогов, которое едят простые монахи. Используется в расчетах.
   PUchen - число пирогов, которое едят ученики. Используется в расчетах.
   K - коэффицент, который изначально приравнивается к
   числу пирогов, которое едят высшие монахи. Если высшие
   монахи голодают, то коэффицент принимет значение, равное
   числу монахов.
   Ved - число ведущих монахов.
   Prost - число простых монахов.
   Uchen - число учеников.
   Monahi - общее число монахов. Используется в расчетах.
   Flag - в случае, если решений нет, позволяет вывести
   сообщение об этом.
   Error - используется для проверки вводимых польхователем данных.
   DataUchen - проверяемое перед расчетами число пирогов, которое едят ученики.
   DataProst - проверяемое перед расчетами число пирогов, которое едят простые монахи.
   DataVed - проверяемое перед расчетами число пирогов, которое едят ведущие монахи.
   DataP - проверяемое перед расчетами число пирогов.
   DataM - проверяемое перед расчетами число монахов.}

Begin

  {Ввод необходимых для рассчетов значений: числа пирогов,
   монахов,количества пирогов, которое едят разные категории.
   Проверка корректности введенных данных.
   Присвоение изнаальных значений для Flag и  K.}
  repeat
    writeln('Enter the number of pies.');
    readln(DataP);
    val(DataP,Pirogi,Error);
    if (Error<>0) or (Pirogi<0) then
      writeln('Incorrect data.');
  until (Error=0) and (Pirogi>=0);
  repeat
    writeln('Enter the number of monks.');
    readln(DataM);
    val(DataM,Monahi,Error);
    if (Error<>0) or (Monahi<0) then
      writeln('Incorrect data.');
  until (Error=0) and (Monahi>=0);
  repeat
    writeln('Enter the number of pies the leading monks eat.');
    readln(DataVed);
    val(DataVed,PVed,Error);
    if (Error<>0) or (PVed<0) then
      writeln('Incorrect data.');
  until(Error=0) and (Pved>=0);
  repeat
    writeln('Enter the number of pies the ordinary monks eat.');
    readln(DataProst);
    val(DataProst,PProst,Error);
    if (Error<>0) or (PProst<0) or (PProst=PVed) then
      writeln('Incorrect data.');
  until (Error=0) and (PProst>=0) and (PProst<>PVed);
  repeat
    writeln('Enter the number of pies the students eat.');
    readln(DataUchen);
    val(DataUchen,PUchen,Error);
    if (Error<>0) or (PUchen<0) or (PProst=PUchen) or (PVed=PUchen) then
      writeln('Incorrect data.');
  until (Error=0) and (PUchen>=0) and (PProst<>PUchen) and (PVed<>PUchen);
  Flag := false;

  {Если ведущие монахи едят 0 пирогов, то дальнейшие
   вычисления невозможны, поэтому введен коэффицент K,
   значение которого изменяется в зависимости от того,
   едят ли высшие монахи пироги.}
  if PVed = 0 then
    K := 1
  else
    K:=PVed;

  {Начало цикла А1 для поиска числа ведущих монахов.
   Цикл идет от 0 до максимального значения ведущих мона-
   хов с шагом 1.}
  for Ved := 0 to trunc(Pirogi/K) do
  begin

    {Если все категории монахов едят разное количество
     пирогов, то рассчет будет проводиться по следующей формуле:}
    Prost := trunc((PUchen*Ved+Pirogi-PVed*Ved-PUchen*Monahi)/(PProst-PUchen));
    if Prost >=0 then
      Uchen := Monahi-Prost-Ved;

    {Проверка соответствия условиям и вывод информации.}
    if (Uchen+Ved+Prost = Monahi) and (Ved*PVed+Prost*PProst+Uchen*PUchen = Pirogi) and (Uchen >= 0) then
    begin
      writeln;
      writeln('Leading monks:',Ved);
      writeln('Ordinary monks:',Prost);
      writeln('Students:',Uchen);
      writeln;
      Flag := true;
    end;
  end;
  {Конец цикла А1.}

  {Если ни одного решения не было найдено, то программа сообщает об этом.}
  if Flag = false then
    writeln('No solutions.');

  readln;

end.








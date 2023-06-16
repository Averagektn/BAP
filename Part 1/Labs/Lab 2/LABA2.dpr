Program LABA2;
{Программа ищет все меньшие 106 натуральные числа, которые являются палиндромами
 как в десятичной, так и в двоичной системах счисления}

{$APPTYPE CONSOLE}

Var
  DecStr,BinStr:string;
  Error:integer;
  // DecStr - проверка вводимых данных
  // Error - проверка вводимых данных
  // BinStr - вывод числа в двоичной системе}

  Num,NumSaved:integer;
  // Num - исходное число
  // NumSaved - хранит веденное пользователем значение
 
  I,CountDec,CountBin:integer;
  // I - счетчик в циклах А1 - А8
  // CountDec - размер числа в десятичной системе
  // CountBin - размер числа в двоичной системе 

  Binary:array[1..20] of integer;
  Decimal:array[1..6] of integer;
  PalDec:array[1..6] of integer;
  PalBin:array[1..20] of integer;
  // Binary - цифры числа в двоичной системе 
  // Decimal - цифры числа в десятичной системе
  // PalDec - инвертированное число в десятичной системе
  // PalBin - инвертированное число в двоичной системе

  FlagDec,FlagBin:boolean;
  // FlagDec - проверка числа на палиндром в десятичной системе
  // FlagBin - проверка числа на палиндром в двоичной системе

begin

 CountBin:=0;
 CountDec:=0;
 
  // Проверка вводимого пользователем числа
  repeat
    writeln('Enter a natural number less than 1000000.');
    readln(DecStr);
    val(DecStr,Num,Error);
    if (Num>1000000) or (Error<>0) or (Num<=0) then
      writeln('Incorrect data')
  until (Num<1000000) and (Error=0) and (Num>0);

  // Сохраняем введенное пользователем число
  NumSaved:=Num;

  // Изначально считаем введенное число палиндромом
  FlagDec:=true;
  FlagBin:=true;

  {Начало цикла А1. Вычисляем размер числа в десятичной системе}
  repeat
    Num:=Num div 10;
    CountDec:=CountDec+1;
  until Num=0;
  // Конец цикла А1.

  // Возвращаем Num исходное значение
  Num:=NumSaved;

  {Начало цикла А2 по I. I меняет свои значения от 1 до CountDec с шагом 1.
   Записываем цифры числа в массив в прямом порядке}
  for I:=1 to CountDec do
  begin
    Decimal[I]:=Num mod 10;
    Num:=Num div 10;
  end;
  // Конец цикла А2

  // Возвращаем Num исходное значение
  Num:=NumSaved;

  {Начало цикла А3 по I. I меняет свои значения от CountDec до 1 с шагом 1.
   Записываем цифры числа в массив в обратном порядке}
  for I:=CountDec downto 1 do
    PalDec[I]:=Decimal[CountDec-I+1];
  // Конец цикла А3

  {Начало цикла А4 по I. I меняет свои значения от 1 до CountDec с шагом 1.
   Проверка числа на палидром в десятичной системе}
  for I:=1 to CountDec div 2 do
    if PalDec[I]<>Decimal[I] then
      FlagDec:=false;
  // Конец цикла А4

  {Вывод сообщения о том, является ли число палиндромом в десятичной системе}
  if FlagDec=false then
    writeln('Number ',NumSaved,' is not a decimal palindrome.')
  else
    writeln('Number ',NumSaved,' is a decimal palindrome');

  {Начало цикла А5. Вычисляем размер числа в двоичной системе}
  repeat
    Num:=Num div 2;
    CountBin:=CountBin+1;
  until Num=0;
  // Конец цикла А5

  // Возвращаем Num изначальное значение
  Num:=NumSaved;

  {Начало цикла А6 по I. I меняет свое значение от 1 до CountBin с шагом 1.
   Перевод числа в двоичную систему. Число вводится в массив в прямом порядке}
  for I:=1 to CountBin do
  Begin
    if Num mod 2=0 then
    begin
      Binary[I]:=0;
      BinStr:='0'+BinStr;
    end
    else
    begin
      Binary[I]:=1;
      BinStr:='1'+BinStr;
    end;
    Num:=Num div 2;
  end;
  // Конец цикла А6


  // Возвращаем Num изначальное значение
  Num:=NumSaved;

  {Начало цикла А7 по I. I меняет свое значение от CountBin до 1 с шагом 1.
   Ввод числа в двоичной системе в массив в обратном порядке}
  for I:=CountBin downto 1 do
    PalBin[I]:=Binary[CountBin-I+1];
  // Конец цикла А7

  {Начало цикла А8 по I. I меняет свое значение от 1 до CountBin с шагом 1.
   Проверка числа на палиндром в двоичной системе}
  for I:=1 to CountBin div 2 do
    if PalBin[I]<>Binary[I] then
      FlagBin:=false;
  // Конец цикла А8

  {Вывод сообщения о том, является ли число палиндромом в двоичной системе}
  if FlagBin=false then
    writeln('Number ',NumSaved,' is equal to ',BinStr,' in binary system and is not a palindrome')
  else
    writeln('Number ',NumSaved,' is equal to ',BinStr,' in binary system and is a palindrome');

  {Вывод сообщения о том, что число является палиндромом в обеих системах}
  if (FlagDec=true) and (FlagBin=true) then
    writeln(NumSaved,' is a palindrome in both systems');

  readln;
end.


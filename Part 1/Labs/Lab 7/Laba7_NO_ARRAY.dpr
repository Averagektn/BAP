Program Laba7_NO_ARRAY;
{Дана последовательность, содержащая от 2 до 50 слов, в 
 каждом из которых от 1 до 8 строчных латинских букв; 
 между соседними словами - запятая или не менее одного 
 пробела, за последним словом - точка. Напечатать те 
 слова последовательности, которые отличны от послед-
 него слова, предварительно преобразовав каждое слово 
 по следующему правилу: если слово нечетной длины, то 
 удалить все вхождения его средней буквы}

// Консольное приложение
{$APPTYPE CONSOLE}

// Объявление констант
Const
  ValidLetters=['a'..'z'];
  M=50;
// ValidLetters - допустимые символы
// M - максимальное число слов

// Объявление переменных
Var
  Letter:char;
  Input,InputSaved:string;
  I,J,N,Finish:integer;
  LastWord,CurrentWord:string;
  Flag:boolean;
// Letter - средняя буква слова нечетной длины
	// Input - исходная строка
	// InputSaved - копия исходной строки
	// Words - массив, содержащий слова из введенной строки
	// I,J - счетчик цикла
	// N - число слов в массиве
	// Finish - положение первого пробела в строке
	// Flag - проверка ввода и вывода

Begin

  // Ввод исходной строки
  repeat
    Flag:=true;
    writeln('Enter words');
    readln(Input);

    // Сохранение исходной строки
    InputSaved:=Input;
    if Input[length(Input)]<>'.' then
    begin
      Flag:=false;
      writeln('Enter . in the end');
    end;

    // Проверка символов перед точкой в конце строки
    if (Input[length(Input)-1]=' ') or 
       (Input[length(Input)-1]=',') then
    begin
      Flag:=false;
      writeln('Incorrect input');
    end;
  until Flag=true;

  (*Начало цикла А1 по I. I изменяет свои значения от 1 
    до length(Input)-1 с шагом 1. Замена всех запятых, 
    отделяющих слова, на пробелы*)
  for I:=1 to length(Input)-1 do
    if Input[I]=',' then
      Input[I]:=' ';
  // Конец цикла А1

  // Присвоение начальных значений. Изначально текущее 
  // и последнее слово не скопировано из строки. Счита-
  // ется что пробел, отделяющий последнее слово от 
  // предыдущего стоит перед точкой
  CurrentWord:='';
  LastWord:='';
  I:=length(Input)-1;

  (*Начало цикла А2. Цикл выполняется до тех пор, пока 
    не будет найдено последнее слово. Обработка всех 
    слов строки*)
  while LastWord='' do
 
    // Поиск пробела, отделяющего последнее слово
    if Input[I]=' ' then
    begin
   
      (*Начало цикла А2.1 по J. J изменяет свои значе-
        ния от I до length(Input-2) с шагом 1. Слово 
        заносится в переменную поэлементно*)
      for J:=I to length(Input)-2 do
        LastWord:=LastWord+Input[J+1];
      // Конец цикла А2.1
      // Удаление последнего слова из исходной строки
      delete(Input,I,length(Input)-I+1);
    end
    else
      I:=I-1;
  // Конец цикла А2

  writeln;

  // Присвоение начальных значений. Изначально счита-
  // ется, что введено 0 слов, исключая последнее
  N:=0;

  writeln('Words after all changes: ');

  (*Начало цикла А3. Цикл выполняется до тех пор, пока 
    исходная строка не будет полностью удалена. Осу-
    ществляется анализ и вывод обработанных слов от-
    дельно*)
  repeat
    
    // Увеличение числа обработанных слов
    N:=N+1;

    // Присвоение начальных значений. Изначально счита-
    // ется, что слово содержит корректные символы
    Flag:=true;

    // Поиск положения первого пробела в строке
    Finish:=pos(' ',Input);

    // Копирование текущего слова из исходной строки
    CurrentWord:=copy(Input,1,Finish-1);

    // Удаление текущего слова и пробела после него из 
    // исходной строки
    delete(Input,1,Finish);

    (*Начало цикла А3.1. Цикл выполняется до тех пор, 
      пока пробел перестанет быть первым сиволом в 
      строке. Удаление пробелов из начала строки*)
    while Input[1]=' ' do
      delete(Input,1,1);
    // Конец цикла А3.1




    // Если пробелов не осталось, то в строке осталось 
    // только одно слово
    if Finish=0 then
    begin
      CurrentWord:=Input;
      Input:='';
    end;

    // Проверка длины слова
    if length(CurrentWord)>8 then
    begin
      writeln('Too many symbols in word ',CurrentWord);
      CurrentWord:='';
    end;

    (*Начало цикла А3.2 по J. J принимает значения от 1 
      до length(CurrentWord) с шагом 1. Проверка кор-
      ректности символов слова*)
    for J:=1 to length(CurrentWord) do
      if CurrentWord[J] in ValidLetters then
      else
        Flag:=false;
    // Конец цикла А3.2

    // Если слово содержит некорректные символы, слово 
    // удаляется и программа сообщает о некорректных 
    // символах
    if Flag=false then
    begin
      writeln('Incorrect symbols in word ',
               CurrentWord);
      CurrentWord:='';
    end;

    // Если слово идентично последнему, оно удаляется
    if (CurrentWord=LastWord) or (CurrentWord='') then
      CurrentWord:=''
    else
  
      // Поиск слов нечетной длины и его средней буквы
      if Length(CurrentWord) mod 2=1 then
      begin
        Letter:=CurrentWord[Length(CurrentWord) div 2 
                            + 1];




        (*Начало цикла А3.3 по J. J изменяет свои зна-
          чения от length(CurrentWord) до 1 с шагом 1. 
          Удаление вхождений средней буквы с слово не-
          четной длины*)
        for J:=length(CurrentWord) downto 1 do
          if CurrentWord[J]=Letter then
            delete(CurrentWord,J,1);
        // Конец цикла А3.3
 
      end;

    // Если слово не было удалено, оно выводится на 
    // экран
    if (CurrentWord<>'') then
      writeln(CurrentWord);

    // Если введено больше 50 слов, программа анализи-
    // рует только первые 49 слов и последнее
    if N>49 then
    begin
      Input:='';
      writeln('Too many words ');
    end;

  until Input='';
  // Конец цикла А3

  (*Начало цикла А4 по I. I принимает значения от 1 до 
    length(LastWord) с шагом 1. Проверка корректности 
    символов последнего слова*)
  for I:=1 to length(LastWord) do
    if LastWord[I] in ValidLetters then
      Flag:=true
    else
      Flag:=false;
  // Конец цикла А4

  // Проверка длины последнего слова
  if length(LastWord)>8 then
    Flag:=false;

  if Flag=true then
    writeln('Last word: ',LastWord)
  else
    writeln('Last word is incorrect');

  readln;
end.



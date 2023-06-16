{Бактерии могут быть двух цветов: зеленые и красные. Красная бактерия за один
 такт времени меняет свой цвет на зеленый, а зеленая делится на красную и
 зеленую. Сколько всего бактерий (красных и зеленых) будет через K тактов
 времени, если изначально было N красных бактерий.
 Вывести зависимости числа бактерий на текущем такте от числа бактерий на
 предыдущих тактах.
 Добавить возможность ввода числа зеленых бактерий.}
Program razminka2;

{$APPTYPE CONSOLE}

Var
  Flag,Flag1:boolean;
  K,N,Red,Green,GreenSave,RedSave:integer;
  {Flag - проверка корректности вычислений. В случае переполнения принимает
   значение false и вычисления прекращаются
   K - число тактов
   N - счетчик числа тактов. В случае преждевременного завершения вычислений
   выводит последний такт с корректными данными
   Red - число красных бактерий, число бактерий на текущем такте
   Green - число зеленых бактерий на текущем шаге
   GreenSave - число зеленых бактерий на предыдущем такте. Используется при
   выводе числа зеленых бактерий
   RedSave - число красных бактерий на предыдущем шаге
   Используется при выводе числа красных бактерий}

  RedTemp1,GreenTemp1,RedTemp2,GreenTemp2,GreenTemp:integer;
  {RedTemp1 - число красных бактерий на нечетных тактах
   GreenTemp1 - число зеленых бактерий на нечетных тактах
   RedTemp2 - число красных бактерий на четных тактах
   GreenTemp2 - число зеленых бактерий на нечетных тактах
   GreenTemp - хранит начальное число зеленых бактерий}

  Error:integer;
  KStr,RedStr,GreenStr:string;
  {Error - проверка вводимых данных
   KStr - вводимое число тактов
   RedStr - вводимое число красных бактерий
   GreenStr - вводимое число зеленых бактерий}

begin

  //Ввод и проверка числа тактов
  repeat
  writeln('Enter the number of steps');
  readln(KStr);
  val(KStr,K,Error);
  if (Error<>0) or (K<0) then
    writeln('Incorrect data');
  until (Error=0) and (K>=0);

  //Ввод и проверка числа красных бактерий
  repeat
  writeln('Enter the number of red bacteria');
  readln(RedStr);
  val(RedStr,Red,Error);
  if (Error<>0) or (Red<0) then
    writeln('Incorrect data');
  until (Error=0) and (Red>=0);

  //Ввод и проверка числа зеленых бактерий
  repeat
  Flag1:=true;
  writeln('Enter the number of green bacteria');
  readln(GreenStr);
  val(GreenStr,Green,Error);
  if (Green=Red) and (Red=0) then
  begin
    writeln('Incorrect data');
    Flag1:=false;
  end;
  if (Error<>0) or (Green<0) then
    writeln('Incorrect data');
  until (Error=0) and (Green>=0) and (Flag1=true);

  writeln;
  GreenTemp:=Green;
  GreenSave:=0;
  RedSave:=0;
  RedTemp1:=Green;
  GreenTemp1:=Red+Green;
  RedTemp2:=Red;
  GreenTemp2:=Green;
  Flag:=true;
  N:=0;

  //Начало первого вариана решения, используя число бактрий на предыдущем шаге
  writeln('First variant:');

  {Начало цикла А1. Цикл выполняется, пока текущее количество тактов не станет
   больше введенного, либо не произойдет переполнение. N изменяется от 0 до K с
   шагом 1}
  while (Flag=true) and (K>=N) do
  begin
    RedSave:=Red;     //Сохраняем число красных бактерий.
    GreenSave:=Green; //Сохраняем значение зеленых бактерий, т.к. потом они превратятся в красные.
    Green:=Green+Red; //К зелёным прибавляем красные, которые преврящаются в зеленые.
    Red:=GreenSave;   //Приравниваем число красных к числу зеленых на предыдущем шаге.
    N:=N+1;           //Увеличиваем число тактов на 1.

    {Если возникает ошибка, и программа не может посчитать число бактерий
     корректно, то выводится сообщение о невозможности дальнейших вычислений,
     последний корректный такт и количество бактерий на этом такте.}
    if GreenSave>Green then
    begin
      writeln('Impossible to count. Last valid step number: ',N-1);
      Flag:=false;
    end;
  end;
  //Конец цикла А1.

  writeln('Red bacteria: ',RedSave,'. Green bacteria: ',GreenSave);
  writeln;

  {Начало второго варианта решения, используя число бактерий 2 такта назад.
   Число тактов изначально равно 2, т.к. вычисления вы
   полняются при помощи числа бактерий 2 такта назад.}
  writeln('Second variant:');
  Green:=GreenTemp; //Возващение начального числа зеленых бактерий
  Flag:=true;       //Присвоение начального значения
  N:=2;             //Вычисления возможны при числе тактов >= 2

  {Если число тактов меньше 2, программа сообщит об ошибке и вычисления
   проводиться не будут, пока пользователь не введет корректные данные.}
  if K<N then
  begin
    writeln('Incorrect data. Enter more than one step');
    writeln('You entered: ');
    writeln('Number of steps: ',K);
    Flag:=false;
  end;

  {Начало цикла А2. Цикл выполняется, пока текущее количество тактов не станет
   больше введенного, либо не произойдет переполнение.}
  while (Flag=true) and (K>=N) do
  begin
    Red:=RedTemp2+GreenTemp2;
    Green:=Red+GreenTemp2;
    N:=N+1;

    {Если произошло переполнение, то программа сообщит об этом и выведет
     последний корректный такт}
    if Green<0 then
    begin
      writeln('Impossible to count. Last valid step number: ',N-2);
      Flag:=false;
    end
    else
    begin
      RedTemp2:=Red;
      GreenTemp2:=Green;
      Red:=RedTemp1+GreenTemp1;
      Green:=Red+GreenTemp1;
      RedTemp1:=Red;
      GreenTemp1:=Green;
      N:=N+1;
    end;

    if (Green<0) and (Flag=true) then
    begin
      writeln('Impossible to count. Last valid step number: ',N-2);
      Flag:=false;
    end;
  end;
  //Конец цикла А2.

  {Если в ходе вычислений программа не сообщила об ошибке, то количество
   пройденных тактов равно введенному}
  if Flag=true then
    N:=K;

    {Если было пройдено четное количество тактов, то программа выведет значения,
     сохраненные в переменные для четного числа тактов.
     Если было пройдено нечетное количество тактов, то программа выведет значения,
     сохраненные в переменные для нечетного числа тактов.}
    if N mod 2 = 0 then
      writeln('Red bacteria: ',RedTemp2,'. Green bacteria: ',GreenTemp2)
    else
      writeln('Red bacteria: ',RedTemp1,'. Green bacteria: ',GreenTemp1);
  readln;
end.


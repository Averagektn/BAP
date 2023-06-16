Program razminka3;
(*Одна дискета стоит 11.5. Коробка дискет содержит 12   
  дискет и стоит 114.5. Ящик содержит 12 коробок и 
  стоит 1255. Купить N дискет, заплатив наименьшую 
  стоимость.Программа рассчитывает минимальную стои-
  мость покупки N числа дисков*)

// Консольное приложение
{$APPTYPE CONSOLE}

Const
  Box=12;
  Chest=144;
  PrDisc=11.5;
  PrBox=114.5;
  PrChest=1255;
  // Box - число дискет в коробке. В одной коробке 12 
  // дискет.
  // Chest - число дискет в ящике. В одном ящике 144 
  // дискеты.
  // PrDisc - цена 1 дискеты.
  // PrBox - цена 1 коробки.
  // PrChest - цена 1 ящика.

Var
  Price:real;
  N,TotalDisc,TotalBoxes,TotalChests:integer;
  // Price - минимальная цена всех дискет.
  // N - число дискет, введенное пользователем.
  // TotalDisc - число дискет, пробретенных поштучно. 
  // TotalBoxes - число приобретенных коробок.
  // TotalChests - число приобретенных ящиков.

  Error:integer;
  Num:string;
  // Error,Num - проверка вводимых данных

Begin

  // Ввод и проверка данных
  repeat
    write('Enter the number of floppy disks: ');
    readln(Num);
    val (Num,N,Error);
    if (Error<>0) or (N<=0) then
      writeln('Incorrect data')
  until (Error=0) and (N>0);

  (*Если дискет меньше 10, то выгоднее купить их поштучно*)
  if N < 10 then
    Price:=N*PrDisc;

  (*Если дискет больше или равно 10 и меньше или равно 129, то выгоднее купить
    их коробками. При этом, если количество дискет при делении на их количество
    в коробке дает в остатке 10 и выше, то выгоднее купить лишнюю коробку*)
  if (N >= 10) and (N <= 129) then
    if N mod Box < 10 then
      Price:=(N div Box)*PrBox+(N-(N div Box)*Box)*  
             PrDisc
    else
      Price:=(N div Box+1)*PrBox;

  (*Если дискет более 129, то выгоднее купить ящиками. При этом, если количество
    дискет при делении на их количество в ящике дает в остатке 130 и выше,то вы-
    годнее купить лишний ящик. Если количество дискет при делении на их
    количество в коробке дает в остатке 10 и выше, то выгоднее купить лишнюю
    коробку*)
  if N > 129 then
    if N mod Chest <= 129 then
      if N mod Box < 10 then
             Price:=(N div Chest)*PrChest+((N-(N div Chest)   
                *Chest) div Box)*PrBox+(N-(N div Box)*  
                Box)*PrDisc
      else
        Price:=(N div Chest)*PrChest+(((N-(N div Chest) 
               *Chest) div Box)+1)*PrBox
    else
        Price:=(N div Chest + 1)*PrChest;
  writeln('The lowest cost of ',N,' floppy disks is:',  
           Price:0:1);


  // Вычисление и вывод числа ящиков, коробок и дискет
  TotalChests:=trunc(Price/PrChest);
  Price:=Price-TotalChests*PrChest;
  TotalBoxes:=trunc(Price/PrBox);
  Price:=Price-TotalBoxes*PrBox;
  TotalDisc:=trunc(Price/PrDisc);
  writeln;
  writeln('Total chests purchased: ',TotalChests);
  writeln;
  writeln('Total boxes purchased: ',TotalBoxes);
  writeln;
  writeln('Total single floppy discs purchased: ',
           TotalDisc);

  readln;
end.





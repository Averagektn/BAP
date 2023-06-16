Program MergeFile_Integer_Final;

{$APPTYPE CONSOLE}

Const
  Num = 9;
  FileName = 'File.txt';

Type
  TComp = Function (Const Param1,Param2: Integer): Boolean;
  // Выбор сотрировки (по возрастанию или убыванию)

  TFile = File of Integer;

Var
  Txt: TFile;
  // Исходный файл

// Заполнение файла
Procedure Fill(Const Name: String; Var F: TFile; Const N: Integer);
Var
  I,Tmp: Integer;
begin
  writeln('Input :');
  Randomize;
  Assign(F,Name);
  Rewrite(F);
  for I := 0 to N do
  begin
    Tmp := Random(1000);
    write(F,Tmp);
    write(Tmp,' ');
  end;
  CloseFile(F);
end;

// По убыванию
Function Descend (Const Param1,Param2: Integer): Boolean;
begin
  Descend := Param1 > Param2;
end;

// По возрастанию
Function Ascend (Const Param1,Param2: Integer): Boolean;
begin
  Ascend := Param1 < Param2;
end;

Procedure Output(Const Name: String; Var F: TFile; Const N: Integer);
Var
  Tmp: Integer;
begin
  writeln('Output :');
  AssignFile(F,Name);
  Reset(F);
  while not EoF(F) do
  begin
    read(F,Tmp);
    write(Tmp,' ');
  end;
  CloseFile(F);
end;

// Сортировка
Procedure MergeSort(Compare: TComp; Const Name: string; var F: TFile);
Const
  Supp1Name = 'Supp1.txt';
  Supp2Name = 'Supp2.txt';
Type
  TSupp = 1..2;
Var
  Supp: TSupp;
  Series,Tmp1,Tmp2,Tmp,Save1,Save2: Integer;
  F1,F2: TFile;
begin

  Assign(F,Name);
  Assign(F1,Supp1Name);
  Assign(F2,Supp2Name);

  repeat
    Supp := 1;
    Series := 1;

    Reset(F);
    Rewrite(F1);
    Rewrite(F2);

    // Первый элемент в первый файл
    read(F,Tmp1);
    write(F1,Tmp1);

    // Запись всех значений в F1 F2 сериями. Серия прекращается если элемент меньше предыдущего
    while not EoF(F) do
    begin
      read(F,Tmp2);

      // Сравнение по передаваемому в процедуру условию
      if Compare(Tmp2,Tmp1) then
      begin
        if Supp = 1 then
          Supp := 2
        else
          Supp := 1;
        Inc(Series);
      end;
      if Supp = 1 then
        write(F1,Tmp2)
      else
        write(F2,Tmp2);
      Tmp1 := Tmp2;
    end;

    // Это костыль :)
    (*Я не знаю почему но когда читаешь типизированный файл последняя цифра
      каждого из вспомогательных файлов не записывается, поэтому в конец пишем
      нули(можно любое число). На сортировку не влияет*)
    Tmp := 0;
    write(F1,Tmp);
    write(F2,Tmp);

    Rewrite(F);
    Reset(F1);
    Reset(F2);

    // Сортировка отдельных серий вспомогательных файлов
    // Слияние в исходный файл
    read(F1,Tmp1);
    read(F2,Tmp2);
    Save1:=Tmp1;
    Save2:=Tmp2;

    while (not EoF(F1)) and (not EoF(F2)) do
    begin
      if Compare(Tmp1,Tmp2) then
      begin
        write(F,Tmp1);
        Save1 := Tmp1;
        read(F1,Tmp1);
      end
      else
      begin
        write(F,Tmp2);
        Save2 := Tmp2;
        read(F2,Tmp2);
      end;

      if Compare(Tmp1,Save1) then
        while Compare(Save2,Tmp2) do
        begin
          write(F,Tmp2);
          Save2 := Tmp2;
          read(F2,Tmp2);
        end;

      if Compare(Tmp2,Save2) then
        while Compare(Save1,Tmp1) do
        begin
          write(F,Tmp1);
          Save1 := Tmp1;
          read(F1,Tmp1);
        end;
    end;

    // Если одна серия одного из файлов кончилась, записываем элементы оставшейся серии в исходный файл подряд
    while not EoF(F1) do
    begin
      Tmp := Tmp1;
      read(F1,Tmp1);
      write(F,Tmp)
      end;

    while not EoF(F2) do
    begin
      Tmp := Tmp2;
      read(F2,Tmp2);
      write(F,Tmp)
    end;

  until Series = 1;

  CloseFile(F);
  CloseFile(F1);
  CloseFile(F2);

  // Удаление вспомогательных файлов
  Erase(F1);
  Erase(F2);
end;

begin
  Fill(FileName,Txt,Num);
  MergeSort(Ascend,FileName,Txt);
  writeln;
  Output(FileName,Txt,Num);
  readln;
end.

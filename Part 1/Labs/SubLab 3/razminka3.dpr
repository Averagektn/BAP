Program razminka3;
(*���� ������� ����� 11.5. ������� ������ �������� 12   
  ������ � ����� 114.5. ���� �������� 12 ������� � 
  ����� 1255. ������ N ������, �������� ���������� 
  ���������.��������� ������������ ����������� ����-
  ����� ������� N ����� ������*)

// ���������� ����������
{$APPTYPE CONSOLE}

Const
  Box=12;
  Chest=144;
  PrDisc=11.5;
  PrBox=114.5;
  PrChest=1255;
  // Box - ����� ������ � �������. � ����� ������� 12 
  // ������.
  // Chest - ����� ������ � �����. � ����� ����� 144 
  // �������.
  // PrDisc - ���� 1 �������.
  // PrBox - ���� 1 �������.
  // PrChest - ���� 1 �����.

Var
  Price:real;
  N,TotalDisc,TotalBoxes,TotalChests:integer;
  // Price - ����������� ���� ���� ������.
  // N - ����� ������, ��������� �������������.
  // TotalDisc - ����� ������, ������������ ��������. 
  // TotalBoxes - ����� ������������� �������.
  // TotalChests - ����� ������������� ������.

  Error:integer;
  Num:string;
  // Error,Num - �������� �������� ������

Begin

  // ���� � �������� ������
  repeat
    write('Enter the number of floppy disks: ');
    readln(Num);
    val (Num,N,Error);
    if (Error<>0) or (N<=0) then
      writeln('Incorrect data')
  until (Error=0) and (N>0);

  (*���� ������ ������ 10, �� �������� ������ �� ��������*)
  if N < 10 then
    Price:=N*PrDisc;

  (*���� ������ ������ ��� ����� 10 � ������ ��� ����� 129, �� �������� ������
    �� ���������. ��� ����, ���� ���������� ������ ��� ������� �� �� ����������
    � ������� ���� � ������� 10 � ����, �� �������� ������ ������ �������*)
  if (N >= 10) and (N <= 129) then
    if N mod Box < 10 then
      Price:=(N div Box)*PrBox+(N-(N div Box)*Box)*  
             PrDisc
    else
      Price:=(N div Box+1)*PrBox;

  (*���� ������ ����� 129, �� �������� ������ �������. ��� ����, ���� ����������
    ������ ��� ������� �� �� ���������� � ����� ���� � ������� 130 � ����,�� ��-
    ������ ������ ������ ����. ���� ���������� ������ ��� ������� �� ��
    ���������� � ������� ���� � ������� 10 � ����, �� �������� ������ ������
    �������*)
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


  // ���������� � ����� ����� ������, ������� � ������
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





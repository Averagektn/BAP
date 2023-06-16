Program Laba7_NO_ARRAY;
{���� ������������������, ���������� �� 2 �� 50 ����, � 
 ������ �� ������� �� 1 �� 8 �������� ��������� ����; 
 ����� ��������� ������� - ������� ��� �� ����� ������ 
 �������, �� ��������� ������ - �����. ���������� �� 
 ����� ������������������, ������� ������� �� ������-
 ���� �����, �������������� ������������ ������ ����� 
 �� ���������� �������: ���� ����� �������� �����, �� 
 ������� ��� ��������� ��� ������� �����}

// ���������� ����������
{$APPTYPE CONSOLE}

// ���������� ��������
Const
  ValidLetters=['a'..'z'];
  M=50;
// ValidLetters - ���������� �������
// M - ������������ ����� ����

// ���������� ����������
Var
  Letter:char;
  Input,InputSaved:string;
  I,J,N,Finish:integer;
  LastWord,CurrentWord:string;
  Flag:boolean;
// Letter - ������� ����� ����� �������� �����
	// Input - �������� ������
	// InputSaved - ����� �������� ������
	// Words - ������, ���������� ����� �� ��������� ������
	// I,J - ������� �����
	// N - ����� ���� � �������
	// Finish - ��������� ������� ������� � ������
	// Flag - �������� ����� � ������

Begin

  // ���� �������� ������
  repeat
    Flag:=true;
    writeln('Enter words');
    readln(Input);

    // ���������� �������� ������
    InputSaved:=Input;
    if Input[length(Input)]<>'.' then
    begin
      Flag:=false;
      writeln('Enter . in the end');
    end;

    // �������� �������� ����� ������ � ����� ������
    if (Input[length(Input)-1]=' ') or 
       (Input[length(Input)-1]=',') then
    begin
      Flag:=false;
      writeln('Incorrect input');
    end;
  until Flag=true;

  (*������ ����� �1 �� I. I �������� ���� �������� �� 1 
    �� length(Input)-1 � ����� 1. ������ ���� �������, 
    ���������� �����, �� �������*)
  for I:=1 to length(Input)-1 do
    if Input[I]=',' then
      Input[I]:=' ';
  // ����� ����� �1

  // ���������� ��������� ��������. ���������� ������� 
  // � ��������� ����� �� ����������� �� ������. �����-
  // ���� ��� ������, ���������� ��������� ����� �� 
  // ����������� ����� ����� ������
  CurrentWord:='';
  LastWord:='';
  I:=length(Input)-1;

  (*������ ����� �2. ���� ����������� �� ��� ���, ���� 
    �� ����� ������� ��������� �����. ��������� ���� 
    ���� ������*)
  while LastWord='' do
 
    // ����� �������, ����������� ��������� �����
    if Input[I]=' ' then
    begin
   
      (*������ ����� �2.1 �� J. J �������� ���� �����-
        ��� �� I �� length(Input-2) � ����� 1. ����� 
        ��������� � ���������� �����������*)
      for J:=I to length(Input)-2 do
        LastWord:=LastWord+Input[J+1];
      // ����� ����� �2.1
      // �������� ���������� ����� �� �������� ������
      delete(Input,I,length(Input)-I+1);
    end
    else
      I:=I-1;
  // ����� ����� �2

  writeln;

  // ���������� ��������� ��������. ���������� �����-
  // ����, ��� ������� 0 ����, �������� ���������
  N:=0;

  writeln('Words after all changes: ');

  (*������ ����� �3. ���� ����������� �� ��� ���, ���� 
    �������� ������ �� ����� ��������� �������. ���-
    ����������� ������ � ����� ������������ ���� ��-
    ������*)
  repeat
    
    // ���������� ����� ������������ ����
    N:=N+1;

    // ���������� ��������� ��������. ���������� �����-
    // ����, ��� ����� �������� ���������� �������
    Flag:=true;

    // ����� ��������� ������� ������� � ������
    Finish:=pos(' ',Input);

    // ����������� �������� ����� �� �������� ������
    CurrentWord:=copy(Input,1,Finish-1);

    // �������� �������� ����� � ������� ����� ���� �� 
    // �������� ������
    delete(Input,1,Finish);

    (*������ ����� �3.1. ���� ����������� �� ��� ���, 
      ���� ������ ���������� ���� ������ ������� � 
      ������. �������� �������� �� ������ ������*)
    while Input[1]=' ' do
      delete(Input,1,1);
    // ����� ����� �3.1




    // ���� �������� �� ��������, �� � ������ �������� 
    // ������ ���� �����
    if Finish=0 then
    begin
      CurrentWord:=Input;
      Input:='';
    end;

    // �������� ����� �����
    if length(CurrentWord)>8 then
    begin
      writeln('Too many symbols in word ',CurrentWord);
      CurrentWord:='';
    end;

    (*������ ����� �3.2 �� J. J ��������� �������� �� 1 
      �� length(CurrentWord) � ����� 1. �������� ���-
      ��������� �������� �����*)
    for J:=1 to length(CurrentWord) do
      if CurrentWord[J] in ValidLetters then
      else
        Flag:=false;
    // ����� ����� �3.2

    // ���� ����� �������� ������������ �������, ����� 
    // ��������� � ��������� �������� � ������������ 
    // ��������
    if Flag=false then
    begin
      writeln('Incorrect symbols in word ',
               CurrentWord);
      CurrentWord:='';
    end;

    // ���� ����� ��������� ����������, ��� ���������
    if (CurrentWord=LastWord) or (CurrentWord='') then
      CurrentWord:=''
    else
  
      // ����� ���� �������� ����� � ��� ������� �����
      if Length(CurrentWord) mod 2=1 then
      begin
        Letter:=CurrentWord[Length(CurrentWord) div 2 
                            + 1];




        (*������ ����� �3.3 �� J. J �������� ���� ���-
          ����� �� length(CurrentWord) �� 1 � ����� 1. 
          �������� ��������� ������� ����� � ����� ��-
          ������ �����*)
        for J:=length(CurrentWord) downto 1 do
          if CurrentWord[J]=Letter then
            delete(CurrentWord,J,1);
        // ����� ����� �3.3
 
      end;

    // ���� ����� �� ���� �������, ��� ��������� �� 
    // �����
    if (CurrentWord<>'') then
      writeln(CurrentWord);

    // ���� ������� ������ 50 ����, ��������� �������-
    // ���� ������ ������ 49 ���� � ���������
    if N>49 then
    begin
      Input:='';
      writeln('Too many words ');
    end;

  until Input='';
  // ����� ����� �3

  (*������ ����� �4 �� I. I ��������� �������� �� 1 �� 
    length(LastWord) � ����� 1. �������� ������������ 
    �������� ���������� �����*)
  for I:=1 to length(LastWord) do
    if LastWord[I] in ValidLetters then
      Flag:=true
    else
      Flag:=false;
  // ����� ����� �4

  // �������� ����� ���������� �����
  if length(LastWord)>8 then
    Flag:=false;

  if Flag=true then
    writeln('Last word: ',LastWord)
  else
    writeln('Last word is incorrect');

  readln;
end.



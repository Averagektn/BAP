// Yhis program finds full squares among numbers until minus is reached
Program LAB12E;

{$APPTYPE CONSOLE}

Type

  // Queue declaration
  Pt = ^Elem;
  Elem = Record
    Data: Integer;
    Next: Pt;
  end;

  //TFile = File of Integer;
  TFile = TextFile;

Const
  //FName = 'Start';
  FName = 'Start.txt';

Var
  First,Last: Pt;

// Filling file with random numbers
Procedure ToFile(Const N: String);
Var
  I,Tmp,Select: Integer;
  F: TFile;
begin
  writeln('Numbers: ');
  Randomize;

  // Assignng starting file
  AssignFile(F,N);
  Rewrite(F);

  // 99 elements are added to file
  for I := 0 to 98 do
  begin
    Tmp := Random(3125) - 500;
    Select := Random(4);
    if Select = 0 then
    begin
      Tmp := Random(55);
      Tmp := Tmp * Tmp;
    end;
    write(F,Tmp);
    write(Tmp,' ');
  end;

  // Last element in file
  Tmp := Random(999) + 1;
  write(F,Tmp);
  CloseFile(F);
  writeln;
end;

// Pushing to the beginning of the queue
Procedure Push (Var X,Y: Pt; Const V: Integer);
Var
  PTmp: Pt;
begin

  // Adding new value
  new(PTmp);
  PTmp^.data := V;
  PTmp^.next := nil;

  // Checkong if there are elements in the queue
  if X = nil then
    X := PTmp
  else
    Y^.next := PTmp;

  Y := PTmp;
end;

// Filling in the queue
Procedure Input(Var L,R: Pt; Const Name: String);
Var
  F: TFile;
  Value: Integer;
begin

  // Reading from the file
  AssignFile(F,Name);
  Reset(F);

  // Adding element to the queue until the end of the file
  while not EoF(F) do
  begin
    Read(F,Value);
    Push(L,R,Value);
  end;

  // Saving changes
  CloseFile(F);
end;

// Finding full suares
Procedure Find (X: Pt);
Var
  Counter,Tmp,Num: Integer;
begin

  // Initializing counter of full squares
  Counter := 0;

  // Walking through the queue from the start
  while (X <> nil) and (X^.Data >= 0) do
  begin
    Num := X^.Data;

    // Cutting off fractional part
    Tmp := Trunc(exp(ln(Num) / 2));

    // Counting new square
    Tmp := Tmp * Tmp;

    // Showing current number
    if  Tmp = X^.Data then
    begin
      Inc(Counter);
      write(X^.Data,' ');
    end;

    // Moving to the next element of the queue
    X := X^.Next;
  end;

  writeln;
  writeln('Number of elements that are full squares: ',Counter);
end;

Begin
  //ToFile(FName);

  Input(First,Last,FName);

  write('Full squares are: ');
  Find(First);

  readln;
end.

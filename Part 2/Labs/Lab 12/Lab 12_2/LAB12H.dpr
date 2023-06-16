// Converting from infix form to postfix
Program LAB12H;

{$APPTYPE CONSOLE}

Type

  // Queue type
  Pt = ^Elem;
  Elem = Record
    Data: Char;
    Prev: Pt;
  end;

Type

  // Set of legal symbols
  TSet = Set of Char;

Const
  // Legal operands
  Operands = ['a'..'z','A'..'Z'];

Var
  Head: Pt;
  Str,Res: String;
  Ranc: Integer;
  Flag: Boolean;
  Inf,Postf: TextFile;

// Adding element to the queue
Procedure Push(Var X: Pt; Const Chr: Char);
Var
  TPt: Pt;
begin
  new(TPt);

  // 
  if X = nil then
    TPt^.Prev := nil
  else
    TPt^.Prev := X;

  TPt^.Data := Chr;
  X := TPt;
end;

Procedure Pop(Var X: Pt; Var Chr: Char);
begin
  if X <> nil then
  begin
    Chr := X^.Data;
    X := X^.Prev;
  end;
end;

Procedure Check(Var Flg: Boolean; Const S: String; Const Ops: TSet);
Const
  Pars = ['(',')'];
  Elems = ['a'..'z','A'..'Z','+','-','*','/','@','(',')'];
Var
  I: Integer;
begin
  Flg := true;
  for I := 2 to length(S) do
  begin
    if not(S[I] in Elems) then
      Flg := false;
    if (S[I - 1] in Ops) and (S[I] in Ops) then
      Flg := false;
    if not(S[I - 1] in Ops) and not(S[I] in Ops) and not(S[I] in Pars) and not(S[I - 1] in Pars)then
      Flg := false;
  end;
end;

Procedure ToPostfix(Const S: String; Var P: String; Var R: Integer; Var X: Pt; Const Ops: TSet);
Const
  Pars = ['(',')'];
  RArr: Array [1..12] of Integer = (9,0,3,1,-2,1,-2,3,-2,-2,-2,5);
  SArr: Array [1..12] of Integer = (0,-1,4,2,-2,2,-2,4,-2,-2,-2,6);
  MagicNumber = 13;
Var
  I: Integer;
  Symb,C: Char;
begin
  R := 0;

  for I := 1 to length(S) do
  begin

    if S[I] in Ops then
    begin
      P := P + S[I];
      Inc(R);
    end

    else

    begin
      if not (S[I] in Pars) then
        Dec(R);

      if X = nil then
      begin
        Push(X,S[I]);
      end

      else

      begin
        Symb := X^.Data;
        while (RArr[ord(Str[I]) mod MagicNumber] < SArr[ord(Symb) mod MagicNumber]) and (X <> nil) do
        begin
          Pop(X,C);
          if X <> nil then
            Symb := X^.Data;
          if not (C in Pars) then
            P := P + C;
        end;
        Push(X,S[I]);
      end;

    end;

  end;

  while X <> nil do
  begin
    Pop(X,C);

    if not (C in Pars) then
      P := P + C;
  end;
end;

Begin

//  writeln('Enter expression');
//  readln(Str);

  AssignFile(Inf,'Infix.txt');
  Reset(Inf);
  readln(Inf,Str);
  writeln('Your expression: ',Str);

  Check(Flag,Str,Operands);
  ToPostfix(Str,Res,Ranc,Head,Operands);

  AssignFile(Postf,'Postfix.txt');
  Rewrite(Postf);
  writeln(Postf,Res);
  CloseFile(Postf);

  //writeln('Ranc is: ',Ranc);
  write('Result: ');

  if (Ranc = 1) and Flag then
    writeln(Res)
  else
    writeln('Incorrect data');

  readln;
end.

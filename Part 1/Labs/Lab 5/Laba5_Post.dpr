Program Laba5_Post;

{$APPTYPE CONSOLE}

Const
  Eps1=0.0001;
  Eps2=0.00001;
  XStart=0.1;
  XFinish=0.9;
  DeltaX=0.1;

Var
  K,Minus:integer;
  Sum,Result,Numerator,X,Denomenator,Y,Delta:real;
  Flag:boolean;

begin

  X:=XStart;

  repeat
    K:=0;
    Sum:=0;
    Numerator:=0;
    Denomenator:=0;
    Flag:=true;
    Result:=0;
    Minus:=-1;
    Y:=0;
    repeat
      K:=K+1;
      Numerator:=X*exp(2*K*ln(X))*Minus;
      Denomenator:=K*(K+1)*(K+2);
      Result:=Numerator/Denomenator;
      Sum:=Sum+Result;
      Minus:=-Minus;
      Delta:=Sum-Y;
      Y:=Sum;
      if (abs(Delta)<Eps1) and (Flag=true) then
      begin
        writeln('Sum for Eps=0.0001: ',Sum:11:7);
        writeln('Number of steps: ',K);
        Flag:=false;
      end;
    until abs(Delta)<Eps2;
    writeln('Sum for Eps=0.00001: ',Sum:0:7);
    writeln('Number of steps: ',K);
    writeln('X = ',X:0:2);
    writeln;
    X:=X+DeltaX;
  until X>=Xfinish;

  readln;
end.


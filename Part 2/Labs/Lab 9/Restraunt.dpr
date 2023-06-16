program Restraunt;

uses
  Vcl.Forms,
  LAB9 in 'LAB9.pas' {Restraunt};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TRestraunt, FRestraunt);
  Application.Run;
end.

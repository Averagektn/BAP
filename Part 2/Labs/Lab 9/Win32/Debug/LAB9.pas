unit LAB9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtDlgs,
  Vcl.ComCtrls, Vcl.Samples.Spin;

type

  TRec = Record
    Plate,Table: String[255];
    Order,Portions,Total: Integer;
  End;

  Pt = ^Elem;
  Elem = Record
    Data: TRec;
    Next: Pt;
  End;



  ROrder = Record
    Order,Table,N: Integer;
    Plate: String[255];
  End;

  TFile = File of TRec;

  TAInt = Array [0..3] of Integer;
  TAStr = Array [0..3] of String[255];

  TRestraunt = class(TForm)
    cbPlate: TComboBox;
    btnFindPlate: TButton;
    btnOk: TButton;
    mmMenu: TMemo;
    seNumber: TSpinEdit;
    lblMenu: TLabel;
    lvBill: TListView;
    cbTable: TComboBox;
    lvTop: TListView;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFindPlateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const
  APrice: TAInt = (1,2,3,4);
  ADescription: TAStr = ('ABOBA','AMOGUS','SUS','COCK');
  APlate: TAStr = ('Plate 1','Plate2','Plate3','Plate4');
var
  FRestraunt: TRestraunt;
  First,Last: Pt;
  ADemand: TAInt = (0,0,0,0);
  Num: Integer;



implementation

{$R *.dfm}

Procedure Push (Var X,Y: Pt; Const R: TRec);

// Local variables declaration
Var
  PTmp: Pt;
// PTmp - new element of the queue

begin

  // Initialization
  new(PTmp);
  PTmp^.data := R;
  PTmp^.next := nil;

  // If queue is empty, it will be created
  if X = nil then
  begin
    X := PTmp;
  end

  else

  begin
    Y^.next := PTmp;
  end;

  // Adding element
  Y := PTmp;
end;

Function FindMost(Const A: TAInt): Integer;
Var
  I: Integer;
begin


end;

procedure TRestraunt.btnOkClick(Sender: TObject);
Var
  Rec: TRec;
  Item: TListItem;
  X: Pt;
begin

  with Rec do
  begin
    Plate := cbPlate.Text;
    Order := Num;
    Table := cbTable.Text;
    Portions := seNumber.Value;
    Total := seNumber.Value * APrice[cbPlate.ItemIndex];
  end;

  ADemand[cbPlate.ItemIndex] := ADemand[cbPlate.ItemIndex] + seNumber.Value;

  Push(First,Last,Rec);
  ShowMessage('Plate was added');

  Item := lvBill.Items.Add;

  Item.Caption := IntToStr(Num);
  Item.SubItems.Add(cbTable.Text);
  Item.SubItems.Add(cbPlate.Text);
  Item.SubItems.Add(IntToStr(seNumber.Value));
  Item.SubItems.Add(IntToStr(seNumber.Value * APrice[cbPlate.ItemIndex]));

  Inc(Num);
end;

procedure TRestraunt.btnFindPlateClick(Sender: TObject);
Var
  N,I,Vle: Integer;
  Item: TListItem;
begin

  N := low(ADemand);
  for I := Low(ADemand) + 1 to High(ADemand) do
    if ADemand[I] > ADemand[N] then
      N := I;

  Vle := ADemand[N];
  lvTop.Clear;

  for I := Low(ADemand) to High(ADemand) do
    if ADemand[I] = Vle then
    begin
      Item := lvTop.Items.Add;
      Item.Caption := APlate[I];
      Item.SubItems.Add(IntToStr(APrice[I]));
      Item.SubItems.Add(IntToStr(ADemand[I]));
    end;

end;

Procedure PopFile (X: Pt);

// Local variables declaration
Var
  F: TFile;
// Current file

begin

  // Assigning file, setting file mode
  AssignFile(F,'Orders');
  Rewrite(F);

  // Writing queue elements to file
  while X <> nil do
  begin
    write(F,X^.data);
    X := X^.next;
  end;

  // Saving changes
  CloseFile(F);
end;
// End of PopFile subprogram

procedure TRestraunt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PopFile(First);
end;

Procedure ReadFile (Const Name: String);

// Local variables declaration
Var
  F: File of TRec;
  Tmp: TRec;
// F - current file
// Tmp - current record

begin

  // Assigning file, setting file mode
  AssignFile(F,'Orders');
  Reset(F);

  // Pushing elements to the queue
  while not EoF(F) do
  begin
    Read(F,Tmp);
    Push(First,Last,Tmp);
  end;

  // Saving changes
  CloseFile(F);
end;
// End of ReadFile subprogram

procedure TRestraunt.FormCreate(Sender: TObject);
Var
  Item: TListItem;
  X: Pt;
  I: Integer;
begin
  Num := 1;
  ReadFile('Orders');

  X := First;

  while X <> nil do
  begin
    with X^.Data do
    begin
      Item := lvBill.Items.Add;

      Item.Caption := IntToStr(Num);
      Item.SubItems.Add(Table);
      Item.SubItems.Add(Plate);
      Item.SubItems.Add(IntToStr(Portions));
      Item.SubItems.Add(IntToStr(Total));
      for I := Low(APlate) to High(APlate) do
        if APlate[I] = Plate then
          ADemand[I] := ADemand[I] + Portions;
    end;

    X := X^.Next;
    Inc(Num);
  end;

end;

end.

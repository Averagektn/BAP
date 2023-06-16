object Restraunt: TRestraunt
  Left = 0
  Top = 0
  Caption = 'Restraunt'
  ClientHeight = 513
  ClientWidth = 768
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblMenu: TLabel
    Left = 64
    Top = 19
    Width = 47
    Height = 23
    Alignment = taCenter
    Caption = 'Menu'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object cbPlate: TComboBox
    Left = 240
    Top = 53
    Width = 185
    Height = 21
    ItemIndex = 0
    TabOrder = 0
    Text = 'Plate 1'
    Items.Strings = (
      'Plate 1'
      'Plate2'
      'Plate3'
      'Plate4')
  end
  object btnFindPlate: TButton
    Left = 256
    Top = 208
    Width = 169
    Height = 42
    Caption = 'Find the most popular plate'
    TabOrder = 1
    OnClick = btnFindPlateClick
  end
  object btnOk: TButton
    Left = 240
    Top = 152
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnOkClick
  end
  object mmMenu: TMemo
    Left = 0
    Top = 48
    Width = 201
    Height = 441
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      ''
      'Name: Plate 1'
      'Description: ...'
      'Price: 300'
      ''
      'Name: Plate 2'
      'Description: ...'
      'Price: 200'
      ''
      'Name: Plate 3'
      'Description: ...'
      'Price: 100'
      ''
      'Name: Plate 4'
      'Description: ...'
      'Price: 5500'
      '')
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object seNumber: TSpinEdit
    Left = 271
    Top = 80
    Width = 121
    Height = 22
    MaxValue = 100
    MinValue = 1
    TabOrder = 4
    Value = 1
  end
  object lvBill: TListView
    Left = 488
    Top = 48
    Width = 281
    Height = 441
    Columns = <
      item
        Caption = 'Order'
      end
      item
        Caption = 'Table'
      end
      item
        Caption = 'Plate'
      end
      item
        Caption = 'Portions'
        MinWidth = 60
        Width = 60
      end
      item
        Caption = 'Total'
      end>
    TabOrder = 5
    ViewStyle = vsReport
  end
  object cbTable: TComboBox
    Left = 240
    Top = 108
    Width = 185
    Height = 21
    TabOrder = 6
    Text = 'Table 1'
    Items.Strings = (
      'Table 1'
      'Table 2'
      'Table 3'
      'Table 4')
  end
  object lvTop: TListView
    Left = 224
    Top = 288
    Width = 245
    Height = 150
    Columns = <
      item
        Caption = 'Plate'
        Width = 80
      end
      item
        Alignment = taCenter
        Caption = 'Price'
        Width = 80
      end
      item
        Alignment = taCenter
        Caption = 'Times ordered'
        Width = 80
      end>
    TabOrder = 7
    ViewStyle = vsReport
  end
end

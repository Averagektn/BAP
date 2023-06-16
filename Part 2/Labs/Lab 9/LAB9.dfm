object Restraunt: TRestraunt
  Left = 0
  Top = 0
  Caption = 'Restraunt'
  ClientHeight = 514
  ClientWidth = 1013
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
    Left = 56
    Top = 11
    Width = 65
    Height = 33
    Alignment = taCenter
    Caption = 'Menu'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblBills: TLabel
    Left = 798
    Top = 11
    Width = 46
    Height = 33
    Alignment = taCenter
    Caption = 'Bills'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblTop: TLabel
    Left = 384
    Top = 253
    Width = 46
    Height = 33
    Alignment = taCenter
    Caption = 'Top'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblOrder: TLabel
    Left = 336
    Top = 11
    Width = 150
    Height = 33
    Alignment = taCenter
    Caption = 'Order maker'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 238
    Top = 53
    Width = 74
    Height = 19
    Alignment = taCenter
    Caption = 'Your dish:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 238
    Top = 101
    Width = 131
    Height = 19
    Alignment = taCenter
    Caption = 'Number of dishes:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 238
    Top = 148
    Width = 79
    Height = 19
    Alignment = taCenter
    Caption = 'Your table:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object cbPlate: TComboBox
    Left = 348
    Top = 50
    Width = 200
    Height = 27
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    Text = 'Apples in chicken broth'
    Items.Strings = (
      'Apples in chicken broth'
      'Bull tail soup'
      'Fried pelmen'
      'Sticky pasta')
  end
  object btnFindPlate: TButton
    Left = 287
    Top = 301
    Width = 245
    Height = 49
    Caption = 'Find the most popular plate'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnFindPlateClick
  end
  object btnOk: TButton
    Left = 348
    Top = 197
    Width = 113
    Height = 36
    Caption = 'Order'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnOkClick
  end
  object mmMenu: TMemo
    Left = 0
    Top = 50
    Width = 200
    Height = 465
    Align = alCustom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Name: Apples in chicken '
      'broth'
      'Description: '
      'Apples,oranges,chicken,'
      'ginger'
      'Price: 100'
      ''
      'Name: Bull tail soup'
      'Description: Bull tails, '
      'onions,water,liver'
      'Price: 250'
      ''
      'Name: Fried pelmen'
      'Description: '
      'Pelmen,butter,oil'
      'Price: 300'
      ''
      'Name: Sticky pasta'
      'Description: Toamato '
      'sauce,pasta,cheese'
      'Price: 4000'
      '')
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object seNumber: TSpinEdit
    Left = 448
    Top = 98
    Width = 100
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxValue = 100
    MinValue = 1
    ParentFont = False
    TabOrder = 4
    Value = 1
  end
  object lvBill: TListView
    Left = 600
    Top = 50
    Width = 411
    Height = 465
    Align = alCustom
    Columns = <
      item
        Caption = 'Order'
        Width = 60
      end
      item
        Caption = 'Table'
        Width = 70
      end
      item
        Caption = 'Plate'
        Width = 140
      end
      item
        Caption = 'Portions'
        MinWidth = 60
        Width = 70
      end
      item
        Caption = 'Total'
        Width = 60
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    ViewStyle = vsReport
  end
  object cbTable: TComboBox
    Left = 348
    Top = 148
    Width = 200
    Height = 27
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 6
    Text = 'Table 1'
    Items.Strings = (
      'Table 1'
      'Table 2'
      'Table 3'
      'Table 4')
  end
  object lvTop: TListView
    Left = 256
    Top = 356
    Width = 290
    Height = 159
    Columns = <
      item
        Caption = 'Plate'
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = 'Price'
        Width = 60
      end
      item
        Alignment = taCenter
        Caption = 'Times ordered'
        Width = 120
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    ViewStyle = vsReport
  end
end

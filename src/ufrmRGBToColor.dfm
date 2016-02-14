object frmRGBToColor: TfrmRGBToColor
  Left = 0
  Top = 0
  Caption = 'frmRGBToColor'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 27
    Width = 7
    Height = 13
    Caption = 'R'
  end
  object Label2: TLabel
    Left = 32
    Top = 54
    Width = 7
    Height = 13
    Caption = 'G'
  end
  object Label3: TLabel
    Left = 32
    Top = 81
    Width = 6
    Height = 13
    Caption = 'B'
  end
  object edtR: TEdit
    Left = 44
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtG: TEdit
    Left = 44
    Top = 51
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtB: TEdit
    Left = 44
    Top = 78
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edtResultado: TEdit
    Left = 212
    Top = 24
    Width = 141
    Height = 21
    TabOrder = 3
  end
  object Button1: TButton
    Left = 212
    Top = 76
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 4
    OnClick = Button1Click
  end
end

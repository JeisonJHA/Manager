object frmModelo: TfrmModelo
  Left = 0
  Top = 0
  Caption = 'frmModelo'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object ioeMestre: TInstantExposer
    Left = 288
    Top = 112
  end
  object ActionList: TActionList
    Left = 384
    Top = 112
  end
  object dtsMestre: TDataSource
    DataSet = ioeMestre
    Left = 288
    Top = 160
  end
end

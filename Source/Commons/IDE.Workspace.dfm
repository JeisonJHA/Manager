object frmWorkspace: TfrmWorkspace
  Left = 0
  Top = 0
  Caption = 'frmWorkspace'
  ClientHeight = 633
  ClientWidth = 959
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxTileControl1: TdxTileControl
    Left = 0
    Top = 0
    Width = 959
    Height = 633
    Images = dtmDatabase.SmallImageList
    OptionsView.CenterContentVert = True
    TabOrder = 4
    Title.Text = 'Hello World'
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 472
    Top = 320
    DockControlHeights = (
      0
      0
      0
      0)
    object btnSpSQL: TdxBarButton
      Caption = 'spSQL'
      Category = 0
      Hint = 'spSQL'
      Visible = ivAlways
      ImageIndex = 7
    end
    object dxBarLookupCombo1: TdxBarLookupCombo
      Caption = 'Selecionar base de dados'
      Category = 0
      Hint = 'Selecionar base de dados'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDD000000000000000D0FFFF0FFFFFFFF0D0F77F0F777777F0D0CCCC0CCCCCC
        CC0D0C77C0C777777C0D0CCCC0CCCCCCCC0D0F77F0F777777F0D0FFFF0FFFFFF
        FF0D0F77F0F777777F0D0FFFF0FFFFFFFF0D000000000000000D0FFFCCCCFFF0
        DDDD0F777777FFF0DDDD0FFFCCCCFFF0DDDD000000000000DDDD}
      Width = 180
      KeyField = 'CDBASEDADOS'
      ListField = 'DEALIAS'
      ListSource = DataSource1
      RowCount = 7
    end
    object btnMontarAmbiente: TdxBarSubItem
      Caption = 'Montar ambiente'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object btnExecutarApp: TdxBarSubItem
      Caption = 'Executar'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
  end
  object DataSource1: TDataSource
    Left = 368
    Top = 336
  end
  object ActionList1: TActionList
    Left = 816
    Top = 184
  end
end

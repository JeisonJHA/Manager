inherited frmGerenciamentoModelo: TfrmGerenciamentoModelo
  Caption = 'frmGerenciamentoModelo'
  ClientHeight = 614
  ClientWidth = 1053
  FormStyle = fsMDIChild
  Visible = True
  ExplicitWidth = 1069
  ExplicitHeight = 653
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 1053
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 440
    ExplicitTop = 304
    ExplicitWidth = 185
    object Panel2: TPanel
      Left = 868
      Top = 0
      Width = 185
      Height = 41
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 640
      object btnAdicionar: TButton
        Left = 88
        Top = 9
        Width = 75
        Height = 25
        Caption = 'Adicionar'
        TabOrder = 0
      end
    end
  end
  object cxGrid1: TcxGrid [1]
    Left = 0
    Top = 41
    Width = 1053
    Height = 573
    Align = alClient
    PopupMenu = PopupMenu1
    TabOrder = 1
    ExplicitTop = 40
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellDblClick = cxGrid1DBTableView1CellDblClick
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  inherited ActionList: TActionList
    object actAdicionar: TAction
      Caption = 'Adicionar'
      OnExecute = actAdicionarExecute
    end
    object actEditar: TAction
      Caption = 'Editar'
      OnExecute = actEditarExecute
    end
    object actExcluir: TAction
      Caption = 'Excluir'
      OnExecute = actExcluirExecute
    end
  end
  object iosSelecionador: TInstantSelector
    Connector = dmDados.InstantIBXConnector1
    Left = 288
    Top = 168
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = iosSelecionador
    Left = 288
    Top = 224
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = cxGrid1
    PopupMenus = <>
    Left = 136
    Top = 424
  end
  object PopupMenu1: TPopupMenu
    Left = 480
    Top = 352
    object Excluir1: TMenuItem
      Action = actExcluir
    end
  end
end

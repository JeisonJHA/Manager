inherited frmSelecao: TfrmSelecao
  BorderStyle = bsDialog
  Caption = 'Selecionar'
  ClientHeight = 419
  ClientWidth = 517
  Position = poMainFormCenter
  ExplicitWidth = 523
  ExplicitHeight = 448
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel [0]
    Left = 0
    Top = 376
    Width = 517
    Height = 2
    Align = alBottom
    Shape = bsBottomLine
    ExplicitTop = 328
    ExplicitWidth = 461
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 378
    Width = 517
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnSelecionar: TButton
      Left = 345
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Selecionar'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancelar: TButton
      Left = 426
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 517
    Height = 376
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object cxGrid1: TcxGrid
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 511
      Height = 370
      Align = alClient
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        OnCellDblClick = cxGrid1DBTableView1CellDblClick
        DataController.DataSource = dtsMestre
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  inherited ioeMestre: TInstantExposer
    Left = 64
    Top = 56
  end
  inherited ActionList: TActionList
    Left = 160
    Top = 56
  end
  inherited dtsMestre: TDataSource
    Left = 64
    Top = 104
  end
end

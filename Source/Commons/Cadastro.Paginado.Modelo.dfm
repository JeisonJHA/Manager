inherited frmCadastroPaginadoModelo: TfrmCadastroPaginadoModelo
  Caption = 'Cadastro Paginado Modelo'
  OnShow = FormShow
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      Left = 328
      Width = 362
      ExplicitLeft = 328
      ExplicitWidth = 362
      inherited btnConfirmar: TButton
        Left = 106
        Top = 6
        ModalResult = 0
        TabOrder = 1
        ExplicitLeft = 106
        ExplicitTop = 6
      end
      inherited btnCancelar: TButton
        Left = 268
        Top = 6
        TabOrder = 3
        ExplicitLeft = 268
        ExplicitTop = 6
      end
      object btnNovo: TButton
        Left = 26
        Top = 6
        Width = 75
        Height = 25
        Action = actNovo
        TabOrder = 0
      end
      object btnExcluir: TButton
        Left = 187
        Top = 6
        Width = 75
        Height = 25
        Action = actExcluir
        TabOrder = 2
      end
    end
  end
  object cxPageControl1: TcxPageControl [2]
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 684
    Height = 382
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = tabGrade
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    ClientRectBottom = 380
    ClientRectLeft = 2
    ClientRectRight = 682
    ClientRectTop = 28
    object tabGrade: TcxTabSheet
      Caption = 'Principal'
      ImageIndex = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxGrid1: TcxGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 674
        Height = 346
        Align = alClient
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          OnCellDblClick = cxGrid1DBTableView1CellDblClick
          DataController.DataSource = dtsSelecionador
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
    object tabDetalhes: TcxTabSheet
      Caption = 'Detalhes'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
  inherited ioeMestre: TInstantExposer
    Left = 128
  end
  inherited ActionList: TActionList
    object actNovo: TAction
      Caption = 'Novo'
      OnExecute = actNovoExecute
      OnUpdate = actNovoUpdate
    end
    object actExcluir: TAction
      Caption = 'Excluir'
      OnExecute = actExcluirExecute
      OnUpdate = actExcluirUpdate
    end
  end
  object iosSelecionador: TInstantSelector [5]
    FieldOptions = [foObjects, foThorough]
    Connector = dtmDatabase.InstantIBXConnector1
    Left = 288
    Top = 208
  end
  object dtsSelecionador: TDataSource [6]
    DataSet = iosSelecionador
    Left = 288
    Top = 256
  end
  inherited dtsMestre: TDataSource
    Left = 128
  end
end

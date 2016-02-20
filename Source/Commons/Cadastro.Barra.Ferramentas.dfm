inherited frmCadastroBarraFerramentas: TfrmCadastroBarraFerramentas
  Caption = 'Barra Ferramentas'
  ExplicitWidth = 696
  ExplicitHeight = 460
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    inherited tabGrade: TcxTabSheet
      ExplicitLeft = 2
      ExplicitTop = 28
      ExplicitWidth = 680
      ExplicitHeight = 349
      inherited cxGrid1: TcxGrid
        ExplicitHeight = 343
        inherited cxGrid1DBTableView1: TcxGridDBTableView
          object cxGrid1DBTableView1Descricao: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'Descricao'
          end
        end
      end
    end
    inherited tabDetalhes: TcxTabSheet
      ExplicitLeft = 2
      ExplicitTop = 28
      ExplicitWidth = 680
      ExplicitHeight = 352
      object Label1: TLabel [0]
        Left = 24
        Top = 21
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = cxDBTextEdit1
      end
      inherited GroupBox1: TGroupBox
        Top = 86
        ExplicitTop = 86
        object Label2: TLabel [0]
          Left = 21
          Top = 25
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object btnNovaAcao: TButton [1]
          Left = 463
          Top = 39
          Width = 75
          Height = 25
          Action = actAdicionarAcao
          TabOrder = 0
        end
        object cbxSelecaoDeAcao: TcxLookupComboBox [2]
          Left = 21
          Top = 41
          Properties.KeyFieldNames = 'Self'
          Properties.ListColumns = <
            item
              FieldName = 'Descricao'
            end>
          Properties.ListSource = dtsSelecaoDeAcoes
          TabOrder = 1
          Width = 436
        end
        inherited cxGrid2: TcxGrid
          TabOrder = 2
          inherited cxGrid2DBTableView1: TcxGridDBTableView
            DataController.DataSource = dtsDetalhe
            OptionsView.ColumnAutoWidth = True
            object cxGrid2DBTableView1Descricao: TcxGridDBColumn
              DataBinding.FieldName = 'Descricao'
            end
          end
        end
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 24
        Top = 40
        DataBinding.DataField = 'Descricao'
        DataBinding.DataSource = dtsMestre
        TabOrder = 1
        Width = 633
      end
      object Button1: TButton
        Left = 560
        Top = 125
        Width = 75
        Height = 25
        Action = DatasetInsert1
        TabOrder = 2
      end
    end
  end
  inherited ioeMestre: TInstantExposer
    MasterSource = nil
    Mode = amObject
    ObjectClassName = 'TBarraFerramenta'
    object ioeMestreAcao: TDataSetField
      FieldName = 'Acao'
    end
    object ioeMestreDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object ioeMestreSelf: TIntegerField
      FieldName = 'Self'
    end
  end
  inherited ActionList: TActionList
    object actAdicionarAcao: TAction
      Caption = 'Adicionar'
      OnExecute = actAdicionarAcaoExecute
      OnUpdate = actAdicionarAcaoUpdate
    end
    object DatasetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Insert'
      Hint = 'Insert'
      ImageIndex = 4
      DataSource = dtsDetalhe
    end
    object DatasetDelete1: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Delete'
      Hint = 'Delete'
      ImageIndex = 5
      DataSource = dtsDetalhe
    end
  end
  inherited iosSelecionador: TInstantSelector
    AutoOpen = True
    Command.Strings = (
      'SELECT * FROM TBarraFerramenta')
    object iosSelecionadorAcao: TDataSetField
      FieldName = 'Acao'
    end
    object iosSelecionadorDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object iosSelecionadorSelf: TIntegerField
      FieldName = 'Self'
    end
  end
  inherited ioeDetalhe: TInstantExposer
    ContainerName = 'Acao'
    ObjectClassName = 'TAcao'
    object ioeDetalheDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object ioeDetalheIcone: TIntegerField
      FieldName = 'Icone'
    end
    object ioeDetalheSelf: TIntegerField
      FieldName = 'Self'
    end
  end
  object iosSelecaoDeAcoes: TInstantSelector
    FieldOptions = [foObjects, foThorough]
    AutoOpen = True
    Command.Strings = (
      'SELECT * FROM ANY TAcao')
    Connector = dmDados.InstantIBXConnector1
    Left = 592
    Top = 32
    object iosSelecaoDeAcoesDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object iosSelecaoDeAcoesIcone: TIntegerField
      FieldName = 'Icone'
    end
    object iosSelecaoDeAcoesSelf: TIntegerField
      FieldName = 'Self'
    end
  end
  object dtsSelecaoDeAcoes: TDataSource
    AutoEdit = False
    DataSet = iosSelecaoDeAcoes
    Left = 592
    Top = 80
  end
end

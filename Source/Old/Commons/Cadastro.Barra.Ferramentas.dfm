inherited frmCadastroBarraFerramentas: TfrmCadastroBarraFerramentas
  Caption = 'Barra Ferramentas'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    Properties.ActivePage = tabGrade
    inherited tabGrade: TcxTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      inherited cxGrid1: TDBGrid
        DataSource = dtsSelecionador
        Columns = <
          item
            Expanded = False
            FieldName = 'Descricao'
            Title.Caption = 'Descri'#231#227'o'
            Visible = True
          end>
      end
    end
    inherited tabDetalhes: TcxTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel [0]
        Left = 24
        Top = 21
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = cxDBTextEdit1
      end
      inherited GroupBox1: TGroupBox
        Caption = 'A'#231#245'es dispon'#237'veis'
        inherited Panel3: TPanel
          inherited btnAdd: TJvSpeedButton
            OnClick = SpeedButton1Click
          end
        end
        inherited Panel4: TPanel
          inherited cxGrid2: TDBGrid
            Columns = <
              item
                Expanded = False
                FieldName = 'Descricao'
                Title.Caption = 'Descri'#231#227'o'
                Visible = True
              end>
          end
        end
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 24
        Top = 40
        DataBinding.DataField = 'Descricao'
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 1
        Width = 633
      end
    end
  end
  inherited ioeMestre: TInstantExposer
    MasterSource = nil
    Mode = amObject
    ObjectClassName = 'TBarraFerramenta'
    object ioeMestreDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object ioeMestreSelf: TIntegerField
      FieldName = 'Self'
    end
    object ioeMestreAcoes: TDataSetField
      FieldName = 'Acoes'
    end
  end
  inherited ActionList: TActionList
    inherited actDelDetalhe: TAction
      OnExecute = actDelDetalheExecute
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
    object iosSelecionadorAcoes: TDataSetField
      FieldName = 'Acoes'
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
    ContainerName = 'Acoes'
    MasterSource = dtsSelecionador
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
    AutoOpen = True
    Command.Strings = (
      'SELECT * FROM ANY TAcao')
    Connector = dtmDatabase.InstantIBXConnector1
    Left = 600
    Top = 40
    object iosSelecaoDeAcoesDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object iosSelecaoDeAcoesIcone: TIntegerField
      FieldName = 'Icone'
    end
    object iosSelecaoDeAcoesTipoAcao: TStringField
      FieldName = 'TipoAcao'
      Size = 255
    end
  end
end

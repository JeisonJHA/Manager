inherited frmCadastroAcaoExecutar: TfrmCadastroAcaoExecutar
  Caption = 'Executar Aplicativo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    Properties.ActivePage = tabDetalhes
    inherited tabDetalhes: TcxTabSheet
      object Label4: TLabel [1]
        Left = 479
        Top = 72
        Width = 55
        Height = 13
        Caption = 'Par'#226'metros'
        FocusControl = cxDBTextEdit2
      end
      object Label2: TLabel [2]
        Left = 24
        Top = 72
        Width = 46
        Height = 13
        Caption = 'Aplicativo'
      end
      inherited lblIcone: TLabel
        Left = 24
        Top = 119
        ExplicitLeft = 24
        ExplicitTop = 119
      end
      object cxDBTextEdit2: TcxDBTextEdit [4]
        Left = 479
        Top = 88
        DataBinding.DataField = 'Parametros'
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 1
        Width = 178
      end
      inherited cbxIcone: TcxDBImageComboBox
        Left = 24
        Top = 135
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 2
        ExplicitLeft = 24
        ExplicitTop = 135
      end
      inherited edtDescricao: TcxDBTextEdit
        TabOrder = 0
      end
      object cbxAplicativo: TcxDBComboBox
        Left = 24
        Top = 88
        DataBinding.DataField = 'Aplicativo'
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 3
        Width = 449
      end
    end
  end
  inherited ioeMestre: TInstantExposer
    FieldOptions = [foObjects, foThorough]
    ObjectClassName = 'TAcaoExecutar'
    object ioeMestreAplicativo: TStringField
      FieldName = 'Aplicativo'
      Size = 255
    end
    object ioeMestreParametros: TStringField
      FieldName = 'Parametros'
      Size = 255
    end
    object ioeMestreSelf: TIntegerField
      FieldName = 'Self'
    end
  end
  inherited iosSelecionador: TInstantSelector
    Command.Strings = (
      'SELECT * FROM TAcaoExecutar')
    ObjectClassName = 'TAcaoExecutar'
    object iosSelecionadorAplicativo: TStringField
      FieldName = 'Aplicativo'
      Size = 255
    end
    object iosSelecionadorParametros: TStringField
      FieldName = 'Parametros'
      Size = 255
    end
  end
end

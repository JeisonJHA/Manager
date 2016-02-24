inherited frmCadastroAcaoExecutar: TfrmCadastroAcaoExecutar
  Caption = 'Executar Aplicativo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    Properties.ActivePage = tabDetalhes
    inherited tabDetalhes: TcxTabSheet
      object Label4: TLabel [1]
        Left = 24
        Top = 116
        Width = 55
        Height = 13
        Caption = 'Par'#226'metros'
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
        Top = 159
        ExplicitLeft = 24
        ExplicitTop = 159
      end
      inherited cbxIcone: TcxDBImageComboBox
        Left = 24
        Top = 175
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 4
        ExplicitLeft = 24
        ExplicitTop = 175
        ExplicitHeight = 36
      end
      inherited edtDescricao: TcxDBTextEdit
        TabOrder = 0
      end
      object cbxAplicativo: TcxDBComboBox
        Left = 24
        Top = 88
        DataBinding.DataField = 'Aplicativo'
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 1
        Width = 633
      end
      object edtParametros: TcxDBTextEdit
        Left = 24
        Top = 132
        DataBinding.DataField = 'Parametros'
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 2
        Width = 633
      end
      object chkIsAdmin: TcxDBCheckBox
        Left = 502
        Top = 318
        Caption = 'Executar como administrador'
        DataBinding.DataField = 'IsAdmin'
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 3
        Transparent = True
        Width = 164
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
    object iosSelecionadorIsAdmin: TBooleanField
      FieldName = 'IsAdmin'
    end
  end
end

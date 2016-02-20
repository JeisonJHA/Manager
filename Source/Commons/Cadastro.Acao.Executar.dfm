inherited frmCadastroAcaoExecutar: TfrmCadastroAcaoExecutar
  Caption = 'Executar Aplicativo'
  ExplicitWidth = 696
  ExplicitHeight = 460
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    inherited tabGrade: TcxTabSheet
      ExplicitLeft = 2
      ExplicitTop = 28
      ExplicitWidth = 680
      ExplicitHeight = 352
    end
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
        FocusControl = cxDBTextEdit3
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
        DataBinding.DataSource = dtsMestre
        TabOrder = 1
        Width = 178
      end
      object cxDBTextEdit3: TcxDBTextEdit [5]
        Left = 24
        Top = 88
        DataBinding.DataField = 'Aplicativo'
        DataBinding.DataSource = dtsMestre
        TabOrder = 2
        Width = 449
      end
      inherited cbxIcone: TcxDBImageComboBox
        Left = 24
        Top = 135
        TabOrder = 3
        ExplicitLeft = 24
        ExplicitTop = 135
        ExplicitHeight = 36
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

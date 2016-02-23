inherited frmCadastroAcaoConfigurarBaseDeDadosMSSQL: TfrmCadastroAcaoConfigurarBaseDeDadosMSSQL
  Caption = 'Configurar Base de Dados MSSQL'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    inherited tabDetalhes: TcxTabSheet
      inherited Label2: TLabel
        Top = 148
        ExplicitTop = 148
      end
      inherited lblIcone: TLabel
        Top = 191
        ExplicitTop = 191
      end
      object Label8: TLabel [6]
        Left = 25
        Top = 106
        Width = 44
        Height = 13
        Caption = 'Instancia'
      end
      inherited Label5: TLabel
        Left = 536
        Top = 106
        ExplicitLeft = 536
        ExplicitTop = 106
      end
      inherited Label6: TLabel
        Left = 409
        Top = 106
        ExplicitLeft = 409
        ExplicitTop = 106
      end
      inherited cbxIcone: TcxDBImageComboBox
        TabOrder = 8
      end
      inherited cbxOrigem: TcxDBComboBox
        Top = 166
        TabOrder = 6
        ExplicitTop = 166
      end
      object edtInstancia: TcxDBTextEdit [15]
        Left = 25
        Top = 122
        DataBinding.DataField = 'Instancia'
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 3
        Width = 378
      end
      inherited cbxDestino: TcxDBComboBox
        TabOrder = 7
      end
      inherited edtSenha: TcxDBTextEdit
        Left = 536
        Top = 122
        TabOrder = 5
        ExplicitLeft = 536
        ExplicitTop = 122
      end
      inherited edtUsuario: TcxDBTextEdit
        Left = 409
        Top = 122
        TabOrder = 4
        ExplicitLeft = 409
        ExplicitTop = 122
      end
    end
  end
  inherited ioeMestre: TInstantExposer
    ObjectClassName = 'TAcaoConfigurarBaseDeDadosMSSQL'
    object ioeMestreInstancia: TStringField
      FieldName = 'Instancia'
      Size = 255
    end
  end
  inherited iosSelecionador: TInstantSelector
    Command.Strings = (
      'SELECT * FROM TAcaoConfigurarBaseDeDadosMSSQL')
    ObjectClassName = 'TAcaoConfigurarBaseDeDadosMSSQL'
    object iosSelecionadorInstancia: TStringField
      FieldName = 'Instancia'
      Size = 255
    end
  end
end

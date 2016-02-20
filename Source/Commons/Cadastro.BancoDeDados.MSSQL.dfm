inherited frmCadastroBancoDeDadosMSSQL: TfrmCadastroBancoDeDadosMSSQL
  Caption = 'Banco de Dados MSSQL'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    Properties.ActivePage = tabDetalhes
    inherited tabDetalhes: TcxTabSheet
      ExplicitLeft = 2
      ExplicitTop = 28
      inherited Label3: TLabel
        Left = 327
        ExplicitLeft = 327
      end
      inherited Label4: TLabel
        Left = 200
        ExplicitLeft = 200
      end
      object Label6: TLabel [5]
        Left = 24
        Top = 112
        Width = 44
        Height = 13
        Caption = 'Inst'#226'ncia'
        FocusControl = cxDBTextEdit5
      end
      inherited cxDBTextEdit3: TcxDBTextEdit
        Left = 327
        ExplicitLeft = 327
      end
      inherited cxDBTextEdit4: TcxDBTextEdit
        Left = 200
        ExplicitLeft = 200
      end
      object cxDBTextEdit5: TcxDBTextEdit
        Left = 24
        Top = 128
        DataBinding.DataField = 'Instancia'
        DataBinding.DataSource = dtsMestre
        TabOrder = 5
        Width = 170
      end
    end
  end
  inherited ioeMestre: TInstantExposer
    ObjectClassName = 'TBancoDeDadosMSSQL'
    object ioeMestreInstancia: TStringField
      FieldName = 'Instancia'
      Size = 255
    end
  end
  inherited iosSelecionador: TInstantSelector
    Command.Strings = (
      'SELECT * FROM TBancoDeDadosMSSQL')
    object iosSelecionadorInstancia: TStringField
      FieldName = 'Instancia'
      Size = 255
    end
  end
end

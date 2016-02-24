inherited frmCadastroAcaoConfigurarBaseDeDadosMSSQL: TfrmCadastroAcaoConfigurarBaseDeDadosMSSQL
  Caption = 'Configurar Base de Dados MSSQL'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    inherited tabDetalhes: TcxTabSheet
      inherited Label6: TLabel
        Height = 13
        ExplicitHeight = 13
      end
      inherited Label8: TLabel
        Width = 44
        Caption = 'Inst'#226'ncia'
        ExplicitWidth = 44
      end
      object Label9: TLabel [10]
        Left = 369
        Top = 187
        Width = 134
        Height = 13
        Caption = ' ex.: {WS_DIR}bin\spcfg.ini'
        Enabled = False
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
  inherited ActionList: TActionList
    Left = 400
    Top = 296
  end
  inherited iosSelecionador: TInstantSelector
    Command.Strings = (
      'SELECT * FROM TAcaoConfigurarBaseDeDadosMSSQL')
    ObjectClassName = 'TAcaoConfigurarBaseDeDadosMSSQL'
    Left = 280
    Top = 344
    object iosSelecionadorInstancia: TStringField
      FieldName = 'Instancia'
      Size = 255
    end
  end
  inherited dtsSelecionador: TDataSource
    Left = 280
    Top = 296
  end
  inherited iosSistema: TInstantSelector
    Left = 512
    Top = 264
  end
  inherited dtsSistema: TDataSource
    Left = 512
    Top = 312
  end
  inherited OpenDialog1: TOpenDialog
    Left = 328
    Top = 288
  end
end

inherited frmCadastroAcaoConfigurarBaseDeDadosMSSQL: TfrmCadastroAcaoConfigurarBaseDeDadosMSSQL
  Caption = 'Configurar Base de Dados MSSQL'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    inherited tabGrade: TcxTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    inherited tabDetalhes: TcxTabSheet
      inherited Label8: TLabel
        Width = 44
        Caption = 'Inst'#226'ncia'
        ExplicitWidth = 44
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

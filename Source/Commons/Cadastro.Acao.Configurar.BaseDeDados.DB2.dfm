inherited frmCadastroAcaoConfigurarBaseDeDadosDB2: TfrmCadastroAcaoConfigurarBaseDeDadosDB2
  Caption = 'Configurar Base de Dados DB2'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    inherited tabGrade: TcxTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
  inherited ioeMestre: TInstantExposer
    ObjectClassName = 'TAcaoConfigurarBaseDeDadosDB2'
  end
  inherited iosSelecionador: TInstantSelector
    Command.Strings = (
      'SELECT * FROM TAcaoConfigurarBaseDeDadosDB2')
    ObjectClassName = 'TAcaoConfigurarBaseDeDadosDB2'
  end
end

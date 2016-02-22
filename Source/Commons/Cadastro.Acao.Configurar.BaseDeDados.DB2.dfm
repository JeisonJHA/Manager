inherited frmCadastroAcaoConfigurarBaseDeDadosDB2: TfrmCadastroAcaoConfigurarBaseDeDadosDB2
  Caption = 'Configurar Base de Dados DB2'
  PixelsPerInch = 96
  TextHeight = 13
  inherited ioeMestre: TInstantExposer
    ObjectClassName = 'TAcaoConfigurarBaseDeDadosDB2'
  end
  inherited iosSelecionador: TInstantSelector
    Command.Strings = (
      'SELECT * FROM TAcaoConfigurarBaseDeDadosDB2')
    ObjectClassName = 'TAcaoConfigurarBaseDeDadosDB2'
  end
end

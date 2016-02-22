inherited frmCadastroAcaoConfigurarBaseDeDadosOracle: TfrmCadastroAcaoConfigurarBaseDeDadosOracle
  Caption = 'Configurar Base de Dados Oracle'
  PixelsPerInch = 96
  TextHeight = 13
  inherited ioeMestre: TInstantExposer
    ObjectClassName = 'TAcaoConfigurarBaseDeDadosOracle'
  end
  inherited iosSelecionador: TInstantSelector
    Command.Strings = (
      'SELECT * FROM TAcaoConfigurarBaseDeDadosOracle')
    ObjectClassName = 'TAcaoConfigurarBaseDeDadosOracle'
  end
end

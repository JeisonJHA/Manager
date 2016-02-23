inherited frmCadastroAcaoConfigurarBaseDeDadosOracle: TfrmCadastroAcaoConfigurarBaseDeDadosOracle
  Caption = 'Configurar Base de Dados Oracle'
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
    ObjectClassName = 'TAcaoConfigurarBaseDeDadosOracle'
  end
  inherited iosSelecionador: TInstantSelector
    Command.Strings = (
      'SELECT * FROM TAcaoConfigurarBaseDeDadosOracle')
    ObjectClassName = 'TAcaoConfigurarBaseDeDadosOracle'
  end
end

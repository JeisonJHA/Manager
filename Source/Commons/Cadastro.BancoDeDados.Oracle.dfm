inherited frmCadastroBancoDeDadosOracle: TfrmCadastroBancoDeDadosOracle
  Caption = 'Banco de Dados Oracle'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    inherited tabDetalhes: TcxTabSheet
      ExplicitLeft = 2
      ExplicitTop = 28
    end
  end
  inherited ioeMestre: TInstantExposer
    ObjectClassName = 'TBancoDeDadosOracle'
  end
  inherited iosSelecionador: TInstantSelector
    Command.Strings = (
      'SELECT * FROM TBancoDeDadosOracle')
  end
end

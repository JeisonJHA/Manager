inherited frmCadastroBancoDeDadosDB2: TfrmCadastroBancoDeDadosDB2
  Caption = 'Banco de Dados DB2'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    inherited tabDetalhes: TcxTabSheet
      ExplicitLeft = 2
      ExplicitTop = 28
    end
  end
  inherited ioeMestre: TInstantExposer
    ObjectClassName = 'TBancoDeDadosDB2'
  end
  inherited iosSelecionador: TInstantSelector
    Command.Strings = (
      'SELECT * FROM TBancoDeDadosDB2')
  end
end

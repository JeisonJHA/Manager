inherited frmCadastroAcaoCatalogoBases: TfrmCadastroAcaoCatalogoBases
  Caption = 'Cat'#225'logo de Bases'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    inherited tabDetalhes: TcxTabSheet
      inherited chkIsAdmin: TcxDBCheckBox
        ExplicitHeight = 19
      end
    end
  end
  inherited iosSelecionador: TInstantSelector
    Command.Strings = (
      'SELECT * FROM TAcaoCatalogoDeBases ORDER BY Descricao')
    ObjectClassName = 'TAcaoCatalogoDeBases'
  end
end

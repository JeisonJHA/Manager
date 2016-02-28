inherited frmCadastroAcaoCatalogoBases: TfrmCadastroAcaoCatalogoBases
  Caption = 'Cat'#225'logo de Bases'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    inherited tabGrade: TcxTabSheet
      ExplicitLeft = 2
      ExplicitTop = 28
      ExplicitWidth = 680
      ExplicitHeight = 352
    end
  end
  inherited iosSelecionador: TInstantSelector
    Command.Strings = (
      'SELECT * FROM TAcaoCatalogoDeBases')
    ObjectClassName = 'TAcaoCatalogoDeBases'
  end
end

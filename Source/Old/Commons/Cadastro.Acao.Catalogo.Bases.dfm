inherited frmCadastroAcaoCatalogoBases: TfrmCadastroAcaoCatalogoBases
  Caption = 'Cat'#225'logo de Bases'
  ExplicitWidth = 696
  ExplicitHeight = 460
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    inherited tabGrade: TcxTabSheet
      ExplicitLeft = 2
      ExplicitTop = 28
      ExplicitWidth = 680
      ExplicitHeight = 352
    end
    inherited tabDetalhes: TcxTabSheet
      ExplicitLeft = 2
      ExplicitTop = 28
      ExplicitWidth = 680
      ExplicitHeight = 352
      inherited cbxIcone: TcxDBImageComboBox
        ExplicitHeight = 36
      end
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

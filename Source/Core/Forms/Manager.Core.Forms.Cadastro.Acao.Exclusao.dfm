inherited frmCadastroAcaoExclusao: TfrmCadastroAcaoExclusao
  Caption = 'frmCadastroAcaoExclusao'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
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
  inherited ioeMestre: TInstantExposer
    ObjectClassName = 'TAcaoExclusaoArquivo'
  end
  inherited iosSelecionador: TInstantSelector
    Command.Strings = (
      'SELECT * FROM TAcaoExclusaoArquivo')
    ObjectClassName = 'TAcaoExclusaoArquivo'
  end
end

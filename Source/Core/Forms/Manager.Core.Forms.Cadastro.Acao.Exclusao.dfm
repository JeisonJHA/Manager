inherited frmCadastroAcaoExclusao: TfrmCadastroAcaoExclusao
  Caption = 'Exclus'#227'o de Arquivo(s)'
  ExplicitWidth = 696
  ExplicitHeight = 460
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    Properties.ActivePage = tabDetalhes
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
      inherited Label4: TLabel
        Visible = False
      end
      inherited cbxIcone: TcxDBImageComboBox
        ExplicitHeight = 36
      end
      inherited chkIsAdmin: TcxDBCheckBox
        Visible = False
        ExplicitHeight = 19
      end
      inherited cbxParametros: TcxDBComboBox
        Visible = False
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

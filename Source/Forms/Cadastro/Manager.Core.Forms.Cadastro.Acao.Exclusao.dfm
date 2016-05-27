inherited frmCadastroAcaoExclusao: TfrmCadastroAcaoExclusao
  Caption = 'Exclus'#227'o de Arquivo(s)'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    Properties.ActivePage = tabDetalhes
    inherited tabDetalhes: TcxTabSheet
      inherited Label4: TLabel
        Top = 260
        Visible = False
        ExplicitTop = 260
      end
      inherited chkIsAdmin: TcxDBCheckBox
        Left = 24
        Top = 120
        Caption = 'Confirmar a exclus'#227'o'
        ExplicitLeft = 24
        ExplicitTop = 120
        ExplicitHeight = 19
      end
      inherited cbxParametros: TcxDBComboBox
        Top = 276
        Visible = False
        ExplicitTop = 276
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

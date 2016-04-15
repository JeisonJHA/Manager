object frmConfiguracaoInicial: TfrmConfiguracaoInicial
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Configura'#231#227'o Inicial'
  ClientHeight = 490
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dxWizardControl1: TdxWizardControl
    Left = 0
    Top = 0
    Width = 650
    Height = 490
    AutoSize = True
    Buttons.Back.Caption = '&Voltar'
    Buttons.Cancel.Caption = '&Cancelar'
    Buttons.CustomButtons.Buttons = <>
    Buttons.Finish.Caption = '&Finalizar'
    Buttons.Help.Caption = '&Ajuda'
    Buttons.Help.Visible = False
    Buttons.Next.Caption = '&Avan'#231'ar'
    OnButtonClick = dxWizardControl1ButtonClick
    ExplicitWidth = 640
    ExplicitHeight = 480
    object dxWizardControlPage1: TdxWizardControlPage
      Header.Description = 'Diret'#243'rio onde ficam dispon'#237'veis os c'#243'digos fonte.'
      Header.Title = 'C'#243'digo Fonte'
      object btnCodigoFonte: TButton
        Left = 455
        Top = 38
        Width = 75
        Height = 25
        Caption = 'Localizar ...'
        TabOrder = 0
        OnClick = btnCodigoFonteClick
      end
      object edtCodigoFonte: TEdit
        Left = 80
        Top = 40
        Width = 369
        Height = 21
        TabOrder = 1
      end
    end
    object dxWizardControlPage3: TdxWizardControlPage
      Header.Description = 
        'Selecione os arquivos de configura'#231#227'o para as aplica'#231#245'es seguind' +
        'o o exemplo abaixo.'
      Header.Title = 'Arquivos de Configura'#231#227'o'
      object lstArqINI: TListBox
        Left = 80
        Top = 22
        Width = 450
        Height = 155
        ItemHeight = 13
        TabOrder = 0
        OnClick = lstArqINIClick
      end
      object btnAdicionarArqINI: TButton
        Left = 374
        Top = 183
        Width = 75
        Height = 25
        Caption = 'Adicionar'
        TabOrder = 1
        OnClick = btnAdicionarArqINIClick
      end
      object btnExcluirArqINI: TButton
        Left = 455
        Top = 183
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 2
        OnClick = btnExcluirArqINIClick
      end
      object edtArqINI: TEdit
        Left = 80
        Top = 185
        Width = 288
        Height = 21
        TabOrder = 3
      end
    end
    object dxWizardControlPage4: TdxWizardControlPage
      Header.Description = 'Selecione uma aplica'#231#227'o para gerenciamento de banco de dados.'
      Header.Title = 'Banco de Dados'
      object edtAppDBM: TEdit
        Left = 88
        Top = 48
        Width = 369
        Height = 21
        TabOrder = 0
      end
      object btnAppDBM: TButton
        Left = 463
        Top = 46
        Width = 75
        Height = 25
        Caption = 'Localizar ...'
        TabOrder = 1
        OnClick = btnAppDBMClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 312
    Top = 248
  end
end

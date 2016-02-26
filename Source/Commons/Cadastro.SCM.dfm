inherited frmCadastroSCM: TfrmCadastroSCM
  Caption = 'Configurar SCM'
  ClientHeight = 393
  ClientWidth = 405
  ExplicitWidth = 411
  ExplicitHeight = 422
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 350
    Width = 405
    ExplicitTop = 350
    ExplicitWidth = 405
  end
  inherited Panel1: TPanel
    Top = 352
    Width = 405
    ExplicitTop = 352
    ExplicitWidth = 405
    inherited Panel2: TPanel
      Left = 206
      ExplicitLeft = 206
    end
  end
  object GroupBox1: TGroupBox [2]
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 399
    Height = 344
    Align = alClient
    Caption = 'Diret'#243'rios'
    TabOrder = 1
    object Panel3: TPanel
      Left = 2
      Top = 264
      Width = 395
      Height = 78
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object btnDiretorio: TSpeedButton
        Left = 367
        Top = 12
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = btnDiretorioClick
      end
      object btnSubscrever: TButton
        Left = 5
        Top = 40
        Width = 75
        Height = 25
        Caption = 'Subscrever'
        TabOrder = 0
        OnClick = btnSubscreverClick
      end
      object btnAdicionar: TButton
        Left = 86
        Top = 40
        Width = 75
        Height = 25
        Caption = 'Adicionar'
        TabOrder = 1
        OnClick = btnAdicionarClick
      end
      object btnExcluir: TButton
        Left = 167
        Top = 40
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 2
        OnClick = btnExcluirClick
      end
      object btnExcluirInvalidos: TButton
        Left = 248
        Top = 40
        Width = 142
        Height = 25
        Caption = 'Excluir caminhos inv'#225'lidos'
        TabOrder = 3
        OnClick = btnExcluirInvalidosClick
      end
      object edtPath: TEdit
        Left = 5
        Top = 13
        Width = 356
        Height = 21
        TabOrder = 4
      end
    end
    object lstPath: TListBox
      AlignWithMargins = True
      Left = 7
      Top = 20
      Width = 385
      Height = 239
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      ItemHeight = 13
      TabOrder = 1
      OnClick = lstPathClick
    end
  end
  inherited ActionList: TActionList
    Left = 352
  end
end

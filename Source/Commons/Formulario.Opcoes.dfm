inherited frmFormularioOpcoes: TfrmFormularioOpcoes
  BorderStyle = bsDialog
  Caption = 'Op'#231#245'es'
  ClientHeight = 417
  ClientWidth = 675
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 681
  ExplicitHeight = 446
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel [0]
    Left = 0
    Top = 374
    Width = 675
    Height = 2
    Align = alBottom
    Shape = bsBottomLine
    ExplicitLeft = 312
    ExplicitTop = 200
    ExplicitWidth = 50
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 376
    Width = 675
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 48
    ExplicitTop = 296
    ExplicitWidth = 185
    object Panel4: TPanel
      Left = 386
      Top = 0
      Width = 289
      Height = 41
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 376
      object btnConfirmar: TButton
        Left = 120
        Top = 9
        Width = 75
        Height = 25
        Caption = 'Confirmar'
        Default = True
        ModalResult = 1
        TabOrder = 0
        OnClick = btnConfirmarClick
      end
      object btnCancelar: TButton
        Left = 201
        Top = 9
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 185
    Height = 374
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitHeight = 41
    object JvPageListTreeView1: TJvPageListTreeView
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 179
      Height = 368
      PageDefault = 0
      PageList = JvPageList1
      Align = alClient
      Indent = 19
      TabOrder = 0
      Items.NodeData = {
        0303000000320000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        0000000000010A57006F0072006B007300700061006300650073003A00000000
        00000000000000FFFFFFFFFFFFFFFF000000000200000000000000010E420061
        006E0063006F0020006400650020006400610064006F00730034000000000000
        0000000000FFFFFFFFFFFFFFFF000000000100000000000000010B4100740075
        0061006C0069007A006100E700E3006F00}
      Items.Links = {03000000000000000200000001000000}
      ExplicitTop = 2
    end
  end
  object Panel3: TPanel [3]
    Left = 185
    Top = 0
    Width = 490
    Height = 374
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitLeft = 177
    ExplicitTop = -4
    ExplicitWidth = 480
    ExplicitHeight = 364
    object JvPageList1: TJvPageList
      AlignWithMargins = True
      Left = 0
      Top = 3
      Width = 487
      Height = 368
      Margins.Left = 0
      ActivePage = pageDiretorios
      PropagateEnable = False
      Align = alClient
      ExplicitLeft = 88
      ExplicitTop = 80
      ExplicitWidth = 300
      ExplicitHeight = 200
      object pageDiretorios: TJvStandardPage
        Left = 0
        Top = 0
        Width = 487
        Height = 368
        Caption = 'pageDiretorios'
        ParentBackground = True
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 487
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = '   Configura'#231#227'o de diret'#243'rios'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 484
        end
        object GroupBox1: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 28
          Width = 481
          Height = 337
          Align = alClient
          Caption = 'Diret'#243'rios'
          TabOrder = 1
          ExplicitTop = 3
          ExplicitWidth = 399
          ExplicitHeight = 344
          object Panel6: TPanel
            Left = 2
            Top = 257
            Width = 477
            Height = 78
            Align = alBottom
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 0
            ExplicitWidth = 474
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
            Width = 467
            Height = 232
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Align = alClient
            ItemHeight = 13
            TabOrder = 1
            OnClick = lstPathClick
            ExplicitWidth = 464
          end
        end
      end
      object pageAtualizacao: TJvStandardPage
        Left = 0
        Top = 0
        Width = 487
        Height = 368
        Caption = 'pageAtualizacao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #39
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label2: TLabel
          Left = 24
          Top = 76
          Width = 135
          Height = 14
          Caption = 'Verificar atualiza'#231#227'o a cada'
        end
        object Label3: TLabel
          Left = 239
          Top = 76
          Width = 45
          Height = 14
          Caption = 'minuto(s)'
        end
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 487
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = '   Atualiza'#231#227'o'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          ExplicitTop = 8
          ExplicitWidth = 484
        end
        object cbxVerificarAtualizacaoAuto: TcxCheckBox
          Left = 24
          Top = 48
          Caption = 'Verifica'#231#227'o autom'#225'tica de atualiza'#231#245'es dispon'#237'veis'
          TabOrder = 1
          Width = 441
        end
        object edtTempoVerificacaoAtualizacao: TcxSpinEdit
          Left = 161
          Top = 73
          TabOrder = 2
          Width = 72
        end
      end
      object pageBancoDeDados: TJvStandardPage
        Left = 0
        Top = 0
        Width = 487
        Height = 368
        Caption = 'pageBancoDeDados'
        ExplicitLeft = 3
        ExplicitTop = -1
        object SpeedButton1: TSpeedButton
          Left = 439
          Top = 64
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = SpeedButton1Click
        end
        object Label1: TLabel
          Left = 24
          Top = 49
          Width = 239
          Height = 13
          Caption = 'Aplicativo para gerenciamento de banco de dados'
        end
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 487
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = '   Banco de dados'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          ExplicitTop = 8
        end
        object edtAplicacaoSQL: TcxTextEdit
          Left = 24
          Top = 64
          TabOrder = 1
          Width = 409
        end
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 328
    Top = 208
  end
end

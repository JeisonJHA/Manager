object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Manager XE8'
  ClientHeight = 637
  ClientWidth = 1071
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxRibbon1: TdxRibbon
    Left = 0
    Top = 0
    Width = 1071
    Height = 155
    ApplicationButton.Menu = dxRibbonBackstageView1
    ApplicationButton.Text = 'Ferramentas'
    BarManager = dxBarManager1
    Style = rs2013
    ColorSchemeAccent = rcsaBlue
    ColorSchemeName = 'White'
    QuickAccessToolbar.Toolbar = dxBarManager1Bar1
    SupportNonClientDrawing = True
    Contexts = <>
    TabOrder = 0
    TabStop = False
    object ribbonGerenciamento: TdxRibbonTab
      Active = True
      Caption = 'Gerenciamento'
      Groups = <
        item
          ToolbarName = 'barCadastros'
        end
        item
          ToolbarName = 'barAplicacoes'
        end>
      Index = 0
    end
  end
  object dxRibbonBackstageView1: TdxRibbonBackstageView
    Left = 8
    Top = 166
    Width = 777
    Height = 371
    Buttons = <>
    Ribbon = dxRibbon1
    object dxRibbonBackstageViewTabSheet1: TdxRibbonBackstageViewTabSheet
      Left = 132
      Top = 0
      Caption = 'Recent'
      DesignSize = (
        645
        371)
      object dxRibbonBackstageViewGalleryControl1: TdxRibbonBackstageViewGalleryControl
        Left = 12
        Top = 44
        Width = 300
        Height = 313
        Anchors = [akLeft, akTop, akBottom]
        BorderStyle = cxcbsNone
        OptionsView.ColumnAutoWidth = True
        OptionsView.ColumnCount = 1
        OptionsView.ContentOffset.All = 0
        OptionsView.Item.Text.AlignHorz = taLeftJustify
        OptionsView.Item.Text.AlignVert = vaCenter
        OptionsView.Item.Text.Position = posRight
        OptionsView.Item.PinMode = bgipmTag
        Ribbon = dxRibbon1
        object dxRibbonBackstageViewGalleryControl1Group1: TdxRibbonBackstageViewGalleryGroup
          ShowCaption = False
          object dxRibbonBackstageViewGalleryControl1Group1Item1: TdxRibbonBackstageViewGalleryItem
            Caption = 'New Item'
            Description = 'New Item Description'
          end
        end
      end
      object cxLabel1: TcxLabel
        Left = 12
        Top = 12
        AutoSize = False
        Caption = 'Recent Documents'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        Properties.LineOptions.Alignment = cxllaBottom
        Properties.LineOptions.Visible = True
        Transparent = True
        Height = 26
        Width = 300
      end
    end
    object tabOpcoes: TdxRibbonBackstageViewTabSheet
      Left = 132
      Top = 0
      Active = True
      Caption = 'Op'#231#245'es'
      object Label1: TLabel
        Left = 20
        Top = 67
        Width = 138
        Height = 13
        Caption = 'Caminho do workspace local:'
      end
      object SpeedButton1: TSpeedButton
        Left = 312
        Top = 84
        Width = 23
        Height = 22
        Caption = '...'
      end
      object cxTextEdit1: TcxTextEdit
        Left = 20
        Top = 84
        TabOrder = 0
        Text = 'cxTextEdit1'
        Width = 289
      end
      object cxLabel2: TcxLabel
        Left = 20
        Top = 20
        AutoSize = False
        Caption = 'Source Control Manager'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        Properties.LineOptions.Alignment = cxllaBottom
        Properties.LineOptions.Visible = True
        Transparent = True
        Height = 26
        Width = 300
      end
    end
  end
  object dxRibbonStatusBar1: TdxRibbonStatusBar
    Left = 0
    Top = 614
    Width = 1071
    Height = 23
    Images = dmDados.SmallImageList
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.ImageIndex = 1
        Width = 255
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taRightJustify
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taRightJustify
        Width = 20
      end>
    Ribbon = dxRibbon1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object dxDockSite1: TdxDockSite
    Left = 0
    Top = 155
    Width = 185
    Height = 459
    Color = 10114859
    ManagerColor = False
    Align = alLeft
    AutoSize = True
    DockingType = 5
    OriginalWidth = 1
    OriginalHeight = 459
    object dxLayoutDockSite1: TdxLayoutDockSite
      Left = 0
      Top = 0
      Width = 185
      Height = 459
      DockingType = 0
      OriginalWidth = 185
      OriginalHeight = 200
    end
    object dxDockPanel1: TdxDockPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 459
      AllowFloating = True
      AutoHide = False
      Caption = 'Workspaces'
      CustomCaptionButtons.Buttons = <>
      TabsProperties.CustomButtons.Buttons = <>
      TabsProperties.Style = 6
      DockingType = 0
      OriginalWidth = 185
      OriginalHeight = 140
      object Panel1: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 174
        Height = 415
        Margins.Left = 0
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object JvNavigationPane1: TJvNavigationPane
          Left = 0
          Top = 0
          Width = 174
          Height = 415
          ActivePage = JvNavPanelPage1
          Align = alClient
          BorderWidth = 0
          Background.Stretch = False
          Background.Proportional = False
          Background.Center = False
          Background.Tile = False
          Background.Transparent = False
          Caption = 'JvNavigationPane1'
          Colors.ButtonColorFrom = clWhite
          Colors.ButtonColorTo = clWhite
          Colors.ButtonHotColorFrom = 16578548
          Colors.ButtonHotColorTo = 16578548
          Colors.ButtonSelectedColorFrom = 15983576
          Colors.ButtonSelectedColorTo = 15983576
          Colors.ButtonSeparatorColor = clWhite
          Colors.SplitterColorFrom = 10114859
          Colors.SplitterColorTo = 10114859
          Colors.DividerColorFrom = 10114859
          Colors.DividerColorTo = 10114859
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          LargeImages = dmDados.MediumImageList
          MaximizedCount = 3
          NavPanelFont.Charset = DEFAULT_CHARSET
          NavPanelFont.Color = clWindowText
          NavPanelFont.Height = -12
          NavPanelFont.Name = 'Segoe UI'
          NavPanelFont.Style = []
          NavPanelHotTrackFont.Charset = DEFAULT_CHARSET
          NavPanelHotTrackFont.Color = clWindowText
          NavPanelHotTrackFont.Height = -12
          NavPanelHotTrackFont.Name = 'Segoe UI'
          NavPanelHotTrackFont.Style = []
          SmallImages = dmDados.SmallImageList
          object JvNavPanelPage1: TJvNavPanelPage
            Left = 0
            Top = 0
            Width = 174
            Height = 296
            Hint = ''
            Background.Stretch = False
            Background.Proportional = False
            Background.Center = False
            Background.Tile = False
            Background.Transparent = False
            Caption = 'Primeiro Grau (PG5)'
            ImageIndex = 10
          end
          object JvNavPanelPage2: TJvNavPanelPage
            Left = 0
            Top = 0
            Width = 174
            Height = 296
            Hint = ''
            Background.Stretch = False
            Background.Proportional = False
            Background.Center = False
            Background.Tile = False
            Background.Transparent = False
            Caption = 'Segundo Grau (SG5)'
            ImageIndex = 10
          end
          object JvNavPanelPage3: TJvNavPanelPage
            Left = 0
            Top = 0
            Width = 174
            Height = 296
            Hint = ''
            Background.Stretch = False
            Background.Proportional = False
            Background.Center = False
            Background.Tile = False
            Background.Transparent = False
            Caption = 'Minit'#233'rio P'#250'blico (MP)'
            ImageIndex = 10
          end
        end
      end
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmDados.SmallImageList
    ImageOptions.LargeImages = dmDados.LargeImageList
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 568
    Top = 8
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBarManager1Bar1: TdxBar
      Caption = 'Quick Access Toolbar'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 0
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barCadastros: TdxBar
      Caption = 'Cadastros'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1105
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnCadSistemas'
        end
        item
          Visible = True
          ItemName = 'btnCadBaseDados'
        end
        item
          Visible = True
          ItemName = 'btnCadAplicacoes'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barAplicacoes: TdxBar
      Caption = 'Aplica'#231#245'es'
      CaptionButtons = <>
      DockedLeft = 200
      DockedTop = 0
      FloatLeft = 1105
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object btnOpcoes: TdxBarLargeButton
      Action = actOpcoes
      Category = 0
    end
    object btnCadSistemas: TdxBarLargeButton
      Action = actCadSistemas
      Category = 0
    end
    object btnCadBaseDados: TdxBarLargeButton
      Action = actCadBaseDados
      Category = 0
    end
    object btnCadAplicacoes: TdxBarLargeButton
      Action = actCadAplicacoes
      Category = 0
    end
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Office2013White'
    Left = 536
    Top = 8
  end
  object ActionList1: TActionList
    Images = dmDados.SmallImageList
    Left = 640
    Top = 8
    object actOpcoes: TAction
      Category = 'Ferramentas'
      Caption = 'Op'#231#245'es'
      ImageIndex = 0
    end
    object actCadSistemas: TAction
      Category = 'Cadastros'
      Caption = 'Sistemas'
      ImageIndex = 3
      OnExecute = actCadSistemasExecute
    end
    object actCadBaseDados: TAction
      Category = 'Cadastros'
      Caption = 'Base de Dados'
      ImageIndex = 1
      OnExecute = actCadBaseDadosExecute
    end
    object actCadAplicacoes: TAction
      Category = 'Cadastros'
      Caption = 'Aplica'#231#245'es'
      ImageIndex = 2
      OnExecute = actCadAplicacoesExecute
    end
  end
  object regStorage: TJvAppRegistryStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    Root = '%NONE%'
    SubStorages = <>
    Left = 880
    Top = 216
  end
  object dxTabbedMDIManager1: TdxTabbedMDIManager
    Active = True
    LookAndFeel.Kind = lfStandard
    TabProperties.CloseButtonMode = cbmActiveTab
    TabProperties.CloseTabWithMiddleClick = True
    TabProperties.CustomButtons.Buttons = <>
    Left = 888
    Top = 360
  end
  object dxDockingManager1: TdxDockingManager
    Color = clBtnFace
    DefaultHorizContainerSiteProperties.CustomCaptionButtons.Buttons = <>
    DefaultHorizContainerSiteProperties.Dockable = True
    DefaultHorizContainerSiteProperties.ImageIndex = -1
    DefaultVertContainerSiteProperties.CustomCaptionButtons.Buttons = <>
    DefaultVertContainerSiteProperties.Dockable = True
    DefaultVertContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.CustomCaptionButtons.Buttons = <>
    DefaultTabContainerSiteProperties.Dockable = True
    DefaultTabContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.TabsProperties.CustomButtons.Buttons = <>
    DockStyle = dsVS2005
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    LookAndFeel.Kind = lfFlat
    Left = 848
    Top = 288
    PixelsPerInch = 96
  end
end

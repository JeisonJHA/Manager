object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Manager'
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    1071
    637)
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
      Caption = 'Principal'
      Groups = <
        item
          ToolbarName = 'barCadastros'
        end
        item
          ToolbarName = 'barDebug'
        end>
      Index = 0
    end
  end
  object dxRibbonBackstageView1: TdxRibbonBackstageView
    Left = 264
    Top = 174
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
        Left = 315
        Top = 85
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton1Click
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
      object edtSCMPaths: TcxTextEdit
        Left = 20
        Top = 86
        Properties.ReadOnly = True
        TabOrder = 1
        Text = 'cxTextEdit1'
        Width = 289
      end
    end
    object tabSandbox: TdxRibbonBackstageViewTabSheet
      Left = 132
      Top = 0
      Caption = 'Sandbox'
    end
  end
  object dxRibbonStatusBar1: TdxRibbonStatusBar
    Left = 0
    Top = 614
    Width = 1071
    Height = 23
    Images = dtmDatabase.SmallImageList
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.ImageIndex = 1
        MinWidth = 240
        Width = 600
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taRightJustify
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        Width = 20
      end>
    Ribbon = dxRibbon1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object dxDockSite2: TdxDockSite
    Left = 0
    Top = 586
    Width = 1071
    Height = 28
    Align = alBottom
    AutoSize = True
    DockingType = 5
    OriginalWidth = 1071
    OriginalHeight = 2
    object dxLayoutDockSite2: TdxLayoutDockSite
      Left = 0
      Top = 0
      Width = 1071
      Height = 0
      Visible = False
      DockingType = 0
      OriginalWidth = 300
      OriginalHeight = 140
    end
    object dxDockPanel2: TdxDockPanel
      Left = 0
      Top = 0
      Width = 0
      Height = 140
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ManagerFont = False
      Visible = False
      AllowFloating = True
      AutoHide = True
      Caption = 'Console'
      CustomCaptionButtons.Buttons = <>
      TabsProperties.CustomButtons.Buttons = <>
      OnActivate = dxDockPanel2Activate
      AutoHidePosition = 3
      DockingType = 0
      OriginalWidth = 185
      OriginalHeight = 140
      object txtConsole: TMemo
        Left = 0
        Top = 0
        Width = 0
        Height = 96
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = clGrayText
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          'manager/>')
        ParentCtl3D = False
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        WantReturns = False
        WordWrap = False
        OnEnter = txtConsoleEnter
        OnKeyPress = txtConsoleKeyPress
      end
    end
  end
  object dxDockSite1: TdxDockSite
    Left = 0
    Top = 155
    Width = 28
    Height = 431
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
      Width = 0
      Height = 431
      Visible = False
      DockingType = 0
      OriginalWidth = 185
      OriginalHeight = 200
    end
    object dxDockPanel1: TdxDockPanel
      Left = -185
      Top = 0
      Width = 185
      Height = 0
      Visible = False
      AllowFloating = True
      AutoHide = True
      Caption = 'Workspaces'
      CustomCaptionButtons.Buttons = <>
      TabsProperties.CustomButtons.Buttons = <>
      TabsProperties.Style = 6
      AutoHidePosition = 0
      DockingType = 0
      OriginalWidth = 185
      OriginalHeight = 140
      object Panel1: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 174
        Height = 0
        Margins.Left = 0
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object cxGrid1: TcxGrid
          Left = 0
          Top = 0
          Width = 174
          Height = 0
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = cxcbsNone
          TabOrder = 0
          object cxGrid1DBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            OnCellDblClick = cxGrid1DBTableView1CellDblClick
            DataController.DataSource = dtsWorkspaces
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            object cxGrid1DBTableView1Descricao: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'Descricao'
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
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
    ImageOptions.Images = dtmDatabase.SmallImageList
    ImageOptions.LargeImages = dtmDatabase.LargeImageList
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
          ItemName = 'btnBancoDeDados'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem2'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem1'
        end>
      OneOnRow = True
      Row = 1
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barDebug: TdxBar
      Caption = 'Debug'
      CaptionButtons = <>
      DockedLeft = 231
      DockedTop = 0
      FloatLeft = 1105
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton3'
        end>
      OneOnRow = True
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
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'Menu'
      Category = 0
      Visible = ivAlways
      ImageIndex = 15
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton2'
        end>
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = 'Barra de ferramentas'
      Category = 0
      Hint = 'Barra de ferramentas'
      Visible = ivAlways
      OnClick = dxBarLargeButton2Click
      SyncImageIndex = False
      ImageIndex = 14
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = 'A'#231#245'es'
      Category = 0
      Visible = ivAlways
      ImageIndex = 16
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnCadastroAcaoExecutar'
        end
        item
          Visible = True
          ItemName = 'btnCadastroAcaoCopiar'
        end
        item
          Visible = True
          ItemName = 'dxBarSeparator2'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton4'
        end>
    end
    object btnCadastroAcaoExecutar: TdxBarButton
      Caption = 'Executar'
      Category = 0
      Hint = 'Executar'
      Visible = ivAlways
      ImageIndex = 5
      OnClick = btnCadastroAcaoExecutarClick
    end
    object btnCadastroAcaoCopiar: TdxBarButton
      Caption = 'Copiar'
      Category = 0
      Hint = 'Copiar'
      Visible = ivAlways
      ImageIndex = 12
      OnClick = btnCadastroAcaoCopiarClick
    end
    object btnBancoDeDados: TdxBarSubItem
      Caption = 'Banco de dados'
      Category = 0
      Visible = ivAlways
      ImageIndex = 1
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnCadastroBancoDeDadosOracle'
        end
        item
          Visible = True
          ItemName = 'btnCadastroBancoDeDadosMSSQL'
        end
        item
          Visible = True
          ItemName = 'btnCadastroBancoDeDadosDB2'
        end>
    end
    object btnCadastroBancoDeDadosOracle: TdxBarLargeButton
      Caption = 'Oracle'
      Category = 0
      Hint = 'Oracle'
      Visible = ivAlways
      OnClick = btnCadastroBancoDeDadosOracleClick
    end
    object btnCadastroBancoDeDadosMSSQL: TdxBarLargeButton
      Caption = 'MSSQL'
      Category = 0
      Hint = 'MSSQL'
      Visible = ivAlways
      OnClick = btnCadastroBancoDeDadosMSSQLClick
    end
    object btnCadastroBancoDeDadosDB2: TdxBarLargeButton
      Caption = 'DB2'
      Category = 0
      Hint = 'DB2'
      Visible = ivAlways
      OnClick = btnCadastroBancoDeDadosDB2Click
    end
    object dxBarSeparator1: TdxBarSeparator
      Caption = 'Banco de Dados'
      Category = 0
      Hint = 'Banco de Dados'
      Visible = ivAlways
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'Configurar Base de Dados'
      Category = 0
      Hint = 'btnConfiguracaoBancoDeDados'
      Visible = ivAlways
      OnClick = dxBarLargeButton1Click
      SyncImageIndex = False
      ImageIndex = 8
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Caption = 'Teste'
      Category = 0
      Hint = 'Teste'
      Visible = ivAlways
      OnClick = dxBarLargeButton3Click
    end
    object dxBarSeparator2: TdxBarSeparator
      Caption = 'Ambiente'
      Category = 0
      Hint = 'Ambiente'
      Visible = ivAlways
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Caption = 'Montar Ambientes'
      Category = 0
      Hint = 'Montar Ambientes'
      Visible = ivAlways
      OnClick = dxBarLargeButton4Click
      SyncImageIndex = False
      ImageIndex = 10
    end
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Office2013White'
    Left = 536
    Top = 8
  end
  object ActionList1: TActionList
    Images = dtmDatabase.SmallImageList
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
    end
    object actCadAplicacoes: TAction
      Category = 'Cadastros'
      Caption = 'Aplicativos'
      ImageIndex = 2
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
  object dtsWorkspaces: TDataSource
    AutoEdit = False
    DataSet = iosWorkspaces
    Left = 512
    Top = 400
  end
  object iosWorkspaces: TInstantSelector
    Command.Strings = (
      'SELECT * FROM TWorkspace')
    Connector = dtmDatabase.InstantIBXConnector1
    ObjectClassName = 'TWorkspace'
    Left = 512
    Top = 352
    object iosWorkspacesDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object iosWorkspacesDiretorio: TStringField
      FieldName = 'Diretorio'
      Size = 255
    end
  end
  object JvAppIniFileStorage1: TJvAppIniFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    FileName = 'style.ini'
    SubStorages = <>
    Left = 964
    Top = 262
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = JvAppIniFileStorage1
    AppStoragePath = '%FORM_NAME%\'
    StoredValues = <>
    Left = 960
    Top = 312
  end
  object ApplicationEvents1: TApplicationEvents
    OnMinimize = ApplicationEvents1Minimize
    Left = 128
    Top = 416
  end
  object TrayIcon1: TTrayIcon
    BalloonTitle = 'Manager'
    PopupMenu = PopupMenu1
    OnClick = TrayIcon1Click
    Left = 128
    Top = 368
  end
  object PopupMenu1: TPopupMenu
    Left = 200
    Top = 368
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuFechar: TMenuItem
      Caption = 'Fechar aplica'#231#227'o'
      OnClick = mnuFecharClick
    end
  end
end

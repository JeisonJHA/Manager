object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Manager Developer'
  ClientHeight = 660
  ClientWidth = 1087
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
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxRibbon1: TdxRibbon
    Left = 0
    Top = 0
    Width = 1087
    Height = 155
    ApplicationButton.Menu = dxRibbonBackstageView1
    BarManager = dxBarManager1
    Style = rs2013
    ColorSchemeAccent = rcsaBlue
    ColorSchemeName = 'White'
    QuickAccessToolbar.Toolbar = dxBarManager1Bar1
    SupportNonClientDrawing = True
    Contexts = <>
    TabOrder = 0
    TabStop = False
    object ribbonTabPrincipal: TdxRibbonTab
      Active = True
      Caption = 'Principal'
      Groups = <
        item
          Caption = 'Cadastros'
          ToolbarName = 'barCadastros'
        end
        item
          ToolbarName = 'barBaseDeDados'
        end>
      Index = 0
    end
  end
  object dxRibbonBackstageView1: TdxRibbonBackstageView
    Left = 218
    Top = 166
    Width = 577
    Height = 266
    Buttons = <
      item
        Item = btnOpcoes
      end>
    Ribbon = dxRibbon1
    object dxRibbonBackstageViewTabSheet1: TdxRibbonBackstageViewTabSheet
      Left = 132
      Top = 0
      Active = True
      Caption = 'Recent'
      DesignSize = (
        445
        266)
      object dxRibbonBackstageViewGalleryControl1: TdxRibbonBackstageViewGalleryControl
        Left = 12
        Top = 44
        Width = 300
        Height = 208
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
  end
  object dxRibbonStatusBar1: TdxRibbonStatusBar
    Left = 0
    Top = 637
    Width = 1087
    Height = 23
    Images = dtmDatabase.SmallImageList
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.ImageIndex = 1
        Width = 300
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taRightJustify
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
    Width = 201
    Height = 482
    Color = 10114859
    ManagerColor = False
    Align = alLeft
    AutoSize = True
    DockingType = 5
    OriginalWidth = 1
    OriginalHeight = 319
    object dxLayoutDockSite1: TdxLayoutDockSite
      Left = 0
      Top = 0
      Width = 201
      Height = 482
      DockingType = 0
      OriginalWidth = 201
      OriginalHeight = 200
    end
    object dxDockPanel1: TdxDockPanel
      Left = 0
      Top = 0
      Width = 201
      Height = 482
      AllowFloating = True
      AutoHide = False
      Caption = 'Workspaces'
      CaptionButtons = [cbMaximize, cbHide]
      CustomCaptionButtons.Buttons = <>
      TabsProperties.CustomButtons.Buttons = <>
      TabsProperties.Style = 6
      DockingType = 0
      OriginalWidth = 201
      OriginalHeight = 97
      object Panel1: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 190
        Height = 438
        Margins.Left = 0
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object DBGrid1: TJvDBGrid
          Left = 0
          Top = 0
          Width = 190
          Height = 438
          Align = alClient
          DataSource = dtsWorkspaces
          Options = [dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = DBGrid1DblClick
          AutoSizeColumns = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 16
          TitleRowHeight = 16
          Columns = <
            item
              Expanded = False
              FieldName = 'Descricao'
              Title.Caption = ' + Descri'#231#227'o'
              Title.Color = clWhite
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = 10114859
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 186
              Visible = True
            end>
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
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end>
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
      FloatLeft = 1121
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      Images = dtmDatabase.SmallImageList
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnCadastroSistema'
        end
        item
          Visible = True
          ItemName = 'btnBancoDeDados'
        end
        item
          Visible = True
          ItemName = 'btnAcoes'
        end
        item
          Visible = True
          ItemName = 'btnMenu'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barBaseDeDados: TdxBar
      Caption = 'Base de dados'
      CaptionButtons = <>
      DockedLeft = 231
      DockedTop = 0
      FloatLeft = 1121
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnConjuntoDeBases'
        end
        item
          Visible = True
          ItemName = 'btnCatalagoBases'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object btnCadastroSistema: TdxBarLargeButton
      Action = actCadastroSistema
      Category = 0
    end
    object btnOpcoes: TdxBarLargeButton
      Action = actFormularioOpcoes
      Category = 0
    end
    object btnCadastroAcaoCopiar: TdxBarLargeButton
      Action = actCadastroAcaoCopiar
      Category = 0
      SyncImageIndex = False
      ImageIndex = 12
    end
    object btnCadastroAcaoExecutar: TdxBarButton
      Action = actCadastroAcaoExecutar
      Category = 0
      ImageIndex = 5
    end
    object btnCadastroAcaoConfigurarBaseDeDadosDB2: TdxBarLargeButton
      Action = actCadastroAcaoConfigurarBaseDeDadosDB2
      Category = 0
    end
    object btnCadastroAcaoConfigurarBaseDeDadosMSSQL: TdxBarLargeButton
      Action = actCadastroAcaoConfigurarBaseDeDadosMSSQL
      Category = 0
    end
    object btnCadastroAcaoConfigurarBaseDeDadosOracle: TdxBarLargeButton
      Action = actCadastroAcaoConfigurarBaseDeDadosOracle
      Category = 0
    end
    object btnCadastroAcaoConjuntoBases: TdxBarLargeButton
      Action = actCadastroAcaoConjuntoBases
      Category = 0
      SyncImageIndex = False
      ImageIndex = 1
    end
    object btnCadastroAcaoConfigurarBaseDeDados: TdxBarButton
      Action = actCadastroAcaoConfigurarBaseDeDados
      Category = 0
    end
    object btnCadastroBarraFerramentas: TdxBarButton
      Action = actCadastroBarraFerramentas
      Category = 0
      ImageIndex = 15
    end
    object btnCadastroAcaoMontarAmbiente: TdxBarButton
      Action = actCadastroAcaoMontarAmbiente
      Category = 0
      ImageIndex = 20
    end
    object btnCadastroAcaoCatalogoBases: TdxBarButton
      Action = actCadastroAcaoCatalogoBases
      Category = 0
      ImageIndex = 1
    end
    object btnBancoDeDados: TdxBarSubItem
      Caption = 'Banco de Dados'
      Category = 0
      Visible = ivAlways
      ImageIndex = 1
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnCadastroAcaoConfigurarBaseDeDadosOracle'
        end
        item
          Visible = True
          ItemName = 'btnCadastroAcaoConfigurarBaseDeDadosMSSQL'
        end
        item
          Visible = True
          ItemName = 'btnCadastroAcaoConfigurarBaseDeDadosDB2'
        end>
    end
    object btnAcoes: TdxBarSubItem
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
          ItemName = 'btnCadastroAcaoExclusao'
        end
        item
          Visible = True
          ItemName = 'dxBarSeparator1'
        end
        item
          Visible = True
          ItemName = 'btnCadastroAcaoMontarAmbiente'
        end
        item
          Visible = True
          ItemName = 'dxBarSeparator2'
        end
        item
          Visible = True
          ItemName = 'btnCadastroAcaoCatalogoBases'
        end
        item
          Visible = True
          ItemName = 'btnCadastroAcaoConjuntoBases'
        end>
    end
    object dxBarSeparator1: TdxBarSeparator
      Caption = 'Ambientes'
      Category = 0
      Hint = 'Ambientes'
      Visible = ivAlways
    end
    object dxBarSeparator2: TdxBarSeparator
      Caption = 'Banco de dados'
      Category = 0
      Hint = 'Banco de dados'
      Visible = ivAlways
    end
    object btnMenu: TdxBarSubItem
      Caption = 'Menu'
      Category = 0
      Visible = ivAlways
      ImageIndex = 17
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnCadastroBarraFerramentas'
        end>
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton2: TdxBarButton
      Action = actUpdate
      Category = 0
    end
    object btnConjuntoDeBases: TdxBarSubItem
      Caption = 'Conjunto de Bases'
      Category = 0
      Visible = ivAlways
      ImageIndex = 37
      ItemLinks = <>
    end
    object btnCatalagoBases: TdxBarSubItem
      Caption = 'Cat'#225'logo de Bases'
      Category = 0
      Visible = ivAlways
      ImageIndex = 36
      ItemLinks = <>
    end
    object btnCadastroAcaoExclusao: TdxBarLargeButton
      Action = actCadastroAcaoExclusao
      Category = 0
    end
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Office2013White'
    Left = 536
    Top = 8
  end
  object iosWorkspaces: TInstantSelector
    Command.Strings = (
      'SELECT * FROM TWorkspace')
    Connector = dtmDatabase.InstantIBXConnector1
    Left = 536
    Top = 336
  end
  object dtsWorkspaces: TDataSource
    AutoEdit = False
    DataSet = iosWorkspaces
    Left = 536
    Top = 384
  end
  object mdiControleTelas: TdxTabbedMDIManager
    Active = True
    TabProperties.CloseButtonMode = cbmEveryTab
    TabProperties.CustomButtons.Buttons = <>
    Left = 936
    Top = 288
  end
  object aclToolbars: TActionList
    Images = dtmDatabase.SmallImageList
    Left = 640
    Top = 8
    object actCadastroSistema: TAction
      Caption = 'Sistemas'
      HelpKeyword = 'TfrmCadastroSistema'
      ImageIndex = 3
      OnExecute = actOnAbreTelaExecute
    end
    object actFormularioOpcoes: TAction
      Caption = 'Op'#231#245'es'
      HelpKeyword = 'TfrmFormularioOpcoes'
      OnExecute = actOnAbreTelaExecute
    end
    object actCadastroAcaoCopiar: TAction
      Caption = 'Copiar'
      HelpKeyword = 'TfrmCadastroAcaoCopiar'
      OnExecute = actOnAbreTelaExecute
    end
    object actCadastroAcaoExecutar: TAction
      Caption = 'Executar'
      HelpKeyword = 'TfrmCadastroAcaoExecutar'
      OnExecute = actOnAbreTelaExecute
    end
    object actCadastroAcaoConfigurarBaseDeDadosDB2: TAction
      Caption = 'DB2'
      HelpKeyword = 'TfrmCadastroAcaoConfigurarBaseDeDadosDB2'
      ImageIndex = 1
      OnExecute = actOnAbreTelaExecute
    end
    object actCadastroAcaoConfigurarBaseDeDadosMSSQL: TAction
      Caption = 'MS SQL'
      HelpKeyword = 'TfrmCadastroAcaoConfigurarBaseDeDadosMSSQL'
      ImageIndex = 1
      OnExecute = actOnAbreTelaExecute
    end
    object actCadastroAcaoConfigurarBaseDeDadosOracle: TAction
      Caption = 'Oracle'
      HelpKeyword = 'TfrmCadastroAcaoConfigurarBaseDeDadosOracle'
      ImageIndex = 1
      OnExecute = actOnAbreTelaExecute
    end
    object actCadastroAcaoConjuntoBases: TAction
      Caption = 'Conjunto de Bases'
      HelpKeyword = 'TfrmCadastroAcaoConjuntoBases'
      ImageIndex = 37
      OnExecute = actOnAbreTelaExecute
    end
    object actCadastroAcaoConfigurarBaseDeDados: TAction
      Caption = 'Configurar base de dados'
      HelpKeyword = 'TfrmCadastroAcaoConfigurarBaseDeDados'
      OnExecute = actOnAbreTelaExecute
    end
    object actCadastroBarraFerramentas: TAction
      Caption = 'Barra de ferramentas'
      HelpKeyword = 'TfrmCadastroBarraFerramentas'
      OnExecute = actOnAbreTelaExecute
    end
    object actCadastroAcaoMontarAmbiente: TAction
      Caption = 'Montar ambiente'
      HelpKeyword = 'TfrmCadastroAcaoMontarAmbiente'
      OnExecute = actOnAbreTelaExecute
    end
    object actCadastroAcaoCatalogoBases: TAction
      Caption = 'Cat'#225'logo de bases'
      HelpKeyword = 'TfrmCadastroAcaoCatalogoBases'
      ImageIndex = 36
      OnExecute = actOnAbreTelaExecute
    end
    object actCadastroAcaoExclusao: TAction
      Caption = 'Excluir'
      HelpKeyword = 'TfrmCadastroAcaoExclusao'
      ImageIndex = 29
      OnExecute = actOnAbreTelaExecute
    end
    object actUpdate: TAction
      Caption = 'Update'
      ImageIndex = 39
      Visible = False
      OnExecute = actUpdateExecute
    end
  end
  object tiPrincipal: TTrayIcon
    BalloonTitle = 'Manager'
    PopupMenu = ppmTrayIcon
    Visible = True
    OnClick = tiPrincipalClick
    Left = 440
    Top = 64
  end
  object ppmTrayIcon: TPopupMenu
    Images = dtmDatabase.SmallImageList
    OnChange = ppmTrayIconChange
    Left = 496
    Top = 64
  end
  object aePrincipal: TApplicationEvents
    OnMinimize = aePrincipalMinimize
    Left = 520
    Top = 440
  end
  object alMessageAlert: TdxAlertWindowManager
    OptionsButtons.Buttons = <
      item
        ImageIndex = 39
      end>
    OptionsButtons.Images = dtmDatabase.SmallImageList
    OptionsMessage.Caption.Font.Charset = DEFAULT_CHARSET
    OptionsMessage.Caption.Font.Color = clWindowText
    OptionsMessage.Caption.Font.Height = -13
    OptionsMessage.Caption.Font.Name = 'Tahoma'
    OptionsMessage.Caption.Font.Style = [fsBold]
    OptionsMessage.Text.Font.Charset = DEFAULT_CHARSET
    OptionsMessage.Text.Font.Color = clWindowText
    OptionsMessage.Text.Font.Height = -11
    OptionsMessage.Text.Font.Name = 'Tahoma'
    OptionsMessage.Text.Font.Style = []
    OptionsNavigationPanel.Font.Charset = DEFAULT_CHARSET
    OptionsNavigationPanel.Font.Color = clWindowText
    OptionsNavigationPanel.Font.Height = -11
    OptionsNavigationPanel.Font.Name = 'Tahoma'
    OptionsNavigationPanel.Font.Style = []
    OnButtonClick = alMessageAlertButtonClick
    Left = 888
    Top = 432
    PixelsPerInch = 96
  end
  object JvAppIniFileStorage1: TJvAppIniFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    FileName = 'style.ini'
    SubStorages = <>
    Left = 992
    Top = 416
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = JvAppIniFileStorage1
    AppStoragePath = '%FORM_NAME%\'
    StoredValues = <>
    Left = 984
    Top = 464
  end
end

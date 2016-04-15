object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'frmMain'
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
  OnCreate = FormCreate
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
    ColorSchemeAccent = rcsaPurple
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
        end>
      Index = 0
    end
  end
  object dxRibbonBackstageView1: TdxRibbonBackstageView
    Left = 218
    Top = 166
    Width = 577
    Height = 266
    Buttons = <>
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
    Panels = <>
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
      ExplicitWidth = 300
      ExplicitHeight = 200
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
      ExplicitHeight = 97
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
        ExplicitWidth = 198
        ExplicitHeight = 97
        object DBGrid1: TJvDBGrid
          Left = 0
          Top = 0
          Width = 190
          Height = 438
          Align = alClient
          DataSource = dtsWorkspaces
          Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
          TitleRowHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'Descricao'
              Title.Caption = 'Descri'#231#227'o'
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
      OneOnRow = True
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
      OnExecute = actOnAbreTelaExecute
    end
    object actCadastroAcaoConfigurarBaseDeDadosMSSQL: TAction
      Caption = 'MS SQL'
      HelpKeyword = 'TfrmCadastroAcaoConfigurarBaseDeDadosMSSQL'
      OnExecute = actOnAbreTelaExecute
    end
    object actCadastroAcaoConfigurarBaseDeDadosOracle: TAction
      Caption = 'Oracle'
      HelpKeyword = 'TfrmCadastroAcaoConfigurarBaseDeDadosOracle'
      OnExecute = actOnAbreTelaExecute
    end
    object actCadastroAcaoConjuntoBases: TAction
      Caption = 'Conjunto de Bases'
      HelpKeyword = 'TfrmCadastroAcaoConjuntoBases'
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
      OnExecute = actOnAbreTelaExecute
    end
  end
end

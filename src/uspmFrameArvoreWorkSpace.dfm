object spmFrameArvoreWorkSpace: TspmFrameArvoreWorkSpace
  Left = 0
  Top = 0
  Width = 320
  Height = 521
  TabOrder = 0
  object pnWorkSpacePadrao: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 50
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'WorkSpace'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object pnWorkSpaceArvore: TPanel
    Left = 0
    Top = 50
    Width = 320
    Height = 471
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object tvArvoreWorkSpace: TJvDBTreeView
      Left = 1
      Top = 1
      Width = 168
      Height = 349
      BevelInner = bvNone
      BevelOuter = bvNone
      DataSource = dsArvoreWorkSpace
      MasterField = 'CODIGO'
      DetailField = 'CODIGOPAI'
      ItemField = 'DESCRICAO'
      StartMasterValue = '0'
      UseFilter = False
      PersistentNode = False
      BorderStyle = bsNone
      ReadOnly = True
      Indent = 19
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TabOrder = 0
      OnDblClick = tvArvoreWorkSpaceDblClick
      PopupMenu = ppArvoreWorkSpace
      ParentFont = False
      Mirror = False
    end
    object grArvoreWorkSpace: TDBGrid
      Left = 1
      Top = 350
      Width = 318
      Height = 120
      Align = alBottom
      DataSource = dsArvoreWorkSpace
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object pnBaseDados: TPanel
      Left = 169
      Top = 1
      Width = 150
      Height = 349
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      object pcBaseDados: TPageControl
        Left = 0
        Top = 0
        Width = 150
        Height = 349
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 0
      end
    end
  end
  object cdsArvoreWorkSpace: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 8
    Top = 48
  end
  object dsArvoreWorkSpace: TDataSource
    DataSet = cdsArvoreWorkSpace
    OnDataChange = dsArvoreWorkSpaceDataChange
    Left = 40
    Top = 48
  end
  object ppArvoreWorkSpace: TPopupMenu
    Left = 72
    Top = 48
    object Padro1: TMenuItem
      Action = acWorkSpacePadrao
    end
    object ApagarCache1: TMenuItem
      Action = acApagarCache
    end
    object ApagarLogs1: TMenuItem
      Action = acApagarLogs
    end
    object Explorarbin1: TMenuItem
      Action = acExplorarBin
    end
    object ExplorarSrc1: TMenuItem
      Action = acExplorarSrc
    end
  end
  object alArvoreWorkSpace: TActionList
    Left = 104
    Top = 48
    object acWorkSpacePadrao: TAction
      Caption = 'Padr'#227'o'
      Hint = 'Definir WorkSpace Padr'#227'o'
      OnExecute = acWorkSpacePadraoExecute
    end
    object acRodaCPD: TAction
      Caption = 'Rodar CPD'
      OnExecute = acRodaCPDExecute
    end
    object acApagarCache: TAction
      Caption = 'Apagar Cache'
      OnExecute = acApagarCacheExecute
    end
    object acApagarLogs: TAction
      Caption = 'Apagar Logs'
      OnExecute = acApagarLogsExecute
    end
    object acExplorarSrc: TAction
      Caption = 'Explorar Src'
      OnExecute = acExplorarSrcExecute
    end
    object acExplorarBin: TAction
      Caption = 'Explorar Bin'
      OnExecute = acExplorarBinExecute
    end
  end
end

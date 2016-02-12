object dmDados: TdmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 362
  Width = 793
  object dmConexao: TZConnection
    ControlsCodePage = cCP_UTF16
    ClientCodepage = 'UTF-8'
    Catalog = ''
    Properties.Strings = (
      'codepage=UTF-8')
    DesignConnection = True
    HostName = ''
    Port = 0
    Database = 'C:\Softplan\Projetos\SPManagerRTC\bin\SPManager.sqlite3'
    User = ''
    Password = ''
    Protocol = 'sqlite-3'
    LibraryLocation = 'C:\Softplan\Projetos\SPManagerRTC\bin\sqlite3.dll'
    Left = 16
    Top = 8
  end
  object qrCadBaseDados: TZQuery
    Connection = dmConexao
    SortedFields = 'CDBASEDADOS'
    UpdateObject = upCadBaseDados
    SQL.Strings = (
      'SELECT '
      '  BD.*,'
      '  CASE WHEN BD.TPBASEDADOS = '#39'O'#39' THEN '#39'ORACLE'#39' '
      '       WHEN BD.TPBASEDADOS = '#39'D'#39' THEN '#39'DB2'#39' '
      
        '       WHEN BD.TPBASEDADOS = '#39'S'#39' THEN '#39'SQL SERVER'#39' END AS CC_DET' +
        'PBASEDADOS,'
      '  SI.DESISTEMA AS CC_DESISTEMA,'
      '  SI.FLUSAPRO AS CC_FLUSAPRO,'
      '  SI.FLUSASGC AS CC_FLUSASGC,'
      '  SI.FLUSAARC AS CC_FLUSAARC,'
      '  SI.FLUSAPSS AS CC_FLUSAPSS'
      'FROM CADBASEDADOS BD'
      'JOIN CADSISTEMAS SI ON SI.CDSISTEMA = BD.CDSISTEMA')
    Params = <>
    IndexFieldNames = 'CDBASEDADOS Asc'
    UpdateMode = umUpdateAll
    WhereMode = wmWhereAll
    Left = 16
    Top = 152
    object qrCadBaseDadosCDBASEDADOS: TLargeintField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 5
      FieldName = 'CDBASEDADOS'
      Required = True
    end
    object qrCadBaseDadosDEBASEDADOS: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 25
      FieldName = 'DEBASEDADOS'
      Required = True
      Size = 100
    end
    object qrCadBaseDadosCDSISTEMA: TLargeintField
      DisplayLabel = 'Sistema'
      DisplayWidth = 10
      FieldName = 'CDSISTEMA'
      Required = True
      Visible = False
    end
    object qrCadBaseDadosCC_DESISTEMA: TWideStringField
      DisplayLabel = 'Sistema'
      DisplayWidth = 10
      FieldName = 'CC_DESISTEMA'
      Required = True
      Size = 100
    end
    object qrCadBaseDadosTPBASEDADOS: TWideStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 10
      FieldName = 'TPBASEDADOS'
      Required = True
      Visible = False
      Size = 2
    end
    object qrCadBaseDadosCC_DETPBASEDADOS: TWideStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 10
      FieldName = 'CC_DETPBASEDADOS'
      ReadOnly = True
      Size = 510
    end
    object qrCadBaseDadosDEALIAS: TWideStringField
      DisplayLabel = 'Alias'
      DisplayWidth = 10
      FieldName = 'DEALIAS'
      Required = True
      Size = 40
    end
    object qrCadBaseDadosDEINSTANCIA: TWideStringField
      DisplayLabel = 'Inst'#226'ncia'
      DisplayWidth = 20
      FieldName = 'DEINSTANCIA'
      Required = True
      Size = 100
    end
    object qrCadBaseDadosDEUSUARIO: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      DisplayWidth = 15
      FieldName = 'DEUSUARIO'
      Size = 40
    end
    object qrCadBaseDadosDESENHA: TWideStringField
      DisplayLabel = 'Senha'
      DisplayWidth = 15
      FieldName = 'DESENHA'
      Size = 40
    end
    object qrCadBaseDadosDEALIASPRO: TWideStringField
      DisplayLabel = 'Alias PRO'
      DisplayWidth = 10
      FieldName = 'DEALIASPRO'
      Visible = False
      Size = 40
    end
    object qrCadBaseDadosDEALIASSGC: TWideStringField
      DisplayLabel = 'Alias SGC'
      DisplayWidth = 10
      FieldName = 'DEALIASSGC'
      Visible = False
      Size = 40
    end
    object qrCadBaseDadosDEALIASARC: TWideStringField
      DisplayLabel = 'Alias ARC'
      DisplayWidth = 10
      FieldName = 'DEALIASARC'
      Visible = False
      Size = 40
    end
    object qrCadBaseDadosDEALIASPSS: TWideStringField
      DisplayLabel = 'Alias PSS'
      DisplayWidth = 10
      FieldName = 'DEALIASPSS'
      Visible = False
      Size = 40
    end
    object qrCadBaseDadosCC_FLUSAPRO: TWideStringField
      FieldName = 'CC_FLUSAPRO'
      Visible = False
      Size = 2
    end
    object qrCadBaseDadosCC_FLUSASGC: TWideStringField
      FieldName = 'CC_FLUSASGC'
      Visible = False
      Size = 2
    end
    object qrCadBaseDadosCC_FLUSAARC: TWideStringField
      FieldName = 'CC_FLUSAARC'
      Visible = False
      Size = 2
    end
    object qrCadBaseDadosCC_FLUSAPSS: TWideStringField
      FieldName = 'CC_FLUSAPSS'
      Visible = False
      Size = 2
    end
  end
  object upCadBaseDados: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM CADBASEDADOS'
      'WHERE'
      '  CADBASEDADOS.CDBASEDADOS = :OLD_CDBASEDADOS')
    InsertSQL.Strings = (
      'INSERT INTO CADBASEDADOS'
      
        '  (CDBASEDADOS, DEBASEDADOS, TPBASEDADOS, DEINSTANCIA, DEUSUARIO' +
        ', DESENHA, '
      
        '   CDSISTEMA, DEALIAS, DEALIASPRO, DEALIASSGC, DEALIASARC, DEALI' +
        'ASPSS)'
      'VALUES'
      
        '  (:CDBASEDADOS, :DEBASEDADOS, :TPBASEDADOS, :DEINSTANCIA, :DEUS' +
        'UARIO, '
      
        '   :DESENHA, :CDSISTEMA, :DEALIAS, :DEALIASPRO, :DEALIASSGC, :DE' +
        'ALIASARC, '
      '   :DEALIASPSS)')
    ModifySQL.Strings = (
      'UPDATE CADBASEDADOS SET'
      '  CDBASEDADOS = :CDBASEDADOS,'
      '  DEBASEDADOS = :DEBASEDADOS,'
      '  TPBASEDADOS = :TPBASEDADOS,'
      '  DEINSTANCIA = :DEINSTANCIA,'
      '  DEUSUARIO = :DEUSUARIO,'
      '  DESENHA = :DESENHA,'
      '  CDSISTEMA = :CDSISTEMA,'
      '  DEALIAS = :DEALIAS,'
      '  DEALIASPRO = :DEALIASPRO,'
      '  DEALIASSGC = :DEALIASSGC,'
      '  DEALIASARC = :DEALIASARC,'
      '  DEALIASPSS = :DEALIASPSS'
      'WHERE'
      '  CADBASEDADOS.CDBASEDADOS = :OLD_CDBASEDADOS')
    UseSequenceFieldForRefreshSQL = False
    Left = 48
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDBASEDADOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBASEDADOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TPBASEDADOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEINSTANCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESENHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CDSISTEMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEALIAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEALIASPRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEALIASSGC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEALIASARC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEALIASPSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_CDBASEDADOS'
        ParamType = ptUnknown
      end>
  end
  object qrCadSistemas: TZQuery
    Connection = dmConexao
    SortedFields = 'CDSISTEMA'
    UpdateObject = upCadSistemas
    SQL.Strings = (
      'SELECT SI.*'
      'FROM CADSISTEMAS SI')
    Params = <>
    IndexFieldNames = 'CDSISTEMA Asc'
    UpdateMode = umUpdateAll
    WhereMode = wmWhereAll
    Left = 16
    Top = 104
    object qrCadSistemasCDSISTEMA: TLargeintField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 5
      FieldName = 'CDSISTEMA'
    end
    object qrCadSistemasDESISTEMA: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 20
      FieldName = 'DESISTEMA'
      Required = True
      Size = 100
    end
    object qrCadSistemasFLUSAPRO: TWideStringField
      FieldName = 'FLUSAPRO'
      Visible = False
      Size = 2
    end
    object qrCadSistemasFLUSASGC: TWideStringField
      FieldName = 'FLUSASGC'
      Visible = False
      Size = 2
    end
    object qrCadSistemasFLUSAARC: TWideStringField
      FieldName = 'FLUSAARC'
      Visible = False
      Size = 2
    end
    object qrCadSistemasFLUSAPSS: TWideStringField
      FieldName = 'FLUSAPSS'
      Visible = False
      Size = 2
    end
    object qrCadSistemasDEDIRREFER: TWideStringField
      DisplayLabel = 'Dir. Refer.'
      FieldName = 'DEDIRREFER'
      Required = True
    end
    object qrCadSistemasDELISTAEXE: TWideStringField
      DisplayLabel = 'Lista Exec.'
      FieldName = 'DELISTAEXE'
      Required = True
      Visible = False
      Size = 1000
    end
    object qrCadSistemasDELISTAEXEPRO: TWideStringField
      DisplayLabel = 'Lista Exec. PRO'
      FieldName = 'DELISTAEXEPRO'
      Visible = False
      Size = 1000
    end
    object qrCadSistemasDELISTAEXESGC: TWideStringField
      DisplayLabel = 'Lista Exec. SGC'
      FieldName = 'DELISTAEXESGC'
      Visible = False
      Size = 1000
    end
    object qrCadSistemasDELISTAEXEARC: TWideStringField
      DisplayLabel = 'Lista Exec. ARC'
      FieldName = 'DELISTAEXEARC'
      Visible = False
      Size = 1000
    end
    object qrCadSistemasDELISTAEXEPSS: TWideStringField
      DisplayLabel = 'Lista Exec. PSS'
      FieldName = 'DELISTAEXEPSS'
      Visible = False
      Size = 1000
    end
    object qrCadSistemasDELISTAEXEEXT: TWideStringField
      DisplayLabel = 'Lista Exec. Ext.'
      FieldName = 'DELISTAEXEEXT'
      Visible = False
      Size = 1000
    end
  end
  object upCadSistemas: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM CADSISTEMAS'
      'WHERE'
      '  CADSISTEMAS.CDSISTEMA = :OLD_CDSISTEMA')
    InsertSQL.Strings = (
      'INSERT INTO CADSISTEMAS'
      
        '  (CDSISTEMA, DESISTEMA, FLUSAPRO, FLUSASGC, FLUSAARC, FLUSAPSS,' +
        ' DEDIRREFER, '
      
        '   DELISTAEXE, DELISTAEXEPRO, DELISTAEXESGC, DELISTAEXEARC, DELI' +
        'STAEXEPSS, '
      '   DELISTAEXEEXT)'
      'VALUES'
      
        '  (:CDSISTEMA, :DESISTEMA, :FLUSAPRO, :FLUSASGC, :FLUSAARC, :FLU' +
        'SAPSS, '
      
        '   :DEDIRREFER, :DELISTAEXE, :DELISTAEXEPRO, :DELISTAEXESGC, :DE' +
        'LISTAEXEARC, '
      '   :DELISTAEXEPSS, :DELISTAEXEEXT)')
    ModifySQL.Strings = (
      'UPDATE CADSISTEMAS SET'
      '  CDSISTEMA = :CDSISTEMA,'
      '  DESISTEMA = :DESISTEMA,'
      '  FLUSAPRO = :FLUSAPRO,'
      '  FLUSASGC = :FLUSASGC,'
      '  FLUSAARC = :FLUSAARC,'
      '  FLUSAPSS = :FLUSAPSS,'
      '  DEDIRREFER = :DEDIRREFER,'
      '  DELISTAEXE = :DELISTAEXE,'
      '  DELISTAEXEPRO = :DELISTAEXEPRO,'
      '  DELISTAEXESGC = :DELISTAEXESGC,'
      '  DELISTAEXEARC = :DELISTAEXEARC,'
      '  DELISTAEXEPSS = :DELISTAEXEPSS,'
      '  DELISTAEXEEXT = :DELISTAEXEEXT'
      'WHERE'
      '  CADSISTEMAS.CDSISTEMA = :OLD_CDSISTEMA')
    UseSequenceFieldForRefreshSQL = False
    Left = 48
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDSISTEMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESISTEMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FLUSAPRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FLUSASGC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FLUSAARC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FLUSAPSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEDIRREFER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DELISTAEXE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DELISTAEXEPRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DELISTAEXESGC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DELISTAEXEARC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DELISTAEXEPSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DELISTAEXEEXT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_CDSISTEMA'
        ParamType = ptUnknown
      end>
  end
  object qrCadAplicacoes: TZQuery
    Connection = dmConexao
    SortedFields = 'CDAPLICACOES'
    UpdateObject = upCadAplicacoes
    SQL.Strings = (
      'SELECT AP.*'
      'FROM CADAPLICACOES AP')
    Params = <>
    IndexFieldNames = 'CDAPLICACOES Asc'
    UpdateMode = umUpdateAll
    WhereMode = wmWhereAll
    Left = 16
    Top = 200
    object qrCadAplicacoesCDAPLICACOES: TLargeintField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 5
      FieldName = 'CDAPLICACOES'
    end
    object qrCadAplicacoesDEAPLICACOES: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 20
      FieldName = 'DEAPLICACOES'
      Required = True
      Size = 100
    end
    object qrCadAplicacoesDEEXECUTAVEL: TWideStringField
      DisplayLabel = 'Execut'#225'vel'
      DisplayWidth = 65
      FieldName = 'DEEXECUTAVEL'
      Required = True
      Size = 1000
    end
    object qrCadAplicacoesBLICONE: TBlobField
      DisplayLabel = #205'cone'
      FieldName = 'BLICONE'
      Visible = False
    end
    object qrCadAplicacoesDEPARAMETROS: TWideStringField
      DisplayLabel = 'Par'#226'metros'
      DisplayWidth = 100
      FieldName = 'DEPARAMETROS'
      Visible = False
      Size = 400
    end
  end
  object upCadAplicacoes: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM CADAPLICACOES'
      'WHERE'
      '  CADAPLICACOES.CDAPLICACOES = :OLD_CDAPLICACOES')
    InsertSQL.Strings = (
      'INSERT INTO CADAPLICACOES'
      '  (CDAPLICACOES, DEAPLICACOES, DEEXECUTAVEL, BLICONE)'
      'VALUES'
      '  (:CDAPLICACOES, :DEAPLICACOES, :DEEXECUTAVEL, :BLICONE)')
    ModifySQL.Strings = (
      'UPDATE CADAPLICACOES SET'
      '  CDAPLICACOES = :CDAPLICACOES,'
      '  DEAPLICACOES = :DEAPLICACOES,'
      '  DEEXECUTAVEL = :DEEXECUTAVEL,'
      '  BLICONE = :BLICONE'
      'WHERE'
      '  CADAPLICACOES.CDAPLICACOES = :OLD_CDAPLICACOES')
    UseSequenceFieldForRefreshSQL = False
    Left = 48
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDAPLICACOES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEAPLICACOES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEEXECUTAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BLICONE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_CDAPLICACOES'
        ParamType = ptUnknown
      end>
  end
  object qrCfgManager: TZQuery
    Connection = dmConexao
    UpdateObject = upCfgManager
    SQL.Strings = (
      'SELECT *'
      'FROM CFGMANAGER')
    Params = <>
    UpdateMode = umUpdateAll
    WhereMode = wmWhereAll
    Left = 16
    Top = 56
    object qrCfgManagerDEPATHREFER: TWideStringField
      DisplayWidth = 10
      FieldName = 'DEPATHREFER'
      Size = 200
    end
    object qrCfgManagerDEWSPADRAO: TWideStringField
      FieldName = 'DEWSPADRAO'
      Size = 100
    end
  end
  object upCfgManager: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM CFGMANAGER'
      'WHERE'
      
        '  ((CFGMANAGER.DEPATHREFER IS NULL AND :OLD_DEPATHREFER IS NULL)' +
        ' OR (CFGMANAGER.DEPATHREFER = :OLD_DEPATHREFER)) AND'
      
        '  ((CFGMANAGER.DEWSPADRAO IS NULL AND :OLD_DEWSPADRAO IS NULL) O' +
        'R (CFGMANAGER.DEWSPADRAO = :OLD_DEWSPADRAO))')
    InsertSQL.Strings = (
      'INSERT INTO CFGMANAGER'
      '  (DEPATHREFER, DEWSPADRAO)'
      'VALUES'
      '  (:DEPATHREFER, :DEWSPADRAO)')
    ModifySQL.Strings = (
      'UPDATE CFGMANAGER SET'
      '  DEPATHREFER = :DEPATHREFER,'
      '  DEWSPADRAO = :DEWSPADRAO'
      'WHERE'
      
        '  ((CFGMANAGER.DEPATHREFER IS NULL AND :OLD_DEPATHREFER IS NULL)' +
        ' OR (CFGMANAGER.DEPATHREFER = :OLD_DEPATHREFER)) AND'
      
        '  ((CFGMANAGER.DEWSPADRAO IS NULL AND :OLD_DEWSPADRAO IS NULL) O' +
        'R (CFGMANAGER.DEWSPADRAO = :OLD_DEWSPADRAO))')
    UseSequenceFieldForRefreshSQL = False
    Left = 48
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DEPATHREFER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEWSPADRAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_DEPATHREFER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_DEWSPADRAO'
        ParamType = ptUnknown
      end>
  end
end

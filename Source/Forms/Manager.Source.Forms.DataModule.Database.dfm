object dtmDatabase: TdtmDatabase
  OldCreateOrder = False
  Height = 362
  Width = 793
  object InstantIBXConnector1: TInstantIBXConnector
    IsDefault = True
    LoginPrompt = False
    Connection = IBDatabase1
    Left = 56
    Top = 136
  end
  object IBTransaction1: TIBTransaction
    Left = 56
    Top = 88
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = 'D:\apps\Softplan-Manager\bin\data.fdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 56
    Top = 40
  end
  object IBScript1: TIBScript
    Database = IBDatabase1
    Transaction = IBTransaction1
    Terminator = ';'
    Left = 56
    Top = 184
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 56
    Top = 232
  end
end

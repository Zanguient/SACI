object DMFB: TDMFB
  OldCreateOrder = False
  Left = 495
  Top = 277
  Height = 178
  Width = 218
  object IBDatabaseConn: TIBDatabase
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransactionConn
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 35
    Top = 25
  end
  object IBTransactionConn: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabaseConn
    AutoStopAction = saNone
    Left = 137
    Top = 25
  end
  object qComandos: TIBQuery
    Database = IBDatabaseConn
    Transaction = IBTransactionConn
    BufferChunks = 1000
    CachedUpdates = False
    Left = 35
    Top = 80
  end
  object qConsultas: TIBQuery
    Database = IBDatabaseConn
    Transaction = IBTransactionConn
    BufferChunks = 1000
    CachedUpdates = False
    Left = 137
    Top = 80
  end
end

object frmImportaEstoque: TfrmImportaEstoque
  Left = 421
  Top = 291
  BorderStyle = bsNone
  Caption = 'Tabela de Estoque de Produtos'
  ClientHeight = 61
  ClientWidth = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 0
    Top = 0
    Width = 400
    Height = 25
    ForeColor = clBlue
    Progress = 0
  end
  object OpenDialog1: TOpenDialog
    Left = 3
    Top = 31
  end
  object IBDatabase1: TIBDatabase
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 33
    Top = 31
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 65
    Top = 31
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 97
    Top = 31
  end
  object IBDataSet1: TIBDataSet
    BufferChunks = 1000
    CachedUpdates = False
    Left = 129
    Top = 31
  end
end

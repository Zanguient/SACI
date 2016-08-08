object frmLivro: TfrmLivro
  Left = 222
  Top = 58
  Width = 1084
  Height = 653
  Caption = 'Livro'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 966
    Height = 626
    Align = alClient
    TabOrder = 0
    DesignSize = (
      966
      626)
    object Label2: TLabel
      Left = 15
      Top = 60
      Width = 57
      Height = 13
      Caption = 'Ocorr'#234'ncias'
    end
    object Label3: TLabel
      Left = 15
      Top = 15
      Width = 36
      Height = 13
      Caption = 'Porteiro'
    end
    object DBGridOcorrencia: TDBGrid
      Left = 15
      Top = 75
      Width = 233
      Height = 490
      Anchors = [akLeft, akTop, akBottom]
      Ctl3D = True
      DataSource = dsOcorrencia
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGridOcorrenciaDrawColumnCell
    end
    object mmMensagem: TMemo
      Left = 260
      Top = 75
      Width = 687
      Height = 490
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clMenu
      ReadOnly = True
      TabOrder = 2
    end
    object cbxPorteiro: TComboBox
      Left = 15
      Top = 30
      Width = 233
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'FL'#193'VIO'
        'GUGU'
        'JOAQUIM'
        'RAFAEL')
    end
    object Panel1: TPanel
      Left = 1
      Top = 573
      Width = 964
      Height = 52
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      object Label4: TLabel
        Left = 15
        Top = 5
        Width = 52
        Height = 13
        Caption = 'Aten'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 15
        Top = 20
        Width = 393
        Height = 13
        Caption = 
          'Ocorr'#234'ncias destacadas em vermelho s'#227'o importantes, portanto, pr' +
          'iorise sua leitura.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object Panel3: TPanel
    Left = 966
    Top = 0
    Width = 110
    Height = 626
    Align = alRight
    TabOrder = 1
    object Label1: TLabel
      Left = 10
      Top = 15
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object dtpData: TDateTimePicker
      Left = 10
      Top = 30
      Width = 90
      Height = 21
      Date = 42589.635880393520000000
      Time = 42589.635880393520000000
      TabOrder = 0
    end
    object btnConsultar: TBitBtn
      Left = 10
      Top = 60
      Width = 90
      Height = 25
      Caption = '&Consultar'
      TabOrder = 1
      OnClick = btnConsultarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
    end
    object btnNovo: TBitBtn
      Left = 10
      Top = 95
      Width = 90
      Height = 25
      Caption = '&Novo'
      TabOrder = 2
      OnClick = btnNovoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
        0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
        0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
        5555557FFFFF7755555555500000005555555577777775555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
    end
  end
  object ConnectionLagoa: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=agfm1901;Persist Security Info=True' +
      ';User ID=lagoa;Initial Catalog=buildsis_lagoa;Data Source=70.38.' +
      '11.27;Use Procedure for Prepare=1;Auto Translate=True;Packet Siz' +
      'e=4096;Workstation ID=FONTESD7-VM;Use Encryption for Data=False;' +
      'Tag with column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 435
    Top = 505
  end
  object ADOOcorrencia: TADOQuery
    Active = True
    Connection = ConnectionLagoa
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM OCORRENCIA ORDER BY DATAOCORRENCIA')
    Left = 465
    Top = 505
    object ADOOcorrenciaID: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 7
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object ADOOcorrenciaPorteiro: TStringField
      DisplayWidth = 12
      FieldName = 'Porteiro'
      Size = 50
    end
    object ADOOcorrenciaDataOcorrencia: TDateTimeField
      DisplayLabel = 'Data Hora'
      DisplayWidth = 20
      FieldName = 'DataOcorrencia'
    end
    object ADOOcorrenciaOcorrencia: TMemoField
      FieldName = 'Ocorrencia'
      Visible = False
      BlobType = ftMemo
    end
    object ADOOcorrenciaIMPORTANTE: TStringField
      FieldName = 'IMPORTANTE'
      Visible = False
      Size = 1
    end
  end
  object dsOcorrencia: TDataSource
    DataSet = ADOOcorrencia
    OnDataChange = dsOcorrenciaDataChange
    Left = 495
    Top = 505
  end
end

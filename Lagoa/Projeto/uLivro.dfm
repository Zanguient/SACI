object frmLivro: TfrmLivro
  Left = 285
  Top = 106
  Width = 826
  Height = 577
  BorderIcons = [biSystemMenu]
  Caption = 'Livro'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 708
    Height = 550
    Align = alClient
    TabOrder = 0
    DesignSize = (
      708
      550)
    object Label2: TLabel
      Left = 15
      Top = 15
      Width = 57
      Height = 13
      Caption = 'Ocorr'#234'ncias'
    end
    object DBGridOcorrencia: TDBGrid
      Left = 15
      Top = 30
      Width = 221
      Height = 450
      Anchors = [akLeft, akTop, akBottom]
      Ctl3D = True
      DataSource = dsOcorrencia
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      PopupMenu = pmOcorrencia
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGridOcorrenciaDrawColumnCell
    end
    object mmMensagem: TMemo
      Left = 255
      Top = 30
      Width = 434
      Height = 450
      Anchors = [akLeft, akTop, akRight, akBottom]
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object Panel1: TPanel
      Left = 1
      Top = 497
      Width = 706
      Height = 52
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object Label4: TLabel
        Left = 15
        Top = 3
        Width = 62
        Height = 16
        Caption = 'Aten'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 15
        Top = 20
        Width = 501
        Height = 16
        Caption = 
          'Ocorr'#234'ncias destacadas em vermelho s'#227'o importantes, portanto, pr' +
          'iorise sua leitura.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object Panel3: TPanel
    Left = 708
    Top = 0
    Width = 110
    Height = 550
    Align = alRight
    TabOrder = 1
    DesignSize = (
      110
      550)
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
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
        9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FF
        485360FEE9C7F4DAB5F3D5AAF2D0A0EFCB96EFC68BEDC182EBC17FEBC180EBC1
        80F2C782A46769FF00FFFF00FFFF00FF6F6F6FE9E9E9DEDEDED9D9D9D4D4D4CF
        CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FF4380B7
        1F6FC2656B86F3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FF9292928282828E8E8EE0E0E0DBDBDBD7D7D7D2
        D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
        32A3FF1672D76B6A80F2DABCF2D5B2EFD0A9EECB9EEDC796EBC28CE9BD82E9BD
        7FEFC481A46769FF00FFFF00FFFF00FFA5A5A58484848E8E8EE0E0E0DCDCDCD7
        D7D7D2D2D2CECECEC9C9C9C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
        A0675B34A1FF1572D45E6782F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FF959595A6A6A6828282898989E0E0E0DB
        DBDBD6D6D6D2D2D2CDCDCDC8C8C8C4C4C4C5C5C59C9C9CFF00FFFF00FFFF00FF
        A7756BFFFBF033A6FF4078AD8E675EAC7F7597645EAC7D6FCAA083EDC695EBC2
        8AEFC583A46769FF00FFFF00FFFF00FF9F9F9FF9F9F9A5A5A58C8C8C8E8E8EA6
        A6A6929292A3A3A3B8B8B8CDCDCDC8C8C8C7C7C79C9C9CFF00FFFF00FFFF00FF
        A7756BFFFFFCFAF0E6AD8A88B78F84D8BAA5EED5B6D7B298B58877CBA083EBC7
        93F2C98CA46769FF00FFFF00FFFF00FF9F9F9FFEFEFEF3F3F3AFAFAFB1B1B1CC
        CCCCDCDCDCC6C6C6AAAAAAB9B9B9CCCCCCCCCCCC9C9C9CFF00FFFF00FFFF00FF
        BC8268FFFFFFFEF7F2AF847FDAC0B4F7E3CFF6E0C5FFFFF4D7B198AC7D6FEECC
        9EF3CE97A46769FF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9ABABABD3D3D3E9
        E9E9E5E5E5FBFBFBC6C6C6A3A3A3D2D2D2D1D1D19C9C9CFF00FFFF00FFFF00FF
        BC8268FFFFFFFFFEFC976560F6E9E0F7EADAF6E3CFFFFFEBEFD4B797645EF0D0
        A6F6D3A0A46769FF00FFFF00FFFF00FFA6A6A6FFFFFFFEFEFE939393EFEFEFEE
        EEEEE9E9E9F7F7F7DDDDDD929292D6D6D6D6D6D69C9C9CFF00FFFF00FFFF00FF
        D1926DFFFFFFFFFFFFB08884DECAC4FAEFE5F8EAD9FFFFD4D9B8A5AC7F74F4D8
        B1EBCFA4A46769FF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFAEAEAEDBDBDBF3
        F3F3EEEEEEEEEEEECDCDCDA5A5A5DCDCDCD3D3D39C9C9CFF00FFFF00FFFF00FF
        D1926DFFFFFFFFFFFFD5BFBCBA9793DECAC4F6E9DEDAC0B4B78F84B28C7BDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFD5D5D5B9B9B9DB
        DBDBEFEFEFD3D3D3B1B1B1ABABABD5D5D5B7B7B79C9C9CFF00FFFF00FFFF00FF
        DA9D75FFFFFFFFFFFFFFFFFFD5BFBCB08884976560AF867FCAA79DA56B5FA56B
        5FA56B5FA46769FF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFD5D5D5AE
        AEAE939393ABABABC3C3C39999999999999999999C9C9CFF00FFFF00FFFF00FF
        DA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAA56B5FE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFDFDFDFCFCFCD6D6D6999999ACACAC9B9B9B969696FF00FFFF00FFFF00FF
        E7AB79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC7C5A56B5FF8B5
        5CBF7A5CFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
        E7AB79FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6
        F6F6F6F6F6F6F6F6D7D7D7999999AAAAAAFF00FFFF00FFFF00FFFF00FFFF00FF
        E7AB79D1926DD1926DD1926DD1926DD1926DD1926DD1926DD1926DA56B5FFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
        B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
    end
    object btnNovo: TBitBtn
      Left = 10
      Top = 93
      Width = 90
      Height = 25
      Caption = '&Novo'
      TabOrder = 2
      OnClick = btnNovoClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
        9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FF
        B79184FEE9C7F4DAB5F3D5AAF2D0A0EFCB96EFC68BEDC182EBC17FEBC180EBC1
        80F2C782A46769FF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
        CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
        B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FF9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2
        D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
        B7938AFEEFDAF6E0C6F2DABCF2D5B2EFD0A9EECB9EEDC796EBC28CE9BD82E9BD
        7FEFC481A46769FF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0DCDCDCD7
        D7D7D2D2D2CECECEC9C9C9C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
        BA978FFFF4E5F7E5CFF4E0C5F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FF959595F5F5F5E9E9E9E4E4E4E0E0E0DB
        DBDBD6D6D6D2D2D2CDCDCDC8C8C8C4C4C4C5C5C59C9C9CFF00FFFF00FFFF00FF
        C09E95FFFBF0F8EADCF6E3CFF4E0C6F2D9BCF2D5B1F0D0A9EDCB9EEDC695EBC2
        8AEFC583A46769FF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE9E9E9E5E5E5E0
        E0E0DBDBDBD7D7D7D1D1D1CDCDCDC8C8C8C7C7C79C9C9CFF00FFFF00FFFF00FF
        C6A49AFFFFFCFAF0E6F8EADAF7E5CFF4E0C5F2DABAF2D5B1F0D0A7EECB9DEBC7
        93F2C98CA46769FF00FFFF00FFFF00FF9F9F9FFEFEFEF3F3F3EEEEEEE9E9E9E4
        E4E4DFDFDFDBDBDBD7D7D7D1D1D1CCCCCCCCCCCC9C9C9CFF00FFFF00FFFF00FF
        CBA99EFFFFFFFEF7F2FAEFE6F8EAD9F7E3CFF6E0C5F2DABBF2D4B1F0D0A7EECC
        9EF3CE97A46769FF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3EEEEEEE9
        E9E9E5E5E5DFDFDFDBDBDBD7D7D7D2D2D2D1D1D19C9C9CFF00FFFF00FFFF00FF
        CFAC9FFFFFFFFFFEFCFCF6F0FAEFE6F7EADAF6E3CFF4E0C5F3D9BBF3D4B0F0D0
        A6F6D3A0A46769FF00FFFF00FFFF00FFA6A6A6FFFFFFFEFEFEF8F8F8F3F3F3EE
        EEEEE9E9E9E4E4E4E0E0E0DBDBDBD6D6D6D6D6D69C9C9CFF00FFFF00FFFF00FF
        D4B0A1FFFFFFFFFFFFFFFEFCFEF7F0FAEFE5F8EAD9F7E5CEF6DEC4F3D9B8F4D8
        B1EBCFA4A46769FF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3
        F3F3EEEEEEE9E9E9E4E4E4DFDFDFDCDCDCD3D3D39C9C9CFF00FFFF00FFFF00FF
        D9B5A1FFFFFFFFFFFFFFFFFFFFFEFCFCF7F0FAEFE5F8E9D9F8E7D1FBEACEDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8
        F8F8F3F3F3EEEEEEEBEBEBEAEAEAD5D5D5B7B7B79C9C9CFF00FFFF00FFFF00FF
        DDB7A4FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFCF3E6EDD8C9B68A7BA17B
        6F9C7667A46769FF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFE
        FEFEF8F8F8F4F4F4E3E3E39999999999999999999C9C9CFF00FFFF00FFFF00FF
        E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFDFDFDFCFCFCD6D6D6999999ACACAC9B9B9B969696FF00FFFF00FFFF00FF
        E6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC7C5B88265F8B5
        5CBF7A5CFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
        E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6
        F6F6F6F6F6F6F6F6D7D7D7999999AAAAAAFF00FFFF00FFFF00FFFF00FFFF00FF
        E8C4ADEBCBB7EBCBB7EACBB7EACAB6EACAB6EACAB6EACAB6E3C2B1A56B5FFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
        B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
    end
    object btnSair: TBitBtn
      Left = 10
      Top = 126
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Sai&r'
      TabOrder = 3
      OnClick = btnSairClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        0800000000000002000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD0101FD
        FDFDFDFDFD0101FDFDFDFDFDFD9B9BFDFDFDFDFDFD9B9BFDFDFDFDFD01171701
        FDFDFDFD010F1701FDFDFDFD9BF7F79BFDFDFDFD9BF7F79BFDFDFDFD01171717
        01FDFD010F170F01FDFDFDFD9BF7F7F79BFDFD9BF7F7F79BFDFDFDFDFD011717
        1701010F170F01FDFDFDFDFDFD9BF7F7F79B9BF7F7F79BFDFDFDFDFDFDFD0117
        1F1717170F01FDFDFDFDFDFDFDFD9BF7F7F7F7F7F79BFDFDFDFDFDFDFDFDFD01
        1717171701FDFDFDFDFDFDFDFDFDFD9BF7F7F7F79BFDFDFDFDFDFDFDFDFDFD01
        5717171701FDFDFDFDFDFDFDFDFDFD9BF7F7F7F79BFDFDFDFDFDFDFDFDFD015F
        5F57571F1701FDFDFDFDFDFDFDFD9B070707F707F79BFDFDFDFDFDFDFD015F5F
        5F01015F1F5F01FDFDFDFDFDFD9B0707F79B9BF707F79BFDFDFDFDFD0167675F
        01FDFD015F5F5701FDFDFDFD9B0707F79BFDFD9BF707F79BFDFDFDFD01675F01
        FDFDFDFD015F1F01FDFDFDFD9B07079BFDFDFDFD9BF7079BFDFDFDFDFD0101FD
        FDFDFDFDFD0101FDFDFDFDFDFD9B9BFDFDFDFDFDFD9B9BFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
      NumGlyphs = 2
    end
  end
  object ConnectionLagoa: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 270
    Top = 85
  end
  object ADOOcorrencia: TADOQuery
    Connection = ConnectionLagoa
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM OCORRENCIA ORDER BY DATAOCORRENCIA DESC')
    Left = 300
    Top = 85
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
      DisplayLabel = 'Data/Hora'
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
    Left = 330
    Top = 85
  end
  object pmOcorrencia: TPopupMenu
    Left = 455
    Top = 170
    object EnviarEmailparaoSndico1: TMenuItem
      Caption = 'Enviar Email para o S'#237'ndico'
      OnClick = EnviarEmailparaoSndico1Click
    end
  end
end

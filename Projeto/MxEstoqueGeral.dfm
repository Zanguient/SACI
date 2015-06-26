object fMxEstoqueGeral: TfMxEstoqueGeral
  Left = 344
  Top = 262
  HelpContext = 6200
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Pesquisa de Estoque'
  ClientHeight = 251
  ClientWidth = 678
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel5: TPanel
    Left = 0
    Top = 211
    Width = 678
    Height = 40
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      678
      40)
    object SB_Loc: TSpeedButton
      Left = 392
      Top = 7
      Width = 90
      Height = 25
      Hint = 'Imprime os Movimentos'
      Anchors = [akTop, akRight]
      Caption = '&Localizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SB_LocClick
    end
    object SpeedButton1: TSpeedButton
      Left = 481
      Top = 7
      Width = 90
      Height = 25
      Hint = 'Imprime os Movimentos'
      Anchors = [akTop, akRight]
      Caption = '&Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF989898989898FF00FFFF
        00FF989898989898FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF6C6A6AAAA7A7A19F9F6C6A6A6C6A6A6C6A6AE5E3E36C6A6A6C6A6A6C6A
        6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF989898BFBFBFBABABA98989898
        9898989898E1E1E1989898989898989898FF00FFFF00FFFF00FFFF00FFFF00FF
        6C6A6ADAD9D9A19F9FA19F9FA19F9F3736363535356C6D6DBFBFBFE1E2E2B7B6
        B66C6A6A6C6A6A6C6A6AFF00FFFF00FF989898DBDBDBBABABABABABABABABA72
        7272717171999999CCCCCCDFDFDFC7C7C7989898989898989898FF00FF6C6A6A
        D4D3D3CACACA8E8C8C8E8C8C8E8C8C3C3B3B0A090A0707070B0B0B0707077A7A
        7ABBBBBB6C6A6AFF00FFFF00FF989898D7D7D7D3D3D3AEAEAEAEAEAEAEAEAE76
        7676474747454545494949454545A2A2A2CACACA989898FF00FF6C6A6ACACACA
        CACACA8E8C8CD7D4D4CECBCBBFBCBCB1AFAFA3A0A08886865E5B5C0707070909
        090808086C6A6A767373989898D3D3D3D3D3D3AEAEAED9D9D9D3D3D3CBCBCBC3
        C3C3BABABAAAAAAA8E8E8E4545454747474646469898989D9D9D6C6A6ACACACA
        8E8C8CEFEEEEFFFEFEFBFAFAE3E0E1DEDEDEDEDDDDCFCECEBDBCBCADABAB8B89
        895856567A7878757373989898D3D3D3AEAEAEE6E6E6EFEFEFEDEDEDDFDFDFDE
        DEDEDDDDDDD4D4D4CACACAC1C1C1ACACAC8A8A8AA1A1A19D9D9D6C6A6A8E8C8C
        FFFFFFFEFCFCFAFAFAD5D4D5989193A09899B2ABACC4C0C1D7D7D7D8D8D8C7C6
        C6B7B6B6918F8F6C6969989898AEAEAEEFEFEFEFEFEFEDEDEDD8D8D8B3B3B3B7
        B7B7C2C2C2CDCDCDDADADADBDBDBD0D0D0C7C7C7AFAFAF979797FF00FF6C6A6A
        6C6A6AEDEBEBB1A6A77A6F728A83889692959690919D97989A93959E9899BBBA
        BAD1D1D1C2C2C26C6A6AFF00FF989898989898E6E6E6C1C1C19E9E9EAAAAAAB2
        B2B2B1B1B1B6B6B6B4B4B4B7B7B7C9C9C9D7D7D7CECECE989898FF00FFFF00FF
        FF00FF6C6A6ABB897FA7876D8B6F647D67606F62657973798F8B8EA9A3A4CBCA
        CAC1C1C16C6A6AFF00FFFF00FFFF00FFFF00FF989898A7A7A79999998A8A8A9A
        9A9A9696969F9F9FAEAEAEBDBDBDD3D3D3CDCDCD989898FF00FFFF00FFFF00FF
        FF00FFFF00FFBD8281FFE3B4FFD39FE9B281C99973BA916CBD8281807D7E6C6A
        6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9D3D3D3CCCCCCB8
        B8B8A7A7A79F9F9FA9A9A9A5A5A5989898989898FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFBD8281FFE0B8FFD3A7FFD09DFFCE90FFC688BD8281FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9D5D5D5CFCFCFCB
        CBCBC6C6C6C3C3C3A9A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFC08683FFE7CFFFE0C0FFD9B2FFD3A5FFD099BD8281FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFABABABDDDDDDD8D8D8D3D3D3CE
        CECECACACAA9A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFBD8281FEEBD8FFE6CCFFDEBDFFD8B1FED3A4BD8281FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9E0E0E0DCDCDCD7D7D7D3
        D3D3CDCDCDA9A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        BD8281FFFFF2FFFFF2FFEBD8FFE5CAFFE1BDF3C7A7BD8281FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9EAEAEAEAEAEAE1E1E1DCDCDCD7
        D7D7CBCBCBA9A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        BD8281BD8281BD8281FBEFE2FBE3CFFBDDC2BD8281FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9A9A9A9A9A9A9E3E3E3DCDCDCD8
        D8D8A9A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFBD8281BD8281BD8281FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9A9A9A9A9
        A9A9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 570
      Top = 7
      Width = 90
      Height = 25
      Hint = 'Fechar'
      Anchors = [akTop, akRight]
      Caption = '&Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000120B0000120B00000001000000000000000000000000
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
        FD9249FDFDFDFDFDFDFDFDFDFDFDFDFDFDF7A4FDFDFDFDFDFDFDFDFDFDFD9292
        D2D249FDFDFDFDFDFDFDFDFDFDFDF7F7A4F7A4FDFDFDFDFDFDFDFDFD9292D3D3
        D2D249929292929292FDFDFDF7F7F7F7F7F7A4F7F7F7F7F7F7FDFDFD92DBDBDB
        DBD349E40909090992FDFDFDF7F7F7F7F7F7A40808080808F7FDFDFD92DBDBDB
        DBDB49723232320992FDFDFDF7F7F7F7F7F7A4A4A4A4A408F7FDFDFD92DBDBDB
        DBDB49723232320992FDFDFDF707F7F7F7F7A4F7F7F7A408F7FDFDFD92DBDBDB
        DBDB49723232320992FDFDFDF707070707F7A4A4A4F7A408F7FDFDFD92DBDBE4
        09DC49BD7B73730992FDFDFDF7070707F607A40807F7F708F7FDFDFD92E4DBE4
        09DC49FFFFFF080992FDFDFDF7070707F607A4F6F6F6F608F7FDFDFD92E4E4E4
        E4DB4909FFFFFF0992FDFDFDF707070707F7A4F6F6F6F608F7FDFDFD92E4E4E4
        E4DB4909FFFFFF0992FDFDFDF70707070707A4F6F6F6F608F7FDFDFD92E4E4E4
        E4DB4909FFFFFF0992FDFDFDF70707070707A4F6F6F6F608F7FDFDFD92E4E4E4
        E4E44909FFFFFF0992FDFDFDF70707070707A4F6F6F6F608F7FDFDFD9292E4E4
        E4E44909FFFFFF0992FDFDFDF7F707070707A4F6F6F6F608F7FDFDFDFDFD929B
        DBDB49929292929292FDFDFDFDFDF7F7F707A4F7F7F7F7F7F7FDFDFDFDFDFDFD
        929249FDFDFDFDFDFDFDFDFDFDFDFDFDF7F7A4FDFDFDFDFDFDFD}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 91
    Width = 678
    Height = 120
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      678
      120)
    object Label1: TLabel
      Left = 15
      Top = 29
      Width = 32
      Height = 13
      Caption = 'Local'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 15
      Top = 56
      Width = 44
      Height = 13
      Caption = 'Externo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 73
      Top = 9
      Width = 56
      Height = 13
      Caption = 'Comercial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 157
      Top = 9
      Width = 48
      Height = 13
      Caption = 'Reserva'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 227
      Top = 9
      Width = 71
      Height = 13
      Caption = 'Indispon'#237'vel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 324
      Top = 9
      Width = 33
      Height = 13
      Caption = 'Saldo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 15
      Top = 96
      Width = 30
      Height = 13
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 61
      Top = 80
      Width = 323
      Height = 3
    end
    object Label12: TLabel
      Left = 2
      Top = 28
      Width = 9
      Height = 16
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Zurich Ex BT'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label13: TLabel
      Left = 2
      Top = 55
      Width = 9
      Height = 16
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Zurich Ex BT'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label15: TLabel
      Left = 472
      Top = 9
      Width = 163
      Height = 13
      Caption = 'Previs'#227'o (Dt.Compra/DtEnt.)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 396
      Top = 9
      Width = 57
      Height = 13
      Caption = 'Embarque'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtFisicoLoc: TEdit
      Left = 61
      Top = 25
      Width = 80
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtReservaLoc: TEdit
      Left = 142
      Top = 25
      Width = 80
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtIndisponivelLoc: TEdit
      Left = 223
      Top = 25
      Width = 80
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtSaldoLoc: TEdit
      Left = 304
      Top = 25
      Width = 80
      Height = 21
      TabStop = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtFisicoExt: TEdit
      Left = 61
      Top = 52
      Width = 80
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 5
    end
    object edtReservaExt: TEdit
      Left = 142
      Top = 52
      Width = 80
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 6
    end
    object edtIndisponivelExt: TEdit
      Left = 223
      Top = 52
      Width = 80
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 7
    end
    object edtSaldoExt: TEdit
      Left = 304
      Top = 52
      Width = 80
      Height = 21
      TabStop = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object edtTotalFisico: TEdit
      Left = 61
      Top = 92
      Width = 80
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 9
    end
    object edtTotalReserva: TEdit
      Left = 142
      Top = 92
      Width = 80
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 10
    end
    object edtTotalIndisponivel: TEdit
      Left = 223
      Top = 92
      Width = 80
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 11
    end
    object edtTotalSaldo: TEdit
      Left = 304
      Top = 92
      Width = 80
      Height = 21
      TabStop = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
    end
    object edtEmbarqueLoc: TEdit
      Left = 385
      Top = 25
      Width = 80
      Height = 21
      TabStop = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object edtEmbarqueExt: TEdit
      Left = 385
      Top = 52
      Width = 80
      Height = 21
      TabStop = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
    end
    object cmbPrevisaoLoc: TComboBox
      Left = 466
      Top = 25
      Width = 194
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      ItemHeight = 13
      TabOrder = 14
    end
    object cmbPrevisaoExt: TComboBox
      Left = 466
      Top = 52
      Width = 194
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      ItemHeight = 13
      TabOrder = 15
    end
    object edtTotalPrevisao: TEdit
      Left = 466
      Top = 92
      Width = 194
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 16
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 678
    Height = 91
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      678
      91)
    object Label8: TLabel
      Left = 15
      Top = 12
      Width = 45
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 15
      Top = 49
      Width = 63
      Height = 13
      Caption = 'Refer'#234'ncia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 154
      Top = 49
      Width = 45
      Height = 13
      Caption = 'Detalhe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 81
      Top = 12
      Width = 58
      Height = 13
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 598
      Top = 12
      Width = 34
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Pre'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodigoPRD: TEdit
      Left = 15
      Top = 26
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edtCodigoPRDChange
      OnKeyPress = edtCodigoPRDKeyPress
    end
    object edtProduto: TEdit
      Left = 81
      Top = 26
      Width = 516
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clMenu
      Enabled = False
      TabOrder = 1
    end
    object edtReferencia: TEdit
      Left = 15
      Top = 63
      Width = 138
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 2
    end
    object edtDetalhe: TEdit
      Left = 154
      Top = 63
      Width = 509
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clMenu
      Enabled = False
      TabOrder = 3
    end
    object edtPrecoVenda: TEdit
      Left = 598
      Top = 26
      Width = 65
      Height = 21
      Anchors = [akTop, akRight]
      Color = clMenu
      Enabled = False
      TabOrder = 4
    end
  end
  object Item_de_Estoque1: TItem_de_Estoque
    BeforeOpen = Item_de_Estoque1BeforeOpen
    DatabaseName = 'DBguerra'
    Filtered = True
    SQL.Strings = (
      'SELECT * FROM ITEM_DE_ESTOQUE'
      'WHERE CNC_CODIGO=:CNC_CODIGO AND PRD_CODIGO=:PRD_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = 1
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    Tabela = 'ITEM_DE_ESTOQUE'
    CodigoFUN = 0
    CodigoPRD = 0
    MaquinaIES = 0
    Left = 40
    Top = 218
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CNC_CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PRD_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object Produto1: TProduto
    BeforeOpen = Produto1BeforeOpen
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM PRODUTO'
      'WHERE PRD_CODIGO=:PRD_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = 1
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    Tabela = 'PRODUTO'
    Catalogo = False
    Classificacao = 0
    CodigoCLF = 0
    CodigoCTP = 0
    CodigoFOR = 0
    CodigoGRP = 0
    CodigoORF = 0
    CodigoPRD = 0
    CodigoSGP = 0
    EstoqueDetalhado = False
    ForaDeLinha = False
    ForaPrevisao = False
    ForaTabela = False
    Insumo = False
    Nivel = 0
    Previsao = 0
    Servico = False
    Situacao = 0
    TempoMedio = 0
    Left = 9
    Top = 218
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PRD_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object MainMenu1: TMainMenu
    Left = 102
    Top = 218
    object Fechar1: TMenuItem
      Caption = '&Fechar'
      OnClick = SpeedButton1Click
    end
    object Consulta1: TMenuItem
      Caption = '&Consulta'
      object Localizar1: TMenuItem
        Caption = '&Localizar'
        ShortCut = 114
        OnClick = SB_LocClick
      end
    end
  end
  object Item_de_Embarque1: TItem_de_Embarque
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT SUM(IEB_QUANTIDADE)  AS SOMA'
      'FROM ITEM_DE_EMBARQUE'
      'WHERE CNC_CODIGO=:CNC_CODIGO '
      'AND PRD_CODIGO=:PRD_CODIGO'
      'AND EMB_CODIGO=0')
    CNCOrigem = 0
    CentroDeCusto = 1
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    CNC_Codigo_Ent = 0
    CodigoEMB = 0
    CodigoENT = 0
    CodigoIEB = 0
    CodigoPRD = 0
    Situacao = 0
    TipoEnt = 0
    Left = 71
    Top = 218
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CNC_CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PRD_CODIGO'
        ParamType = ptUnknown
      end>
  end
end

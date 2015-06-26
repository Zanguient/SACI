object fMxCalculaFrete: TfMxCalculaFrete
  Left = 326
  Top = 140
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Calculo Individual de Frete/ICMS'
  ClientHeight = 535
  ClientWidth = 587
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 587
    Height = 495
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object Label2: TLabel
      Left = 126
      Top = 18
      Width = 74
      Height = 13
      Caption = 'ICMS do Frete.:'
    end
    object Label1: TLabel
      Left = 15
      Top = 18
      Width = 72
      Height = 13
      Caption = 'Total do Frete.:'
    end
    object Label6: TLabel
      Left = 94
      Top = 474
      Width = 30
      Height = 13
      Caption = 'Total.:'
    end
    object Label3: TLabel
      Left = 15
      Top = 66
      Width = 84
      Height = 13
      Caption = 'Total de Produtos'
    end
    object Label5: TLabel
      Left = 237
      Top = 66
      Width = 66
      Height = 13
      Caption = 'Valor do Frete'
    end
    object Label4: TLabel
      Left = 462
      Top = 66
      Width = 68
      Height = 13
      Caption = 'ICMS do Frete'
    end
    object Label7: TLabel
      Left = 125
      Top = 66
      Width = 38
      Height = 13
      Caption = 'Frete(%)'
    end
    object Label8: TLabel
      Left = 347
      Top = 66
      Width = 67
      Height = 13
      Caption = 'ICMS Frete(%)'
    end
    object Edit1: TEdit
      Tag = 1
      Left = 15
      Top = 81
      Width = 110
      Height = 21
      TabOrder = 2
    end
    object Edit2: TEdit
      Tag = 1
      Left = 15
      Top = 104
      Width = 110
      Height = 21
      TabOrder = 3
      OnExit = Edit2Exit
    end
    object Edit3: TEdit
      Tag = 1
      Left = 15
      Top = 127
      Width = 110
      Height = 21
      TabOrder = 4
      OnExit = Edit2Exit
    end
    object Edit4: TEdit
      Tag = 1
      Left = 15
      Top = 150
      Width = 110
      Height = 21
      TabOrder = 5
      OnExit = Edit2Exit
    end
    object Edit5: TEdit
      Tag = 1
      Left = 15
      Top = 173
      Width = 110
      Height = 21
      TabOrder = 6
      OnExit = Edit2Exit
    end
    object Edit6: TEdit
      Tag = 1
      Left = 15
      Top = 196
      Width = 110
      Height = 21
      TabOrder = 7
      OnExit = Edit2Exit
    end
    object Edit7: TEdit
      Tag = 1
      Left = 15
      Top = 219
      Width = 110
      Height = 21
      TabOrder = 8
      OnExit = Edit2Exit
    end
    object Edit8: TEdit
      Tag = 1
      Left = 15
      Top = 242
      Width = 110
      Height = 21
      TabOrder = 9
      OnExit = Edit2Exit
    end
    object Edit9: TEdit
      Tag = 1
      Left = 15
      Top = 265
      Width = 110
      Height = 21
      TabOrder = 10
      OnExit = Edit2Exit
    end
    object Edit10: TEdit
      Tag = 1
      Left = 15
      Top = 288
      Width = 110
      Height = 21
      TabOrder = 11
      OnExit = Edit2Exit
    end
    object Edit11: TEdit
      Tag = 1
      Left = 15
      Top = 311
      Width = 110
      Height = 21
      TabOrder = 12
      OnExit = Edit2Exit
    end
    object Edit12: TEdit
      Tag = 1
      Left = 15
      Top = 334
      Width = 110
      Height = 21
      TabOrder = 13
      OnExit = Edit2Exit
    end
    object Edit13: TEdit
      Tag = 1
      Left = 15
      Top = 357
      Width = 110
      Height = 21
      TabOrder = 14
      OnExit = Edit2Exit
    end
    object Edit14: TEdit
      Tag = 1
      Left = 15
      Top = 380
      Width = 110
      Height = 21
      TabOrder = 15
      OnExit = Edit2Exit
    end
    object Edit15: TEdit
      Tag = 1
      Left = 15
      Top = 402
      Width = 110
      Height = 21
      TabOrder = 16
      OnExit = Edit2Exit
    end
    object Edit16: TEdit
      Tag = 1
      Left = 15
      Top = 425
      Width = 110
      Height = 21
      TabOrder = 17
      OnExit = Edit2Exit
    end
    object Edit17: TEdit
      Tag = 1
      Left = 15
      Top = 447
      Width = 110
      Height = 21
      TabOrder = 18
      OnExit = Edit2Exit
    end
    object Edit18: TEdit
      Left = 237
      Top = 81
      Width = 110
      Height = 21
      BiDiMode = bdLeftToRight
      Enabled = False
      ParentBiDiMode = False
      TabOrder = 19
    end
    object Edit19: TEdit
      Left = 237
      Top = 104
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 20
    end
    object Edit20: TEdit
      Left = 237
      Top = 127
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 21
    end
    object Edit21: TEdit
      Left = 237
      Top = 150
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 22
    end
    object Edit22: TEdit
      Left = 237
      Top = 173
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 23
    end
    object Edit23: TEdit
      Left = 237
      Top = 196
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 24
    end
    object Edit24: TEdit
      Left = 237
      Top = 219
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 25
    end
    object Edit25: TEdit
      Left = 237
      Top = 242
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 26
    end
    object Edit26: TEdit
      Left = 237
      Top = 265
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 27
    end
    object Edit27: TEdit
      Left = 237
      Top = 288
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 28
    end
    object Edit28: TEdit
      Left = 237
      Top = 311
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 29
    end
    object Edit29: TEdit
      Left = 237
      Top = 334
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 30
    end
    object Edit30: TEdit
      Left = 237
      Top = 357
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 31
    end
    object Edit31: TEdit
      Left = 237
      Top = 380
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 32
    end
    object Edit32: TEdit
      Left = 237
      Top = 402
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 33
    end
    object Edit33: TEdit
      Left = 237
      Top = 425
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 34
    end
    object Edit34: TEdit
      Left = 237
      Top = 447
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 35
    end
    object Edit35: TEdit
      Left = 460
      Top = 81
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 36
    end
    object Edit36: TEdit
      Left = 460
      Top = 104
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 37
    end
    object Edit37: TEdit
      Left = 460
      Top = 127
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 38
    end
    object Edit38: TEdit
      Left = 460
      Top = 150
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 39
    end
    object Edit39: TEdit
      Left = 460
      Top = 173
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 40
    end
    object Edit40: TEdit
      Left = 460
      Top = 196
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 41
    end
    object Edit41: TEdit
      Left = 460
      Top = 219
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 42
    end
    object Edit42: TEdit
      Left = 460
      Top = 242
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 43
    end
    object Edit43: TEdit
      Left = 460
      Top = 265
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 44
    end
    object Edit44: TEdit
      Left = 460
      Top = 288
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 45
    end
    object Edit45: TEdit
      Left = 461
      Top = 311
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 46
    end
    object Edit46: TEdit
      Left = 461
      Top = 334
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 47
    end
    object Edit47: TEdit
      Left = 461
      Top = 357
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 48
    end
    object Edit48: TEdit
      Left = 461
      Top = 380
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 49
    end
    object Edit49: TEdit
      Left = 461
      Top = 402
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 50
    end
    object Edit50: TEdit
      Left = 461
      Top = 425
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 51
    end
    object Edit51: TEdit
      Left = 461
      Top = 447
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 52
    end
    object Edit52: TEdit
      Left = 126
      Top = 81
      Width = 110
      Height = 21
      BiDiMode = bdLeftToRight
      Color = clMenu
      Enabled = False
      ParentBiDiMode = False
      TabOrder = 53
    end
    object Edit53: TEdit
      Left = 126
      Top = 104
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 54
    end
    object Edit54: TEdit
      Left = 126
      Top = 127
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 55
    end
    object Edit55: TEdit
      Left = 126
      Top = 150
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 56
    end
    object Edit56: TEdit
      Left = 126
      Top = 173
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 57
    end
    object Edit57: TEdit
      Left = 126
      Top = 196
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 58
    end
    object Edit58: TEdit
      Left = 126
      Top = 219
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 59
    end
    object Edit59: TEdit
      Left = 126
      Top = 242
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 60
    end
    object Edit60: TEdit
      Left = 126
      Top = 265
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 61
    end
    object Edit61: TEdit
      Left = 126
      Top = 288
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 62
    end
    object Edit62: TEdit
      Left = 126
      Top = 311
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 63
    end
    object Edit63: TEdit
      Left = 126
      Top = 334
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 64
    end
    object Edit64: TEdit
      Left = 126
      Top = 357
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 65
    end
    object Edit65: TEdit
      Left = 126
      Top = 380
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 66
    end
    object Edit66: TEdit
      Left = 126
      Top = 402
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 67
    end
    object Edit67: TEdit
      Left = 126
      Top = 425
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 68
    end
    object Edit68: TEdit
      Left = 126
      Top = 447
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 69
    end
    object Edit69: TEdit
      Left = 348
      Top = 81
      Width = 110
      Height = 21
      BiDiMode = bdLeftToRight
      Color = clMenu
      Enabled = False
      ParentBiDiMode = False
      TabOrder = 70
    end
    object Edit70: TEdit
      Left = 348
      Top = 104
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 71
    end
    object Edit71: TEdit
      Left = 348
      Top = 127
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 72
    end
    object Edit72: TEdit
      Left = 348
      Top = 150
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 73
    end
    object Edit73: TEdit
      Left = 348
      Top = 173
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 74
    end
    object Edit74: TEdit
      Left = 348
      Top = 196
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 75
    end
    object Edit75: TEdit
      Left = 348
      Top = 219
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 76
    end
    object Edit76: TEdit
      Left = 348
      Top = 242
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 77
    end
    object Edit77: TEdit
      Left = 348
      Top = 265
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 78
    end
    object Edit78: TEdit
      Left = 348
      Top = 288
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 79
    end
    object Edit79: TEdit
      Left = 348
      Top = 311
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 80
    end
    object Edit80: TEdit
      Left = 348
      Top = 334
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 81
    end
    object Edit81: TEdit
      Left = 348
      Top = 357
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 82
    end
    object Edit82: TEdit
      Left = 348
      Top = 380
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 83
    end
    object Edit83: TEdit
      Left = 348
      Top = 402
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 84
    end
    object Edit84: TEdit
      Left = 348
      Top = 425
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 85
    end
    object Edit85: TEdit
      Left = 348
      Top = 447
      Width = 110
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 86
    end
    object edtTotalFrete: TEdit
      Left = 15
      Top = 32
      Width = 110
      Height = 21
      TabOrder = 0
    end
    object edtICMSFrete: TEdit
      Left = 126
      Top = 32
      Width = 110
      Height = 21
      TabOrder = 1
    end
    object edtICMSCalculado: TEdit
      Left = 461
      Top = 470
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 88
    end
    object edtFreteCalculado: TEdit
      Left = 237
      Top = 470
      Width = 110
      Height = 21
      Enabled = False
      TabOrder = 87
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 495
    Width = 587
    Height = 40
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object SB_Calcular: TSpeedButton
      Left = 303
      Top = 7
      Width = 90
      Height = 25
      Caption = '&Calcular'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
      OnClick = SB_CalcularClick
    end
    object SpeedButton3: TSpeedButton
      Left = 392
      Top = 7
      Width = 90
      Height = 25
      Caption = '&Imprimir'
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
      OnClick = SpeedButton3Click
    end
    object SpeedButton2: TSpeedButton
      Left = 481
      Top = 7
      Width = 90
      Height = 25
      Caption = '&Fechar'
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
      OnClick = SpeedButton2Click
    end
  end
end

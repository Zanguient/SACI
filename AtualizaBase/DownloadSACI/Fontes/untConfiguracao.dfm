object frmConfiguracao: TfrmConfiguracao
  Left = 358
  Top = 248
  Width = 563
  Height = 218
  BorderIcons = [biSystemMenu]
  Caption = 'Configura'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 555
    Height = 191
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Tag = 99
      Left = 2
      Top = 2
      Width = 142
      Height = 187
      Align = alLeft
      BevelOuter = bvNone
      Color = 14738664
      TabOrder = 0
      object Label5: TLabel
        Left = 72
        Top = 24
        Width = 63
        Height = 16
        Caption = 'Ftp Host:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 51
        Top = 49
        Width = 84
        Height = 16
        Caption = 'Ftp Usu'#225'rio:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 65
        Top = 73
        Width = 70
        Height = 16
        Caption = 'Ftp Senha:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 9
        Top = 98
        Width = 126
        Height = 16
        Caption = 'Arquivo Principal:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 37
        Top = 123
        Width = 98
        Height = 16
        Caption = 'Arquivo Chave:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object bvLeftControle: TBevel
        Left = 140
        Top = 0
        Width = 2
        Height = 187
        Align = alRight
        Shape = bsFrame
      end
    end
    object editftp: TEdit
      Left = 150
      Top = 20
      Width = 390
      Height = 21
      TabOrder = 1
      Text = 'siac.buildsistemas.com.br'
    end
    object edusuario: TEdit
      Left = 150
      Top = 45
      Width = 390
      Height = 21
      TabOrder = 2
      Text = 'siac@buildsistemas.com.br'
    end
    object edsenha: TEdit
      Left = 150
      Top = 70
      Width = 390
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
      Text = 's2f1303'
    end
    object edarquivo1: TEdit
      Left = 150
      Top = 95
      Width = 390
      Height = 21
      TabOrder = 4
      Text = '/SIAC/PSACI.exe'
    end
    object edarquivo2: TEdit
      Left = 150
      Top = 120
      Width = 390
      Height = 21
      TabOrder = 5
      Text = '/SIAC/Chave.dll'
    end
    object checkpassivo: TCheckBox
      Left = 150
      Top = 148
      Width = 118
      Height = 17
      Cursor = crHandPoint
      Caption = 'Modo Passivo'
      TabOrder = 6
    end
    object btnSalvar: TBitBtn
      Left = 444
      Top = 149
      Width = 95
      Height = 28
      Caption = '&Salvar'
      TabOrder = 7
      OnClick = btnSalvarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        AD5A59AA5454A24D4EAA9595C1C8C7CCCBCACECBCACAC8C7C6CAC9B79E9E9840
        41994444A65151FF00FFFF00FFBC7871CF6666D26868B95A5B9B8080BEA1A0E2
        D0CEFEF9F5FFFDFAF2F6F4D2B3B3962D2C993232C25B5BB05859FF00FFBB7871
        CB6565CE6767B85D5D9E7B7C9D4343B77675E7DFDDFDFBF9FEFFFDD9BAB9962E
        2E993333C05A5AAF5859FF00FFBB7871CB6565CE6667B85D5DA884839939399B
        3636CDBCBBF2F0EEFFFFFFE2C3C1962D2D983333C05A5AAF5859FF00FFBB7871
        CB6565CE6666B75C5CB28F8E9F4848943232A69A9AD5DBD8FAFFFEE6C9C8932B
        2B963030BF5959AF5859FF00FFBB7871CB6565CF6666BB5C5CC3908FC29695B3
        8686AA8D8EBAA2A1E1CAC8DCA9A9A33A3AA43E3EC35D5DAE5758FF00FFBB7871
        CC6566CB6464CB6464CB6364CC6767CD6767CC6464C85B5BC95E5ECA6161CC65
        65CD6666CF6868AC5657FF00FFBC7972B75351B25B57C68684D2A4A2D5ABAAD5
        AAA9D5ABAAD5A5A4D5A8A7D5AAA9D6AEACD39C9CCD6666AC5556FF00FFBC7871
        B14F4CE4CDCBFAF7F7F8F4F3F9F5F4F9F5F4F9F5F4F9F6F5F9F5F4F9F5F4FBFB
        FADEBEBDC45C5DAD5657FF00FFBC7871B3514EEBD7D6FCFBFAF7F0EFF7F1F0F7
        F1F0F7F1F0F7F1F0F7F1F0F6F1F0FBF9F8DEBCBBC35B5BAD5657FF00FFBC7871
        B3514EEBD7D4F0EFEFD8D5D4DAD7D7DAD7D7DAD7D7DAD7D7DAD7D7D8D5D5ECEC
        EBE0BDBCC25B5BAD5657FF00FFBC7871B3514EEBD7D5F3F1F1DEDAD9DFDBDBDF
        DBDBDFDBDBDFDBDBDFDBDBDDDAD9EEEEEEE0BDBCC35B5BAD5657FF00FFBC7871
        B3514EEAD7D5F5F4F3E4DFDEE5E1E0E5E1E0E5E1E0E5E1E0E5E1E0E4DFDFF2F1
        F0DFBDBBC35B5BAD5657FF00FFBC7871B3514EEBD7D6F1F0EFD9D5D5DAD8D7DA
        D8D7DAD8D7DAD8D7DAD8D7D8D5D5EDECEBE1BEBDC35B5BAD5657FF00FFBC7870
        B3514EE9D6D4FEFBFBFAF3F2FAF3F2FAF3F2FAF3F2FAF3F2FAF3F2FAF3F2FDFA
        F9DEBCBBC35C5CAD5657FF00FFFF00FFA8504CC9B6B5D3D5D4D1CECED1CECED1
        CECED1CECED1CECED1CECED1CECED3D4D4CBAEADA34D4EFF00FF}
    end
  end
  object Configuracao1: TQuery
    DatabaseName = 'DBguerra'
    Left = 12
    Top = 8
  end
end

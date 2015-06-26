object fMxRelConsignacao: TfMxRelConsignacao
  Left = 548
  Top = 193
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Relat'#243'rio de Consigna'#231#227'o'
  ClientHeight = 338
  ClientWidth = 338
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
    Top = 61
    Width = 338
    Height = 237
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 207
      Top = 13
      Width = 38
      Height = 13
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object ckbCodigoCNC: TCheckBox
      Left = 12
      Top = 120
      Width = 99
      Height = 17
      Cursor = crHandPoint
      Caption = 'Centro de Custo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnClick = ckbCodigoCNCClick
    end
    object dblCodigoCNC: TDBLookupComboBox
      Left = 138
      Top = 119
      Width = 189
      Height = 21
      Color = clMenu
      Enabled = False
      KeyField = 'CNC_CODIGO'
      ListField = 'CNC_RZ_SOCIAL'
      ListSource = DSCentroCusto1
      TabOrder = 11
    end
    object ckbCodigoCLI: TCheckBox
      Left = 12
      Top = 10
      Width = 94
      Height = 17
      Cursor = crHandPoint
      Caption = 'Consignat'#225'rio'
      TabOrder = 0
      OnClick = ckbCodigoCLIClick
    end
    object edtCodigoCLI: TEdit
      Left = 138
      Top = 8
      Width = 65
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 1
      OnKeyPress = edtCodigoCLIKeyPress
    end
    object ckbSituacao: TCheckBox
      Left = 12
      Top = 142
      Width = 133
      Height = 17
      Cursor = crHandPoint
      Caption = 'Situa'#231#227'o'
      TabOrder = 12
      OnClick = ckbSituacaoClick
    end
    object cmbSituacao: TComboBox
      Left = 138
      Top = 141
      Width = 189
      Height = 21
      Style = csDropDownList
      Color = clMenu
      Enabled = False
      ItemHeight = 13
      TabOrder = 13
      Items.Strings = (
        'Em Aberto'
        'Confirmado')
    end
    object ckbCodigoPDV: TCheckBox
      Left = 12
      Top = 98
      Width = 97
      Height = 17
      Cursor = crHandPoint
      Caption = 'C'#243'd. Pedido:'
      TabOrder = 8
      OnClick = ckbCodigoPDVClick
    end
    object edtCodigoPDV: TEdit
      Left = 138
      Top = 97
      Width = 65
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 9
    end
    object ckbCodigoFUN: TCheckBox
      Left = 12
      Top = 54
      Width = 119
      Height = 17
      Cursor = crHandPoint
      Caption = 'Vendedor'
      TabOrder = 5
      OnClick = ckbCodigoFUNClick
    end
    object ckbCodigoGRP: TCheckBox
      Left = 12
      Top = 166
      Width = 124
      Height = 17
      Cursor = crHandPoint
      Caption = 'Grupo de Produto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      OnClick = ckbCodigoGRPClick
    end
    object dblCodigoGRP: TDBLookupComboBox
      Left = 138
      Top = 163
      Width = 189
      Height = 21
      Color = clMenu
      Enabled = False
      KeyField = 'GRP_CODIGO'
      ListField = 'GRP_DESCRICAO'
      ListSource = DSGrupo
      TabOrder = 15
    end
    object ckbCodigoSGP: TCheckBox
      Left = 43
      Top = 188
      Width = 103
      Height = 17
      Cursor = crHandPoint
      Caption = 'SubGrupo:'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
      OnClick = ckbCodigoSGPClick
    end
    object dblCodigoSGP: TDBLookupComboBox
      Left = 138
      Top = 186
      Width = 189
      Height = 21
      Color = clMenu
      Enabled = False
      KeyField = 'SGP_CODIGO'
      ListField = 'SGP_DESCRICAO'
      ListSource = DSSubGrupo1
      TabOrder = 17
    end
    object ckbSintetico: TCheckBox
      Left = 12
      Top = 211
      Width = 84
      Height = 17
      Cursor = crHandPoint
      Caption = 'Sint'#233'tico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 18
      OnClick = ckbSinteticoClick
    end
    object ckbConsignacao: TCheckBox
      Left = 12
      Top = 32
      Width = 119
      Height = 17
      Cursor = crHandPoint
      Caption = 'Consigna'#231#227'o'
      TabOrder = 2
      OnClick = ckbConsignacaoClick
    end
    object edtConsignacao: TEdit
      Left = 138
      Top = 30
      Width = 65
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 3
    end
    object ckbCodigoPRD: TCheckBox
      Left = 12
      Top = 76
      Width = 97
      Height = 17
      Cursor = crHandPoint
      Caption = 'Produto'
      TabOrder = 6
      OnClick = ckbCodigoPRDClick
    end
    object edtCodigoPRD: TEdit
      Left = 138
      Top = 74
      Width = 65
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 7
      OnKeyPress = edtCodigoPRDKeyPress
    end
    object dblVendedor: TDBLookupComboBox
      Left = 138
      Top = 52
      Width = 189
      Height = 21
      Color = clMenu
      Enabled = False
      KeyField = 'FUN_CODIGO'
      ListField = 'FUN_APELIDO'
      ListSource = DSVendedor1
      TabOrder = 4
    end
    object ckbSomenteItens: TCheckBox
      Left = 139
      Top = 211
      Width = 97
      Height = 17
      Cursor = crHandPoint
      Caption = 'Somente Itens'
      Enabled = False
      TabOrder = 19
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 298
    Width = 338
    Height = 40
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      338
      40)
    object Label3: TLabel
      Left = 238
      Top = 53
      Width = 36
      Height = 13
      Caption = '.          .'
    end
    object Label4: TLabel
      Left = 11
      Top = 52
      Width = 33
      Height = 13
      Caption = '.         .'
    end
    object BitBtn1: TBitBtn
      Left = 148
      Top = 7
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      TabOrder = 0
      OnClick = BitBtn1Click
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
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD10
        10FDFDFDFDFDFDFDFDFDFDFDFDFDFD9B9BFDFDFDFDFDFDFDFDFDFDFDFDFD1029
        2910FDFDFDFDFDFDFDFDFDFDFDFD9BF7F79BFDFDFDFDFDFDFDFDFDFDFD103229
        292910FDFDFDFDFDFDFDFDFDFD9BF7F7F7F79BFDFDFDFDFDFDFDFDFD10737229
        10292910FDFDFDFDFDFDFDFD9B0707F79BF7F79BFDFDFDFDFDFDFD10737B2A10
        FD10212910FDFDFDFDFDFD9B0707F79BFD9BA4F79BFDFDFDFDFDFDFD107210FD
        FDFDFD102910FDFDFDFDFDFD9B079BFDFDFDFD9BF79BFDFDFDFDFDFDFD10FDFD
        FDFDFDFD102110FDFDFDFDFDFD9BFDFDFDFDFDFD9BA49BFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFD1010FDFDFDFDFDFDFDFDFDFDFDFDFDFD9B9BFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFD1010FDFDFDFDFDFDFDFDFDFDFDFDFDFD9B9BFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 237
      Top = 7
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = BitBtn2Click
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
    object ProgressBar1: TProgressBar
      Left = 48
      Top = 52
      Width = 185
      Height = 16
      TabOrder = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 338
    Height = 61
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object Label6: TLabel
      Left = 12
      Top = 15
      Width = 56
      Height = 13
      Caption = 'Data Inicial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 12
      Top = 36
      Width = 51
      Height = 13
      Caption = 'Data Final:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object mskDataINI: TMaskEdit
      Left = 138
      Top = 11
      Width = 79
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object mskDataFIM: TMaskEdit
      Left = 138
      Top = 33
      Width = 79
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  object DSCentroCusto1: TDataSource
    DataSet = CentroCusto1
    Left = 270
    Top = 164
  end
  object CentroCusto1: TCentroCusto
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM CENTRO_DE_CUSTO'
      'ORDER BY CNC_RZ_SOCIAL')
    CNCOrigem = 0
    CentroDeCusto = 2
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    Tabela = 'CENTRO_DE_CUSTO'
    Logradouro = 0
    RecebeDados = False
    Left = 241
    Top = 164
  end
  object DSGrupo: TDataSource
    DataSet = Grupo
    Left = 270
    Top = 196
  end
  object Grupo: TQuery
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM GRUPO'
      'ORDER BY GRP_DESCRICAO ASC')
    Left = 242
    Top = 196
  end
  object SubGrupo1: TSubGrupo
    DatabaseName = 'DBguerra'
    Filtered = True
    SQL.Strings = (
      'SELECT * FROM SUBGRUPO'
      'WHERE GRP_CODIGO=:GRP_CODIGO'
      'ORDER BY SGP_DESCRICAO ASC')
    CNCOrigem = 0
    CentroDeCusto = 2
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    Tabela = 'SUBGRUPO'
    CodigoGRP = 0
    CodigoSGP = 0
    Fabricar = False
    PrecoDolar = False
    ServicoObrigatorio = False
    Situacao = 0
    Left = 240
    Top = 101
    ParamData = <
      item
        DataType = ftInteger
        Name = 'GRP_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object DSSubGrupo1: TDataSource
    DataSet = SubGrupo1
    Left = 269
    Top = 101
  end
  object Vendedor1: TVendedor
    DatabaseName = 'DBguerra'
    Filtered = True
    SQL.Strings = (
      'SELECT * '
      'FROM FUNCIONARIO '
      'WHERE FUN_SITUACAO=0'
      'AND FUN_FUNCAO IN (58,45) '
      'ORDER BY FUN_NOME')
    CNCOrigem = 0
    CentroDeCusto = 2
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    CFuncao = 0
    CLogradouro = 0
    CodigoFUN = 0
    CodigoSEC = 0
    Funcao = 0
    Logradouro = 0
    Rota = 0
    Left = 240
    Top = 130
  end
  object DSVendedor1: TDataSource
    DataSet = Vendedor1
    Left = 269
    Top = 131
  end
end

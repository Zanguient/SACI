object fMxSelPedidos: TfMxSelPedidos
  Left = 468
  Top = 148
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Selecionar Pedidos'
  ClientHeight = 473
  ClientWidth = 322
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
    Width = 322
    Height = 65
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 50
      Top = 16
      Width = 56
      Height = 13
      Caption = 'Data Inicial:'
    end
    object Label2: TLabel
      Left = 50
      Top = 41
      Width = 51
      Height = 13
      Caption = 'Data Final:'
    end
    object mskDataINI: TMaskEdit
      Left = 147
      Top = 11
      Width = 79
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object mskDataFIM: TMaskEdit
      Left = 147
      Top = 34
      Width = 79
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 65
    Width = 322
    Height = 368
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object ckbCodigoCLI: TCheckBox
      Left = 15
      Top = 31
      Width = 125
      Height = 17
      Cursor = crHandPoint
      Caption = 'C'#243'd. Cliente:'
      TabOrder = 2
      OnClick = ckbCodigoCLIClick
    end
    object edtCodigoCLI: TEdit
      Left = 147
      Top = 27
      Width = 78
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 3
      OnKeyPress = edtCodigoCLIKeyPress
    end
    object dblCodigoCNC: TDBLookupComboBox
      Left = 147
      Top = 93
      Width = 158
      Height = 21
      Color = clMenu
      Enabled = False
      KeyField = 'CNC_CODIGO'
      ListField = 'CNC_RZ_SOCIAL'
      ListSource = DSCentroCusto1
      TabOrder = 9
    end
    object ckbCodigoPDV: TCheckBox
      Left = 15
      Top = 9
      Width = 129
      Height = 17
      Cursor = crHandPoint
      Caption = 'C'#243'd. Pedido:'
      TabOrder = 0
      OnClick = ckbCodigoPDVClick
    end
    object edtCodigoPDV: TEdit
      Left = 147
      Top = 5
      Width = 78
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 1
    end
    object CheckBox10: TCheckBox
      Left = 15
      Top = 187
      Width = 145
      Height = 17
      Cursor = crHandPoint
      Caption = 'Relat'#243'rio Sint'#233'tico'
      TabOrder = 13
    end
    object ckbCodigoCNC: TCheckBox
      Left = 15
      Top = 97
      Width = 126
      Height = 17
      Cursor = crHandPoint
      Caption = 'Centro de Custo:'
      TabOrder = 8
      OnClick = ckbCodigoCNCClick
    end
    object dblCodigoFUN: TDBLookupComboBox
      Left = 147
      Top = 71
      Width = 158
      Height = 21
      Color = clMenu
      Enabled = False
      KeyField = 'FUN_CODIGO'
      ListField = 'FUN_APELIDO'
      ListSource = DSFuncionario1
      TabOrder = 7
    end
    object ckbCodigoFUN: TCheckBox
      Left = 15
      Top = 75
      Width = 126
      Height = 17
      Cursor = crHandPoint
      Caption = 'Vendedor(a):'
      TabOrder = 6
      OnClick = ckbCodigoFUNClick
    end
    object CheckBox3: TCheckBox
      Left = 15
      Top = 121
      Width = 145
      Height = 17
      Cursor = crHandPoint
      Caption = 'Somente '#218'lt. Compra'
      TabOrder = 10
      OnClick = CheckBox3Click
    end
    object CheckBox6: TCheckBox
      Left = 15
      Top = 142
      Width = 145
      Height = 17
      Cursor = crHandPoint
      Caption = 'Exibir Parcelas'
      TabOrder = 11
    end
    object ckbCodigoPRD: TCheckBox
      Left = 15
      Top = 53
      Width = 126
      Height = 17
      Cursor = crHandPoint
      Caption = 'C'#243'd. Produto:'
      TabOrder = 4
      OnClick = ckbCodigoPRDClick
    end
    object edtCodigoPRD: TEdit
      Left = 147
      Top = 49
      Width = 78
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 5
      OnKeyPress = edtCodigoPRDKeyPress
    end
    object CheckBox7: TCheckBox
      Left = 15
      Top = 164
      Width = 145
      Height = 17
      Cursor = crHandPoint
      Caption = 'N'#227'o Exibir Itens'
      TabOrder = 12
    end
    object CheckBox8: TCheckBox
      Left = 15
      Top = 341
      Width = 146
      Height = 17
      Cursor = crHandPoint
      Caption = 'Mala Direta (Word)'
      Enabled = False
      TabOrder = 16
    end
    object GroupBox1: TGroupBox
      Left = 15
      Top = 204
      Width = 289
      Height = 65
      TabOrder = 14
      object ckbSomenteAdiplente: TCheckBox
        Left = 8
        Top = 16
        Width = 139
        Height = 17
        Cursor = crHandPoint
        Caption = 'Somente Adiplentes'
        TabOrder = 0
        OnClick = ckbSomenteAdiplenteClick
      end
      object rdbSemParcelas: TRadioButton
        Left = 23
        Top = 40
        Width = 129
        Height = 17
        Caption = 'Sem Parcelas'
        Checked = True
        Enabled = False
        TabOrder = 2
        TabStop = True
      end
      object rdbComParcelas: TRadioButton
        Left = 159
        Top = 40
        Width = 113
        Height = 17
        Caption = 'Com Parcelas'
        Enabled = False
        TabOrder = 3
      end
      object CheckBox27: TCheckBox
        Left = 161
        Top = 16
        Width = 114
        Height = 17
        Cursor = crHandPoint
        Caption = 'Data de Origem'
        Enabled = False
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 15
      Top = 269
      Width = 289
      Height = 65
      TabOrder = 15
      object rdbPedidoInteiro: TRadioButton
        Left = 159
        Top = 40
        Width = 113
        Height = 17
        Caption = 'Pedido Inteiro'
        Enabled = False
        TabOrder = 3
      end
      object rdbQualquerParcela: TRadioButton
        Left = 23
        Top = 40
        Width = 129
        Height = 17
        Caption = 'Qualquer Parcela'
        Checked = True
        Enabled = False
        TabOrder = 2
        TabStop = True
      end
      object ckbSomenteInadiplente: TCheckBox
        Left = 8
        Top = 16
        Width = 145
        Height = 17
        Cursor = crHandPoint
        Caption = 'Somente Inadiplentes'
        TabOrder = 0
        OnClick = ckbSomenteInadiplenteClick
      end
      object CheckBox13: TCheckBox
        Left = 160
        Top = 16
        Width = 118
        Height = 17
        Cursor = crHandPoint
        Caption = 'Data de Origem'
        Enabled = False
        TabOrder = 1
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 433
    Width = 322
    Height = 40
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 126
      Top = 7
      Width = 90
      Height = 25
      Caption = 'Ok'
      Default = True
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
      Left = 215
      Top = 7
      Width = 90
      Height = 25
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
  end
  object CentroCusto1: TCentroCusto
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM CENTRO_DE_CUSTO'
      'ORDER BY CNC_RZ_SOCIAL')
    CNCOrigem = 0
    CentroDeCusto = 1
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    Tabela = 'CENTRO_DE_CUSTO'
    Logradouro = 0
    RecebeDados = False
    Left = 178
    Top = 194
  end
  object DSCentroCusto1: TDataSource
    DataSet = CentroCusto1
    Left = 208
    Top = 194
  end
  object Funcionario1: TFuncionario
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT FUN_CODIGO,FUN_NOME,CNC_CODIGO,FUN_APELIDO'
      'FROM FUNCIONARIO'
      'WHERE (FUN_FUNCAO IN (45,56,58)) '
      'AND FUN_SITUACAO<>1'
      'ORDER BY FUN_APELIDO')
    CNCOrigem = 0
    CentroDeCusto = 1
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    Tabela = 'FUNCIONARIO'
    ApareceServicos = False
    ApareceVendas = False
    CFuncao = 0
    CLogradouro = 0
    CodigoFUN = 0
    Funcao = 0
    Logradouro = 0
    Parceiro = 0
    Secao = 0
    Situacao = 0
    Superior = 0
    TodosCentros = False
    UsuarioVinculado = 0
    Left = 178
    Top = 224
  end
  object DSFuncionario1: TDataSource
    DataSet = Funcionario1
    Left = 239
    Top = 194
  end
  object Etiquetas1: TCliente
    DatabaseName = 'DBguerra'
    CNCOrigem = 0
    CentroDeCusto = 1
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    Tabela = 'CLIENTE'
    ArquivoDeEtiquetas = 'C:\EtiquetasClientes.txt'
    CLogradouro = 0
    CRota = 0
    Classificacao = 0
    CodigoCLI = 0
    Convenio = 0
    ConvenioCNC = 0
    Logradouro = 0
    Mensal = False
    Nota = False
    Orgao = 0
    PessoaFisica = False
    Quinzenal = False
    SPC = 0
    Situacao = 0
    Tipo = 0
    Left = 238
    Top = 224
  end
  object Parametro1: TParametro
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM PARAMETRO'
      'WHERE TPR_CODIGO=3 AND PAR_CODIGO=:PAR_CODIGO')
    CConfiguracao = DM.Configuracao1
    CLog = DM.Log1
    CNCOrigem = 0
    CentroDeCusto = 1
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    CodigoPAR = 0
    CodigoTPR = 0
    Informacao = 0
    Situacao = 0
    Left = 208
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PAR_CODIGO'
        ParamType = ptUnknown
      end>
  end
end

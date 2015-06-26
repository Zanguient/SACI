object fMxSelLog: TfMxSelLog
  Left = 389
  Top = 154
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Log do Sistema'
  ClientHeight = 369
  ClientWidth = 364
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
    Width = 364
    Height = 76
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 21
      Width = 56
      Height = 13
      Caption = 'Data Inicial:'
    end
    object Label2: TLabel
      Left = 15
      Top = 46
      Width = 51
      Height = 13
      Caption = 'Data Final:'
    end
    object Bevel1: TBevel
      Left = 200
      Top = 11
      Width = 146
      Height = 53
      Shape = bsFrame
    end
    object mskDataINI: TMaskEdit
      Left = 94
      Top = 16
      Width = 79
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object mskDataFIM: TMaskEdit
      Left = 94
      Top = 39
      Width = 79
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
    object rdgDataEstacao: TRadioButton
      Left = 213
      Top = 19
      Width = 65
      Height = 17
      Caption = 'Esta'#231#227'o'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
    object rdgDataServidor: TRadioButton
      Left = 213
      Top = 40
      Width = 61
      Height = 17
      Caption = 'Servidor'
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 76
    Width = 364
    Height = 253
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object ckbCodigoUSU: TCheckBox
      Left = 15
      Top = 13
      Width = 188
      Height = 17
      Cursor = crHandPoint
      Caption = 'Usu'#225'rio:'
      TabOrder = 0
      OnClick = ckbCodigoUSUClick
    end
    object ckbCodigoMDL: TCheckBox
      Left = 15
      Top = 34
      Width = 188
      Height = 17
      Cursor = crHandPoint
      Caption = 'M'#243'dulo:'
      TabOrder = 2
      OnClick = ckbCodigoMDLClick
    end
    object ckbCodigoSML: TCheckBox
      Left = 32
      Top = 55
      Width = 167
      Height = 17
      Cursor = crHandPoint
      Caption = 'SubM'#243'dulo:'
      Enabled = False
      TabOrder = 4
      OnClick = ckbCodigoSMLClick
    end
    object ckbCodigoOPS: TCheckBox
      Left = 50
      Top = 77
      Width = 150
      Height = 17
      Cursor = crHandPoint
      Caption = 'Opera'#231#227'o do Sistema:'
      Enabled = False
      TabOrder = 6
      OnClick = ckbCodigoOPSClick
    end
    object dblCodigoOPS: TDBLookupComboBox
      Left = 202
      Top = 75
      Width = 145
      Height = 21
      Color = clMenu
      Enabled = False
      KeyField = 'OPS_CODIGO'
      ListField = 'OPS_OPERACAO'
      ListSource = DSOperacao_do_Sistema1
      TabOrder = 7
    end
    object dblCodigoSML: TDBLookupComboBox
      Left = 202
      Top = 53
      Width = 145
      Height = 21
      Color = clMenu
      Enabled = False
      KeyField = 'SML_CODIGO'
      ListField = 'SML_DESCRICAO'
      ListSource = DSSubmodulo1
      TabOrder = 5
      OnClick = dblCodigoSMLClick
    end
    object mdlCodigoMDL: TDBLookupComboBox
      Left = 202
      Top = 31
      Width = 145
      Height = 21
      Color = clMenu
      Enabled = False
      KeyField = 'MDL_CODIGO'
      ListField = 'MDL_DESCRICAO'
      ListSource = DSModulo1
      TabOrder = 3
      OnClick = mdlCodigoMDLClick
    end
    object dblCodigoUSU: TDBLookupComboBox
      Left = 202
      Top = 9
      Width = 145
      Height = 21
      Color = clMenu
      Enabled = False
      KeyField = 'USU_CODIGO'
      ListField = 'USU_NOME'
      ListSource = DSUsuario1
      TabOrder = 1
    end
    object dblCodigoCNC: TDBLookupComboBox
      Left = 202
      Top = 97
      Width = 145
      Height = 21
      Color = clMenu
      Enabled = False
      KeyField = 'CNC_CODIGO'
      ListField = 'CNC_RZ_SOCIAL'
      ListSource = DSCentroCusto1
      TabOrder = 9
    end
    object CheckBox5: TCheckBox
      Left = 15
      Top = 99
      Width = 184
      Height = 17
      Cursor = crHandPoint
      Caption = 'Centro de Custo:'
      TabOrder = 8
      OnClick = CheckBox5Click
    end
    object ckbCodigoEntrada: TCheckBox
      Left = 15
      Top = 143
      Width = 184
      Height = 17
      Cursor = crHandPoint
      Caption = 'C'#243'digo Ent.'
      TabOrder = 12
      OnClick = ckbCodigoEntradaClick
    end
    object edtCodigoEntrada: TEdit
      Left = 201
      Top = 141
      Width = 65
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 13
    end
    object ckbSintetico: TCheckBox
      Left = 15
      Top = 207
      Width = 184
      Height = 17
      Cursor = crHandPoint
      Caption = 'Sint'#233'tico'
      TabOrder = 16
    end
    object ckbNaoExibirEntraSai: TCheckBox
      Left = 15
      Top = 164
      Width = 264
      Height = 17
      Cursor = crHandPoint
      Caption = 'N'#227'o exibir (Entra/Sair do Sistema)'
      TabOrder = 14
    end
    object ckbObservacao: TCheckBox
      Left = 15
      Top = 121
      Width = 184
      Height = 17
      Cursor = crHandPoint
      Caption = 'Observa'#231#227'o:'
      TabOrder = 10
      OnClick = ckbObservacaoClick
    end
    object edtObservacao: TEdit
      Left = 201
      Top = 119
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      Color = clMenu
      Enabled = False
      TabOrder = 11
    end
    object ckbNaoAgruparUSU: TCheckBox
      Left = 15
      Top = 185
      Width = 264
      Height = 17
      Cursor = crHandPoint
      Caption = 'N'#227'o Agrupar Usu'#225'rio'
      TabOrder = 15
    end
    object cbxRelatorioGrafico: TCheckBox
      Left = 15
      Top = 229
      Width = 110
      Height = 17
      Cursor = crHandPoint
      Caption = 'Relat'#243'rio Gr'#225'fico'
      TabOrder = 17
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 329
    Width = 364
    Height = 40
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 167
      Top = 7
      Width = 90
      Height = 25
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
      Left = 256
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
  object Usuario1: TUsuario
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT USU_CODIGO, USU_NOME FROM USUARIO'
      'WHERE USU_SITUACAO<>1'
      'ORDER BY USU_NOME')
    CNCOrigem = 0
    CentroDeCusto = 1
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    MaquinaLogado = 0
    Perfil = False
    Situacao = 0
    TodosCentros = False
    Left = 197
    Top = 278
  end
  object Modulo1: TModulo
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT MDL_CODIGO,MDL_DESCRICAO'
      'FROM MODULO'
      'ORDER BY MDL_DESCRICAO')
    CNCOrigem = 0
    CentroDeCusto = 1
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    CodigoMDL = 0
    Left = 226
    Top = 278
  end
  object Submodulo1: TSubmodulo
    DatabaseName = 'DBguerra'
    DataSource = DSModulo1
    SQL.Strings = (
      'SELECT MDL_CODIGO,SML_CODIGO,SML_DESCRICAO'
      'FROM SUBMODULO'
      'WHERE MDL_CODIGO=:MDL_CODIGO'
      'ORDER BY SML_DESCRICAO')
    CNCOrigem = 0
    CentroDeCusto = 1
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    CodigoMDL = 0
    CodigoSML = 0
    Left = 256
    Top = 278
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MDL_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object Operacao_do_Sistema1: TOperacao_do_Sistema
    DatabaseName = 'DBguerra'
    DataSource = DSSubmodulo1
    SQL.Strings = (
      'SELECT OPS_CODIGO,OPS_OPERACAO'
      'FROM OPERACAO_DO_SISTEMA'
      'WHERE MDL_CODIGO=:MDL_CODIGO AND SML_CODIGO=:SML_CODIGO'
      'ORDER BY OPS_OPERACAO')
    CNCOrigem = 0
    CentroDeCusto = 1
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    CodigoOPS = 0
    Modulo = 0
    Submodulo = 0
    Left = 286
    Top = 278
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MDL_CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SML_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object DSUsuario1: TDataSource
    DataSet = Usuario1
    Left = 197
    Top = 250
  end
  object DSModulo1: TDataSource
    DataSet = Modulo1
    Left = 286
    Top = 250
  end
  object DSSubmodulo1: TDataSource
    DataSet = Submodulo1
    Left = 226
    Top = 250
  end
  object DSOperacao_do_Sistema1: TDataSource
    DataSet = Operacao_do_Sistema1
    Left = 256
    Top = 250
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
    Left = 316
    Top = 278
  end
  object DSCentroCusto1: TDataSource
    DataSet = CentroCusto1
    Left = 316
    Top = 250
  end
end

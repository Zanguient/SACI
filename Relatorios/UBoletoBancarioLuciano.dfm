object rpt_BoletoBancarioLuciano: Trpt_BoletoBancarioLuciano
  Left = 199
  Top = 107
  Width = 779
  Height = 340
  Caption = 'rpt_BoletoBancarioLuciano'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object report: TSZReport
    Left = 0
    Top = 0
    Width = 110
    Height = 31
    Columns = 1
    ColumnSpace = 0
    DataSet = Titulo_receber1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Options.Copies = 1
    Options.Destination = zrdLPT1
    Options.Escapes.BoldOn = #15#27'0'
    Options.Escapes.BoldOff = #27'F'#27'H'
    Options.Escapes.ItalicsOn = #27'4'
    Options.Escapes.ItalicsOff = #27'5'
    Options.Escapes.UnderlineOn = #27'-1'
    Options.Escapes.UnderlineOff = #27'-0'
    Options.Escapes.SuperScriptOn = #27'S'#1
    Options.Escapes.SuperScriptOff = #27'T'
    Options.Escapes.SubScriptOn = #27'S'#0
    Options.Escapes.SubScriptOff = #27'T'
    Options.PageLength = 31
    Options.PageWidth = 110
    Options.PaperType = zptSheet
    object ZRBand2: TSZRBand
      Left = 0
      Top = 0
      Width = 110
      Height = 21
      BeforePrint = ZRBand2BeforePrint
      BandType = rbDetail
      ForceNewColumn = False
      ForceNewPage = False
      object ZRDBText9: TSZRDBText
        Left = 2
        Top = 19
        Width = 7
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Titulo_receber1
        DataField = 'CLI_CODIGO'
      end
      object ZRDBText14: TSZRDBText
        Left = 96
        Top = 0
        Width = 13
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Titulo_receber1
        DataField = 'TRC_VENCIMENTO'
      end
      object ZRDBText1: TSZRDBText
        Left = 10
        Top = 19
        Width = 59
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Titulo_receber1
        DataField = 'CLI_RZ_SOCIAL'
      end
      object zrlDataEmissao: TSZRLabel
        Left = 2
        Top = 5
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlDataEmissao'
      end
      object SZRLabel3: TSZRLabel
        Left = 39
        Top = 7
        Width = 2
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'R$'
      end
      object zrlData: TSZRLabel
        Left = 71
        Top = 5
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlData'
      end
      object zrlLocalPagamento: TSZRLabel
        Left = 1
        Top = 0
        Width = 75
        Height = 1
        AlignToBand = False
        Enabled = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel6: TSZRLabel
        Left = 2
        Top = 11
        Width = 75
        Height = 1
        AlignToBand = False
        Enabled = False
        FontStyle = []
        WordWrap = True
        Caption = 'APOS O VENCIMENTO COBRAR JUROS DE 0,27% / DIA.'
      end
      object SZRLabel7: TSZRLabel
        Left = 2
        Top = 12
        Width = 75
        Height = 1
        AlignToBand = False
        Enabled = False
        FontStyle = []
        WordWrap = True
        Caption = 'CONSERVE O SEU CREDITO PAGANDO PONTUALMENTE.'
      end
      object SZRLabel8: TSZRLabel
        Left = 2
        Top = 13
        Width = 75
        Height = 1
        AlignToBand = False
        Enabled = False
        FontStyle = []
        WordWrap = True
        Caption = 
          'ATRAZO DE 05 DIAS SEU NOME SERA INCLUIDO AUTOMATICAMENTO NO SCPC' +
          '.'
      end
      object zrlValorTitulo: TSZRLabel
        Left = 96
        Top = 7
        Width = 13
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlValorTitulo'
      end
      object SZRLabel10: TSZRLabel
        Left = 9
        Top = 19
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '-'
      end
      object SZRLabel13: TSZRLabel
        Left = 2
        Top = 14
        Width = 75
        Height = 1
        AlignToBand = False
        Enabled = False
        FontStyle = []
        WordWrap = True
        Caption = 'Taxa Bancaria R$ 1,50'
      end
      object SZRLabel14: TSZRLabel
        Left = 69
        Top = 19
        Width = 8
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'SZRLabel14'
      end
      object SZRLabel15: TSZRLabel
        Left = 2
        Top = 20
        Width = 75
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlReduzirAltura: TSZRLabel
        Left = 0
        Top = 0
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = [esBold]
        WordWrap = True
        Caption = '.'
      end
      object zrlPedidoParcela: TSZRLabel
        Left = 32
        Top = 5
        Width = 18
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlPedidoParcela'
      end
    end
  end
  object Query1: TQuery
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM CATRACA'
      'WHERE CNC_CODIGO=:CNC_CODIGO')
    Left = 191
    Top = 246
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CNC_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object Titulo_receber1: TTitulo_receber
    DatabaseName = 'DBguerra'
    Filtered = True
    SQL.Strings = (
      'SELECT t1.*,t2.CLI_CODIGO,T2.CLI_RZ_SOCIAL, T2.CLI_CIDADE,'
      '               T2.CLI_ENDERECO,T2.CLI_BAIRRO,T2.CLI_LOGRADOURO '
      'FROM'
      '     Titulo_a_receber T1,'
      '     Cliente T2'
      'WHERE'
      '     (T1.CNC_CODIGO=:CNC_CODIGO) AND'
      '     (T1.CLI_CODIGO = T2.CLI_CODIGO) AND'
      '     (T2.CNC_CODIGO=T1.CNC_CLIENTE) AND'
      '     (T1.PDV_CODIGO=:PEDCOD) AND'
      '     (T1.TRC_SITUACAO=0)'
      'ORDER BY'
      '     T1.TRC_SEQUENCIA')
    CConfiguracao = DM.Configuracao1
    CNCOrigem = 0
    CentroDeCusto = 4
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    ChequeCNC = 0
    ChequeDevolvido = False
    ClienteCNC = 0
    CodigoAGF = 0
    CodigoBOL = 0
    CodigoCCX = 0
    CodigoCCXRecebimento = 0
    CodigoCHQ = 0
    CodigoCLI = 0
    CodigoCPC = 0
    CodigoFPE = 0
    CodigoFUN = 0
    CodigoMCC = 0
    CodigoPDV = 0
    CodigoTRC = 0
    CodigoTRF = 0
    FaturamentoCNC = 0
    GerouMovimento = False
    MovimentoContaCorrenteCNC = 0
    PagamentoParcial = False
    Processo = 0
    Reabertura = 0
    Situacao = 0
    Tipo = 0
    TipoPag = 0
    TipoPedido = 0
    TituloANT = 0
    TituloORI = 0
    Verificado = 0
    Visitado = False
    Left = 595
    Top = 237
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CNC_CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PEDCOD'
        ParamType = ptUnknown
      end>
  end
end

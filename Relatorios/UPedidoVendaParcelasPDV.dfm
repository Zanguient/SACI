object rpt_PedidoVendaParcelasPDV: Trpt_PedidoVendaParcelasPDV
  Left = 212
  Top = 115
  Width = 401
  Height = 480
  Caption = 'rpt_PedidoVendaParcelasPDV'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object report: TSZReport
    Left = 0
    Top = 0
    Width = 56
    Height = 31
    BeforePrint = reportBeforePrint
    Columns = 1
    ColumnSpace = 0
    DataSet = Pedido_de_Venda1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Margins.Left = 0
    Margins.Top = 2
    Margins.Right = 0
    Margins.Bottom = 0
    Options.Copies = 1
    Options.Destination = zrdLPT1
    Options.Escapes.BoldOn = #27'E'#27'G'
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
    Options.PageWidth = 56
    Options.PaperType = zptSheet
    object ZRBand1: TSZRBand
      Left = 0
      Top = 2
      Width = 56
      Height = 10
      BeforePrint = ZRBand1BeforePrint
      BandType = rbPageHeader
      ForceNewColumn = False
      ForceNewPage = False
      object ZRLabel2: TSZRLabel
        Left = 0
        Top = 2
        Width = 26
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'SIAC - Pedido de Venda'
      end
      object ZRSysData2: TSZRSysData
        Left = 26
        Top = 2
        Width = 30
        Height = 1
        Alignment = taRightJustify
        AlignToBand = True
        FontStyle = []
        WordWrap = True
        Data = zrsDateTime
        Text = 'Data/Hora.:'
      end
      object zrlDadosLoja: TSZRLabel
        Left = 0
        Top = 1
        Width = 56
        Height = 1
        AlignToBand = False
        FontStyle = []
        BeforePrint = zrlDadosLojaBeforePrint
        WordWrap = True
        Caption = 'Mafalda Magazine'
      end
      object ZRLabel5: TSZRLabel
        Left = 0
        Top = 3
        Width = 56
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          '================================================================' +
          '=============='
      end
      object ZRLabel6: TSZRLabel
        Left = 0
        Top = 9
        Width = 56
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          '================================================================' +
          '=============='
      end
      object ZRLabel18: TSZRLabel
        Left = 1
        Top = 4
        Width = 8
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Pedido :'
      end
      object ZRLabel14: TSZRLabel
        Left = 28
        Top = 4
        Width = 8
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Emissao:'
      end
      object ZRDBText8: TSZRDBText
        Left = 10
        Top = 4
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'PDV_CODIGO'
      end
      object ZRDBText1: TSZRDBText
        Left = 16
        Top = 5
        Width = 40
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'CLI_RZ_SOCIAL'
      end
      object ZRDBText11: TSZRDBText
        Left = 37
        Top = 4
        Width = 19
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'PDV_DATA_HORA'
      end
      object ZRDBText4: TSZRDBText
        Left = 9
        Top = 5
        Width = 6
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'CLI_CODIGO'
      end
      object ZRLabel1: TSZRLabel
        Left = 0
        Top = 0
        Width = 56
        Height = 1
        Alignment = taCenter
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'E S T E  C U P O M  N A O  T E M  V A L O R  F I S C A L'
      end
      object SZRDBText2: TSZRDBText
        Left = 38
        Top = 7
        Width = 18
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'CLI_BAIRRO'
      end
      object SZRDBText4: TSZRDBText
        Left = 9
        Top = 8
        Width = 28
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'CLI_CIDADE'
      end
      object SZRDBText5: TSZRDBText
        Left = 38
        Top = 8
        Width = 3
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'CLI_UF'
      end
      object SZRLabel1: TSZRLabel
        Left = 37
        Top = 7
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '-'
      end
      object SZRLabel2: TSZRLabel
        Left = 37
        Top = 8
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '-'
      end
      object SZRDBText6: TSZRDBText
        Left = 42
        Top = 8
        Width = 14
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'CLI_FONE'
      end
      object SZRLabel3: TSZRLabel
        Left = 9
        Top = 7
        Width = 28
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel4: TSZRLabel
        Left = 1
        Top = 5
        Width = 8
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Cliente:'
      end
      object SZRLabel5: TSZRLabel
        Left = 1
        Top = 6
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'CPF/CNPJ:'
      end
      object SZRDBText1: TSZRDBText
        Left = 11
        Top = 6
        Width = 18
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'CLI_CGC_CPF'
      end
      object SZRLabel6: TSZRLabel
        Left = 30
        Top = 6
        Width = 7
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'RG/CGF:'
      end
      object SZRDBText3: TSZRDBText
        Left = 38
        Top = 6
        Width = 18
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'CLI_CGF_RG'
      end
      object SZRLabel7: TSZRLabel
        Left = 9
        Top = 4
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
    end
    object ZRBand5: TSZRBand
      Left = 0
      Top = 12
      Width = 56
      Height = 17
      BeforePrint = ZRBand5BeforePrint
      BandType = rbSummary
      ForceNewColumn = False
      ForceNewPage = False
      object ZRLabel4: TSZRLabel
        Left = 0
        Top = 15
        Width = 56
        Height = 1
        Alignment = taCenter
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'E S T E  C U P O M  N A O  T E M  V A L O R  F I S C A L'
      end
      object ZRLabel7: TSZRLabel
        Left = 0
        Top = 16
        Width = 31
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'EmpresaDesenvolvedora'
      end
      object zrlParcela1: TSZRLabel
        Left = 1
        Top = 0
        Width = 56
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlParcela1'
      end
      object zrlParcela2: TSZRLabel
        Left = 1
        Top = 1
        Width = 56
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlParcela2'
      end
      object zrlParcela3: TSZRLabel
        Left = 1
        Top = 2
        Width = 56
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlParcela3'
      end
      object zrlParcela4: TSZRLabel
        Left = 1
        Top = 3
        Width = 56
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlParcela4'
      end
      object zrlParcela5: TSZRLabel
        Left = 1
        Top = 4
        Width = 56
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlParcela5'
      end
      object zrlParcela6: TSZRLabel
        Left = 1
        Top = 5
        Width = 56
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlParcela6'
      end
      object zrlParcela7: TSZRLabel
        Left = 1
        Top = 6
        Width = 56
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlParcela7'
      end
      object zrlParcela8: TSZRLabel
        Left = 1
        Top = 7
        Width = 56
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlParcela8'
      end
      object zrlParcela9: TSZRLabel
        Left = 1
        Top = 8
        Width = 56
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlParcela9'
      end
      object zrlParcela10: TSZRLabel
        Left = 1
        Top = 9
        Width = 56
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlParcela10'
      end
      object zrlParcela11: TSZRLabel
        Left = 1
        Top = 10
        Width = 56
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlParcela11'
      end
      object zrlParcela12: TSZRLabel
        Left = 1
        Top = 11
        Width = 56
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlParcela12'
      end
      object zrlParcela13: TSZRLabel
        Left = 1
        Top = 12
        Width = 56
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlParcela13'
      end
    end
    object zrbDetalhe: TSZRBand
      Left = 0
      Top = 12
      Width = 56
      Height = 0
      BandType = rbDetail
      ForceNewColumn = False
      ForceNewPage = False
    end
  end
  object Pedido_de_Venda1: TPedido_de_Venda
    DatabaseName = 'DBguerra'
    Filtered = True
    SQL.Strings = (
      'SELECT T1.CNC_CLIENTE,T1.PDV_CODIGO,T1.PDV_DATA_HORA,'
      'T1.PDV_TOTAL,T1.PDV_OBS,T2.CLI_CODIGO,T2.CNC_CODIGO,'
      'T2.CLI_RZ_SOCIAL,T2.CLI_LOGRADOURO,T2.CLI_ENDERECO,'
      'T2.CLI_BAIRRO,T2.CLI_CIDADE,T2.CLI_UF,T2.CLI_FONE,'
      'T2.CLI_PESSOA_FISICA,T2.CLI_CGC_CPF,T2.CLI_CGF_RG,'
      
        'T3.IPV_ENTREGA,PDV_SITUACAO,T3.IPV_QUANTIDADE,T3.IPV_BONIFICACAO' +
        ','
      'T3.FUN_CODIGO,'
      'T3.IPV_CODIGO,T3.PRD_CODIGO,T3.IPV_PRECO,T3.IPV_PRECO_DESC,'
      'T4.PRD_DESCRICAO,T4.PRD_CODIGO,T4.PRD_REFERENCIA,'
      'T4.PRD_MARCA,T4.PRD_UNIDADE,T1.PDV_ANTECIPADO'
      
        'FROM PEDIDO_DE_VENDA T1, CLIENTE T2, ITEM_DE_PEDIDO_DE_VENDA T3,' +
        ' PRODUTO T4'
      'WHERE (T1.PDV_CODIGO=:PDV_CODIGO) AND'
      '(T1.CNC_CODIGO=:CNC_CODIGO) AND'
      '(T1.CLI_CODIGO=T2.CLI_CODIGO) AND'
      '(T1.CNC_CLIENTE=T2.CNC_CODIGO) AND'
      '(T1.PDV_CODIGO=T3.PDV_CODIGO) AND'
      '(T3.PRD_CODIGO=T4.PRD_CODIGO)'
      ' '
      ' '
      ' '
      ' ')
    CNCOrigem = 0
    CentroDeCusto = 4
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    Tabela = 'PEDIDO_DE_VENDA'
    Arquiteto = 0
    CUsuario = DM.Usuario1
    ClienteCNC = 0
    CodigoAGF = 0
    CodigoCLI = 0
    CodigoCNT = 0
    CodigoFPE = 0
    CodigoFPG = 0
    CodigoPDV = 0
    CodigoPDVOrigem = 0
    CodigoPacote = 0
    DiasReserv = 0
    EmUsu = 0
    EntregaDeposito = False
    FaturamentoCNC = 0
    Garantia = 0
    GrupoEspecial = False
    Impresso = False
    Listado = 0
    MaquinaPDV = 0
    MediaPagamento = 0
    NotaCupom = 0
    NotaFiscal = 0
    Servico = False
    Situacao = 0
    TipoDeVenda = 0
    TipoPag = 0
    TituloGerado = False
    Left = 218
    Top = 71
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PDV_CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CNC_CODIGO'
        ParamType = ptUnknown
      end>
    object Pedido_de_Venda1CNC_CLIENTE: TIntegerField
      FieldName = 'CNC_CLIENTE'
      Origin = 'PEDIDO_DE_VENDA.CNC_CLIENTE'
    end
    object Pedido_de_Venda1PDV_CODIGO: TIntegerField
      FieldName = 'PDV_CODIGO'
      Origin = 'PEDIDO_DE_VENDA.PDV_CODIGO'
    end
    object Pedido_de_Venda1PDV_DATA_HORA: TDateTimeField
      FieldName = 'PDV_DATA_HORA'
      Origin = 'PEDIDO_DE_VENDA.PDV_DATA_HORA'
      EditMask = '!99/99/9999 99:99;1;_'
    end
    object Pedido_de_Venda1PDV_TOTAL: TFloatField
      FieldName = 'PDV_TOTAL'
      Origin = 'PEDIDO_DE_VENDA.PDV_TOTAL'
    end
    object Pedido_de_Venda1CLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Origin = 'CLIENTE.CLI_CODIGO'
    end
    object Pedido_de_Venda1CNC_CODIGO: TIntegerField
      FieldName = 'CNC_CODIGO'
      Origin = 'CLIENTE.CNC_CODIGO'
    end
    object Pedido_de_Venda1CLI_RZ_SOCIAL: TStringField
      FieldName = 'CLI_RZ_SOCIAL'
      Origin = 'CLIENTE.CLI_RZ_SOCIAL'
      Size = 40
    end
    object Pedido_de_Venda1CLI_LOGRADOURO: TIntegerField
      FieldName = 'CLI_LOGRADOURO'
      Origin = 'CLIENTE.CLI_LOGRADOURO'
    end
    object Pedido_de_Venda1CLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      Origin = 'CLIENTE.CLI_ENDERECO'
      Size = 40
    end
    object Pedido_de_Venda1CLI_BAIRRO: TStringField
      FieldName = 'CLI_BAIRRO'
      Origin = 'CLIENTE.CLI_BAIRRO'
    end
    object Pedido_de_Venda1CLI_CIDADE: TStringField
      FieldName = 'CLI_CIDADE'
      Origin = 'CLIENTE.CLI_CIDADE'
    end
    object Pedido_de_Venda1CLI_UF: TStringField
      FieldName = 'CLI_UF'
      Origin = 'CLIENTE.CLI_UF'
    end
    object Pedido_de_Venda1CLI_FONE: TStringField
      FieldName = 'CLI_FONE'
      Origin = 'CLIENTE.CLI_FONE'
      EditMask = '!\(9999\) #999-9999;0;_'
    end
    object Pedido_de_Venda1IPV_QUANTIDADE: TFloatField
      FieldName = 'IPV_QUANTIDADE'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.IPV_QUANTIDADE'
    end
    object Pedido_de_Venda1IPV_CODIGO: TIntegerField
      FieldName = 'IPV_CODIGO'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.IPV_CODIGO'
    end
    object Pedido_de_Venda1PRD_CODIGO: TIntegerField
      FieldName = 'PRD_CODIGO'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.PRD_CODIGO'
    end
    object Pedido_de_Venda1IPV_PRECO: TFloatField
      FieldName = 'IPV_PRECO'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.IPV_PRECO'
    end
    object Pedido_de_Venda1IPV_PRECO_DESC: TFloatField
      FieldName = 'IPV_PRECO_DESC'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.IPV_PRECO_DESC'
    end
    object Pedido_de_Venda1PRD_DESCRICAO: TStringField
      FieldName = 'PRD_DESCRICAO'
      Origin = 'PRODUTO.PRD_DESCRICAO'
      Size = 60
    end
    object Pedido_de_Venda1PRD_CODIGO_1: TIntegerField
      FieldName = 'PRD_CODIGO_1'
      Origin = 'PRODUTO.PRD_CODIGO'
    end
    object Pedido_de_Venda1PRD_REFERENCIA: TStringField
      FieldName = 'PRD_REFERENCIA'
      Origin = 'PRODUTO.PRD_REFERENCIA'
    end
    object Pedido_de_Venda1PRD_MARCA: TStringField
      FieldName = 'PRD_MARCA'
      Origin = 'PRODUTO.PRD_MARCA'
    end
    object Pedido_de_Venda1PRD_UNIDADE: TStringField
      FieldName = 'PRD_UNIDADE'
      Origin = 'PRODUTO.PRD_UNIDADE'
    end
    object Pedido_de_Venda1CLI_PESSOA_FISICA: TSmallintField
      FieldName = 'CLI_PESSOA_FISICA'
      Origin = 'DBGUERRA.CLIENTE.CLI_PESSOA_FISICA'
    end
    object Pedido_de_Venda1CLI_CGC_CPF: TStringField
      FieldName = 'CLI_CGC_CPF'
      Origin = 'DBGUERRA.CLIENTE.CLI_CGC_CPF'
    end
    object Pedido_de_Venda1CLI_CGF_RG: TStringField
      FieldName = 'CLI_CGF_RG'
      Origin = 'DBGUERRA.CLIENTE.CLI_CGF_RG'
    end
    object Pedido_de_Venda1IPV_ENTREGA: TSmallintField
      FieldName = 'IPV_ENTREGA'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_ENTREGA'
    end
    object Pedido_de_Venda1PDV_SITUACAO: TIntegerField
      FieldName = 'PDV_SITUACAO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_SITUACAO'
    end
    object Pedido_de_Venda1PDV_OBS: TStringField
      FieldName = 'PDV_OBS'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_OBS'
      FixedChar = True
      Size = 255
    end
    object Pedido_de_Venda1IPV_BONIFICACAO: TFloatField
      FieldName = 'IPV_BONIFICACAO'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_BONIFICACAO'
    end
    object Pedido_de_Venda1FUN_CODIGO: TIntegerField
      FieldName = 'FUN_CODIGO'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.FUN_CODIGO'
    end
    object Pedido_de_Venda1PDV_ANTECIPADO: TFloatField
      FieldName = 'PDV_ANTECIPADO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_ANTECIPADO'
    end
  end
end

object rpt_PedidoServicoLBMEsp: Trpt_PedidoServicoLBMEsp
  Left = 243
  Top = 286
  Width = 977
  Height = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object report: TSZReport
    Left = 0
    Top = 0
    Width = 138
    Height = 32
    Columns = 1
    ColumnSpace = 0
    DataSet = Item_Pedido_Venda1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Margins.Left = 1
    Margins.Top = 0
    Margins.Right = 1
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
    Options.PageLength = 32
    Options.PageWidth = 138
    Options.PaperType = zptSheet
    object zrbCabecalhoPagina: TSZRBand
      Left = 1
      Top = 0
      Width = 136
      Height = 3
      BeforePrint = zrbCabecalhoPaginaBeforePrint
      BandType = rbPageHeader
      ForceNewColumn = False
      ForceNewPage = False
      object ZRLabel2: TSZRLabel
        Left = 0
        Top = 1
        Width = 47
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'SIAC - Pedido de Servico'
      end
      object ZRSysData2: TSZRSysData
        Left = 93
        Top = 1
        Width = 43
        Height = 1
        Alignment = taRightJustify
        AlignToBand = True
        FontStyle = []
        WordWrap = True
        Data = zrsDateTime
        Text = 'Data/Hora.:'
      end
      object zrlEmpresa: TSZRLabel
        Left = 0
        Top = 0
        Width = 136
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'EletroGuerra '
      end
      object ZRLabel5: TSZRLabel
        Left = 0
        Top = 2
        Width = 136
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          '================================================================' +
          '================================================================' +
          '========'
      end
    end
    object zrbDetalhe: TSZRBand
      Left = 1
      Top = 9
      Width = 136
      Height = 2
      BeforePrint = zrbDetalheBeforePrint
      BandType = rbDetail
      ForceNewColumn = False
      ForceNewPage = False
      object zrlProduto: TSZRLabel
        Left = 0
        Top = 0
        Width = 72
        Height = 2
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQuantidade: TSZRLabel
        Left = 115
        Top = 0
        Width = 10
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlPreco: TSZRLabel
        Left = 126
        Top = 0
        Width = 10
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTecnico: TSZRLabel
        Left = 73
        Top = 0
        Width = 41
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
    end
    object zrbRodapePagina: TSZRBand
      Left = 1
      Top = 13
      Width = 136
      Height = 4
      BeforePrint = zrbRodapePaginaBeforePrint
      BandType = rbPageFooter
      ForceNewColumn = False
      ForceNewPage = False
      object ZRSysData1: TSZRSysData
        Left = 125
        Top = 2
        Width = 11
        Height = 1
        Alignment = taRightJustify
        AlignToBand = True
        FontStyle = []
        WordWrap = True
        Data = zrsPageNumber
        Text = 'Pag.:'
      end
      object ZRLabel8: TSZRLabel
        Left = 0
        Top = 1
        Width = 136
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--------'
      end
      object ZRLabel4: TSZRLabel
        Left = 0
        Top = 2
        Width = 23
        Height = 1
        AlignToBand = False
        FontStyle = [esItalic]
        WordWrap = True
        Caption = 'EmpresaDesenvolvedora'
      end
      object zrlUsuario: TSZRLabel
        Left = 24
        Top = 2
        Width = 42
        Height = 1
        AlignToBand = False
        FontStyle = [esItalic]
        WordWrap = True
      end
      object zrlDescAssinatura: TSZRLabel
        Left = 0
        Top = 0
        Width = 11
        Height = 1
        AlignToBand = False
        FontStyle = [esItalic]
        WordWrap = True
        Caption = 'Assinatura:'
      end
      object zrlDescDtAssinatura: TSZRLabel
        Left = 53
        Top = 0
        Width = 16
        Height = 1
        AlignToBand = False
        FontStyle = [esItalic]
        WordWrap = True
        Caption = 'Data: __/__/____'
      end
      object zrlAtencao: TSZRLabel
        Left = 70
        Top = 0
        Width = 66
        Height = 1
        AlignToBand = False
        FontStyle = [esItalic]
        WordWrap = True
        Caption = 
          'ATENCAO: O prazo maximo para retirada da mercadoria e de 60 dias' +
          '.'
      end
    end
    object zrbGrupoPDV: TSZRGroup
      Left = 1
      Top = 3
      Width = 136
      Height = 6
      BeforePrint = zrbGrupoPDVBeforePrint
      Expression = 'CNC_CODIGO+PDV_CODIGO'
      FooterBand = zrbRodapeGrupoPDV
      Master = report
      ForceNewColumn = False
      ForceNewPage = False
      object SZRDBText1: TSZRDBText
        Left = 10
        Top = 0
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Item_Pedido_Venda1
        DataField = 'PDV_CODIGO'
      end
      object SZRLabel1: TSZRLabel
        Left = 0
        Top = 0
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Codigo  :'
      end
      object zrlDBDataCadastro: TSZRDBText
        Left = 31
        Top = 0
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Item_Pedido_Venda1
        DataField = 'PDV_DATA_HORA'
      end
      object SZRLabel2: TSZRLabel
        Left = 21
        Top = 0
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Cadastro:'
      end
      object SZRLabel3: TSZRLabel
        Left = 44
        Top = 0
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Previsao:'
      end
      object SZRLabel4: TSZRLabel
        Left = 65
        Top = 0
        Width = 8
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Entrega:'
      end
      object SZRLabel5: TSZRLabel
        Left = 0
        Top = 1
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Cliente :'
      end
      object zrlCliente: TSZRLabel
        Left = 10
        Top = 1
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel6: TSZRLabel
        Left = 54
        Top = 1
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Endereco :'
      end
      object zrlEndereco: TSZRLabel
        Left = 65
        Top = 1
        Width = 71
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel18: TSZRLabel
        Left = 0
        Top = 4
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Observ. :'
      end
      object SZRLabel19: TSZRLabel
        Left = 0
        Top = 5
        Width = 136
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          'Produtos -------------------------------------------------------' +
          '---------Tecnico-----------------------------------Quantidade---' +
          '---Valor |'
      end
      object zrlDataEntrega: TSZRLabel
        Left = 74
        Top = 0
        Width = 16
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlDataPrevisao: TSZRLabel
        Left = 54
        Top = 0
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel49: TSZRLabel
        Left = 0
        Top = 3
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Tipo Pag:'
      end
      object zrlTipoPag: TSZRLabel
        Left = 10
        Top = 3
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel52: TSZRLabel
        Left = 54
        Top = 3
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Forma P. :'
      end
      object zrlFormaPag: TSZRLabel
        Left = 65
        Top = 3
        Width = 33
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel50: TSZRLabel
        Left = 99
        Top = 3
        Width = 7
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Agente:'
      end
      object zrlAgenteFinanceiro: TSZRLabel
        Left = 107
        Top = 3
        Width = 29
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlAgenteFinanceiro'
      end
      object SZRLabel13: TSZRLabel
        Left = 115
        Top = 0
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Documento:'
      end
      object SZRDBText4: TSZRDBText
        Left = 126
        Top = 0
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Item_Pedido_Venda1
        DataField = 'PDV_DOCUMENTO'
      end
      object SZRLabel57: TSZRLabel
        Left = 97
        Top = 4
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Situacao:'
      end
      object zrlSituacao: TSZRLabel
        Left = 107
        Top = 4
        Width = 29
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlSituacao'
      end
      object SZRLabel8: TSZRLabel
        Left = 91
        Top = 0
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Garantia:'
      end
      object SZRLabel10: TSZRLabel
        Left = 108
        Top = 0
        Width = 6
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'meses'
      end
      object SZRDBText2: TSZRDBText
        Left = 101
        Top = 0
        Width = 6
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Item_Pedido_Venda1
        DataField = 'PDV_GARANTIA'
      end
      object zrlDescContato: TSZRLabel
        Left = 0
        Top = 2
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Contato :'
      end
      object zrlContato: TSZRLabel
        Left = 10
        Top = 2
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlDescIndicacao: TSZRLabel
        Left = 54
        Top = 2
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Indicacao:'
      end
      object zrlIndicacao: TSZRLabel
        Left = 65
        Top = 2
        Width = 49
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel7: TSZRLabel
        Left = 115
        Top = 2
        Width = 5
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Fone:'
      end
      object zrlFone: TSZRLabel
        Left = 121
        Top = 2
        Width = 15
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlObservacao: TSZRLabel
        Left = 10
        Top = 4
        Width = 86
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
    end
    object zrbRodapeGrupoPDV: TSZRBand
      Left = 1
      Top = 11
      Width = 136
      Height = 2
      BeforePrint = zrbRodapeGrupoPDVBeforePrint
      BandType = rbGroupFooter
      ForceNewColumn = False
      ForceNewPage = False
      object SZRLabel40: TSZRLabel
        Left = 113
        Top = 1
        Width = 13
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Total Pedido:'
      end
      object zrlTotalPedido: TSZRLabel
        Left = 127
        Top = 1
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel9: TSZRLabel
        Left = 113
        Top = 0
        Width = 23
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--------'
      end
    end
  end
  object Funcionario1: TFuncionario
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM FUNCIONARIO'
      'WHERE FUN_CODIGO=:FUN_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = 4
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
    Left = 199
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FUN_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object AgenteFin1: TAgenteFin
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT CNC_CODIGO,AGF_CODIGO,AGF_DESCRICAO'
      'FROM AGENTE_FINANCEIRO'
      'WHERE AGF_CODIGO=:AGF_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = 4
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    Tabela = 'AGENTE_FINANCEIRO'
    CentavosEntrada = False
    CodigoAGF = 0
    DiaPagamento = 0
    Especial = False
    JurosEntrada = False
    LiberarDescontoFPG = False
    RecebimentoAVista = False
    Situacao = 0
    TipoPagExclusivo = 0
    Left = 71
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AGF_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object Forma_de_Pagamento1: TForma_de_Pagamento
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM FORMA_DE_PAGAMENTO'
      'WHERE FPG_CODIGO=:FPG_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = 4
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    Tabela = 'FORMA_DE_PAGAMENTO'
    CentavosEntrada = False
    CodigoFPG = 0
    CodigoTBP = 0
    Compra = False
    PrazoMedio = 0
    Situacao = 0
    TipoPagExclusivo = 0
    Left = 231
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FPG_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object Cliente1: TCliente
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT *'
      'FROM CLIENTE'
      'WHERE CNC_CODIGO=:CNC_CODIGO AND CLI_CODIGO=:CLI_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = 4
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    Tabela = 'CLIENTE'
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
    Left = 7
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CNC_CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CLI_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object Item_Pedido_Venda1: TItem_Pedido_Venda
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT *,'
      ' CASE IPV_VINCULO'
      '   WHEN -1 THEN IPV_SEQUENCIA*100 '
      '   ELSE (IPV_VINCULO*100)+IPV_SEQUENCIA '
      '  END ORDEM'
      'FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1'
      'WHERE I1.CNC_CODIGO=:CNC_CODIGO'
      'AND I1.PDV_CODIGO=:PDV_CODIGO'
      'AND P1.CNC_CODIGO=I1.CNC_CODIGO'
      'AND P1.PDV_CODIGO=I1.PDV_CODIGO'
      'ORDER BY I1.CNC_CODIGO, I1.PDV_CODIGO, ORDEM')
    CNCOrigem = 0
    CentroDeCusto = 4
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    AVista = False
    CodigoFUN = 0
    CodigoIEB = 0
    CodigoIPV = 0
    CodigoLOT = 0
    CodigoPDV = 0
    CodigoPRD = 0
    CodigoSEC = 0
    CodigoTBP = 0
    DiasEntrega = 0
    Entrega = False
    ItemNota = 0
    LocEst = 0
    NotaSituacao = 0
    Pendencia = 0
    Sequencia = 0
    Servico = False
    Situacao = 0
    Vinculo = 0
    Left = 39
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CNC_CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PDV_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object Detalhe_Venda1: TDetalhe_Venda
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM DETALHE_DE_PEDIDO_DE_VENDA'
      'WHERE CNC_CODIGO=:CNC_CODIGO'
      'AND PDV_CODIGO=:PDV_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = 4
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    Tabela = 'DETALHE_DE_PEDIDO_DE_VENDA'
    CodigoPDV = 0
    Indicacao1 = 0
    Indicacao2 = 0
    MedicoCRM = 0
    Meio = 0
    Situacao = 0
    Left = 167
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CNC_CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PDV_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object Produto1: TProduto
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT *'
      'FROM PRODUTO'
      'WHERE PRD_CODIGO=:PRD_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = 4
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
    Left = 135
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PRD_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object Contato1: TContato
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM CONTATO'
      'WHERE CNC_FOR=:CNC_FOR'
      'AND CNT_CODIGO=:CNT_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = 4
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    Tabela = 'CONTATO'
    CodigoCNT = 0
    CodigoFOR = 0
    FORCNC = 0
    Logradouro = 0
    Situacao = 0
    Tipo = 0
    Left = 103
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CNC_FOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CNT_CODIGO'
        ParamType = ptUnknown
      end>
  end
end

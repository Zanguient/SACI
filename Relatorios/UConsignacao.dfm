object rpt_Consignacao: Trpt_Consignacao
  Left = 234
  Top = 156
  Width = 1004
  Height = 480
  Caption = 'rpt_Consignacao'
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
    Left = 3
    Top = 2
    Width = 138
    Height = 65
    Columns = 1
    ColumnSpace = 0
    DataSet = Item_de_Consignacao1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Margins.Left = 1
    Margins.Top = 1
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
    Options.PageLength = 65
    Options.PageWidth = 138
    Options.PaperType = zptSheet
    object zrbCabecalhoPagina: TSZRBand
      Left = 1
      Top = 1
      Width = 136
      Height = 3
      BeforePrint = zrbCabecalhoPaginaBeforePrint
      BandType = rbPageHeader
      ForceNewColumn = False
      ForceNewPage = False
      object zrlTituloRelatorio: TSZRLabel
        Left = 0
        Top = 1
        Width = 47
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'SIAC - Consignacao'
      end
      object ZRSysData2: TSZRSysData
        Left = 106
        Top = 1
        Width = 30
        Height = 1
        Alignment = taRightJustify
        AlignToBand = True
        FontStyle = []
        WordWrap = True
        Data = zrsDateTime
        Text = 'Data/Hora.:'
      end
      object ZRLabel3: TSZRLabel
        Left = 0
        Top = 0
        Width = 47
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'EletroGuerra '
      end
      object ZRLabel1: TSZRLabel
        Left = 106
        Top = 0
        Width = 30
        Height = 1
        Alignment = taRightJustify
        AlignToBand = True
        FontStyle = []
        WordWrap = True
        Caption = 'Centro de Custo'
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
      Top = 12
      Width = 136
      Height = 1
      BeforePrint = zrbDetalheBeforePrint
      BandType = rbDetail
      ForceNewColumn = False
      ForceNewPage = False
      object ZRDBText10: TSZRDBText
        Left = 104
        Top = 0
        Width = 10
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Item_de_Consignacao1
        DataField = 'ICS_QUANTIDADE'
      end
      object zrlProduto: TSZRLabel
        Left = 10
        Top = 0
        Width = 93
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlCodigoPRD: TSZRLabel
        Left = 0
        Top = 0
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalItem: TSZRLabel
        Left = 125
        Top = 0
        Width = 11
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlValorItem: TSZRLabel
        Left = 115
        Top = 0
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
    end
    object zrlbRodapePagina: TSZRBand
      Left = 1
      Top = 17
      Width = 136
      Height = 3
      BeforePrint = zrlbRodapePaginaBeforePrint
      BandType = rbPageFooter
      ForceNewColumn = False
      ForceNewPage = False
      object ZRSysData3: TSZRSysData
        Left = 125
        Top = 1
        Width = 11
        Height = 1
        Alignment = taRightJustify
        AlignToBand = True
        FontStyle = []
        WordWrap = True
        Data = zrsPageNumber
        Text = 'Pag.:'
      end
      object ZRLabel15: TSZRLabel
        Left = 0
        Top = 0
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
      object ZRLabel16: TSZRLabel
        Left = 0
        Top = 1
        Width = 34
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'EmpresaDesenvolvedora'
      end
      object zrlUsuario: TSZRLabel
        Left = 35
        Top = 1
        Width = 35
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
    end
    object zrbParcelas: TSZRBand
      Left = 1
      Top = 13
      Width = 136
      Height = 4
      BeforePrint = zrbParcelasBeforePrint
      BandType = rbGroupFooter
      ForceNewColumn = False
      ForceNewPage = False
      object ZRLabel4: TSZRLabel
        Left = 115
        Top = 1
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Total:'
      end
      object ZRLabel11: TSZRLabel
        Left = 115
        Top = 0
        Width = 21
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          '----------------------------------------------------------------' +
          '---------------'
      end
      object zrlAssinatura: TSZRLabel
        Left = 0
        Top = 2
        Width = 71
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          'Data:   /  /     Assinatura: ___________________________________' +
          '___'
      end
      object zrlTotalConsignacao: TSZRLabel
        Left = 125
        Top = 1
        Width = 11
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
    end
    object zrbCabecalhoPedido: TSZRGroup
      Left = 1
      Top = 4
      Width = 136
      Height = 8
      BeforePrint = zrbCabecalhoPedidoBeforePrint
      Expression = 'CNC_CODIGO'
      FooterBand = zrbParcelas
      Master = report
      ForceNewColumn = False
      ForceNewPage = False
      object ZRLabel24: TSZRLabel
        Left = 0
        Top = 7
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
      object ZRLabel10: TSZRLabel
        Left = 0
        Top = 6
        Width = 103
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Produto   Descricao'
      end
      object ZRLabel19: TSZRLabel
        Left = 104
        Top = 6
        Width = 10
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Quantidade'
      end
      object SZRLabel9: TSZRLabel
        Left = 0
        Top = 5
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
      object zrlCliente: TSZRLabel
        Left = 10
        Top = 1
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlCliente'
      end
      object zrlDescEndereco: TSZRLabel
        Left = 0
        Top = 3
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Endereco:'
      end
      object zrlEndereco: TSZRLabel
        Left = 10
        Top = 3
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlEndereco'
      end
      object zrlBairro: TSZRLabel
        Left = 74
        Top = 3
        Width = 18
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlBairro'
      end
      object zrlCidade: TSZRLabel
        Left = 101
        Top = 3
        Width = 21
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlCidade'
      end
      object SZRLabel20: TSZRLabel
        Left = 61
        Top = 3
        Width = 12
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Bairro     :'
      end
      object SZRLabel21: TSZRLabel
        Left = 93
        Top = 3
        Width = 7
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Cidade:'
      end
      object zrlDescObservacao: TSZRLabel
        Left = 0
        Top = 4
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Ref/Obs :'
      end
      object zrlDescRG: TSZRLabel
        Left = 0
        Top = 2
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'RG/CGF  :'
      end
      object zrlRGCGF: TSZRLabel
        Left = 10
        Top = 2
        Width = 19
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlRGCGF'
      end
      object SZRLabel34: TSZRLabel
        Left = 30
        Top = 2
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'CPF/CNPJ:'
      end
      object zrlCPFCNPJ: TSZRLabel
        Left = 40
        Top = 2
        Width = 20
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlCPFCNPJ'
      end
      object SZRLabel36: TSZRLabel
        Left = 61
        Top = 2
        Width = 12
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Fone       :'
      end
      object zrlFone: TSZRLabel
        Left = 74
        Top = 2
        Width = 18
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlFone'
      end
      object SZRLabel38: TSZRLabel
        Left = 61
        Top = 1
        Width = 12
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Data Nasc  :'
      end
      object zrlDataNascimento: TSZRLabel
        Left = 74
        Top = 1
        Width = 18
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlDataNascimento'
      end
      object zrlDescSituacao: TSZRLabel
        Left = 18
        Top = 0
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Situacao:'
      end
      object zrlSituacao: TSZRLabel
        Left = 28
        Top = 0
        Width = 32
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Confirmado'
      end
      object SZRLabel47: TSZRLabel
        Left = 115
        Top = 6
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Pr.Unit'
      end
      object zrlDescCliente: TSZRLabel
        Left = 0
        Top = 1
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Cliente :'
      end
      object zrlDescCodigoPDV: TSZRLabel
        Left = 0
        Top = 0
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Consig. :'
      end
      object SZRDBText3: TSZRDBText
        Left = 10
        Top = 0
        Width = 7
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Consignacao1
        DataField = 'CSG_CODIGO'
      end
      object SZRLabel64: TSZRLabel
        Left = 125
        Top = 6
        Width = 11
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'SubTotal'
      end
      object zrlCEP: TSZRLabel
        Left = 128
        Top = 3
        Width = 8
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel23: TSZRLabel
        Left = 123
        Top = 3
        Width = 4
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'CEP:'
      end
      object SZRLabel27: TSZRLabel
        Left = 93
        Top = 2
        Width = 7
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Fax   :'
      end
      object zrlFax: TSZRLabel
        Left = 101
        Top = 2
        Width = 15
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel46: TSZRLabel
        Left = 117
        Top = 2
        Width = 5
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Cel :'
      end
      object zrlCelular: TSZRLabel
        Left = 123
        Top = 2
        Width = 13
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlObservacao: TSZRLabel
        Left = 10
        Top = 4
        Width = 126
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object szrVendedor: TSZRLabel
        Left = 61
        Top = 0
        Width = 12
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Vendedor(a):'
      end
      object zrlVendedor: TSZRLabel
        Left = 74
        Top = 0
        Width = 18
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
    end
  end
  object Item_de_Consignacao1: TItem_de_Consignacao
    DatabaseName = 'DBguerra'
    CConfiguracao = DM.Configuracao1
    CNCOrigem = 0
    CentroDeCusto = 4
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    Tabela = 'ITEM_DE_CONSIGNACAO'
    CConsignacao = Consignacao1
    CodigoICS = 0
    CodigoCSG = 0
    CodigoPRD = 0
    Left = 135
    Top = 320
  end
  object Consignacao1: TConsignacao
    DatabaseName = 'DBguerra'
    CConfiguracao = DM.Configuracao1
    CNCOrigem = 0
    CentroDeCusto = 4
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    CodigoFUN = 0
    CodigoCLI = 0
    CodigoCSG = 0
    Situacao = 0
    Left = 95
    Top = 320
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
    Consignatario = False
    Quinzenal = False
    SPC = 0
    Situacao = 0
    Tipo = 0
    Left = 192
    Top = 319
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
    Left = 163
    Top = 322
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PRD_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object Funcionario1: TFuncionario
    DatabaseName = 'DBguerra'
    Filtered = True
    SQL.Strings = (
      'SELECT FUN_CODIGO,FUN_NOME,CNC_CODIGO,FUN_APELIDO,FUN_FONE'
      'FROM FUNCIONARIO'
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
    Left = 228
    Top = 322
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FUN_CODIGO'
        ParamType = ptUnknown
      end>
  end
end

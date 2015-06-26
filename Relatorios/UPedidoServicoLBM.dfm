object rpt_PedidoServicoLBM: Trpt_PedidoServicoLBM
  Left = 11
  Top = 109
  Width = 984
  Height = 488
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
    DataSet = Pedido_de_Venda1
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
      Height = 4
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
        Top = 3
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
      object zrlFiltros: TSZRLabel
        Left = 0
        Top = 2
        Width = 136
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
    end
    object zrbDetalhe: TSZRBand
      Left = 1
      Top = 25
      Width = 136
      Height = 1
      BandType = rbDetail
      ForceNewColumn = False
      ForceNewPage = False
    end
    object zrbRodapePagina: TSZRBand
      Left = 1
      Top = 28
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
      object zrlUsuario: TSZRLabel
        Left = 24
        Top = 2
        Width = 42
        Height = 1
        AlignToBand = False
        FontStyle = [esItalic]
        WordWrap = True
      end
      object SZRLabel56: TSZRLabel
        Left = 0
        Top = 0
        Width = 11
        Height = 1
        AlignToBand = False
        FontStyle = [esItalic]
        WordWrap = True
        Caption = 'Assinatura:'
      end
    end
    object zrbGrupoPDV: TSZRGroup
      Left = 1
      Top = 4
      Width = 136
      Height = 21
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
        DataSet = Pedido_de_Venda1
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
        DataSet = Pedido_de_Venda1
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
      object SZRDBText5: TSZRDBText
        Left = 10
        Top = 4
        Width = 86
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'PDV_OBS'
      end
      object SZRLabel19: TSZRLabel
        Left = 0
        Top = 5
        Width = 73
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          'Produtos -----------------------------------------Quantidade----' +
          '-Valor |'
      end
      object SZRLabel20: TSZRLabel
        Left = 73
        Top = 5
        Width = 63
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Servicos ----------------------------------Quantidade-----Valor'
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
        DataSet = Pedido_de_Venda1
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
      object zrlProduto1: TSZRLabel
        Left = 1
        Top = 6
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlProduto2: TSZRLabel
        Left = 1
        Top = 7
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlProduto4: TSZRLabel
        Left = 1
        Top = 9
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlProduto3: TSZRLabel
        Left = 1
        Top = 8
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlProduto6: TSZRLabel
        Left = 1
        Top = 11
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlProduto5: TSZRLabel
        Left = 1
        Top = 10
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd1: TSZRLabel
        Left = 51
        Top = 6
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd2: TSZRLabel
        Left = 51
        Top = 7
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd4: TSZRLabel
        Left = 51
        Top = 9
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd3: TSZRLabel
        Left = 51
        Top = 8
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd6: TSZRLabel
        Left = 51
        Top = 11
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd5: TSZRLabel
        Left = 51
        Top = 10
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalPRD1: TSZRLabel
        Left = 61
        Top = 6
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalPRD2: TSZRLabel
        Left = 61
        Top = 7
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalPRD4: TSZRLabel
        Left = 61
        Top = 9
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalPRD3: TSZRLabel
        Left = 61
        Top = 8
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalPRD6: TSZRLabel
        Left = 61
        Top = 11
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalPRD5: TSZRLabel
        Left = 61
        Top = 10
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico1: TSZRLabel
        Left = 73
        Top = 6
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico2: TSZRLabel
        Left = 73
        Top = 7
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico4: TSZRLabel
        Left = 73
        Top = 9
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico3: TSZRLabel
        Left = 73
        Top = 8
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico6: TSZRLabel
        Left = 73
        Top = 11
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico5: TSZRLabel
        Left = 73
        Top = 10
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer1: TSZRLabel
        Left = 117
        Top = 6
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer2: TSZRLabel
        Left = 117
        Top = 7
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer4: TSZRLabel
        Left = 117
        Top = 9
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer3: TSZRLabel
        Left = 117
        Top = 8
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer6: TSZRLabel
        Left = 117
        Top = 11
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer5: TSZRLabel
        Left = 117
        Top = 10
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalSER1: TSZRLabel
        Left = 127
        Top = 6
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalSER2: TSZRLabel
        Left = 127
        Top = 7
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalSER4: TSZRLabel
        Left = 127
        Top = 9
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalSER3: TSZRLabel
        Left = 127
        Top = 8
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalSER6: TSZRLabel
        Left = 127
        Top = 11
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalSER5: TSZRLabel
        Left = 127
        Top = 10
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel61: TSZRLabel
        Left = 71
        Top = 6
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel62: TSZRLabel
        Left = 71
        Top = 7
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel63: TSZRLabel
        Left = 71
        Top = 8
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel64: TSZRLabel
        Left = 71
        Top = 9
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel65: TSZRLabel
        Left = 71
        Top = 10
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel66: TSZRLabel
        Left = 71
        Top = 11
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
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
        DataSet = Pedido_de_Venda1
        DataField = 'PDV_GARANTIA'
      end
      object zrlProduto7: TSZRLabel
        Left = 1
        Top = 12
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlProduto8: TSZRLabel
        Left = 1
        Top = 13
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlProduto10: TSZRLabel
        Left = 1
        Top = 15
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlProduto9: TSZRLabel
        Left = 1
        Top = 14
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlProduto12: TSZRLabel
        Left = 1
        Top = 17
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlProduto11: TSZRLabel
        Left = 1
        Top = 16
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd7: TSZRLabel
        Left = 51
        Top = 12
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd8: TSZRLabel
        Left = 51
        Top = 13
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd10: TSZRLabel
        Left = 51
        Top = 15
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd9: TSZRLabel
        Left = 51
        Top = 14
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd12: TSZRLabel
        Left = 51
        Top = 17
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd11: TSZRLabel
        Left = 51
        Top = 16
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalPRD7: TSZRLabel
        Left = 61
        Top = 12
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalPRD8: TSZRLabel
        Left = 61
        Top = 13
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalPRD10: TSZRLabel
        Left = 61
        Top = 15
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalPRD9: TSZRLabel
        Left = 61
        Top = 14
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalPRD12: TSZRLabel
        Left = 61
        Top = 17
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalPRD11: TSZRLabel
        Left = 61
        Top = 16
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico7: TSZRLabel
        Left = 73
        Top = 12
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico8: TSZRLabel
        Left = 73
        Top = 13
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico10: TSZRLabel
        Left = 73
        Top = 15
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico9: TSZRLabel
        Left = 73
        Top = 14
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico12: TSZRLabel
        Left = 73
        Top = 17
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico11: TSZRLabel
        Left = 73
        Top = 16
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer7: TSZRLabel
        Left = 117
        Top = 12
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer8: TSZRLabel
        Left = 117
        Top = 13
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer10: TSZRLabel
        Left = 117
        Top = 15
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer9: TSZRLabel
        Left = 117
        Top = 14
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer12: TSZRLabel
        Left = 117
        Top = 17
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer11: TSZRLabel
        Left = 117
        Top = 16
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalSER7: TSZRLabel
        Left = 127
        Top = 12
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalSER8: TSZRLabel
        Left = 127
        Top = 13
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalSER10: TSZRLabel
        Left = 127
        Top = 15
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalSER9: TSZRLabel
        Left = 127
        Top = 14
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalSER12: TSZRLabel
        Left = 127
        Top = 17
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalSER11: TSZRLabel
        Left = 127
        Top = 16
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel54: TSZRLabel
        Left = 71
        Top = 12
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel55: TSZRLabel
        Left = 71
        Top = 13
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel58: TSZRLabel
        Left = 71
        Top = 14
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel59: TSZRLabel
        Left = 71
        Top = 15
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel60: TSZRLabel
        Left = 71
        Top = 16
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel67: TSZRLabel
        Left = 71
        Top = 17
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
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
    end
    object zrbRodapeGrupoPDV: TSZRBand
      Left = 1
      Top = 26
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
    Left = 512
    Top = 204
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
    Left = 289
    Top = 209
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
    Left = 576
    Top = 116
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
    Left = 132
    Top = 236
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
  object Pedido_de_Venda1: TPedido_de_Venda
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * '
      'FROM PEDIDO_DE_VENDA '
      'ORDER BY CNC_CODIGO, PDV_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = 4
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    Tabela = 'PEDIDO_DE_VENDA'
    Arquiteto = 0
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
    Left = 266
    Top = 50
  end
  object Item_Pedido_Venda1: TItem_Pedido_Venda
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT I1.*'
      ',P1.PRD_DESCRICAO'
      ',P1.PRD_BASE_REAL'
      ',P1.GRP_CODIGO'
      ',P1.SGP_CODIGO'
      ',P1.PRD_PRECO_VENDA'
      'FROM ITEM_DE_PEDIDO_DE_VENDA I1, PRODUTO P1'
      'WHERE I1.CNC_CODIGO=:CNC_CODIGO'
      'AND I1.PDV_CODIGO=:PDV_CODIGO'
      'AND P1.PRD_SERVICO=0'
      'AND I1.PRD_CODIGO=P1.PRD_CODIGO'
      'ORDER BY IPV_SEQUENCIA, IPV_CODIGO')
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
    Left = 430
    Top = 306
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
  object Item_Pedido_Venda2: TItem_Pedido_Venda
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT I1.*, P1.PRD_DESCRICAO'
      ',P1.GRP_CODIGO'
      ',P1.SGP_CODIGO'
      ',P1.PRD_PRECO_VENDA'
      'FROM ITEM_DE_PEDIDO_DE_VENDA I1, PRODUTO P1'
      'WHERE I1.CNC_CODIGO=:CNC_CODIGO'
      'AND I1.PDV_CODIGO=:PDV_CODIGO'
      'AND P1.PRD_SERVICO=1'
      'AND I1.PRD_CODIGO=P1.PRD_CODIGO'
      'ORDER BY IPV_VINCULO, PRD_NIVEL, IPV_SEQUENCIA, IPV_CODIGO')
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
    Left = 606
    Top = 304
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
    Left = 446
    Top = 220
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
end

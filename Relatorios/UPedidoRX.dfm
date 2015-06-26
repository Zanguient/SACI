object fmxPedidoRX: TfmxPedidoRX
  Left = 104
  Top = 99
  Width = 978
  Height = 548
  Caption = 'fmxPedidoRX'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SZReport1: TSZReport
    Left = 0
    Top = 0
    Width = 138
    Height = 34
    Columns = 1
    ColumnSpace = 0
    DataSet = Pedido_de_Venda1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Margins.Left = 2
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
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
    Options.PageLength = 34
    Options.PageWidth = 138
    Options.PaperType = zptSheet
    object SZRBand1: TSZRBand
      Left = 2
      Top = 1
      Width = 135
      Height = 29
      BeforePrint = SZRBand1BeforePrint
      BandType = rbDetail
      ForceNewColumn = False
      ForceNewPage = True
      object SZRLabel68: TSZRLabel
        Left = 0
        Top = 1
        Width = 47
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'SIAC - Pedido de Servico'
      end
      object SZRSysData1: TSZRSysData
        Left = 92
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
      object SZRLabel69: TSZRLabel
        Left = 0
        Top = 0
        Width = 47
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'EletroGuerra '
      end
      object SZRLabel70: TSZRLabel
        Left = -1
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
      object SZRLabel71: TSZRLabel
        Left = 92
        Top = 0
        Width = 43
        Height = 1
        Alignment = taRightJustify
        AlignToBand = True
        FontStyle = []
        WordWrap = True
        Caption = 'Centro de Custo'
      end
      object SZRLabel72: TSZRLabel
        Left = -1
        Top = 2
        Width = 136
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRDBText6: TSZRDBText
        Left = 10
        Top = 5
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'PDV_CODIGO'
      end
      object SZRLabel73: TSZRLabel
        Left = 0
        Top = 5
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Codigo  :'
      end
      object SZRDBText7: TSZRDBText
        Left = 31
        Top = 5
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'PDV_DATA_HORA'
      end
      object SZRLabel74: TSZRLabel
        Left = 21
        Top = 5
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Cadastro:'
      end
      object SZRLabel75: TSZRLabel
        Left = 43
        Top = 5
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Previsao:'
      end
      object SZRLabel76: TSZRLabel
        Left = 65
        Top = 5
        Width = 8
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Entrega:'
      end
      object SZRLabel77: TSZRLabel
        Left = 86
        Top = 5
        Width = 6
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Caixa:'
      end
      object SZRDBText8: TSZRDBText
        Left = 93
        Top = 5
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'PDV_CAIXA'
      end
      object SZRLabel78: TSZRLabel
        Left = 104
        Top = 5
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Documento:'
      end
      object SZRDBText9: TSZRDBText
        Left = 115
        Top = 5
        Width = 12
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'PDV_DOCUMENTO'
      end
      object SZRDBText10: TSZRDBText
        Left = 53
        Top = 5
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'PDV_DT_PREVISAO'
      end
      object SZRDBText11: TSZRDBText
        Left = 74
        Top = 5
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'PDV_DT_ENTREGA'
      end
      object SZRLabel79: TSZRLabel
        Left = 0
        Top = 6
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Cliente :'
      end
      object SZRLabel81: TSZRLabel
        Left = 54
        Top = 6
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Endereco:'
      end
      object zrlCliente: TSZRLabel
        Left = 10
        Top = 6
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlEndereco: TSZRLabel
        Left = 64
        Top = 6
        Width = 71
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel80: TSZRLabel
        Left = 0
        Top = 8
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Observ. :'
      end
      object SZRLabel82: TSZRLabel
        Left = 0
        Top = 7
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Tipo Pag:'
      end
      object SZRLabel84: TSZRLabel
        Left = 54
        Top = 7
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Forma P.:'
      end
      object SZRLabel86: TSZRLabel
        Left = 99
        Top = 7
        Width = 7
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Agente:'
      end
      object SZRLabel88: TSZRLabel
        Left = 97
        Top = 8
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Situacao:'
      end
      object SZRLabel91: TSZRLabel
        Left = 0
        Top = 9
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Pasciente:'
      end
      object SZRDBText12: TSZRDBText
        Left = 10
        Top = 7
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'PAR_DESCRICAO'
      end
      object SZRDBText13: TSZRDBText
        Left = 64
        Top = 7
        Width = 34
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'FPG_DESCRICAO'
      end
      object SZRDBText14: TSZRDBText
        Left = 107
        Top = 7
        Width = 28
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'AGF_DESCRICAO'
      end
      object SZRDBText15: TSZRDBText
        Left = 107
        Top = 8
        Width = 28
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'PDV_SITUACAO'
      end
      object SZRDBText16: TSZRDBText
        Left = 11
        Top = 9
        Width = 85
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'DPV_PASCIENTE'
      end
      object SZRLabel83: TSZRLabel
        Left = 0
        Top = 10
        Width = 135
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          'Detalhe do Servico ---------------------------------------------' +
          '----------------------------------------------------------------' +
          '-------'
      end
      object SZRLabel19: TSZRLabel
        Left = 0
        Top = 21
        Width = 73
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          'Produtos -------------------------------------------------------' +
          '------ |'
      end
      object SZRLabel20: TSZRLabel
        Left = 72
        Top = 21
        Width = 63
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Servicos ------------------------------------------------------'
      end
      object SZRLabel22: TSZRLabel
        Left = 27
        Top = 18
        Width = 2
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'OD'
      end
      object SZRLabel23: TSZRLabel
        Left = 30
        Top = 17
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Esf'
      end
      object SZRLabel24: TSZRLabel
        Left = 27
        Top = 19
        Width = 2
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'OE'
      end
      object SZRLabel25: TSZRLabel
        Left = 36
        Top = 17
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Cil'
      end
      object SZRLabel28: TSZRLabel
        Left = 42
        Top = 17
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Eixo'
      end
      object SZRLabel31: TSZRLabel
        Left = 48
        Top = 17
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Dnp'
      end
      object SZRLabel34: TSZRLabel
        Left = 54
        Top = 17
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Alt'
      end
      object SZRLabel37: TSZRLabel
        Left = 60
        Top = 17
        Width = 6
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Adicao'
      end
      object SZRLabel8: TSZRLabel
        Left = 1
        Top = 15
        Width = 8
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Receita:'
      end
      object SZRLabel15: TSZRLabel
        Left = 69
        Top = 17
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Base Real'
      end
      object zrlFormulaOD: TSZRLabel
        Left = 81
        Top = 18
        Width = 15
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlFormulaOE: TSZRLabel
        Left = 81
        Top = 19
        Width = 15
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlBaseRealOD: TSZRLabel
        Left = 69
        Top = 18
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel17: TSZRLabel
        Left = 99
        Top = 17
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'NMaterial'
      end
      object zrlNMaterialOD: TSZRLabel
        Left = 99
        Top = 18
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlBaseRealOE: TSZRLabel
        Left = 69
        Top = 19
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlNMaterialOE: TSZRLabel
        Left = 99
        Top = 19
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel26: TSZRLabel
        Left = 81
        Top = 17
        Width = 15
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Forma'
      end
      object SZRLabel27: TSZRLabel
        Left = 29
        Top = 17
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel29: TSZRLabel
        Left = 29
        Top = 19
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel30: TSZRLabel
        Left = 29
        Top = 18
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel32: TSZRLabel
        Left = 35
        Top = 17
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel33: TSZRLabel
        Left = 35
        Top = 19
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel35: TSZRLabel
        Left = 35
        Top = 18
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel36: TSZRLabel
        Left = 41
        Top = 17
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel38: TSZRLabel
        Left = 41
        Top = 19
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel39: TSZRLabel
        Left = 41
        Top = 18
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel41: TSZRLabel
        Left = 47
        Top = 17
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel42: TSZRLabel
        Left = 47
        Top = 19
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel43: TSZRLabel
        Left = 47
        Top = 18
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel44: TSZRLabel
        Left = 53
        Top = 17
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel45: TSZRLabel
        Left = 53
        Top = 19
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel46: TSZRLabel
        Left = 53
        Top = 18
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel47: TSZRLabel
        Left = 59
        Top = 17
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel48: TSZRLabel
        Left = 59
        Top = 19
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel51: TSZRLabel
        Left = 59
        Top = 18
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel53: TSZRLabel
        Left = 66
        Top = 17
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel54: TSZRLabel
        Left = 66
        Top = 19
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel55: TSZRLabel
        Left = 66
        Top = 18
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel58: TSZRLabel
        Left = 110
        Top = 18
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Centro OD:'
      end
      object SZRLabel59: TSZRLabel
        Left = 110
        Top = 19
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Centro OE:'
      end
      object SZRLabel60: TSZRLabel
        Left = 110
        Top = 17
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Diametro:'
      end
      object zrlProduto1: TSZRLabel
        Left = 1
        Top = 22
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlProduto2: TSZRLabel
        Left = 1
        Top = 23
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlProduto4: TSZRLabel
        Left = 1
        Top = 25
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlProduto3: TSZRLabel
        Left = 1
        Top = 24
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlProduto6: TSZRLabel
        Left = 1
        Top = 27
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlProduto5: TSZRLabel
        Left = 1
        Top = 26
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd1: TSZRLabel
        Left = 51
        Top = 22
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd2: TSZRLabel
        Left = 51
        Top = 23
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd4: TSZRLabel
        Left = 51
        Top = 25
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd3: TSZRLabel
        Left = 51
        Top = 24
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd6: TSZRLabel
        Left = 51
        Top = 27
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd5: TSZRLabel
        Left = 51
        Top = 26
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalPRD1: TSZRLabel
        Left = 61
        Top = 22
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalPRD2: TSZRLabel
        Left = 61
        Top = 23
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalPRD4: TSZRLabel
        Left = 61
        Top = 25
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalPRD3: TSZRLabel
        Left = 61
        Top = 24
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalPRD6: TSZRLabel
        Left = 61
        Top = 27
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalPRD5: TSZRLabel
        Left = 61
        Top = 26
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico1: TSZRLabel
        Left = 73
        Top = 22
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico2: TSZRLabel
        Left = 73
        Top = 23
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico4: TSZRLabel
        Left = 73
        Top = 25
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico3: TSZRLabel
        Left = 73
        Top = 24
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico6: TSZRLabel
        Left = 73
        Top = 27
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico5: TSZRLabel
        Left = 73
        Top = 26
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer1: TSZRLabel
        Left = 117
        Top = 22
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer2: TSZRLabel
        Left = 117
        Top = 23
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer4: TSZRLabel
        Left = 117
        Top = 25
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer3: TSZRLabel
        Left = 117
        Top = 24
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer6: TSZRLabel
        Left = 117
        Top = 27
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer5: TSZRLabel
        Left = 117
        Top = 26
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalSER1: TSZRLabel
        Left = 126
        Top = 22
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalSER2: TSZRLabel
        Left = 126
        Top = 23
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalSER4: TSZRLabel
        Left = 126
        Top = 25
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalSER3: TSZRLabel
        Left = 126
        Top = 24
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalSER6: TSZRLabel
        Left = 126
        Top = 27
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalSER5: TSZRLabel
        Left = 126
        Top = 26
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel61: TSZRLabel
        Left = 71
        Top = 22
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel62: TSZRLabel
        Left = 71
        Top = 23
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel63: TSZRLabel
        Left = 71
        Top = 24
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel64: TSZRLabel
        Left = 71
        Top = 25
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel65: TSZRLabel
        Left = 71
        Top = 26
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel66: TSZRLabel
        Left = 71
        Top = 27
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRDBText17: TSZRDBText
        Left = 30
        Top = 18
        Width = 5
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'DPV_OD_ESF'
      end
      object SZRDBText18: TSZRDBText
        Left = 30
        Top = 19
        Width = 5
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'DPV_OE_ESF'
      end
      object SZRDBText19: TSZRDBText
        Left = 36
        Top = 18
        Width = 5
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'DPV_OD_CIL'
      end
      object SZRDBText20: TSZRDBText
        Left = 36
        Top = 19
        Width = 5
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'DPV_OE_CIL'
      end
      object SZRDBText21: TSZRDBText
        Left = 42
        Top = 18
        Width = 5
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'DPV_OD_EIXO'
      end
      object SZRDBText22: TSZRDBText
        Left = 42
        Top = 19
        Width = 5
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'DPV_OE_EIXO'
      end
      object SZRDBText23: TSZRDBText
        Left = 48
        Top = 18
        Width = 5
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'DPV_OD_DNP'
      end
      object SZRDBText24: TSZRDBText
        Left = 48
        Top = 19
        Width = 5
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'DPV_OE_DNP'
      end
      object SZRDBText25: TSZRDBText
        Left = 54
        Top = 18
        Width = 5
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'DPV_OD_ALT'
      end
      object SZRDBText26: TSZRDBText
        Left = 54
        Top = 19
        Width = 5
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'DPV_OE_ALT'
      end
      object SZRDBText27: TSZRDBText
        Left = 60
        Top = 18
        Width = 6
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'DPV_OD_ADICAO'
      end
      object SZRDBText28: TSZRDBText
        Left = 60
        Top = 19
        Width = 6
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'DPV_OE_ADICAO'
      end
      object SZRDBText29: TSZRDBText
        Left = 10
        Top = 15
        Width = 87
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'DPV_MEDICO_NOME'
      end
      object SZRDBText30: TSZRDBText
        Left = 10
        Top = 8
        Width = 86
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'OBSERVACAO'
      end
      object SZRLabel1: TSZRLabel
        Left = 0
        Top = 14
        Width = 135
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          'Detalhe do Servico ---------------------------------------------' +
          '----------------------------------------------------------------' +
          '-------'
      end
      object SZRLabel2: TSZRLabel
        Left = 1
        Top = 11
        Width = 14
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Tipo de Lente:'
      end
      object SZRLabel3: TSZRLabel
        Left = 1
        Top = 12
        Width = 16
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Tipo de Arma'#231#227'o:'
      end
      object SZRLabel4: TSZRLabel
        Left = 68
        Top = 11
        Width = 4
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Obs:'
      end
      object SZRLabel5: TSZRLabel
        Left = 68
        Top = 12
        Width = 4
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Obs:'
      end
      object SZRDBText1: TSZRDBText
        Left = 16
        Top = 11
        Width = 51
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'DPV_TIPO_LENTES'
      end
      object SZRDBText2: TSZRDBText
        Left = 18
        Top = 12
        Width = 49
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'DPV_TIPO_ARMACAO'
      end
      object SZRDBText3: TSZRDBText
        Left = 73
        Top = 11
        Width = 62
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'DPV_OBS_LENTES'
      end
      object SZRDBText4: TSZRDBText
        Left = 73
        Top = 12
        Width = 62
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'DPV_OBS_ARMACAO'
      end
    end
    object SZRBand2: TSZRBand
      Left = 2
      Top = 30
      Width = 135
      Height = 3
      BeforePrint = SZRBand2BeforePrint
      BandType = rbPageFooter
      ForceNewColumn = False
      ForceNewPage = False
      object SZRSysData2: TSZRSysData
        Left = 124
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
      object SZRLabel85: TSZRLabel
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
      object SZRLabel87: TSZRLabel
        Left = 0
        Top = 2
        Width = 23
        Height = 1
        AlignToBand = False
        FontStyle = [esItalic]
        WordWrap = True
        Caption = 'EmpresaDesenvolvedora'
      end
      object SZRLabel89: TSZRLabel
        Left = 24
        Top = 2
        Width = 42
        Height = 1
        AlignToBand = False
        FontStyle = [esItalic]
        WordWrap = True
      end
      object SZRLabel90: TSZRLabel
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
  end
  object Pedido_de_Venda1: TPedido_de_Venda
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT PDV.PDV_CODIGO,PDV.CNC_CODIGO,'
      '  CASE PDV_SITUACAO '
      '    WHEN -1 THEN '#39'RESERVA'#39
      '    WHEN 0 THEN '#39'RECEP'#199#195'O'#39
      '    WHEN 1 THEN '#39'RECEP'#199#195'O'#39
      '    WHEN 2 THEN '#39'QUALIDADE'#39
      '    WHEN 3 THEN '#39'PRONTO P/ ENTREGA'#39
      '    WHEN 4 THEN '#39'FINALIZADO'#39
      '    WHEN 5 THEN '#39'CONS. FIN.'#39
      '    WHEN 6 THEN '#39'CANCELADO'#39
      '    WHEN 7 THEN '#39'CONS. CANC.'#39
      '    WHEN 8 THEN '#39'DEVOLVIDO'#39
      '    WHEN 9 THEN '#39'CONS. DEV.'#39
      '    WHEN 10 THEN '#39'CANC. N APROV.'#39
      '    WHEN 11 THEN '#39'FINALIZADO'#39
      '  END AS PDV_SITUACAO,'
      'PDV_DATA_HORA,PDV_DT_PREVISAO,PDV_DT_ENTREGA,PDV_CAIXA,'
      
        'PDV_DOCUMENTO,PDV_TIPO_PAG,PAR1.PAR_DESCRICAO,PDV.FPG_CODIGO,FPG' +
        '_DESCRICAO,'
      
        'PDV.AGF_CODIGO,CLI_CODIGO,CNC_CLIENTE,AGF_DESCRICAO,CONVERT(VARC' +
        'HAR, CONVERT(DECIMAL(10,2),PDV_ANTECIPADO))+'#39' '#39'+'
      
        'PDV_OBS AS OBSERVACAO,DPV_MEDICO_NOME,DPV_TIPO_LENTES,DPV_OBS_LE' +
        'NTES,DPV_TIPO_ARMACAO,'
      
        'DPV_OBS_ARMACAO,DPV_PASCIENTE,DPV_OD_ESF,DPV_OE_ESF,DPV_OD_CIL,D' +
        'PV_OE_CIL,DPV_OD_EIXO,'
      
        'DPV_OE_EIXO,DPV_OD_DNP,DPV_OE_DNP,DPV_OD_ALT,DPV_OE_ALT,DPV_OD_A' +
        'DICAO,DPV_OE_ADICAO,'
      
        'DPV_OBSERVACAO,DPV_TIPO_LENTES,DPV_TIPO_ARMACAO,DPV_OBS_LENTES,D' +
        'PV_OBS_ARMACAO'
      'FROM PEDIDO_DE_VENDA PDV'
      'INNER JOIN PARAMETRO PAR1'
      'ON PAR1.PAR_CODIGO=PDV.PDV_TIPO_PAG'
      'INNER JOIN FORMA_DE_PAGAMENTO FPG'
      'ON FPG.FPG_CODIGO=PDV.FPG_CODIGO'
      'INNER JOIN AGENTE_FINANCEIRO AGF'
      'ON AGF.AGF_CODIGO=PDV.AGF_CODIGO'
      'LEFT JOIN DETALHE_DE_PEDIDO_DE_VENDA DPV'
      'ON DPV.PDV_CODIGO=PDV.PDV_CODIGO '
      'AND DPV.CNC_CODIGO=PDV.CNC_CODIGO'
      'WHERE PDV.CNC_CODIGO=:CNC_CODIGO'
      'AND PDV.PDV_CODIGO=:PDV_CODIGO'
      'ORDER BY PDV.PDV_CODIGO')
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
    Left = 16
    Top = 487
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CNC_CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PDV_CODIGO'
        ParamType = ptUnknown
      end>
    object Pedido_de_Venda1PDV_CODIGO: TIntegerField
      FieldName = 'PDV_CODIGO'
    end
    object Pedido_de_Venda1CNC_CODIGO: TIntegerField
      FieldName = 'CNC_CODIGO'
    end
    object Pedido_de_Venda1PDV_SITUACAO: TStringField
      FieldName = 'PDV_SITUACAO'
      FixedChar = True
      Size = 17
    end
    object Pedido_de_Venda1PDV_DATA_HORA: TDateTimeField
      FieldName = 'PDV_DATA_HORA'
    end
    object Pedido_de_Venda1PDV_DT_PREVISAO: TDateTimeField
      FieldName = 'PDV_DT_PREVISAO'
    end
    object Pedido_de_Venda1PDV_DT_ENTREGA: TDateTimeField
      FieldName = 'PDV_DT_ENTREGA'
    end
    object Pedido_de_Venda1PDV_CAIXA: TStringField
      FieldName = 'PDV_CAIXA'
      FixedChar = True
    end
    object Pedido_de_Venda1PDV_DOCUMENTO: TStringField
      FieldName = 'PDV_DOCUMENTO'
      FixedChar = True
    end
    object Pedido_de_Venda1PDV_TIPO_PAG: TIntegerField
      FieldName = 'PDV_TIPO_PAG'
    end
    object Pedido_de_Venda1PAR_DESCRICAO: TStringField
      FieldName = 'PAR_DESCRICAO'
      FixedChar = True
      Size = 40
    end
    object Pedido_de_Venda1FPG_CODIGO: TIntegerField
      FieldName = 'FPG_CODIGO'
    end
    object Pedido_de_Venda1FPG_DESCRICAO: TStringField
      FieldName = 'FPG_DESCRICAO'
      FixedChar = True
      Size = 60
    end
    object Pedido_de_Venda1AGF_CODIGO: TIntegerField
      FieldName = 'AGF_CODIGO'
    end
    object Pedido_de_Venda1CLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
    end
    object Pedido_de_Venda1CNC_CLIENTE: TIntegerField
      FieldName = 'CNC_CLIENTE'
    end
    object Pedido_de_Venda1AGF_DESCRICAO: TStringField
      FieldName = 'AGF_DESCRICAO'
      FixedChar = True
      Size = 40
    end
    object Pedido_de_Venda1OBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      FixedChar = True
      Size = 255
    end
    object Pedido_de_Venda1DPV_MEDICO_NOME: TStringField
      FieldName = 'DPV_MEDICO_NOME'
      FixedChar = True
      Size = 60
    end
    object Pedido_de_Venda1DPV_TIPO_LENTES: TStringField
      FieldName = 'DPV_TIPO_LENTES'
      FixedChar = True
      Size = 100
    end
    object Pedido_de_Venda1DPV_OBS_LENTES: TStringField
      FieldName = 'DPV_OBS_LENTES'
      FixedChar = True
      Size = 255
    end
    object Pedido_de_Venda1DPV_TIPO_ARMACAO: TStringField
      FieldName = 'DPV_TIPO_ARMACAO'
      FixedChar = True
      Size = 100
    end
    object Pedido_de_Venda1DPV_OBS_ARMACAO: TStringField
      FieldName = 'DPV_OBS_ARMACAO'
      FixedChar = True
      Size = 255
    end
    object Pedido_de_Venda1DPV_PASCIENTE: TStringField
      FieldName = 'DPV_PASCIENTE'
      FixedChar = True
      Size = 60
    end
    object Pedido_de_Venda1DPV_OD_ESF: TFloatField
      FieldName = 'DPV_OD_ESF'
      DisplayFormat = '#,##0.00'
    end
    object Pedido_de_Venda1DPV_OE_ESF: TFloatField
      FieldName = 'DPV_OE_ESF'
      DisplayFormat = '#,##0.00'
    end
    object Pedido_de_Venda1DPV_OD_CIL: TFloatField
      FieldName = 'DPV_OD_CIL'
      DisplayFormat = '#,##0.00'
    end
    object Pedido_de_Venda1DPV_OE_CIL: TFloatField
      FieldName = 'DPV_OE_CIL'
      DisplayFormat = '#,##0.00'
    end
    object Pedido_de_Venda1DPV_OD_EIXO: TFloatField
      FieldName = 'DPV_OD_EIXO'
      DisplayFormat = '#,##0.00'
    end
    object Pedido_de_Venda1DPV_OE_EIXO: TFloatField
      FieldName = 'DPV_OE_EIXO'
      DisplayFormat = '#,##0.00'
    end
    object Pedido_de_Venda1DPV_OD_DNP: TFloatField
      FieldName = 'DPV_OD_DNP'
      DisplayFormat = '#,##0.00'
    end
    object Pedido_de_Venda1DPV_OE_DNP: TFloatField
      FieldName = 'DPV_OE_DNP'
      DisplayFormat = '#,##0.00'
    end
    object Pedido_de_Venda1DPV_OD_ALT: TFloatField
      FieldName = 'DPV_OD_ALT'
      DisplayFormat = '#,##0.00'
    end
    object Pedido_de_Venda1DPV_OE_ALT: TFloatField
      FieldName = 'DPV_OE_ALT'
      DisplayFormat = '#,##0.00'
    end
    object Pedido_de_Venda1DPV_OD_ADICAO: TFloatField
      FieldName = 'DPV_OD_ADICAO'
      DisplayFormat = '#,##0.00'
    end
    object Pedido_de_Venda1DPV_OE_ADICAO: TFloatField
      FieldName = 'DPV_OE_ADICAO'
      DisplayFormat = '#,##0.00'
    end
    object Pedido_de_Venda1DPV_OBSERVACAO: TStringField
      FieldName = 'DPV_OBSERVACAO'
      FixedChar = True
      Size = 255
    end
    object Pedido_de_Venda1DPV_TIPO_LENTES_1: TStringField
      FieldName = 'DPV_TIPO_LENTES_1'
      FixedChar = True
      Size = 100
    end
    object Pedido_de_Venda1DPV_OBS_LENTES_1: TStringField
      FieldName = 'DPV_OBS_LENTES_1'
      FixedChar = True
      Size = 255
    end
    object Pedido_de_Venda1DPV_OBS_ARMACAO_1: TStringField
      FieldName = 'DPV_OBS_ARMACAO_1'
      FixedChar = True
      Size = 255
    end
  end
  object Cliente1: TCliente
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT CLI_CODIGO,CLI_RZ_SOCIAL,CLI_LOGRADOURO, '
      'PAR_DESCRICAO,CLI_ENDERECO,CLI_BAIRRO,CLI_CIDADE,'
      'CLI_UF,CLI_CEP'
      'FROM CLIENTE CLI'
      'LEFT JOIN PARAMETRO PAR'
      'ON PAR.PAR_CODIGO=CLI.CLI_LOGRADOURO'
      'WHERE CLI.CNC_CODIGO=:CNC_CODIGO AND '
      'CLI_CODIGO=:CLI_CODIGO')
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
    Left = 94
    Top = 487
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
      'SELECT I1.*'
      ',P1.PRD_DESCRICAO'
      ',P1.PRD_BASE_REAL'
      ',P1.GRP_CODIGO'
      ',P1.SGP_CODIGO'
      ',P1.PRD_PRECO_VENDA'
      ',S1.SGP_INDICE_REFRACAO'
      'FROM ITEM_DE_PEDIDO_DE_VENDA I1, PRODUTO P1, SUBGRUPO S1'
      'WHERE I1.CNC_CODIGO=:CNC_CODIGO'
      'AND I1.PDV_CODIGO=:PDV_CODIGO'
      'AND P1.PRD_SERVICO=0'
      'AND I1.PRD_CODIGO=P1.PRD_CODIGO'
      'AND P1.SGP_CODIGO=S1.SGP_CODIGO'
      'AND P1.GRP_CODIGO=S1.GRP_CODIGO'
      '')
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
    Left = 172
    Top = 487
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
      'AND PDV_CODIGO=:PDV_CODIGO AND '
      'DPV_PASCIENTE=:DPV_PASCIENTE')
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
    Left = 55
    Top = 487
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
      end
      item
        DataType = ftString
        Name = 'DPV_PASCIENTE'
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
      'AND I1.PRD_CODIGO=P1.PRD_CODIGO')
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
    Left = 133
    Top = 487
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

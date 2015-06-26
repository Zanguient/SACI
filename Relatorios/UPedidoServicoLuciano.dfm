object rpt_PedidoServicoLuciano: Trpt_PedidoServicoLuciano
  Left = 67
  Top = 144
  Width = 991
  Height = 667
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
    Height = 65
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
    Options.PageLength = 65
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
      object ZRLabel1: TSZRLabel
        Left = 93
        Top = 0
        Width = 43
        Height = 1
        Alignment = taRightJustify
        AlignToBand = True
        FontStyle = []
        WordWrap = True
        Caption = 'Centro de Custo'
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
      Top = 37
      Width = 136
      Height = 1
      BandType = rbDetail
      ForceNewColumn = False
      ForceNewPage = False
    end
    object zrbRodapePagina: TSZRBand
      Left = 1
      Top = 40
      Width = 136
      Height = 3
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
      Height = 33
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
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Endereco:'
      end
      object zrlEndereco: TSZRLabel
        Left = 64
        Top = 1
        Width = 72
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel7: TSZRLabel
        Left = 0
        Top = 5
        Width = 136
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          'Detalhe do Servico ---------------------------------------------' +
          '----------------------------------------------------------------' +
          '--------'
      end
      object SZRLabel11: TSZRLabel
        Left = 1
        Top = 6
        Width = 13
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Tipo Lente  :'
      end
      object zrlTipoLente: TSZRLabel
        Left = 15
        Top = 6
        Width = 39
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel12: TSZRLabel
        Left = 55
        Top = 6
        Width = 4
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Obs:'
      end
      object zrlObsLente: TSZRLabel
        Left = 60
        Top = 6
        Width = 76
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel14: TSZRLabel
        Left = 1
        Top = 7
        Width = 13
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Tipo Armacao:'
      end
      object zrlTipoArmacao: TSZRLabel
        Left = 15
        Top = 7
        Width = 39
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel16: TSZRLabel
        Left = 55
        Top = 7
        Width = 4
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Obs:'
      end
      object zrlObsArmacao: TSZRLabel
        Left = 60
        Top = 7
        Width = 76
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel18: TSZRLabel
        Left = 0
        Top = 3
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Observ. :'
      end
      object SZRLabel19: TSZRLabel
        Left = 0
        Top = 20
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
        Left = 73
        Top = 20
        Width = 63
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Servicos ------------------------------------------------------'
      end
      object SZRLabel22: TSZRLabel
        Left = 27
        Top = 10
        Width = 2
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'OD'
      end
      object SZRLabel23: TSZRLabel
        Left = 30
        Top = 9
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
        Top = 11
        Width = 2
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'OE'
      end
      object zrlODEsf: TSZRLabel
        Left = 30
        Top = 10
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlOEEsf: TSZRLabel
        Left = 30
        Top = 11
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel25: TSZRLabel
        Left = 36
        Top = 9
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Cil'
      end
      object zrlODCil: TSZRLabel
        Left = 36
        Top = 10
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlOECil: TSZRLabel
        Left = 36
        Top = 11
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel28: TSZRLabel
        Left = 42
        Top = 9
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Eixo'
      end
      object zrlODEixo: TSZRLabel
        Left = 42
        Top = 10
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlOEEixo: TSZRLabel
        Left = 42
        Top = 11
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel31: TSZRLabel
        Left = 48
        Top = 9
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Dnp'
      end
      object zrlODDnp: TSZRLabel
        Left = 48
        Top = 10
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlOEDnp: TSZRLabel
        Left = 48
        Top = 11
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel34: TSZRLabel
        Left = 54
        Top = 9
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Alt'
      end
      object zrlODAlt: TSZRLabel
        Left = 54
        Top = 10
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlOEAlt: TSZRLabel
        Left = 54
        Top = 11
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel37: TSZRLabel
        Left = 60
        Top = 9
        Width = 6
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Adicao'
      end
      object zrlODAdicao: TSZRLabel
        Left = 60
        Top = 10
        Width = 6
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlOEAdicao: TSZRLabel
        Left = 60
        Top = 11
        Width = 6
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
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
        Top = 2
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Tipo Pag:'
      end
      object zrlTipoPag: TSZRLabel
        Left = 10
        Top = 2
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel52: TSZRLabel
        Left = 54
        Top = 2
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Forma P.:'
      end
      object zrlFormaPag: TSZRLabel
        Left = 64
        Top = 2
        Width = 34
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel50: TSZRLabel
        Left = 99
        Top = 2
        Width = 7
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Agente:'
      end
      object zrlAgenteFinanceiro: TSZRLabel
        Left = 107
        Top = 2
        Width = 29
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlAgenteFinanceiro'
      end
      object SZRLabel8: TSZRLabel
        Left = 1
        Top = 8
        Width = 8
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Receita:'
      end
      object SZRLabel10: TSZRLabel
        Left = 91
        Top = 0
        Width = 6
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Caixa:'
      end
      object SZRDBText3: TSZRDBText
        Left = 98
        Top = 0
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'PDV_CAIXA'
      end
      object SZRLabel13: TSZRLabel
        Left = 108
        Top = 0
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Documento:'
      end
      object SZRDBText4: TSZRDBText
        Left = 119
        Top = 0
        Width = 12
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Pedido_de_Venda1
        DataField = 'PDV_DOCUMENTO'
      end
      object SZRLabel27: TSZRLabel
        Left = 29
        Top = 9
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel29: TSZRLabel
        Left = 29
        Top = 11
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel30: TSZRLabel
        Left = 29
        Top = 10
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel32: TSZRLabel
        Left = 35
        Top = 9
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel33: TSZRLabel
        Left = 35
        Top = 11
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel35: TSZRLabel
        Left = 35
        Top = 10
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel36: TSZRLabel
        Left = 41
        Top = 9
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel38: TSZRLabel
        Left = 41
        Top = 11
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel39: TSZRLabel
        Left = 41
        Top = 10
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel41: TSZRLabel
        Left = 47
        Top = 9
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel42: TSZRLabel
        Left = 47
        Top = 11
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel43: TSZRLabel
        Left = 47
        Top = 10
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel44: TSZRLabel
        Left = 53
        Top = 9
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel45: TSZRLabel
        Left = 53
        Top = 11
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel46: TSZRLabel
        Left = 53
        Top = 10
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel47: TSZRLabel
        Left = 59
        Top = 9
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel48: TSZRLabel
        Left = 59
        Top = 11
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel51: TSZRLabel
        Left = 59
        Top = 10
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel53: TSZRLabel
        Left = 66
        Top = 9
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel54: TSZRLabel
        Left = 66
        Top = 11
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel55: TSZRLabel
        Left = 66
        Top = 10
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel57: TSZRLabel
        Left = 97
        Top = 3
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Situacao:'
      end
      object zrlSituacao: TSZRLabel
        Left = 107
        Top = 3
        Width = 29
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'zrlSituacao'
      end
      object zrlMedico: TSZRLabel
        Left = 10
        Top = 8
        Width = 57
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlProduto1: TSZRLabel
        Left = 1
        Top = 21
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlProduto2: TSZRLabel
        Left = 1
        Top = 22
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlProduto4: TSZRLabel
        Left = 1
        Top = 24
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlProduto3: TSZRLabel
        Left = 1
        Top = 23
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlProduto6: TSZRLabel
        Left = 1
        Top = 26
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlProduto5: TSZRLabel
        Left = 1
        Top = 25
        Width = 50
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd1: TSZRLabel
        Left = 51
        Top = 21
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd2: TSZRLabel
        Left = 51
        Top = 22
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd4: TSZRLabel
        Left = 51
        Top = 24
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd3: TSZRLabel
        Left = 51
        Top = 23
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd6: TSZRLabel
        Left = 51
        Top = 26
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdPrd5: TSZRLabel
        Left = 51
        Top = 25
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalPRD1: TSZRLabel
        Left = 61
        Top = 21
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        BeforePrint = zrlTotalSER1BeforePrint
        WordWrap = True
      end
      object zrlTotalPRD2: TSZRLabel
        Left = 61
        Top = 22
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        BeforePrint = zrlTotalSER1BeforePrint
        WordWrap = True
      end
      object zrlTotalPRD4: TSZRLabel
        Left = 61
        Top = 24
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        BeforePrint = zrlTotalSER1BeforePrint
        WordWrap = True
      end
      object zrlTotalPRD3: TSZRLabel
        Left = 61
        Top = 23
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        BeforePrint = zrlTotalSER1BeforePrint
        WordWrap = True
      end
      object zrlTotalPRD6: TSZRLabel
        Left = 61
        Top = 26
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        BeforePrint = zrlTotalSER1BeforePrint
        WordWrap = True
      end
      object zrlTotalPRD5: TSZRLabel
        Left = 61
        Top = 25
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        BeforePrint = zrlTotalSER1BeforePrint
        WordWrap = True
      end
      object zrlServico1: TSZRLabel
        Left = 73
        Top = 21
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico2: TSZRLabel
        Left = 73
        Top = 22
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico4: TSZRLabel
        Left = 73
        Top = 24
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico3: TSZRLabel
        Left = 73
        Top = 23
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico6: TSZRLabel
        Left = 73
        Top = 26
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlServico5: TSZRLabel
        Left = 73
        Top = 25
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer1: TSZRLabel
        Left = 117
        Top = 21
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer2: TSZRLabel
        Left = 117
        Top = 22
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer4: TSZRLabel
        Left = 117
        Top = 24
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer3: TSZRLabel
        Left = 117
        Top = 23
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer6: TSZRLabel
        Left = 117
        Top = 26
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlQtdSer5: TSZRLabel
        Left = 117
        Top = 25
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlTotalSER1: TSZRLabel
        Left = 127
        Top = 21
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        BeforePrint = zrlTotalSER1BeforePrint
        WordWrap = True
      end
      object zrlTotalSER2: TSZRLabel
        Left = 127
        Top = 22
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        BeforePrint = zrlTotalSER1BeforePrint
        WordWrap = True
      end
      object zrlTotalSER4: TSZRLabel
        Left = 127
        Top = 24
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        BeforePrint = zrlTotalSER1BeforePrint
        WordWrap = True
      end
      object zrlTotalSER3: TSZRLabel
        Left = 127
        Top = 23
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        BeforePrint = zrlTotalSER1BeforePrint
        WordWrap = True
      end
      object zrlTotalSER6: TSZRLabel
        Left = 127
        Top = 26
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        BeforePrint = zrlTotalSER1BeforePrint
        WordWrap = True
      end
      object zrlTotalSER5: TSZRLabel
        Left = 127
        Top = 25
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        BeforePrint = zrlTotalSER1BeforePrint
        WordWrap = True
      end
      object SZRLabel61: TSZRLabel
        Left = 71
        Top = 21
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel62: TSZRLabel
        Left = 71
        Top = 22
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel63: TSZRLabel
        Left = 71
        Top = 23
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel64: TSZRLabel
        Left = 71
        Top = 24
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel65: TSZRLabel
        Left = 71
        Top = 25
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel66: TSZRLabel
        Left = 71
        Top = 26
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object zrlObservacao: TSZRLabel
        Left = 10
        Top = 3
        Width = 86
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel67: TSZRLabel
        Left = 0
        Top = 4
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Pasciente:'
      end
      object zrlPasciente: TSZRLabel
        Left = 11
        Top = 4
        Width = 86
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel21: TSZRLabel
        Left = 1
        Top = 13
        Width = 13
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Tipo Lente  :'
      end
      object zrlTipoLente2: TSZRLabel
        Left = 15
        Top = 13
        Width = 39
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel69: TSZRLabel
        Left = 55
        Top = 13
        Width = 4
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Obs:'
      end
      object zrlObsLente2: TSZRLabel
        Left = 60
        Top = 13
        Width = 76
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel71: TSZRLabel
        Left = 1
        Top = 14
        Width = 13
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Tipo Armacao:'
      end
      object zrlTipoArmacao2: TSZRLabel
        Left = 15
        Top = 14
        Width = 39
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel73: TSZRLabel
        Left = 55
        Top = 14
        Width = 4
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Obs:'
      end
      object zrlObsArmacao2: TSZRLabel
        Left = 60
        Top = 14
        Width = 76
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel75: TSZRLabel
        Left = 27
        Top = 17
        Width = 2
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'OD'
      end
      object SZRLabel76: TSZRLabel
        Left = 30
        Top = 16
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Esf'
      end
      object SZRLabel77: TSZRLabel
        Left = 27
        Top = 18
        Width = 2
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'OE'
      end
      object zrlODEsf2: TSZRLabel
        Left = 30
        Top = 17
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlOEEsf2: TSZRLabel
        Left = 30
        Top = 18
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel80: TSZRLabel
        Left = 36
        Top = 16
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Cil'
      end
      object zrlODCil2: TSZRLabel
        Left = 36
        Top = 17
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlOECil2: TSZRLabel
        Left = 36
        Top = 18
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel83: TSZRLabel
        Left = 42
        Top = 16
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Eixo'
      end
      object zrlODEixo2: TSZRLabel
        Left = 42
        Top = 17
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlOEEixo2: TSZRLabel
        Left = 42
        Top = 18
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel86: TSZRLabel
        Left = 48
        Top = 16
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Dnp'
      end
      object zrlODDnp2: TSZRLabel
        Left = 48
        Top = 17
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlOEDnp2: TSZRLabel
        Left = 48
        Top = 18
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel89: TSZRLabel
        Left = 54
        Top = 16
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Alt'
      end
      object zrlODAlt2: TSZRLabel
        Left = 54
        Top = 17
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlOEAlt2: TSZRLabel
        Left = 54
        Top = 18
        Width = 5
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel92: TSZRLabel
        Left = 60
        Top = 16
        Width = 6
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Adicao'
      end
      object zrlODAdicao2: TSZRLabel
        Left = 60
        Top = 17
        Width = 6
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlOEAdicao2: TSZRLabel
        Left = 60
        Top = 18
        Width = 6
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel95: TSZRLabel
        Left = 1
        Top = 15
        Width = 8
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Receita:'
      end
      object SZRLabel105: TSZRLabel
        Left = 29
        Top = 16
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel106: TSZRLabel
        Left = 29
        Top = 18
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel107: TSZRLabel
        Left = 29
        Top = 17
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel108: TSZRLabel
        Left = 35
        Top = 16
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel109: TSZRLabel
        Left = 35
        Top = 18
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel110: TSZRLabel
        Left = 35
        Top = 17
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel111: TSZRLabel
        Left = 41
        Top = 16
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel112: TSZRLabel
        Left = 41
        Top = 18
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel113: TSZRLabel
        Left = 41
        Top = 17
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel114: TSZRLabel
        Left = 47
        Top = 16
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel115: TSZRLabel
        Left = 47
        Top = 18
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel116: TSZRLabel
        Left = 47
        Top = 17
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel117: TSZRLabel
        Left = 53
        Top = 16
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel118: TSZRLabel
        Left = 53
        Top = 18
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel119: TSZRLabel
        Left = 53
        Top = 17
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel120: TSZRLabel
        Left = 59
        Top = 16
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel121: TSZRLabel
        Left = 59
        Top = 18
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel122: TSZRLabel
        Left = 59
        Top = 17
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel123: TSZRLabel
        Left = 66
        Top = 16
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel124: TSZRLabel
        Left = 66
        Top = 18
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel125: TSZRLabel
        Left = 66
        Top = 17
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object zrlMedico2: TSZRLabel
        Left = 10
        Top = 15
        Width = 57
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlVencimento1: TSZRLabel
        Left = 17
        Top = 29
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlNumeroTitulo1: TSZRLabel
        Left = 1
        Top = 29
        Width = 14
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlValor1: TSZRLabel
        Left = 29
        Top = 29
        Width = 15
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlVencimento2: TSZRLabel
        Left = 17
        Top = 30
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlNumeroTitulo2: TSZRLabel
        Left = 1
        Top = 30
        Width = 14
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlValor2: TSZRLabel
        Left = 29
        Top = 30
        Width = 15
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlVencimento3: TSZRLabel
        Left = 17
        Top = 31
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlNumeroTitulo3: TSZRLabel
        Left = 1
        Top = 31
        Width = 14
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlValor3: TSZRLabel
        Left = 29
        Top = 31
        Width = 15
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlVencimento4: TSZRLabel
        Left = 63
        Top = 29
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlNumeroTitulo4: TSZRLabel
        Left = 47
        Top = 29
        Width = 14
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlValor4: TSZRLabel
        Left = 75
        Top = 29
        Width = 15
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlVencimento5: TSZRLabel
        Left = 63
        Top = 30
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlNumeroTitulo5: TSZRLabel
        Left = 47
        Top = 30
        Width = 14
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlVencimento6: TSZRLabel
        Left = 63
        Top = 31
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlNumeroTitulo6: TSZRLabel
        Left = 47
        Top = 31
        Width = 14
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlVencimento7: TSZRLabel
        Left = 108
        Top = 29
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlNumeroTitulo7: TSZRLabel
        Left = 92
        Top = 29
        Width = 14
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlVencimento8: TSZRLabel
        Left = 108
        Top = 30
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlNumeroTitulo8: TSZRLabel
        Left = 92
        Top = 30
        Width = 14
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlValor8: TSZRLabel
        Left = 120
        Top = 30
        Width = 15
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlValor7: TSZRLabel
        Left = 120
        Top = 29
        Width = 15
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlValor6: TSZRLabel
        Left = 75
        Top = 31
        Width = 15
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlValor5: TSZRLabel
        Left = 75
        Top = 30
        Width = 15
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlVencimento9: TSZRLabel
        Left = 108
        Top = 31
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlNumeroTitulo9: TSZRLabel
        Left = 92
        Top = 31
        Width = 14
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlValor9: TSZRLabel
        Left = 120
        Top = 31
        Width = 15
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel130: TSZRLabel
        Left = 0
        Top = 28
        Width = 136
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          'Detalhe do Financeiro ------------------------------------------' +
          '----------------------------------------------------------------' +
          '--------'
      end
    end
    object zrbRodapeGrupoPDV: TSZRBand
      Left = 1
      Top = 38
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
        BeforePrint = zrlTotalSER1BeforePrint
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
        BeforePrint = zrlTotalSER1BeforePrint
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
    Left = 588
    Top = 173
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
    Left = 588
    Top = 203
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
    Left = 558
    Top = 203
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
    Left = 618
    Top = 173
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
    Left = 529
    Top = 173
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
      'AND P1.GRP_CODIGO=S1.GRP_CODIGO')
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
    Left = 647
    Top = 203
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
      'ORDER BY IPV_CODIGO DESC')
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
    Left = 618
    Top = 203
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
    Left = 529
    Top = 203
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
  object Item_Pedido_Venda3: TItem_Pedido_Venda
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT IPV_OBSERVACAO FROM ITEM_DE_PEDIDO_DE_VENDA '
      'WHERE PDV_CODIGO=:PDV_CODIGO '
      'AND CNC_CODIGO=:CNC_CODIGO '
      'AND IPV_OBSERVACAO <> '#39#39)
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
    Left = 648
    Top = 173
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
  end
  object Titulo_receber1: TTitulo_receber
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM TITULO_A_RECEBER'
      'WHERE CNC_CODIGO=:CNC_CODIGO'
      'AND PDV_CODIGO=:PDV_CODIGO'
      'AND TRC_SITUACAO<>5'
      'AND (TRC_TRCORIGINAL=0 OR TRC_TRCORIGINAL IS NULL)'
      'ORDER BY TRC_CODIGO ASC')
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
    Left = 559
    Top = 173
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

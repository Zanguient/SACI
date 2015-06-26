object rpt_PosEstoqueLote: Trpt_PosEstoqueLote
  Left = 177
  Top = 104
  Width = 992
  Height = 746
  Caption = 'rpt_PosEstoqueLote'
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
    Width = 138
    Height = 65
    Columns = 1
    ColumnSpace = 0
    DataSet = Item_de_Estoque_Detalhe1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 2
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
    object ZRBand1: TSZRBand
      Left = 1
      Top = 1
      Width = 136
      Height = 7
      BeforePrint = ZRBand1BeforePrint
      BandType = rbPageHeader
      ForceNewColumn = False
      ForceNewPage = False
      object zrlTituloRelatorio: TSZRLabel
        Left = 0
        Top = 1
        Width = 38
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'SIAC - Relatorio de Posicao de Estoque'
      end
      object ZRSysData2: TSZRSysData
        Left = 104
        Top = 0
        Width = 32
        Height = 1
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Data = zrsDateTime
        Text = 'Data/Hora.:'
      end
      object ZRLabel3: TSZRLabel
        Left = 0
        Top = 0
        Width = 13
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'EletroGuerra '
      end
      object ZRLabel5: TSZRLabel
        Left = 0
        Top = 4
        Width = 136
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          '================================================================' +
          '================================================================' +
          '==========================='
      end
      object ZRLabel6: TSZRLabel
        Left = 0
        Top = 6
        Width = 136
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          '================================================================' +
          '================================================================' +
          '==========================='
      end
      object ZRLabel7: TSZRLabel
        Left = 0
        Top = 5
        Width = 6
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Codigo'
      end
      object ZRLabel9: TSZRLabel
        Left = 9
        Top = 5
        Width = 9
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Descricao'
      end
      object ZRLabel11: TSZRLabel
        Left = 128
        Top = 5
        Width = 7
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Unidade'
      end
      object zrlFiltros: TSZRLabel
        Left = 0
        Top = 3
        Width = 136
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel12: TSZRLabel
        Left = 0
        Top = 2
        Width = 9
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Validade:'
      end
      object SZRLabel13: TSZRLabel
        Left = 10
        Top = 2
        Width = 10
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'SZRLabel13'
      end
      object SZRLabel14: TSZRLabel
        Left = 21
        Top = 2
        Width = 1
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'a'
      end
      object SZRLabel15: TSZRLabel
        Left = 23
        Top = 2
        Width = 10
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'SZRLabel15'
      end
    end
    object zrlDetalhe: TSZRBand
      Left = 1
      Top = 11
      Width = 136
      Height = 1
      BandType = rbDetail
      ForceNewColumn = False
      ForceNewPage = False
      object SZRDBText2: TSZRDBText
        Left = 1
        Top = 0
        Width = 7
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Item_de_Estoque_Detalhe1
        DataField = 'LOT_CODIGO'
      end
      object SZRDBText3: TSZRDBText
        Left = 9
        Top = 0
        Width = 37
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Item_de_Estoque_Detalhe1
        DataField = 'LOT_DESCRICAO'
      end
      object SZRDBText4: TSZRDBText
        Left = 47
        Top = 0
        Width = 17
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Item_de_Estoque_Detalhe1
        DataField = 'LOT_REFERENCIA'
      end
      object SZRDBText5: TSZRDBText
        Left = 65
        Top = 0
        Width = 14
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Item_de_Estoque_Detalhe1
        DataField = 'LOT_DT_VALIDADE'
      end
      object SZRDBText6: TSZRDBText
        Left = 80
        Top = 0
        Width = 11
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Item_de_Estoque_Detalhe1
        DataField = 'IED_QTD_FISICO'
      end
      object SZRDBText7: TSZRDBText
        Left = 92
        Top = 0
        Width = 44
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Item_de_Estoque_Detalhe1
        DataField = 'LOT_OBSERVACAO'
      end
    end
    object ZRBand3: TSZRBand
      Left = 1
      Top = 17
      Width = 136
      Height = 3
      BeforePrint = ZRBand3BeforePrint
      BandType = rbPageFooter
      ForceNewColumn = False
      ForceNewPage = False
      object ZRSysData1: TSZRSysData
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
      object ZRLabel8: TSZRLabel
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
          '-----------------------------'
      end
      object ZRLabel4: TSZRLabel
        Left = 0
        Top = 1
        Width = 43
        Height = 1
        AlignToBand = False
        FontStyle = [esItalic]
        WordWrap = True
        Caption = 'EmpresaDesenvolvedora'
      end
      object zrlUsuario: TSZRLabel
        Left = 44
        Top = 1
        Width = 44
        Height = 1
        AlignToBand = False
        FontStyle = [esItalic]
        WordWrap = True
      end
    end
    object zrbGrupo: TSZRGroup
      Left = 1
      Top = 8
      Width = 136
      Height = 3
      Expression = 'PRD_CODIGO'
      FooterBand = zrbRodapeGrupo
      Master = report
      ForceNewColumn = False
      ForceNewPage = False
      object ZRDBText1: TSZRDBText
        Left = 0
        Top = 0
        Width = 8
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Item_de_Estoque_Detalhe1
        DataField = 'PRD_CODIGO'
      end
      object ZRDBText5: TSZRDBText
        Left = 128
        Top = 0
        Width = 7
        Height = 1
        Alignment = taCenter
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Item_de_Estoque_Detalhe1
        DataField = 'PRD_UNIDADE'
      end
      object SZRLabel2: TSZRLabel
        Left = 1
        Top = 2
        Width = 4
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Lote'
      end
      object SZRLabel8: TSZRLabel
        Left = 47
        Top = 2
        Width = 10
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Referencia'
      end
      object SZRLabel7: TSZRLabel
        Left = 9
        Top = 2
        Width = 9
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Descricao'
      end
      object SZRLabel9: TSZRLabel
        Left = 65
        Top = 2
        Width = 8
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Validade'
      end
      object SZRLabel10: TSZRLabel
        Left = 80
        Top = 2
        Width = 11
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Est. Fisico'
      end
      object SZRLabel11: TSZRLabel
        Left = 92
        Top = 2
        Width = 10
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Observacao'
      end
      object SZRDBText1: TSZRDBText
        Left = 9
        Top = 0
        Width = 118
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Item_de_Estoque_Detalhe1
        DataField = 'PRD_DESCRICAO'
      end
    end
    object zrbRodapeGrupo: TSZRBand
      Left = 1
      Top = 12
      Width = 136
      Height = 1
      BandType = rbGroupFooter
      ForceNewColumn = False
      ForceNewPage = False
      object zrlLinha: TSZRLabel
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
          '-----------------------------'
      end
    end
    object SZRBand1: TSZRBand
      Left = 1
      Top = 13
      Width = 136
      Height = 4
      BandType = rbSummary
      ForceNewColumn = False
      ForceNewPage = False
      object SZRLabel3: TSZRLabel
        Left = 31
        Top = 2
        Width = 29
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '______________________________'
      end
      object SZRLabel4: TSZRLabel
        Left = 31
        Top = 3
        Width = 29
        Height = 1
        Alignment = taCenter
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Gerente'
      end
      object SZRLabel5: TSZRLabel
        Left = 75
        Top = 2
        Width = 29
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '______________________________'
      end
      object SZRLabel6: TSZRLabel
        Left = 75
        Top = 3
        Width = 29
        Height = 1
        Alignment = taCenter
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Estoquista'
      end
      object zrlDescTotalPatrimonio: TSZRLabel
        Left = 103
        Top = 0
        Width = 17
        Height = 1
        AlignToBand = False
        Enabled = False
        FontStyle = []
        WordWrap = True
        Caption = 'Total Patrimonio:'
      end
      object zrlTotalPatrimonio: TSZRLabel
        Left = 121
        Top = 0
        Width = 15
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        Enabled = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel1: TSZRLabel
        Left = 83
        Top = 0
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Total Qtd:'
      end
      object zrlTotalQuantidade: TSZRLabel
        Left = 94
        Top = 0
        Width = 8
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
    end
  end
  object Item_de_Estoque_Detalhe1: TQuery
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      
        'SELECT PRD.GRP_CODIGO,GRP_DESCRICAO,PRD.SGP_CODIGO,SGP_DESCRICAO' +
        ',IED.CNC_CODIGO,IED.PRD_CODIGO,'
      
        'PRD_DESCRICAO+'#39' '#39'+PRD_CARACTERISTICA+'#39' '#39'+PRD_REFERENCIA+'#39' '#39'+PRD_' +
        'MARCA+'#39' '#39'+PRD_DETALHE+'#39' '#39'+PRD_LOCAL AS PRD_DESCRICAO,'
      
        'PRD_UNIDADE,IED.LOT_CODIGO,LOT_DESCRICAO,LOT_REFERENCIA,LOT_DT_V' +
        'ALIDADE,IED_QTD_FISICO,LOT_OBSERVACAO '
      'FROM ITEM_DE_ESTOQUE_DETALHE IED'
      'INNER JOIN LOTE LOT'
      'ON LOT.LOT_CODIGO=IED.LOT_CODIGO'
      'INNER JOIN PRODUTO PRD'
      'ON PRD.PRD_CODIGO=IED.PRD_CODIGO'
      'INNER JOIN GRUPO GRP'
      'ON GRP.GRP_CODIGO=PRD.GRP_CODIGO'
      'INNER JOIN SUBGRUPO SGP'
      'ON SGP.SGP_CODIGO=PRD.SGP_CODIGO')
    Left = 13
    Top = 290
  end
end

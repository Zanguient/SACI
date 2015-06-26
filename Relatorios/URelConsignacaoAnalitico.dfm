object rpt_URelConsignacaoAnalitico: Trpt_URelConsignacaoAnalitico
  Left = 246
  Top = 131
  Width = 1032
  Height = 480
  Caption = 'rpt_URelConsignacaoAnalitico'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object report: TSZReport
    Left = 8
    Top = 2
    Width = 138
    Height = 65
    Columns = 1
    ColumnSpace = 0
    DataSet = qConsignacao
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
      Enabled = False
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
        DataSet = qConsignacao
        DataField = 'ICS_QUANTIDADE'
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
      object SZRDBText1: TSZRDBText
        Left = 0
        Top = 0
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = qConsignacao
        DataField = 'PRD_CODIGO'
      end
      object SZRDBText2: TSZRDBText
        Left = 11
        Top = 0
        Width = 92
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = qConsignacao
        DataField = 'PRD_DESCRICAO'
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
      Top = 19
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
    object zrbConsignacao: TSZRBand
      Left = 1
      Top = 13
      Width = 136
      Height = 2
      AfterPrint = zrbConsignacaoAfterPrint
      BeforePrint = zrbConsignacaoBeforePrint
      BandType = rbGroupFooter
      ForceNewColumn = False
      ForceNewPage = False
      object ZRLabel4: TSZRLabel
        Left = 104
        Top = 1
        Width = 20
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Total Consignacao  :'
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
      object SZRLabel15: TSZRLabel
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
      Height = 2
      Expression = 'CNC_CODIGO'
      FooterBand = zrbCNC
      Master = report
      ForceNewColumn = False
      ForceNewPage = False
      object SZRDBText3: TSZRDBText
        Left = 11
        Top = 0
        Width = 42
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = qConsignacao
        DataField = 'CNC_RZ_SOCIAL'
      end
      object SZRLabel2: TSZRLabel
        Left = 0
        Top = 0
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'CNC      :'
      end
      object SZRLabel1: TSZRLabel
        Left = 0
        Top = 1
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
    object SZRGroup1: TSZRGroup
      Left = 1
      Top = 6
      Width = 136
      Height = 2
      BeforePrint = SZRGroup1BeforePrint
      Expression = 'FUN_CODIGO'
      FooterBand = zrbVendedor
      Master = report
      ForceNewColumn = False
      ForceNewPage = True
      object SZRLabel14: TSZRLabel
        Left = 0
        Top = 0
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Vendedor :'
      end
      object SZRDBText7: TSZRDBText
        Left = 11
        Top = 0
        Width = 42
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = qConsignacao
        DataField = 'FUN_NOME'
      end
      object SZRLabel5: TSZRLabel
        Left = 0
        Top = 1
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
      object SZRLabel21: TSZRLabel
        Left = 54
        Top = 0
        Width = 11
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
    end
    object SZRGroup2: TSZRGroup
      Left = 1
      Top = 8
      Width = 136
      Height = 4
      BeforePrint = SZRGroup2BeforePrint
      Enabled = False
      Expression = 'CSG_CODIGO'
      FooterBand = zrbConsignacao
      Master = report
      ForceNewColumn = False
      ForceNewPage = False
      object SZRLabel3: TSZRLabel
        Left = 0
        Top = 3
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
      object SZRLabel4: TSZRLabel
        Left = 0
        Top = 2
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Produto'
      end
      object SZRLabel9: TSZRLabel
        Left = 104
        Top = 2
        Width = 10
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Quantidade'
      end
      object SZRLabel13: TSZRLabel
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
      object SZRLabel16: TSZRLabel
        Left = 115
        Top = 2
        Width = 9
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Pr.Unit'
      end
      object SZRLabel17: TSZRLabel
        Left = 125
        Top = 2
        Width = 11
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'SubTotal'
      end
      object SZRLabel18: TSZRLabel
        Left = 11
        Top = 2
        Width = 92
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Descricao'
      end
      object SZRLabel20: TSZRLabel
        Left = 0
        Top = 0
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Consig.  :'
      end
      object SZRDBText5: TSZRDBText
        Left = 11
        Top = 0
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = qConsignacao
        DataField = 'CSG_CODIGO'
      end
      object SZRLabel19: TSZRLabel
        Left = 22
        Top = 0
        Width = 4
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'CLI:'
      end
      object zrlCliente: TSZRLabel
        Left = 27
        Top = 0
        Width = 76
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Cliente'
      end
    end
    object zrbVendedor: TSZRBand
      Left = 1
      Top = 15
      Width = 136
      Height = 2
      AfterPrint = zrbVendedorAfterPrint
      BeforePrint = zrbVendedorBeforePrint
      BandType = rbGroupFooter
      ForceNewColumn = False
      ForceNewPage = False
      object SZRLabel6: TSZRLabel
        Left = 104
        Top = 1
        Width = 20
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Total Vendedor     :'
      end
      object SZRLabel7: TSZRLabel
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
      object SZRLabel8: TSZRLabel
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
    object zrbCNC: TSZRBand
      Left = 1
      Top = 17
      Width = 136
      Height = 2
      AfterPrint = zrbCNCAfterPrint
      BeforePrint = zrbCNCBeforePrint
      BandType = rbGroupFooter
      ForceNewColumn = False
      ForceNewPage = False
      object SZRLabel10: TSZRLabel
        Left = 104
        Top = 1
        Width = 20
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Total CNC          :'
      end
      object SZRLabel11: TSZRLabel
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
      object SZRLabel12: TSZRLabel
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
  end
  object qConsignacao: TQuery
    DatabaseName = 'DBguerra'
    Left = 35
    Top = 298
  end
  object qVendedor: TQuery
    DatabaseName = 'DBguerra'
    Left = 35
    Top = 338
  end
end

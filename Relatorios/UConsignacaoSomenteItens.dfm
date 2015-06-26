object rpt_UConsignacaoSomenteItens: Trpt_UConsignacaoSomenteItens
  Left = 232
  Top = 103
  Width = 1030
  Height = 480
  Caption = 'rpt_UConsignacaoSomenteItens'
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
    Left = 3
    Top = 2
    Width = 138
    Height = 65
    Columns = 1
    ColumnSpace = 0
    DataSet = qProdutos
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
      Height = 5
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
      object SZRLabel4: TSZRLabel
        Left = 0
        Top = 3
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Produto'
      end
      object SZRLabel9: TSZRLabel
        Left = 114
        Top = 3
        Width = 10
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Quantidade'
      end
      object SZRLabel17: TSZRLabel
        Left = 125
        Top = 3
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
        Top = 3
        Width = 74
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Descricao'
      end
      object SZRLabel1: TSZRLabel
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
          '========'
      end
      object SZRLabel3: TSZRLabel
        Left = 86
        Top = 3
        Width = 27
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Referencia'
      end
    end
    object zrbDetalhe: TSZRBand
      Left = 1
      Top = 6
      Width = 136
      Height = 1
      BeforePrint = zrbDetalheBeforePrint
      BandType = rbDetail
      ForceNewColumn = False
      ForceNewPage = False
      object ZRDBText10: TSZRDBText
        Left = 114
        Top = 0
        Width = 10
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = qProdutos
        DataField = 'QUANTIDADE'
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
        DataSet = qProdutos
        DataField = 'PRD_CODIGO'
      end
      object SZRDBText2: TSZRDBText
        Left = 11
        Top = 0
        Width = 74
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = qProdutos
        DataField = 'PRD_DESCRICAO'
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
      object SZRDBText3: TSZRDBText
        Left = 86
        Top = 0
        Width = 27
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataField = 'PRD_REFERENCIA'
      end
    end
    object zrlbRodapePagina: TSZRBand
      Left = 1
      Top = 9
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
    object SZRBand1: TSZRBand
      Left = 1
      Top = 7
      Width = 136
      Height = 2
      AfterPrint = SZRBand1AfterPrint
      BeforePrint = SZRBand1BeforePrint
      BandType = rbSummary
      ForceNewColumn = False
      ForceNewPage = False
      object ZRLabel4: TSZRLabel
        Left = 99
        Top = 1
        Width = 14
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Total:'
      end
      object ZRLabel11: TSZRLabel
        Left = 114
        Top = 0
        Width = 22
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          '----------------------------------------------------------------' +
          '--------'
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
      object SZRLabel2: TSZRLabel
        Left = 114
        Top = 1
        Width = 10
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
    end
  end
  object qProdutos: TQuery
    DatabaseName = 'DBguerra'
    Left = 90
    Top = 198
  end
end

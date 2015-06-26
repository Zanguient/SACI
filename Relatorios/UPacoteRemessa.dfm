object rpt_PacoteRemessa: Trpt_PacoteRemessa
  Left = 256
  Top = 133
  Width = 844
  Height = 616
  Caption = 'Comiss'#227'o LBM'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object report: TQuickRep
    Left = 0
    Top = 2
    Width = 816
    Height = 1056
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = Item_Pacote_Venda1
    Description.Strings = (
      'Relat'#243'rio de Pacotes com Remessas')
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Courier'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter, Compression]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Letter
    Page.Values = (
      50.000000000000000000
      2794.000000000000000000
      50.000000000000000000
      2159.000000000000000000
      60.000000000000000000
      60.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    ReportTitle = 'Relat'#243'rio de Pacotes/Remessas'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object zrbCabecalho: TQRBand
      Left = 23
      Top = 19
      Width = 771
      Height = 58
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = zrbCabecalhoBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        153.458333333333300000
        2039.937500000000000000)
      BandType = rbPageHeader
      object qrlDescricaoRelatorio: TQRLabel
        Left = 0
        Top = 15
        Width = 204
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          39.687500000000000000
          539.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Relat'#243'rio de Pacotes/Remessas'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlNomeLoja: TQRLabel
        Left = 0
        Top = 0
        Width = 85
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          0.000000000000000000
          0.000000000000000000
          224.895833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nome da Loja'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlNomeCentroDeCusto: TQRLabel
        Left = 609
        Top = 0
        Width = 162
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1611.312500000000000000
          0.000000000000000000
          428.625000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nome da Centro de Custo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrsDataHoraImpressao: TQRSysData
        Left = 616
        Top = 15
        Width = 155
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1629.833333333333000000
          39.687500000000000000
          410.104166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Text = 'Data Hora: '
        Transparent = False
        FontSize = 8
      end
      object qrlPeriodoDesc: TQRLabel
        Left = 0
        Top = 29
        Width = 57
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          76.729166666666670000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Per'#237'odo:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlDescricaoPeriodo: TQRLabel
        Left = 61
        Top = 29
        Width = 201
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          161.395833333333300000
          76.729166666666680000
          531.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlDescricaoPeriodo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object zrlFiltros: TQRLabel
        Left = 265
        Top = 29
        Width = 489
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          701.145833333333400000
          76.729166666666680000
          1293.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlFiltros'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object zrlLinhaCabecalho: TQRLabel
        Left = 0
        Top = 44
        Width = 772
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          116.416666666666700000
          2042.583333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          '================================================================' +
          '==========================================================='
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object zrbRodapePagina: TQRBand
      Left = 23
      Top = 262
      Width = 771
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = zrbRodapePaginaBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        71.437500000000000000
        2039.937500000000000000)
      BandType = rbPageFooter
      object QRLabel1: TQRLabel
        Left = 0
        Top = 11
        Width = 148
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          29.104166666666670000
          391.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'EmpresaDesenvolvedora'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrsNumeroPagina: TQRSysData
        Left = 679
        Top = 11
        Width = 92
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1796.520833333333000000
          29.104166666666670000
          243.416666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Text = 'P'#225'g.: '
        Transparent = False
        FontSize = 8
      end
      object QRLabel16: TQRLabel
        Left = 1
        Top = 0
        Width = 772
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2.645833333333333000
          0.000000000000000000
          2042.583333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          '================================================================' +
          '=========================================================='
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object zrbDetalhe: TQRBand
      Left = 23
      Top = 215
      Width = 771
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = zrbDetalheBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        42.333333333333330000
        2039.937500000000000000)
      BandType = rbDetail
      object QRDBText5: TQRDBText
        Left = 515
        Top = 0
        Width = 67
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1362.604166666667000000
          0.000000000000000000
          177.270833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = Item_Pacote_Venda1
        DataField = 'IPC_QUANTIDADE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 710
        Top = 0
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1878.541666666667000000
          0.000000000000000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = Item_Pacote_Venda1
        DataField = 'IPC_PRECO_DESCONTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 584
        Top = 0
        Width = 65
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1545.166666666667000000
          0.000000000000000000
          171.979166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = Item_Pacote_Venda1
        DataField = 'IPC_QUANTIDADE_ENTREGUE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object zrlSubGrupo: TQRLabel
        Left = 0
        Top = 0
        Width = 513
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          0.000000000000000000
          1357.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'SubGrupos'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRExpr1: TQRExpr
        Left = 651
        Top = 0
        Width = 50
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1722.437500000000000000
          0.000000000000000000
          132.291666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'IPC_QUANTIDADE-IPC_QUANTIDADE_ENTREGUE'
        FontSize = 8
      end
    end
    object zrbGrupoPDV: TQRGroup
      Left = 23
      Top = 77
      Width = 771
      Height = 138
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = zrbGrupoPDVBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        365.125000000000000000
        2039.937500000000000000)
      Expression = 'CNC_CODIGO+PDV_CODIGO'
      FooterBand = zrbRodapeGrupoPDV
      Master = report
      ReprintOnNewPage = False
      object QRLabel5: TQRLabel
        Left = 0
        Top = 0
        Width = 68
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          0.000000000000000000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Pacote  :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 70
        Top = 0
        Width = 73
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          185.208333333333300000
          0.000000000000000000
          193.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = Item_Pacote_Venda1
        DataField = 'PDV_CODIGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 148
        Top = 0
        Width = 41
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          391.583333333333400000
          0.000000000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Data:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 194
        Top = 0
        Width = 154
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          513.291666666666800000
          0.000000000000000000
          407.458333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = Item_Pacote_Venda1
        DataField = 'PCT_DT_CADASTRO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 0
        Top = 30
        Width = 68
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          79.375000000000000000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Cliente :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 0
        Top = 90
        Width = 500
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          238.125000000000000000
          1322.916666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'SubGrupos'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 500
        Top = 90
        Width = 81
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1322.916666666667000000
          238.125000000000000000
          214.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Quantidade'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 710
        Top = 90
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1878.541666666667000000
          238.125000000000000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Pre'#231'o'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object zrlCliente: TQRLabel
        Left = 70
        Top = 30
        Width = 501
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          185.208333333333300000
          79.375000000000000000
          1325.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlCliente'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 584
        Top = 90
        Width = 67
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1545.166666666667000000
          238.125000000000000000
          177.270833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Entregue'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 653
        Top = 90
        Width = 50
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1727.729166666667000000
          238.125000000000000000
          132.291666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Saldo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 14
        Top = 106
        Width = 57
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          37.041666666666670000
          280.458333333333400000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Pedido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 71
        Top = 106
        Width = 78
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          187.854166666666700000
          280.458333333333400000
          206.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Data'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 150
        Top = 106
        Width = 430
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          396.875000000000000000
          280.458333333333400000
          1137.708333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Produto'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 594
        Top = 106
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1571.625000000000000000
          280.458333333333400000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtd'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 0
        Top = 122
        Width = 772
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          322.791666666666700000
          2042.583333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel19: TQRLabel
        Left = 0
        Top = 75
        Width = 772
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          198.437500000000000000
          2042.583333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          '----------------------------------------------------------------' +
          '-----------------------------------------------------------'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel20: TQRLabel
        Left = 0
        Top = 15
        Width = 68
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          39.687500000000000000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Tipo Pag:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object zrlTipoDePagamento: TQRLabel
        Left = 70
        Top = 15
        Width = 283
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          185.208333333333300000
          39.687500000000000000
          748.770833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlTipoDePagamento'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel21: TQRLabel
        Left = 355
        Top = 15
        Width = 73
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          939.270833333333400000
          39.687500000000000000
          193.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Forma P.:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object zrlFormaDePagamento: TQRLabel
        Left = 430
        Top = 15
        Width = 141
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1137.708333333333000000
          39.687500000000000000
          373.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlFormaDePagamento'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel22: TQRLabel
        Left = 574
        Top = 15
        Width = 57
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1518.708333333333000000
          39.687500000000000000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Agente:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object zrlAgenteFinanceiro: TQRLabel
        Left = 634
        Top = 15
        Width = 129
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1677.458333333333000000
          39.687500000000000000
          341.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlAgenteFinanceiro'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel23: TQRLabel
        Left = 574
        Top = 30
        Width = 57
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1518.708333333333000000
          79.375000000000000000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Fone  :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object zrlFone: TQRLabel
        Left = 634
        Top = 30
        Width = 129
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1677.458333333333000000
          79.375000000000000000
          341.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlFone'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel24: TQRLabel
        Left = 0
        Top = 45
        Width = 68
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          119.062500000000000000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'RG/CGF  :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object zrlRGCGF: TQRLabel
        Left = 70
        Top = 45
        Width = 144
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          185.208333333333300000
          119.062500000000000000
          381.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlRGCGF'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 215
        Top = 45
        Width = 75
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          568.854166666666800000
          119.062500000000000000
          198.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'CPF/CNPJ:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object zrlCPFCNPJ: TQRLabel
        Left = 292
        Top = 45
        Width = 134
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          772.583333333333400000
          119.062500000000000000
          354.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlCPFCNPJ'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel26: TQRLabel
        Left = 0
        Top = 60
        Width = 68
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          158.750000000000000000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Endereco:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object zrlEndereco: TQRLabel
        Left = 70
        Top = 60
        Width = 299
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          185.208333333333300000
          158.750000000000000000
          791.104166666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlEndereco'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel27: TQRLabel
        Left = 370
        Top = 60
        Width = 58
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          978.958333333333200000
          158.750000000000000000
          153.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Bairro:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object zrlBairro: TQRLabel
        Left = 430
        Top = 60
        Width = 141
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1137.708333333333000000
          158.750000000000000000
          373.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlBairro'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel29: TQRLabel
        Left = 573
        Top = 60
        Width = 58
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1516.062500000000000000
          158.750000000000000000
          153.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Cidade:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object zrlCidade: TQRLabel
        Left = 634
        Top = 60
        Width = 130
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1677.458333333333000000
          158.750000000000000000
          343.958333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlCidade'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 23
      Top = 231
      Width = 771
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        39.687500000000000000
        2039.937500000000000000)
      Master = report
      DataSet = Item_Pedido_Venda1
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText8: TQRDBText
        Left = 588
        Top = 0
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1555.750000000000000000
          0.000000000000000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = Item_Pedido_Venda1
        DataField = 'IPV_QUANTIDADE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 19
        Top = 0
        Width = 52
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          50.270833333333330000
          0.000000000000000000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = Item_Pedido_Venda1
        DataField = 'PDV_CODIGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 70
        Top = 0
        Width = 78
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          185.208333333333300000
          0.000000000000000000
          206.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = Item_Pedido_Venda1
        DataField = 'PDV_DATA_HORA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 9
        Top = 0
        Width = 8
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          23.812500000000000000
          0.000000000000000000
          21.166666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '*'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 652
        Top = 0
        Width = 8
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1725.083333333333000000
          0.000000000000000000
          21.166666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '*'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object zrlProduto: TQRLabel
        Left = 149
        Top = 0
        Width = 429
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          394.229166666666700000
          0.000000000000000000
          1135.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Produto'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object zrbRodapeGrupoPDV: TQRBand
      Left = 23
      Top = 246
      Width = 771
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        42.333333333333330000
        2039.937500000000000000)
      BandType = rbGroupFooter
      object QRLabel18: TQRLabel
        Left = 0
        Top = 1
        Width = 772
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          2.645833333333333000
          2042.583333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          '================================================================' +
          '==========================================================='
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
  object QRTextFilter1: TQRTextFilter
    Left = 310
    Top = 329
  end
  object QRCSVFilter1: TQRCSVFilter
    Separator = ','
    Left = 280
    Top = 329
  end
  object QRHTMLFilter1: TQRHTMLFilter
    Left = 340
    Top = 329
  end
  object Item_Pacote_Venda1: TItem_Pacote_Venda
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT P1.*, I1.*'
      'FROM PACOTE_DE_VENDA P1, ITEM_DE_PACOTE_DE_VENDA I1'
      'WHERE P1.CNC_CODIGO=I1.CNC_CODIGO'
      'AND P1.PDV_CODIGO=I1.PDV_CODIGO'
      'ORDER BY I1.PDV_CODIGO, I1.IPV_CODIGO ASC')
    CNCOrigem = 0
    CentroDeCusto = 2
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    CodigoGRP = 0
    CodigoIPV = 0
    CodigoPDV = 0
    CodigoSGP1 = 0
    CodigoSGP2 = 0
    CodigoSGP3 = 0
    CodigoSGP4 = 0
    Situacao = 0
    Left = 130
    Top = 329
    object Item_Pacote_Venda1CNC_CODIGO: TIntegerField
      FieldName = 'CNC_CODIGO'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.CNC_CODIGO'
    end
    object Item_Pacote_Venda1PDV_CODIGO: TIntegerField
      FieldName = 'PDV_CODIGO'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.PDV_CODIGO'
    end
    object Item_Pacote_Venda1USU_CODIGO: TIntegerField
      FieldName = 'USU_CODIGO'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.USU_CODIGO'
    end
    object Item_Pacote_Venda1PCT_DT_CADASTRO: TDateTimeField
      FieldName = 'PCT_DT_CADASTRO'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.PCT_DT_CADASTRO'
    end
    object Item_Pacote_Venda1PCT_DT_ALTERADO: TDateTimeField
      FieldName = 'PCT_DT_ALTERADO'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.PCT_DT_ALTERADO'
    end
    object Item_Pacote_Venda1PCT_DT_EMISSAO_VENDA: TDateTimeField
      FieldName = 'PCT_DT_EMISSAO_VENDA'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.PCT_DT_EMISSAO_VENDA'
    end
    object Item_Pacote_Venda1CNC_CLIENTE: TIntegerField
      FieldName = 'CNC_CLIENTE'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.CNC_CLIENTE'
    end
    object Item_Pacote_Venda1CLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.CLI_CODIGO'
    end
    object Item_Pacote_Venda1FUN_CODIGO: TIntegerField
      FieldName = 'FUN_CODIGO'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.FUN_CODIGO'
    end
    object Item_Pacote_Venda1PCT_ENTRADA: TFloatField
      FieldName = 'PCT_ENTRADA'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.PCT_ENTRADA'
    end
    object Item_Pacote_Venda1PCT_ACRESCIMO: TFloatField
      FieldName = 'PCT_ACRESCIMO'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.PCT_ACRESCIMO'
    end
    object Item_Pacote_Venda1PCT_TOTAL: TFloatField
      FieldName = 'PCT_TOTAL'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.PCT_TOTAL'
    end
    object Item_Pacote_Venda1PCT_NOTA_FISCAL: TIntegerField
      FieldName = 'PCT_NOTA_FISCAL'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.PCT_NOTA_FISCAL'
    end
    object Item_Pacote_Venda1PCT_NOTA_CUPOM: TIntegerField
      FieldName = 'PCT_NOTA_CUPOM'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.PCT_NOTA_CUPOM'
    end
    object Item_Pacote_Venda1AGF_CODIGO: TIntegerField
      FieldName = 'AGF_CODIGO'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.AGF_CODIGO'
    end
    object Item_Pacote_Venda1FPG_CODIGO: TIntegerField
      FieldName = 'FPG_CODIGO'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.FPG_CODIGO'
    end
    object Item_Pacote_Venda1PCT_TIPO_PAG: TIntegerField
      FieldName = 'PCT_TIPO_PAG'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.PCT_TIPO_PAG'
    end
    object Item_Pacote_Venda1PCT_MAQUINA: TIntegerField
      FieldName = 'PCT_MAQUINA'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.PCT_MAQUINA'
    end
    object Item_Pacote_Venda1PCT_EM_USO: TIntegerField
      FieldName = 'PCT_EM_USO'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.PCT_EM_USO'
    end
    object Item_Pacote_Venda1PCT_VENCIMENTOS: TStringField
      FieldName = 'PCT_VENCIMENTOS'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.PCT_VENCIMENTOS'
      FixedChar = True
      Size = 255
    end
    object Item_Pacote_Venda1PCT_SITUACAO: TIntegerField
      FieldName = 'PCT_SITUACAO'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.PCT_SITUACAO'
    end
    object Item_Pacote_Venda1PCT_OBSERVACAO: TStringField
      FieldName = 'PCT_OBSERVACAO'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.PCT_OBSERVACAO'
      FixedChar = True
      Size = 255
    end
    object Item_Pacote_Venda1CNC_CODIGO_1: TIntegerField
      FieldName = 'CNC_CODIGO_1'
      Origin = 'DBGUERRA.ITEM_DE_PACOTE_DE_VENDA.CNC_CODIGO'
    end
    object Item_Pacote_Venda1IPV_CODIGO: TIntegerField
      FieldName = 'IPV_CODIGO'
      Origin = 'DBGUERRA.ITEM_DE_PACOTE_DE_VENDA.IPV_CODIGO'
    end
    object Item_Pacote_Venda1PDV_CODIGO_1: TIntegerField
      FieldName = 'PDV_CODIGO_1'
      Origin = 'DBGUERRA.ITEM_DE_PACOTE_DE_VENDA.PDV_CODIGO'
    end
    object Item_Pacote_Venda1USU_CODIGO_1: TIntegerField
      FieldName = 'USU_CODIGO_1'
      Origin = 'DBGUERRA.ITEM_DE_PACOTE_DE_VENDA.USU_CODIGO'
    end
    object Item_Pacote_Venda1GRP_CODIGO: TIntegerField
      FieldName = 'GRP_CODIGO'
      Origin = 'DBGUERRA.ITEM_DE_PACOTE_DE_VENDA.GRP_CODIGO'
    end
    object Item_Pacote_Venda1SGP_CODIGO_1: TIntegerField
      FieldName = 'SGP_CODIGO_1'
      Origin = 'DBGUERRA.ITEM_DE_PACOTE_DE_VENDA.SGP_CODIGO_1'
    end
    object Item_Pacote_Venda1SGP_CODIGO_2: TIntegerField
      FieldName = 'SGP_CODIGO_2'
      Origin = 'DBGUERRA.ITEM_DE_PACOTE_DE_VENDA.SGP_CODIGO_2'
    end
    object Item_Pacote_Venda1SGP_CODIGO_3: TIntegerField
      FieldName = 'SGP_CODIGO_3'
      Origin = 'DBGUERRA.ITEM_DE_PACOTE_DE_VENDA.SGP_CODIGO_3'
    end
    object Item_Pacote_Venda1SGP_CODIGO_4: TIntegerField
      FieldName = 'SGP_CODIGO_4'
      Origin = 'DBGUERRA.ITEM_DE_PACOTE_DE_VENDA.SGP_CODIGO_4'
    end
    object Item_Pacote_Venda1IPC_DT_CADASTRO: TDateTimeField
      FieldName = 'IPC_DT_CADASTRO'
      Origin = 'DBGUERRA.ITEM_DE_PACOTE_DE_VENDA.IPC_DT_CADASTRO'
    end
    object Item_Pacote_Venda1IPC_DT_ALTERADO: TDateTimeField
      FieldName = 'IPC_DT_ALTERADO'
      Origin = 'DBGUERRA.ITEM_DE_PACOTE_DE_VENDA.IPC_DT_ALTERADO'
    end
    object Item_Pacote_Venda1IPC_QUANTIDADE: TIntegerField
      FieldName = 'IPC_QUANTIDADE'
      Origin = 'DBGUERRA.ITEM_DE_PACOTE_DE_VENDA.IPC_QUANTIDADE'
      DisplayFormat = '0.00'
    end
    object Item_Pacote_Venda1IPC_QUANTIDADE_ENTREGUE: TIntegerField
      FieldName = 'IPC_QUANTIDADE_ENTREGUE'
      Origin = 'DBGUERRA.ITEM_DE_PACOTE_DE_VENDA.IPC_QUANTIDADE_ENTREGUE'
      DisplayFormat = '0.00'
    end
    object Item_Pacote_Venda1IPC_PRECO: TFloatField
      FieldName = 'IPC_PRECO'
      Origin = 'DBGUERRA.ITEM_DE_PACOTE_DE_VENDA.IPC_PRECO'
      DisplayFormat = '0.00'
    end
    object Item_Pacote_Venda1IPC_DESCONTO: TFloatField
      FieldName = 'IPC_DESCONTO'
      Origin = 'DBGUERRA.ITEM_DE_PACOTE_DE_VENDA.IPC_DESCONTO'
      DisplayFormat = '0.00'
    end
    object Item_Pacote_Venda1IPC_PRECO_DESCONTO: TFloatField
      FieldName = 'IPC_PRECO_DESCONTO'
      Origin = 'DBGUERRA.ITEM_DE_PACOTE_DE_VENDA.IPC_PRECO_DESCONTO'
      DisplayFormat = '0.00'
    end
    object Item_Pacote_Venda1IPC_SITUACAO: TIntegerField
      FieldName = 'IPC_SITUACAO'
      Origin = 'DBGUERRA.ITEM_DE_PACOTE_DE_VENDA.IPC_SITUACAO'
    end
    object Item_Pacote_Venda1IPC_OBSERVACAO: TStringField
      FieldName = 'IPC_OBSERVACAO'
      Origin = 'DBGUERRA.ITEM_DE_PACOTE_DE_VENDA.IPC_OBSERVACAO'
      FixedChar = True
      Size = 255
    end
    object Item_Pacote_Venda1PCT_BLOQUEADO: TIntegerField
      FieldName = 'PCT_BLOQUEADO'
      Origin = 'DBGUERRA.PACOTE_DE_VENDA.PCT_BLOQUEADO'
    end
  end
  object Item_Pedido_Venda1: TItem_Pedido_Venda
    DatabaseName = 'DBguerra'
    DataSource = DSItem_Pacote_Venda1
    SQL.Strings = (
      'SELECT P1.*, I1.*, P2.PRD_CODIGO, P2.PRD_DESCRICAO '
      'FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1, PRODUTO P2'
      'WHERE P1.PDV_SITUACAO=4'
      'AND P1.CNC_CODIGO=:CNC_CODIGO'
      'AND P1.PDV_PACOTE=:PDV_CODIGO'
      'AND P1.CNC_CODIGO=I1.CNC_CODIGO'
      'AND P1.PDV_CODIGO=I1.PDV_CODIGO'
      'AND I1.PRD_CODIGO=P2.PRD_CODIGO'
      'AND (P2.SGP_CODIGO=:SGP_CODIGO_1'
      'OR P2.SGP_CODIGO=:SGP_CODIGO_2'
      'OR P2.SGP_CODIGO=:SGP_CODIGO_3'
      'OR P2.SGP_CODIGO=:SGP_CODIGO_4)'
      'ORDER BY P1.PDV_DT_ENTREGA')
    CNCOrigem = 0
    CentroDeCusto = 2
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
    Left = 250
    Top = 329
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CNC_CODIGO'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'PDV_CODIGO'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'SGP_CODIGO_1'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'SGP_CODIGO_2'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'SGP_CODIGO_3'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'SGP_CODIGO_4'
        ParamType = ptUnknown
        Size = 4
      end>
    object Item_Pedido_Venda1PDV_CODIGO: TIntegerField
      FieldName = 'PDV_CODIGO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_CODIGO'
    end
    object Item_Pedido_Venda1CNC_CODIGO: TIntegerField
      FieldName = 'CNC_CODIGO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.CNC_CODIGO'
    end
    object Item_Pedido_Venda1CLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.CLI_CODIGO'
    end
    object Item_Pedido_Venda1USU_CODIGO: TIntegerField
      FieldName = 'USU_CODIGO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.USU_CODIGO'
    end
    object Item_Pedido_Venda1PDV_DATA_HORA: TDateTimeField
      FieldName = 'PDV_DATA_HORA'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_DATA_HORA'
    end
    object Item_Pedido_Venda1PDV_TOTAL: TFloatField
      FieldName = 'PDV_TOTAL'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_TOTAL'
    end
    object Item_Pedido_Venda1PDV_LISTADO: TIntegerField
      FieldName = 'PDV_LISTADO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_LISTADO'
    end
    object Item_Pedido_Venda1PDV_SITUACAO: TIntegerField
      FieldName = 'PDV_SITUACAO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_SITUACAO'
    end
    object Item_Pedido_Venda1PDV_OBS: TStringField
      FieldName = 'PDV_OBS'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_OBS'
      FixedChar = True
      Size = 255
    end
    object Item_Pedido_Venda1PDV_DIAS_RESERV: TIntegerField
      FieldName = 'PDV_DIAS_RESERV'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_DIAS_RESERV'
    end
    object Item_Pedido_Venda1PDV_NOTA_FISCAL: TIntegerField
      FieldName = 'PDV_NOTA_FISCAL'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_NOTA_FISCAL'
    end
    object Item_Pedido_Venda1AGF_CODIGO: TIntegerField
      FieldName = 'AGF_CODIGO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.AGF_CODIGO'
    end
    object Item_Pedido_Venda1FPG_CODIGO: TIntegerField
      FieldName = 'FPG_CODIGO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.FPG_CODIGO'
    end
    object Item_Pedido_Venda1PDV_TIPO_PAG: TIntegerField
      FieldName = 'PDV_TIPO_PAG'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_TIPO_PAG'
    end
    object Item_Pedido_Venda1PDV_ENTRADA: TFloatField
      FieldName = 'PDV_ENTRADA'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_ENTRADA'
    end
    object Item_Pedido_Venda1CNC_CLIENTE: TIntegerField
      FieldName = 'CNC_CLIENTE'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.CNC_CLIENTE'
    end
    object Item_Pedido_Venda1PDV_EM_USO: TIntegerField
      FieldName = 'PDV_EM_USO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_EM_USO'
    end
    object Item_Pedido_Venda1PDV_ACRESCIMO: TFloatField
      FieldName = 'PDV_ACRESCIMO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_ACRESCIMO'
    end
    object Item_Pedido_Venda1PDV_DT_ALTERADO: TDateTimeField
      FieldName = 'PDV_DT_ALTERADO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_DT_ALTERADO'
    end
    object Item_Pedido_Venda1PDV_MAQUINA: TIntegerField
      FieldName = 'PDV_MAQUINA'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_MAQUINA'
    end
    object Item_Pedido_Venda1PDV_MELHOR_DATA: TDateTimeField
      FieldName = 'PDV_MELHOR_DATA'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_MELHOR_DATA'
    end
    object Item_Pedido_Venda1PDV_VENCIMENTOS: TStringField
      FieldName = 'PDV_VENCIMENTOS'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_VENCIMENTOS'
      FixedChar = True
      Size = 100
    end
    object Item_Pedido_Venda1PDV_MEDIA_PAGAMENTO: TIntegerField
      FieldName = 'PDV_MEDIA_PAGAMENTO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_MEDIA_PAGAMENTO'
    end
    object Item_Pedido_Venda1PDV_NOTA_CUPOM: TIntegerField
      FieldName = 'PDV_NOTA_CUPOM'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_NOTA_CUPOM'
    end
    object Item_Pedido_Venda1PDV_IMPRESSO: TIntegerField
      FieldName = 'PDV_IMPRESSO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_IMPRESSO'
    end
    object Item_Pedido_Venda1PDV_DT_EMISSAO_VENDA: TDateTimeField
      FieldName = 'PDV_DT_EMISSAO_VENDA'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_DT_EMISSAO_VENDA'
    end
    object Item_Pedido_Venda1PDV_DT_DEVOLUCAO: TDateTimeField
      FieldName = 'PDV_DT_DEVOLUCAO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_DT_DEVOLUCAO'
    end
    object Item_Pedido_Venda1PDV_CONTATO: TStringField
      FieldName = 'PDV_CONTATO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_CONTATO'
      FixedChar = True
      Size = 100
    end
    object Item_Pedido_Venda1PDV_CREDITO: TFloatField
      FieldName = 'PDV_CREDITO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_CREDITO'
    end
    object Item_Pedido_Venda1FUN_ARQUITETO: TIntegerField
      FieldName = 'FUN_ARQUITETO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.FUN_ARQUITETO'
    end
    object Item_Pedido_Venda1PDV_TITULO_GERADO: TIntegerField
      FieldName = 'PDV_TITULO_GERADO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_TITULO_GERADO'
    end
    object Item_Pedido_Venda1PDV_TIPO_VENDA: TIntegerField
      FieldName = 'PDV_TIPO_VENDA'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_TIPO_VENDA'
    end
    object Item_Pedido_Venda1PDV_PACOTE: TIntegerField
      FieldName = 'PDV_PACOTE'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_PACOTE'
    end
    object Item_Pedido_Venda1PDV_GRUPO_ESPECIAL: TIntegerField
      FieldName = 'PDV_GRUPO_ESPECIAL'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_GRUPO_ESPECIAL'
    end
    object Item_Pedido_Venda1PDV_DT_PREVISAO: TDateTimeField
      FieldName = 'PDV_DT_PREVISAO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_DT_PREVISAO'
    end
    object Item_Pedido_Venda1PDV_DT_ENTREGA: TDateTimeField
      FieldName = 'PDV_DT_ENTREGA'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_DT_ENTREGA'
    end
    object Item_Pedido_Venda1PDV_DOCUMENTO: TStringField
      FieldName = 'PDV_DOCUMENTO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_DOCUMENTO'
      FixedChar = True
    end
    object Item_Pedido_Venda1PDV_CAIXA: TStringField
      FieldName = 'PDV_CAIXA'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_CAIXA'
      FixedChar = True
    end
    object Item_Pedido_Venda1PDV_SERVICO: TIntegerField
      FieldName = 'PDV_SERVICO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_SERVICO'
    end
    object Item_Pedido_Venda1PDV_FONE_CONTATO: TStringField
      FieldName = 'PDV_FONE_CONTATO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_FONE_CONTATO'
      FixedChar = True
    end
    object Item_Pedido_Venda1CNC_CODIGO_1: TIntegerField
      FieldName = 'CNC_CODIGO_1'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.CNC_CODIGO'
    end
    object Item_Pedido_Venda1IPV_CODIGO: TIntegerField
      FieldName = 'IPV_CODIGO'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_CODIGO'
    end
    object Item_Pedido_Venda1FUN_CODIGO: TIntegerField
      FieldName = 'FUN_CODIGO'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.FUN_CODIGO'
    end
    object Item_Pedido_Venda1IEB_CODIGO: TIntegerField
      FieldName = 'IEB_CODIGO'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IEB_CODIGO'
    end
    object Item_Pedido_Venda1PDV_CODIGO_1: TIntegerField
      FieldName = 'PDV_CODIGO_1'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.PDV_CODIGO'
    end
    object Item_Pedido_Venda1SEC_CODIGO: TIntegerField
      FieldName = 'SEC_CODIGO'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.SEC_CODIGO'
    end
    object Item_Pedido_Venda1PRD_CODIGO: TIntegerField
      FieldName = 'PRD_CODIGO'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.PRD_CODIGO'
    end
    object Item_Pedido_Venda1TBP_CODIGO: TIntegerField
      FieldName = 'TBP_CODIGO'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.TBP_CODIGO'
    end
    object Item_Pedido_Venda1IPV_ENTREGA: TSmallintField
      FieldName = 'IPV_ENTREGA'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_ENTREGA'
    end
    object Item_Pedido_Venda1IPV_AVISTA: TSmallintField
      FieldName = 'IPV_AVISTA'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_AVISTA'
    end
    object Item_Pedido_Venda1IPV_QUANTIDADE: TFloatField
      FieldName = 'IPV_QUANTIDADE'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_QUANTIDADE'
      DisplayFormat = '0.00'
    end
    object Item_Pedido_Venda1IPV_DESCONTO: TFloatField
      FieldName = 'IPV_DESCONTO'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_DESCONTO'
    end
    object Item_Pedido_Venda1IPV_BONIFICACAO: TFloatField
      FieldName = 'IPV_BONIFICACAO'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_BONIFICACAO'
    end
    object Item_Pedido_Venda1CNC_LOCAL_ESTOQUE: TIntegerField
      FieldName = 'CNC_LOCAL_ESTOQUE'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.CNC_LOCAL_ESTOQUE'
    end
    object Item_Pedido_Venda1IPV_PRECO: TFloatField
      FieldName = 'IPV_PRECO'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_PRECO'
    end
    object Item_Pedido_Venda1IPV_SITUACAO: TIntegerField
      FieldName = 'IPV_SITUACAO'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_SITUACAO'
    end
    object Item_Pedido_Venda1IPV_PRECO_DESC: TFloatField
      FieldName = 'IPV_PRECO_DESC'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_PRECO_DESC'
    end
    object Item_Pedido_Venda1IPV_NOTA: TIntegerField
      FieldName = 'IPV_NOTA'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_NOTA'
    end
    object Item_Pedido_Venda1IPV_ITEMNOTA: TIntegerField
      FieldName = 'IPV_ITEMNOTA'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_ITEMNOTA'
    end
    object Item_Pedido_Venda1IPV_PRECO_NOTA: TFloatField
      FieldName = 'IPV_PRECO_NOTA'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_PRECO_NOTA'
    end
    object Item_Pedido_Venda1IPV_PENDENCIA: TIntegerField
      FieldName = 'IPV_PENDENCIA'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_PENDENCIA'
    end
    object Item_Pedido_Venda1IPV_ESTOQUE_LOCAL: TFloatField
      FieldName = 'IPV_ESTOQUE_LOCAL'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_ESTOQUE_LOCAL'
    end
    object Item_Pedido_Venda1IPV_ESTOQUE_EXTERNO: TFloatField
      FieldName = 'IPV_ESTOQUE_EXTERNO'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_ESTOQUE_EXTERNO'
    end
    object Item_Pedido_Venda1IPV_DIAS_ENTREGA: TIntegerField
      FieldName = 'IPV_DIAS_ENTREGA'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_DIAS_ENTREGA'
    end
    object Item_Pedido_Venda1IPV_DT_ENTRADA: TDateTimeField
      FieldName = 'IPV_DT_ENTRADA'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_DT_ENTRADA'
    end
    object Item_Pedido_Venda1IPV_DT_SAIDA: TDateTimeField
      FieldName = 'IPV_DT_SAIDA'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_DT_SAIDA'
    end
    object Item_Pedido_Venda1PRD_CODIGO_1: TIntegerField
      FieldName = 'PRD_CODIGO_1'
      Origin = 'DBGUERRA.PRODUTO.PRD_CODIGO'
    end
    object Item_Pedido_Venda1PRD_DESCRICAO: TStringField
      FieldName = 'PRD_DESCRICAO'
      Origin = 'DBGUERRA.PRODUTO.PRD_DESCRICAO'
      FixedChar = True
      Size = 60
    end
    object Item_Pedido_Venda1FPE_CODIGO: TIntegerField
      FieldName = 'FPE_CODIGO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.FPE_CODIGO'
    end
    object Item_Pedido_Venda1CNC_FATURAMENTO_PENDENTE: TIntegerField
      FieldName = 'CNC_FATURAMENTO_PENDENTE'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.CNC_FATURAMENTO_PENDENTE'
    end
    object Item_Pedido_Venda1IPV_SERVICO: TIntegerField
      FieldName = 'IPV_SERVICO'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_SERVICO'
    end
    object Item_Pedido_Venda1IPV_PRECO_SUGERIDO: TFloatField
      FieldName = 'IPV_PRECO_SUGERIDO'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_PRECO_SUGERIDO'
    end
    object Item_Pedido_Venda1IPV_OBSERVACAO: TStringField
      FieldName = 'IPV_OBSERVACAO'
      Origin = 'DBGUERRA.Item_de_pedido_de_venda.IPV_OBSERVACAO'
      FixedChar = True
      Size = 255
    end
  end
  object DSItem_Pacote_Venda1: TDataSource
    DataSet = Item_Pacote_Venda1
    Left = 160
    Top = 329
  end
  object Cliente1: TCliente
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM CLIENTE'
      'WHERE CNC_CODIGO=:CNC_CODIGO'
      'AND CLI_CODIGO=:CLI_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = 2
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
    Left = 70
    Top = 329
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
  object SubGrupo1: TSubGrupo
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM SUBGRUPO'
      'WHERE SGP_CODIGO=:SGP_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = 2
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    Tabela = 'SUBGRUPO'
    CodigoGRP = 0
    CodigoSGP = 0
    Fabricar = False
    PrecoDolar = False
    ServicoObrigatorio = False
    Situacao = 0
    Left = 100
    Top = 329
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SGP_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object Forma_de_Pagamento1: TForma_de_Pagamento
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM FORMA_DE_PAGAMENTO'
      'WHERE FPG_CODIGO=:FPG_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = 2
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
    Left = 190
    Top = 329
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FPG_CODIGO'
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
    CentroDeCusto = 2
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
    Left = 220
    Top = 329
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AGF_CODIGO'
        ParamType = ptUnknown
      end>
  end
end

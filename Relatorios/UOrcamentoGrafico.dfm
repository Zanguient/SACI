object rpt_OrcamentoGrafico: Trpt_OrcamentoGrafico
  Left = 163
  Top = 104
  Width = 830
  Height = 610
  Caption = 'rpt_OrcamentoGrafico'
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
    Top = 0
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = reportBeforePrint
    DataSet = Item_Pedido_Venda1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      50.000000000000000000
      2100.000000000000000000
      50.000000000000000000
      50.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object zrbCabecalho: TQRBand
      Left = 19
      Top = 19
      Width = 756
      Height = 278
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
        735.541666666666800000
        2000.250000000000000000)
      BandType = rbPageHeader
      object zrlLogomarca: TQRImage
        Left = 0
        Top = 0
        Width = 265
        Height = 89
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          235.479166666666700000
          0.000000000000000000
          0.000000000000000000
          701.145833333333200000)
        Stretch = True
      end
      object zrlProposta: TQRLabel
        Left = 560
        Top = 28
        Width = 85
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          1481.666666666667000000
          74.083333333333340000
          224.895833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PROPOSTA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRDBText1: TQRDBText
        Left = 648
        Top = 28
        Width = 103
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          1714.500000000000000000
          74.083333333333340000
          272.520833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = Item_Pedido_Venda1
        DataField = 'PDV_CODIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlDescContato: TQRLabel
        Left = 8
        Top = 177
        Width = 20
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          468.312500000000000000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'At.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlContato: TQRLabel
        Left = 32
        Top = 177
        Width = 61
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          84.666666666666680000
          468.312500000000000000
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'zrlContato'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRShape2: TQRShape
        Left = 8
        Top = 249
        Width = 756
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          21.166666666666670000
          658.812500000000000000
          2000.250000000000000000)
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object zrlDescItem: TQRLabel
        Left = 8
        Top = 255
        Width = 32
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          674.687500000000000000
          84.666666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Item'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlDescProduto: TQRLabel
        Left = 32
        Top = 255
        Width = 489
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          84.666666666666680000
          674.687500000000000000
          1293.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Produto'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlDescEntrega: TQRLabel
        Left = 528
        Top = 255
        Width = 53
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1397.000000000000000000
          674.687500000000000000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Entrega'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlDescQuandidade: TQRLabel
        Left = 584
        Top = 255
        Width = 50
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1545.166666666667000000
          674.687500000000000000
          132.291666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtd.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlDescPrecoUnitario: TQRLabel
        Left = 648
        Top = 255
        Width = 50
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1714.500000000000000000
          674.687500000000000000
          132.291666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Pr.Unit.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlDescTotalItem: TQRLabel
        Left = 706
        Top = 255
        Width = 50
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1867.958333333333000000
          674.687500000000000000
          132.291666666666700000)
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = False
        AutoStretch = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRShape3: TQRShape
        Left = 8
        Top = 272
        Width = 756
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          21.166666666666670000
          719.666666666666800000
          2000.250000000000000000)
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object zrlCliente: TQRLabel
        Left = 8
        Top = 118
        Width = 337
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          312.208333333333300000
          891.645833333333200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlCliente'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlFoneFax: TQRLabel
        Left = 352
        Top = 118
        Width = 337
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          931.333333333333200000
          312.208333333333300000
          891.645833333333200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlFoneFax'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlDataExtenso: TQRLabel
        Left = 8
        Top = 93
        Width = 737
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          246.062500000000000000
          1949.979166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlDataExtenso'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlEndereco: TQRLabel
        Left = 8
        Top = 134
        Width = 337
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          354.541666666666700000
          891.645833333333200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlEndereco'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlBairro: TQRLabel
        Left = 8
        Top = 150
        Width = 337
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          396.875000000000000000
          891.645833333333200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlBairro'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlCidadeUF: TQRLabel
        Left = 352
        Top = 150
        Width = 337
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          931.333333333333200000
          396.875000000000000000
          891.645833333333200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlCidadeUF'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlDescricaoInicial: TQRLabel
        Left = 8
        Top = 196
        Width = 738
        Height = 50
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          132.291666666666700000
          21.166666666666670000
          518.583333333333300000
          1952.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          '            Proposta de Pre'#231'os que fazem a EMPRESA XXXX, para fo' +
          'rnecimento do material especificado:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
    end
    object zrbDetalhe1: TQRBand
      Left = 19
      Top = 297
      Width = 756
      Height = 41
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = zrbDetalhe1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        108.479166666666700000
        2000.250000000000000000)
      BandType = rbDetail
      object zrlNumeroItem: TQRLabel
        Left = 0
        Top = 2
        Width = 28
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          0.000000000000000000
          5.291666666666667000
          74.083333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Item'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlProduto: TQRLabel
        Left = 32
        Top = 3
        Width = 489
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          84.666666666666680000
          7.937500000000000000
          1293.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Produto'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object zrlEntrega: TQRLabel
        Left = 528
        Top = 2
        Width = 47
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1397.000000000000000000
          5.291666666666667000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Entrega'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlQuantidade: TQRLabel
        Left = 584
        Top = 2
        Width = 50
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1545.166666666667000000
          5.291666666666667000
          132.291666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qtd.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlTotalItem: TQRLabel
        Left = 706
        Top = 2
        Width = 50
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1867.958333333333000000
          5.291666666666667000
          132.291666666666700000)
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = False
        AutoStretch = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlPrecoUnitario: TQRLabel
        Left = 648
        Top = 2
        Width = 50
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1714.500000000000000000
          5.291666666666667000
          132.291666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Pr.Unit.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
    end
    object zrbRodapePagina: TQRBand
      Left = 19
      Top = 521
      Width = 756
      Height = 34
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
        89.958333333333320000
        2000.250000000000000000)
      BandType = rbPageFooter
      object zrlEmpresaDesenvolvedora: TQRLabel
        Left = 0
        Top = 8
        Width = 142
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          21.166666666666670000
          375.708333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'EmpresaDesenvolvedora'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 0
        Width = 756
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          0.000000000000000000
          0.000000000000000000
          2000.250000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object zrlPagina: TQRSysData
        Left = 679
        Top = 8
        Width = 77
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1796.520833333334000000
          21.166666666666670000
          203.729166666666700000)
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Text = 'P'#225'g.:'
        Transparent = False
        FontSize = 10
      end
    end
    object zrbSumario: TQRBand
      Left = 19
      Top = 338
      Width = 756
      Height = 183
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = zrbSumarioBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        484.187500000000000000
        2000.250000000000000000)
      BandType = rbSummary
      object QRShape5: TQRShape
        Left = 32
        Top = 66
        Width = 689
        Height = 68
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          179.916666666666700000
          84.666666666666680000
          174.625000000000000000
          1822.979166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object zrlRodape1: TQRLabel
        Left = 0
        Top = 144
        Width = 756
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          0.000000000000000000
          381.000000000000000000
          2000.250000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlRodape1'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlExtensoTotal: TQRLabel
        Left = 8
        Top = 32
        Width = 745
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.958333333333340000
          21.166666666666670000
          84.666666666666680000
          1971.145833333334000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'rptExtensoTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRShape4: TQRShape
        Left = 584
        Top = 0
        Width = 175
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333340000
          1545.166666666667000000
          0.000000000000000000
          463.020833333333400000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object zrlSubTotal: TQRLabel
        Left = 672
        Top = 10
        Width = 84
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1778.000000000000000000
          26.458333333333330000
          222.250000000000000000)
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = False
        AutoStretch = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlDescTotal: TQRLabel
        Left = 584
        Top = 10
        Width = 50
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1545.166666666667000000
          26.458333333333330000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Total:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlDescVendedor: TQRLabel
        Left = 40
        Top = 74
        Width = 77
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          105.833333333333300000
          195.791666666666700000
          203.729166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Consultor(a):'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlVendedor: TQRLabel
        Left = 120
        Top = 74
        Width = 73
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          317.500000000000000000
          195.791666666666700000
          193.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'zrlVendedor'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlDescCondicaoPagamento: TQRLabel
        Left = 40
        Top = 90
        Width = 147
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          105.833333333333300000
          238.125000000000000000
          388.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Condi'#231#227'o de Pagamento:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlTipoPag: TQRLabel
        Left = 192
        Top = 90
        Width = 526
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          508.000000000000000000
          238.125000000000000000
          1391.708333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlTipoPag'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlDescValidade: TQRLabel
        Left = 40
        Top = 106
        Width = 56
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          105.833333333333300000
          280.458333333333400000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Validade:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zdbValidade: TQRDBText
        Left = 104
        Top = 106
        Width = 25
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          275.166666666666700000
          280.458333333333400000
          66.145833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = Item_Pedido_Venda1
        DataField = 'PDV_DIAS_RESERV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zlrDescDias: TQRLabel
        Left = 136
        Top = 106
        Width = 28
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          359.833333333333400000
          280.458333333333400000
          74.083333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Dias'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object zrlRodape2: TQRLabel
        Left = 0
        Top = 160
        Width = 756
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          0.000000000000000000
          423.333333333333300000
          2000.250000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlRodape2'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
    end
  end
  object Cliente1: TCliente
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT *'
      'FROM CLIENTE'
      'WHERE CNC_CODIGO=:CNC_CODIGO AND CLI_CODIGO=:CLI_CODIGO')
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
    Left = 286
    Top = 28
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
    Filtered = True
    SQL.Strings = (
      'SELECT T1.*,T2.*'
      'FROM'
      '       Item_de_pedido_de_venda T1,'
      '       Pedido_de_Venda T2'
      'WHERE'
      '        (T2.CNC_CODIGO=T1.CNC_CODIGO) AND'
      '        (T1.PDV_CODIGO = T2.PDV_CODIGO) AND'
      '        (T2.PDV_DATA_HORA>=:DATA_INI) AND'
      '        (T2.PDV_DATA_HORA<:DATA_FIM) AND'
      '        (T2.PDV_SITUACAO=4) '
      'ORDER BY T1.PDV_CODIGO ASC'
      ' ')
    CConfiguracao = DM.Configuracao1
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
    Left = 315
    Top = 28
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATA_INI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATA_FIM'
        ParamType = ptUnknown
      end>
    object Item_Pedido_Venda1CNC_CODIGO: TIntegerField
      FieldName = 'CNC_CODIGO'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.CNC_CODIGO'
    end
    object Item_Pedido_Venda1IPV_CODIGO: TIntegerField
      FieldName = 'IPV_CODIGO'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.IPV_CODIGO'
    end
    object Item_Pedido_Venda1FUN_CODIGO: TIntegerField
      FieldName = 'FUN_CODIGO'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.FUN_CODIGO'
    end
    object Item_Pedido_Venda1IEB_CODIGO: TIntegerField
      FieldName = 'IEB_CODIGO'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.IEB_CODIGO'
    end
    object Item_Pedido_Venda1PDV_CODIGO: TIntegerField
      FieldName = 'PDV_CODIGO'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.PDV_CODIGO'
    end
    object Item_Pedido_Venda1SEC_CODIGO: TIntegerField
      FieldName = 'SEC_CODIGO'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.SEC_CODIGO'
    end
    object Item_Pedido_Venda1PRD_CODIGO: TIntegerField
      FieldName = 'PRD_CODIGO'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.PRD_CODIGO'
    end
    object Item_Pedido_Venda1TBP_CODIGO: TIntegerField
      FieldName = 'TBP_CODIGO'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.TBP_CODIGO'
    end
    object Item_Pedido_Venda1IPV_ENTREGA: TSmallintField
      FieldName = 'IPV_ENTREGA'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.IPV_ENTREGA'
    end
    object Item_Pedido_Venda1IPV_AVISTA: TSmallintField
      FieldName = 'IPV_AVISTA'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.IPV_AVISTA'
    end
    object Item_Pedido_Venda1IPV_QUANTIDADE: TFloatField
      FieldName = 'IPV_QUANTIDADE'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.IPV_QUANTIDADE'
    end
    object Item_Pedido_Venda1IPV_DESCONTO: TFloatField
      FieldName = 'IPV_DESCONTO'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.IPV_DESCONTO'
    end
    object Item_Pedido_Venda1IPV_BONIFICACAO: TFloatField
      FieldName = 'IPV_BONIFICACAO'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.IPV_BONIFICACAO'
    end
    object Item_Pedido_Venda1CNC_LOCAL_ESTOQUE: TIntegerField
      FieldName = 'CNC_LOCAL_ESTOQUE'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.CNC_LOCAL_ESTOQUE'
    end
    object Item_Pedido_Venda1IPV_PRECO: TFloatField
      FieldName = 'IPV_PRECO'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.IPV_PRECO'
    end
    object Item_Pedido_Venda1IPV_SITUACAO: TIntegerField
      FieldName = 'IPV_SITUACAO'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.IPV_SITUACAO'
    end
    object Item_Pedido_Venda1IPV_PRECO_DESC: TFloatField
      FieldName = 'IPV_PRECO_DESC'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.IPV_PRECO_DESC'
    end
    object Item_Pedido_Venda1IPV_NOTA: TIntegerField
      FieldName = 'IPV_NOTA'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.IPV_NOTA'
    end
    object Item_Pedido_Venda1IPV_ITEMNOTA: TIntegerField
      FieldName = 'IPV_ITEMNOTA'
      Origin = 'ITEM_DE_PEDIDO_DE_VENDA.IPV_ITEMNOTA'
    end
    object Item_Pedido_Venda1PDV_CODIGO_1: TIntegerField
      FieldName = 'PDV_CODIGO_1'
      Origin = 'PEDIDO_DE_VENDA.PDV_CODIGO'
    end
    object Item_Pedido_Venda1CNC_CODIGO_1: TIntegerField
      FieldName = 'CNC_CODIGO_1'
      Origin = 'PEDIDO_DE_VENDA.CNC_CODIGO'
    end
    object Item_Pedido_Venda1CLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Origin = 'PEDIDO_DE_VENDA.CLI_CODIGO'
    end
    object Item_Pedido_Venda1USU_CODIGO: TIntegerField
      FieldName = 'USU_CODIGO'
      Origin = 'PEDIDO_DE_VENDA.USU_CODIGO'
    end
    object Item_Pedido_Venda1PDV_DATA_HORA: TDateTimeField
      FieldName = 'PDV_DATA_HORA'
      Origin = 'PEDIDO_DE_VENDA.PDV_DATA_HORA'
    end
    object Item_Pedido_Venda1PDV_TOTAL: TFloatField
      FieldName = 'PDV_TOTAL'
      Origin = 'PEDIDO_DE_VENDA.PDV_TOTAL'
    end
    object Item_Pedido_Venda1PDV_LISTADO: TIntegerField
      FieldName = 'PDV_LISTADO'
      Origin = 'PEDIDO_DE_VENDA.PDV_LISTADO'
    end
    object Item_Pedido_Venda1PDV_SITUACAO: TIntegerField
      FieldName = 'PDV_SITUACAO'
      Origin = 'PEDIDO_DE_VENDA.PDV_SITUACAO'
    end
    object Item_Pedido_Venda1PDV_DIAS_RESERV: TIntegerField
      FieldName = 'PDV_DIAS_RESERV'
      Origin = 'PEDIDO_DE_VENDA.PDV_DIAS_RESERV'
    end
    object Item_Pedido_Venda1PDV_NOTA_FISCAL: TSmallintField
      FieldName = 'PDV_NOTA_FISCAL'
      Origin = 'PEDIDO_DE_VENDA.PDV_NOTA_FISCAL'
    end
    object Item_Pedido_Venda1AGF_CODIGO: TIntegerField
      FieldName = 'AGF_CODIGO'
      Origin = 'PEDIDO_DE_VENDA.AGF_CODIGO'
    end
    object Item_Pedido_Venda1FPG_CODIGO: TIntegerField
      FieldName = 'FPG_CODIGO'
      Origin = 'PEDIDO_DE_VENDA.FPG_CODIGO'
    end
    object Item_Pedido_Venda1PDV_TIPO_PAG: TIntegerField
      FieldName = 'PDV_TIPO_PAG'
      Origin = 'PEDIDO_DE_VENDA.PDV_TIPO_PAG'
    end
    object Item_Pedido_Venda1PDV_ENTRADA: TFloatField
      FieldName = 'PDV_ENTRADA'
      Origin = 'PEDIDO_DE_VENDA.PDV_ENTRADA'
    end
    object Item_Pedido_Venda1CNC_CLIENTE: TIntegerField
      FieldName = 'CNC_CLIENTE'
      Origin = 'PEDIDO_DE_VENDA.CNC_CLIENTE'
    end
    object Item_Pedido_Venda1PDV_EM_USO: TIntegerField
      FieldName = 'PDV_EM_USO'
      Origin = 'PEDIDO_DE_VENDA.PDV_EM_USO'
    end
    object Item_Pedido_Venda1IPV_PRECO_NOTA: TFloatField
      FieldName = 'IPV_PRECO_NOTA'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_PRECO_NOTA'
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
    object Item_Pedido_Venda1IPV_PRECO_SUGERIDO: TFloatField
      FieldName = 'IPV_PRECO_SUGERIDO'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_PRECO_SUGERIDO'
    end
    object Item_Pedido_Venda1PDV_MELHOR_DATA: TDateTimeField
      FieldName = 'PDV_MELHOR_DATA'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_MELHOR_DATA'
    end
    object Item_Pedido_Venda1PDV_VENCIMENTOS: TStringField
      FieldName = 'PDV_VENCIMENTOS'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_VENCIMENTOS'
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
    object Item_Pedido_Venda1IPV_DIAS_ENTREGA: TIntegerField
      FieldName = 'IPV_DIAS_ENTREGA'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_DIAS_ENTREGA'
    end
    object Item_Pedido_Venda1PDV_OBS: TStringField
      FieldName = 'PDV_OBS'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_OBS'
      FixedChar = True
      Size = 255
    end
    object Item_Pedido_Venda1IPV_DT_ENTRADA: TDateTimeField
      FieldName = 'IPV_DT_ENTRADA'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_DT_ENTRADA'
    end
    object Item_Pedido_Venda1IPV_DT_SAIDA: TDateTimeField
      FieldName = 'IPV_DT_SAIDA'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_DT_SAIDA'
    end
    object Item_Pedido_Venda1IPV_SERVICO: TIntegerField
      FieldName = 'IPV_SERVICO'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_SERVICO'
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
    object Item_Pedido_Venda1FPE_CODIGO: TIntegerField
      FieldName = 'FPE_CODIGO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.FPE_CODIGO'
    end
    object Item_Pedido_Venda1CNC_FATURAMENTO_PENDENTE: TIntegerField
      FieldName = 'CNC_FATURAMENTO_PENDENTE'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.CNC_FATURAMENTO_PENDENTE'
    end
    object Item_Pedido_Venda1IPV_OBSERVACAO: TStringField
      FieldName = 'IPV_OBSERVACAO'
      Origin = 'DBGUERRA.Item_de_pedido_de_venda.IPV_OBSERVACAO'
      FixedChar = True
      Size = 255
    end
    object Item_Pedido_Venda1IPV_DT_ALTERADO: TDateTimeField
      FieldName = 'IPV_DT_ALTERADO'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_DT_ALTERADO'
    end
    object Item_Pedido_Venda1IPV_DT_CADASTRO: TDateTimeField
      FieldName = 'IPV_DT_CADASTRO'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_DT_CADASTRO'
    end
    object Item_Pedido_Venda1IPV_VINCULO: TIntegerField
      FieldName = 'IPV_VINCULO'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_VINCULO'
    end
    object Item_Pedido_Venda1IPV_SEQUENCIA: TIntegerField
      FieldName = 'IPV_SEQUENCIA'
      Origin = 'DBGUERRA.ITEM_DE_PEDIDO_DE_VENDA.IPV_SEQUENCIA'
    end
    object Item_Pedido_Venda1USU_CODIGO_1: TIntegerField
      FieldName = 'USU_CODIGO_1'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.USU_CODIGO'
    end
    object Item_Pedido_Venda1PDV_DT_FPE: TDateTimeField
      FieldName = 'PDV_DT_FPE'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_DT_FPE'
    end
    object Item_Pedido_Venda1CNT_CODIGO: TIntegerField
      FieldName = 'CNT_CODIGO'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.CNT_CODIGO'
    end
    object Item_Pedido_Venda1PDV_GARANTIA: TIntegerField
      FieldName = 'PDV_GARANTIA'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_GARANTIA'
    end
    object Item_Pedido_Venda1PDV_CODIGO_ORIGEM: TIntegerField
      FieldName = 'PDV_CODIGO_ORIGEM'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_CODIGO_ORIGEM'
    end
    object Item_Pedido_Venda1PDV_FRETE: TFloatField
      FieldName = 'PDV_FRETE'
      Origin = 'DBGUERRA.PEDIDO_DE_VENDA.PDV_FRETE'
    end
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
    Left = 373
    Top = 28
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AGF_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object Titulo_receber1: TTitulo_receber
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM TITULO_A_RECEBER'
      'WHERE CNC_CODIGO=:CNC_CODIGO AND PDV_CODIGO=:PDV_CODIGO'
      'ORDER BY TRC_VENCIMENTO')
    CNCOrigem = 0
    CentroDeCusto = 2
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
    Left = 431
    Top = 28
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
    Left = 460
    Top = 28
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FPG_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object Funcionario1: TFuncionario
    DatabaseName = 'DBguerra'
    Filtered = True
    SQL.Strings = (
      'SELECT FUN_CODIGO,FUN_NOME,CNC_CODIGO,FUN_APELIDO, FUN_FONE'
      'FROM FUNCIONARIO'
      'WHERE FUN_CODIGO=:FUN_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = 2
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
    Left = 402
    Top = 28
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FUN_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object Produto1: TProduto
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT PRD_CODIGO,PRD_DESCRICAO,PRD_UNIDADE,'
      'PRD_REFERENCIA,PRD_DETALHE,PRD_MARCA'
      'FROM PRODUTO'
      'WHERE PRD_CODIGO=:PRD_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = 2
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
    Left = 489
    Top = 28
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PRD_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object CentroCusto1: TCentroCusto
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM CENTRO_DE_CUSTO'
      'WHERE CNC_CODIGO=:CNC_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = 2
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    Tabela = 'CENTRO_DE_CUSTO'
    Logradouro = 0
    RecebeDados = False
    Left = 519
    Top = 28
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CNC_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object Extenso1: TValorPorExtenso
    MoedaNoSingular = 'REAL'
    MoedaNoPlural = 'REAIS'
    TipoDoTexto = ttMaiuscula
    Left = 344
    Top = 28
  end
end

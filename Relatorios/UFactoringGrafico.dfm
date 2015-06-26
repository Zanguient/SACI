object rpt_FactoringGrafico: Trpt_FactoringGrafico
  Left = 257
  Top = 157
  Width = 808
  Height = 608
  Caption = 'Factoring'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object report: TQuickRep
    Left = 0
    Top = 0
    Width = 816
    Height = 1022
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = Item_de_Factoring1
    Description.Strings = (
      
        'Relat'#243'rio de Comiss'#227'o de Vendas baseado nas cotas do funcion'#225'rio' +
        '.')
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
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
    Page.PaperSize = Custom
    Page.Values = (
      100.000000000000000000
      2704.000000000000000000
      100.000000000000000000
      2159.000000000000000000
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
    ReportTitle = 'Relat'#243'rio de Comiss'#227'o de Vendas'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object QRBand1: TQRBand
      Left = 19
      Top = 38
      Width = 778
      Height = 51
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        134.937500000000000000
        2058.458333333333000000)
      BandType = rbPageHeader
      object qrlDescricaoRelatorio: TQRLabel
        Left = 0
        Top = 21
        Width = 67
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          55.562500000000000000
          177.270833333333300000)
        Alignment = taLeftJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Factoring'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object qrlNomeLoja: TQRLabel
        Left = 0
        Top = 0
        Width = 99
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          0.000000000000000000
          261.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Nome da Loja'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object qrlNomeCentroDeCusto: TQRLabel
        Left = 595
        Top = 0
        Width = 183
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1574.270833333333000000
          0.000000000000000000
          484.187500000000000000)
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Nome da Centro de Custo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object qrsDataHoraImpressao: TQRSysData
        Left = 614
        Top = 21
        Width = 164
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1624.541666666667000000
          55.562500000000000000
          433.916666666666700000)
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = True
        Color = clWhite
        Data = qrsDateTime
        Text = 'Data Hora: '
        Transparent = False
        FontSize = 12
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 38
        Width = 776
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          0.000000000000000000
          100.541666666666700000
          2053.166666666667000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object QRBand2: TQRBand
      Left = 19
      Top = 230
      Width = 778
      Height = 40
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
        105.833333333333300000
        2058.458333333333000000)
      BandType = rbPageFooter
      object qrsLinhaHorizontalRodape: TQRShape
        Left = 0
        Top = 0
        Width = 776
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          0.000000000000000000
          2053.166666666667000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrsNumeroPagina: TQRSysData
        Left = 679
        Top = 21
        Width = 99
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1796.520833333334000000
          55.562500000000000000
          261.937500000000000000)
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Text = 'P'#225'g.: '
        Transparent = False
        FontSize = 12
      end
    end
    object QRBand3: TQRBand
      Left = 19
      Top = 158
      Width = 778
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand3BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666680000
        2058.458333333333000000)
      BandType = rbDetail
      object zrlBanco: TQRLabel
        Left = 0
        Top = 5
        Width = 58
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          13.229166666666670000
          153.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'BANCO'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object zrlNumero: TQRLabel
        Left = 78
        Top = 5
        Width = 98
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          206.375000000000000000
          13.229166666666670000
          259.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'No.CHEQUE'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object zrlValor: TQRLabel
        Left = 180
        Top = 5
        Width = 103
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          476.250000000000000000
          13.229166666666670000
          272.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VALOR'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object zrlVencimento: TQRLabel
        Left = 339
        Top = 5
        Width = 105
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          896.937500000000000000
          13.229166666666670000
          277.812500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VENCIMENTO'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object zrlEmitente: TQRLabel
        Left = 461
        Top = 5
        Width = 316
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1219.729166666667000000
          13.229166666666670000
          836.083333333333200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'EMITENTE'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
    end
    object QRGroup1: TQRGroup
      Left = 19
      Top = 89
      Width = 778
      Height = 69
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRGroup1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        182.562500000000000000
        2058.458333333333000000)
      Expression = 'FCT_CODIGO'
      FooterBand = zrbRodapeGrupo
      Master = report
      ReprintOnNewPage = False
      object qrsLinhaHorizontalCabecalho2: TQRShape
        Left = 0
        Top = 53
        Width = 776
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          0.000000000000000000
          140.229166666666700000
          2053.166666666667000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 0
        Top = 2
        Width = 57
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          5.291666666666667000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C'#243'digo:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object zrlCliente: TQRLabel
        Left = 156
        Top = 3
        Width = 469
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          412.750000000000000000
          7.937500000000000000
          1240.895833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlCliente'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText3: TQRDBText
        Left = 71
        Top = 3
        Width = 82
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          187.854166666666700000
          7.937500000000000000
          216.958333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = Item_de_Factoring1
        DataField = 'FCT_CODIGO'
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel4: TQRLabel
        Left = 0
        Top = 32
        Width = 58
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          84.666666666666680000
          153.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'BANCO'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel5: TQRLabel
        Left = 78
        Top = 32
        Width = 98
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          206.375000000000000000
          84.666666666666680000
          259.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'No.CHEQUE'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel6: TQRLabel
        Left = 180
        Top = 32
        Width = 103
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          476.250000000000000000
          84.666666666666680000
          272.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VALOR'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel7: TQRLabel
        Left = 340
        Top = 32
        Width = 105
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          899.583333333333400000
          84.666666666666680000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VENCIMENTO'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel8: TQRLabel
        Left = 462
        Top = 32
        Width = 315
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1222.375000000000000000
          84.666666666666680000
          833.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'EMITENTE'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRShape2: TQRShape
        Left = 0
        Top = 25
        Width = 776
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          66.145833333333320000
          2053.166666666667000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object zrbRodapeGrupo: TQRBand
      Left = 19
      Top = 190
      Width = 778
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = zrbRodapeGrupoBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2058.458333333333000000)
      BandType = rbGroupFooter
      object QRShape4: TQRShape
        Left = 0
        Top = 1
        Width = 776
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          2.645833333333333000
          2053.166666666667000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object zrlTotalCheque: TQRLabel
        Left = 180
        Top = 16
        Width = 103
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          476.250000000000000000
          42.333333333333330000
          272.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VALOR'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
    end
  end
  object QRTextFilter1: TQRTextFilter
    Left = 652
    Top = 260
  end
  object QRCSVFilter1: TQRCSVFilter
    Separator = ','
    Left = 660
    Top = 312
  end
  object QRHTMLFilter1: TQRHTMLFilter
    Left = 660
    Top = 364
  end
  object Item_de_Factoring1: TItem_de_Factoring
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT I1.* '
      'FROM FACTORING F1, ITEM_DE_FACTORING I1'
      'WHERE F1.CNC_CODIGO=:CNC_CODIGO'
      'AND F1.FCT_CODIGO=:FCT_CODIGO'
      'AND F1.CNC_CODIGO=I1.CNC_CODIGO'
      'AND F1.FCT_CODIGO=I1.FCT_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = 2
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    Tabela = 'ITEM_DE_FACTORING'
    ChequeCNC = 0
    CodigoCHQ = 0
    CodigoFCT = 0
    CodigoIFC = 0
    MaquinaIFC = 0
    Situacao = 0
    Left = 392
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CNC_CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FCT_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object Cheque1: TCheque
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM CHEQUE'
      'WHERE CNC_CODIGO=:CNC_CODIGO'
      'AND CHQ_CODIGO=:CHQ_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = 2
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    Tabela = 'CHEQUE'
    Agencia = 0
    Banco = 0
    C1 = 0
    C2 = 0
    C3 = 0
    CNCTitulo = 0
    CODTitulo = 0
    ClienteCNC = 0
    CodigoCHQ = 0
    CodigoCLI = 0
    CodigoFCT = 0
    Comp = 0
    Conta = 0
    Enviado = False
    FactoringCNC = 0
    Situacao = 0
    Terceiro = 0
    Utilizado = False
    Left = 392
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CNC_CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CHQ_CODIGO'
        ParamType = ptUnknown
      end>
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
    Left = 264
    Top = 296
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
end

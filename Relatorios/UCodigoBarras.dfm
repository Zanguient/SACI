object rpt_CodigoBarras: Trpt_CodigoBarras
  Left = 188
  Top = 188
  Width = 808
  Height = 608
  Caption = 'C'#243'digo de Barras'
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
    Left = -1
    Top = 0
    Width = 816
    Height = 1056
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = Codigo_Barras1
    Description.Strings = (
      
        'Relat'#243'rio de Comiss'#227'o de Gerentes baseado nas Equipes de Funcion' +
        #225'rios')
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
    Page.PaperSize = Letter
    Page.Values = (
      50.000000000000000000
      2794.000000000000000000
      50.000000000000000000
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
    ReportTitle = 'Relat'#243'rio de Comiss'#227'o de Gerentes'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object QRBand2: TQRBand
      Left = 19
      Top = 173
      Width = 778
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2058.458333333333000000)
      BandType = rbPageFooter
      object QRLabel1: TQRLabel
        Left = 0
        Top = 21
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
          55.562500000000000000
          375.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'EmpresaDesenvolvedora'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
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
        Left = 697
        Top = 21
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1844.145833333333000000
          55.562500000000000000
          214.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Text = 'P'#225'g.: '
        Transparent = False
        FontSize = 10
      end
    end
    object QRGroup1: TQRGroup
      Left = 19
      Top = 70
      Width = 778
      Height = 53
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRGroup1BeforePrint
      Color = clWindow
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        140.229166666666700000
        2058.458333333333000000)
      Expression = 'Codigo_Barras1.CDB_CODIGO_ENTRADA'
      Master = report
      ReprintOnNewPage = False
      object QRLabel2: TQRLabel
        Left = 4
        Top = 1
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          2.645833333333333000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Produto:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object zrlProduto: TQRLabel
        Left = 60
        Top = 1
        Width = 461
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          158.750000000000000000
          2.645833333333333000
          1219.729166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Produto'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 60
        Top = 23
        Width = 86
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          158.750000000000000000
          60.854166666666670000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'C'#243'digo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 152
        Top = 23
        Width = 101
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          402.166666666666700000
          60.854166666666670000
          267.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C'#243'digo de Barras'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 436
        Top = 23
        Width = 84
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1153.583333333333000000
          60.854166666666670000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data Cadastro'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 717
        Top = 23
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1897.062500000000000000
          60.854166666666670000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Situa'#231#227'o'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 39
        Width = 777
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          103.187500000000000000
          2055.812500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object zrlReferencia: TQRLabel
        Left = 523
        Top = 1
        Width = 84
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1383.770833333333000000
          2.645833333333333000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data Cadastro'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 19
      Top = 123
      Width = 778
      Height = 50
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
        132.291666666666700000
        2058.458333333333000000)
      BandType = rbDetail
      object QRDBText2: TQRDBText
        Left = 152
        Top = 8
        Width = 364
        Height = 37
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          97.895833333333330000
          402.166666666666700000
          21.166666666666670000
          963.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = Codigo_Barras1
        DataField = 'CDB_CODIGO_BARRAS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'C39HrP36DlTt'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 24
      end
      object QRDBText3: TQRDBText
        Left = 436
        Top = 8
        Width = 129
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1153.583333333333000000
          21.166666666666670000
          341.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = Codigo_Barras1
        DataField = 'CDB_DT_CADASTRO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 719
        Top = 8
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1902.354166666667000000
          21.166666666666670000
          137.583333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = Codigo_Barras1
        DataField = 'CDB_SITUACAO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 60
        Top = 8
        Width = 86
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          158.750000000000000000
          21.166666666666670000
          227.541666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = Codigo_Barras1
        DataField = 'CDB_CODIGO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand3: TQRBand
      Left = 19
      Top = 19
      Width = 778
      Height = 51
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
        134.937500000000000000
        2058.458333333333000000)
      BandType = rbPageHeader
      object QRLabel4: TQRLabel
        Left = 0
        Top = 17
        Width = 181
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          44.979166666666670000
          478.895833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Relat'#243'rio de C'#243'digos de Barras'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrsDataHoraImpressao: TQRSysData
        Left = 644
        Top = 21
        Width = 134
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1703.916666666667000000
          55.562500000000000000
          354.541666666666700000)
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = True
        Color = clWhite
        Data = qrsDateTime
        Text = 'Data Hora: '
        Transparent = False
        FontSize = 10
      end
      object qrsLinhaHorizontalCabecalho1: TQRShape
        Left = 0
        Top = 43
        Width = 777
        Height = 3
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          7.937500000000000000
          0.000000000000000000
          113.770833333333300000
          2055.812500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlNomeCentroDeCusto: TQRLabel
        Left = 627
        Top = 0
        Width = 151
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1658.937500000000000000
          0.000000000000000000
          399.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Nome da Centro de Custo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlNomeLoja: TQRLabel
        Left = 0
        Top = 0
        Width = 81
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
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Nome da Loja'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object Codigo_Barras1: TCodigo_Barras
    Active = True
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM CODIGO_DE_BARRAS'
      'ORDER BY CDB_CODIGO_ENTRADA')
    CConfiguracao = DM.Configuracao1
    CLog = DM.Log1
    CNCOrigem = 0
    CentroDeCusto = 5
    CodigoCNC = 1
    CodigoUSU = 1
    Mafalda = 0
    Maquina = 1
    Tabela = 'CODIGO_DE_BARRAS'
    CodigoCDB = 1
    CodigoCDB_Barras = '7891529081105'
    CodigoCDB_Entrada = 457
    DataCadastro = 38105.693551273150000000
    Situacao = 0
    Tipo = 0
    Left = 82
    Top = 228
  end
  object DSCodigoBarras: TDataSource
    DataSet = Codigo_Barras1
    Left = 112
    Top = 228
  end
  object Produto1: TProduto
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM PRODUTO'
      'WHERE PRD_CODIGO=:PRD_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = 5
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
    Left = 52
    Top = 228
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PRD_CODIGO'
        ParamType = ptUnknown
      end>
  end
end

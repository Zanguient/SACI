object rpt_ReciboGrafico: Trpt_ReciboGrafico
  Left = 268
  Top = 161
  Width = 808
  Height = 608
  HorzScrollBar.Position = 13
  Caption = 'Recibo'
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
    Left = -13
    Top = 0
    Width = 813
    Height = 518
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = Titulo_receber1
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
    Page.PaperSize = Custom
    Page.Values = (
      20.000000000000000000
      1370.541666666667000000
      20.000000000000000000
      2151.062500000000000000
      50.000000000000000000
      50.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    ReportTitle = 'Relat'#243'rio de Comiss'#227'o de Gerentes'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object zrbDetalhe: TQRBand
      Left = 19
      Top = 8
      Width = 775
      Height = 475
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
        1256.770833333333000000
        2050.520833333333000000)
      BandType = rbDetail
      object QRShape2: TQRShape
        Left = 7
        Top = 125
        Width = 750
        Height = 344
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          910.166666666666800000
          18.520833333333330000
          330.729166666666700000
          1984.375000000000000000)
        Shape = qrsRectangle
      end
      object QRShape1: TQRShape
        Left = 7
        Top = 4
        Width = 750
        Height = 115
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          304.270833333333300000
          18.520833333333330000
          10.583333333333330000
          1984.375000000000000000)
        Shape = qrsRectangle
      end
      object qriLogomarca: TQRImage
        Left = 19
        Top = 9
        Width = 304
        Height = 102
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          269.875000000000000000
          50.270833333333330000
          23.812500000000000000
          804.333333333333300000)
        AutoSize = True
      end
      object zrlTitulo: TQRLabel
        Left = 24
        Top = 135
        Width = 93
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          63.500000000000000000
          357.187500000000000000
          246.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'RECIBO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 18
      end
      object zrlSifrao: TQRLabel
        Left = 547
        Top = 135
        Width = 31
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1447.270833333333000000
          357.187500000000000000
          82.020833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'R$'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 18
      end
      object zrlTelefoneLoja: TQRLabel
        Left = 561
        Top = 14
        Width = 143
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666670000
          1484.312500000000000000
          37.041666666666670000
          378.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0xx85 433.4646'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object zrlEnderecoLoja: TQRLabel
        Left = 525
        Top = 44
        Width = 224
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1389.062500000000000000
          116.416666666666700000
          592.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Av. Heraclito Graca, 210 - Centro - 60140-060'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object zrlCidadeEstado: TQRLabel
        Left = 590
        Top = 69
        Width = 85
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1561.041666666667000000
          182.562500000000000000
          224.895833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fortaleza - Cear'#225
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object zrlEMailLoja: TQRLabel
        Left = 557
        Top = 91
        Width = 155
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1473.729166666667000000
          240.770833333333300000
          410.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'www.lbmmoveis.com.br'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object zrlDescCliente: TQRLabel
        Left = 24
        Top = 200
        Width = 719
        Height = 49
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          129.645833333333300000
          63.500000000000000000
          529.166666666666700000
          1902.354166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Recebemos de'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object zrlDataExtenso: TQRLabel
        Left = 24
        Top = 323
        Width = 387
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          854.604166666666800000
          1023.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlDataExtenso'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object zrlNomeEmpresa: TQRLabel
        Left = 24
        Top = 422
        Width = 304
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          1116.541666666667000000
          804.333333333333200000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'LBM - M'#243'veis Equip. e Acess p/ Escrit'#243'rio Ltda.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object zrlCNPJ: TQRLabel
        Left = 24
        Top = 436
        Width = 304
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          1153.583333333333000000
          804.333333333333200000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'zrlCNPJ'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object zrlValor: TQRLabel
        Left = 584
        Top = 135
        Width = 89
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1545.166666666667000000
          357.187500000000000000
          235.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'zrlValor'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 18
      end
      object zrlCodigoTRC: TQRLabel
        Left = 646
        Top = 261
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1709.208333333333000000
          690.562500000000000000
          211.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'zrlCodigoTRC'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object zrlDescCodigoTRC: TQRLabel
        Left = 610
        Top = 261
        Width = 30
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1613.958333333333000000
          690.562500000000000000
          79.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TRC:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object zrlDescVencimento: TQRLabel
        Left = 394
        Top = 261
        Width = 127
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1042.458333333333000000
          690.562500000000000000
          336.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Vencimento do T'#237'tulo:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object zrlVencimento: TQRLabel
        Left = 523
        Top = 261
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
          690.562500000000000000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'zrlVencimento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object zrlMensagemCheque: TQRLabel
        Left = 24
        Top = 286
        Width = 380
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          756.708333333333300000
          1005.416666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Este recibo s'#243' ter'#225' validade ap'#243's a compesa'#231#227'o do(s) cheque(s).'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object zrlAVistaPrazo: TQRLabel
        Left = 24
        Top = 261
        Width = 134
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          690.562500000000000000
          354.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Proveniente de venda a'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object QRTextFilter1: TQRTextFilter
    Left = 658
    Top = 412
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
  object Titulo_receber1: TTitulo_receber
    DatabaseName = 'DBguerra'
    Filtered = True
    SQL.Strings = (
      'SELECT * FROM TITULO_A_RECEBER'
      'WHERE CNC_CODIGO=:CNC_CODIGO '
      'AND PDV_CODIGO=:PDV_CODIGO'
      'AND TRC_SITUACAO<>5')
    CNCOrigem = 0
    CentroDeCusto = -1
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = -1
    Maquina = -1
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
    Left = 160
    Top = 358
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
  object CentroCusto1: TCentroCusto
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM CENTRO_DE_CUSTO'
      'WHERE CNC_CODIGO=:CNC_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = -1
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = -1
    Maquina = -1
    Tabela = 'CENTRO_DE_CUSTO'
    Logradouro = 0
    RecebeDados = False
    Left = 272
    Top = 346
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
    Left = 68
    Top = 344
  end
  object Cliente1: TCliente
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM CLIENTE'
      'WHERE CNC_CODIGO=:CNC_CODIGO'
      'AND CLI_CODIGO=:CLI_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = -1
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = -1
    Maquina = -1
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
    Left = 358
    Top = 380
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

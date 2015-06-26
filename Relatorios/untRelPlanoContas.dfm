object frmRelPlanoContas: TfrmRelPlanoContas
  Left = 233
  Top = 103
  Width = 696
  Height = 480
  Caption = 'frmRelPlanoContas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = 5
    Top = 5
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = QueryGrupo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRSTRINGSBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object ColumnHeaderBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 23
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
        60.854166666666680000
        1899.708333333333000000)
      BandType = rbColumnHeader
      object QRLabel1: TQRLabel
        Left = 5
        Top = 3
        Width = 40
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          7.937500000000000000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Grupo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object DetailBandGrupo: TQRBand
      Left = 38
      Top = 61
      Width = 718
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = DetailBandGrupoBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333340000
        1899.708333333333000000)
      BandType = rbDetail
      object QRLabel8: TQRLabel
        Left = 5
        Top = 5
        Width = 58
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          13.229166666666670000
          153.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel8'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRSubDetailSubGrupo: TQRSubDetail
      Left = 38
      Top = 111
      Width = 718
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRSubDetailSubGrupoBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333340000
        1899.708333333333000000)
      Master = QuickRep1
      DataSet = QuerySubGrupo
      PrintBefore = False
      PrintIfEmpty = True
      object QRLabel5: TQRLabel
        Left = 5
        Top = 5
        Width = 58
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          13.229166666666670000
          153.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel5'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRSubDetailAbrangente: TQRSubDetail
      Left = 38
      Top = 161
      Width = 718
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRSubDetailAbrangenteBeforePrint
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333340000
        1899.708333333333000000)
      Master = QRSubDetailSubGrupo
      DataSet = QueryAbrangente
      PrintBefore = False
      PrintIfEmpty = True
      object QRLabel6: TQRLabel
        Left = 5
        Top = 5
        Width = 58
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          13.229166666666670000
          153.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel6'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRSubDetailTitulos: TQRSubDetail
      Left = 38
      Top = 211
      Width = 718
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRSubDetailTitulosBeforePrint
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333340000
        1899.708333333333000000)
      Master = QRSubDetailAbrangente
      DataSet = Titulo_receber1
      PrintBefore = False
      PrintIfEmpty = True
      object QRLabel7: TQRLabel
        Left = 10
        Top = 5
        Width = 58
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          26.458333333333330000
          13.229166666666670000
          153.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel7'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRGroup1: TQRGroup
      Left = 38
      Top = 86
      Width = 718
      Height = 25
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
        66.145833333333340000
        1899.708333333333000000)
      Master = QRSubDetailSubGrupo
      ReprintOnNewPage = False
      object QRLabel2: TQRLabel
        Left = 5
        Top = 5
        Width = 65
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          13.229166666666670000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SubGrupo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRGroup2: TQRGroup
      Left = 38
      Top = 136
      Width = 718
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333340000
        1899.708333333333000000)
      Master = QRSubDetailAbrangente
      ReprintOnNewPage = False
      object QRLabel3: TQRLabel
        Left = 5
        Top = 5
        Width = 75
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          13.229166666666670000
          198.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Abrangente'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRGroup3: TQRGroup
      Left = 38
      Top = 186
      Width = 718
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333340000
        1899.708333333333000000)
      Master = QRSubDetailTitulos
      ReprintOnNewPage = False
      object QRLabel4: TQRLabel
        Left = 5
        Top = 5
        Width = 105
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          13.229166666666670000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Contas de Caixa'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object QueryGrupo: TQuery
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM GRUPO_CONTA_DE_CAIXA'
      'WHERE GCC_CODIGO =:GRUPO')
    Left = 415
    Top = 66
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'GRUPO'
        ParamType = ptUnknown
      end>
  end
  object QuerySubGrupo: TQuery
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM SUBGRUPO_CONTA_DE_CAIXA'
      'WHERE GCC_CODIGO =:GRUPO')
    Left = 305
    Top = 115
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'GRUPO'
        ParamType = ptUnknown
      end>
  end
  object QueryAbrangente: TQuery
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM ABRANGENTES_CONTA_DE_CAIXA'
      'WHERE ACC_CODIGO =:ABRANGENTE'
      ' ')
    Left = 455
    Top = 165
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ABRANGENTE'
        ParamType = ptUnknown
      end>
  end
  object Titulo_receber1: TTitulo_receber
    DatabaseName = 'DBguerra'
    Filtered = True
    SQL.Strings = (
      'SELECT DISTINCT'
      #9'T1.CCX_CODIGO,T1.CLI_CODIGO,T1.CNC_CODIGO,'
      '                T1.TRC_DTORIGINAL,'
      #9'T1.PDV_CODIGO,T1.TRC_CODIGO,T1.TRC_CRED_CLI,'
      #9'T1.TRC_CUSTODIA,T1.TRC_NUMERO,T1.TRC_PAGAMENTO,'
      #9'T1.TRC_SEQUENCIA,T1.TRC_SITUACAO,T1.TRC_TIPO_DOC,'
      #9'T1.TRC_TIPO_PAG,T1.TRC_VALOR,T1.TRC_VALOR_PAGO,'
      #9'T1.TRC_VENCIMENTO,T1.AGF_CODIGO,T2.CLI_RZ_SOCIAL'
      '                DATEPART(mm, T1.TRC_VENCIMENTO) AS Mes, '
      '                DATEPART(yyyy, T1.TRC_VENCIMENTO) AS Ano '#39'+'
      'FROM'#9'Titulo_a_receber T1, Cliente T2, CONTA_DE_CAIXA T3 '
      'WHERE'
      '       (T1.CLI_CODIGO = T2.CLI_CODIGO) AND'
      '       (T1.CNC_CLIENTE = T2.CNC_CODIGO) AND'
      '       (T1.TRC_SITUACAO IN (0,1,8,9)) AND'
      '       (T1.TRC_VENCIMENTO>=:DATA_INI) AND'
      '       (T1.TRC_VENCIMENTO<:DATA_FIM) AND'
      '       (T1.CNC_CODIGO=:CNC_CODIGO) AND'
      '       (T2.CNC_CODIGO=T1.CNC_CODIGO) AND'
      '       (T3.CCX_CODIGO=T1.CCX_CODIGO)'
      '       (T3.CCX_SITUACAO=0)'
      'ORDER BY'
      '       T2.CLI_RZ_SOCIAL,T1.TRC_SEQUENCIA ASC')
    CConfiguracao = DM.Configuracao1
    CNCOrigem = 0
    CentroDeCusto = 2
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 100
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
    Left = 576
    Top = 215
  end
end

object rpt_OrcamentoPrevisto: Trpt_OrcamentoPrevisto
  Left = 199
  Top = 107
  Width = 825
  Height = 479
  Caption = 'rpt_OrcamentoPrevisto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object report: TSZReport
    Left = 0
    Top = 0
    Width = 138
    Height = 65
    Columns = 1
    ColumnSpace = 0
    DataSet = qrOrcamento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Margins.Left = 1
    Margins.Top = 4
    Margins.Right = 1
    Margins.Bottom = 2
    Options.Copies = 1
    Options.Destination = zrdLPT1
    Options.Escapes.BoldOn = #15#27'2'
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
    object zrb_detalhe: TSZRBand
      Left = 1
      Top = 15
      Width = 136
      Height = 2
      BeforePrint = zrb_detalheBeforePrint
      BandType = rbDetail
      ForceNewColumn = False
      ForceNewPage = False
      object SZRDBText12: TSZRDBText
        Left = 93
        Top = 0
        Width = 24
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = qrOrcamento
        DataField = 'IOR_TIPO_ITEM'
      end
      object SZRDBText13: TSZRDBText
        Left = 118
        Top = 0
        Width = 17
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = qrOrcamento
        DataField = 'IOR_VALOR'
      end
      object SZRDBText14: TSZRDBText
        Left = 1
        Top = 1
        Width = 134
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = qrOrcamento
        DataField = 'IOR_OBS'
      end
      object SZRDBText15: TSZRDBText
        Left = 1
        Top = 0
        Width = 7
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = qrOrcamento
        DataField = 'IOR_ITEM'
      end
      object szrlDescricao: TSZRLabel
        Left = 9
        Top = 0
        Width = 13
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'szrlDescricao'
      end
    end
    object zrbGrupoPDV: TSZRGroup
      Left = 1
      Top = 8
      Width = 136
      Height = 7
      BeforePrint = zrbGrupoPDVBeforePrint
      Expression = 'ORC_CODIGO+CNC_CODIGO'
      Master = report
      ForceNewColumn = False
      ForceNewPage = False
      object SZRLabel2: TSZRLabel
        Left = 1
        Top = 0
        Width = 7
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Codigo:'
      end
      object SZRLabel6: TSZRLabel
        Left = 1
        Top = 1
        Width = 10
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Descricao:'
      end
      object SZRLabel7: TSZRLabel
        Left = 20
        Top = 0
        Width = 14
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Data Cadastro:'
      end
      object SZRLabel8: TSZRLabel
        Left = 56
        Top = 0
        Width = 14
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Data Alterado:'
      end
      object SZRDBText1: TSZRDBText
        Left = 9
        Top = 0
        Width = 10
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = qrOrcamento
        DataField = 'ORC_CODIGO'
      end
      object SZRDBText3: TSZRDBText
        Left = 35
        Top = 0
        Width = 20
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = qrOrcamento
        DataField = 'ORC_DT_CADASTRO'
      end
      object SZRDBText4: TSZRDBText
        Left = 71
        Top = 0
        Width = 20
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = qrOrcamento
        DataField = 'ORC_DT_ALTERADO'
      end
      object SZRDBText6: TSZRDBText
        Left = 12
        Top = 1
        Width = 80
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = qrOrcamento
        DataField = 'ORC_DESCRICAO'
      end
      object SZRLabel9: TSZRLabel
        Left = 92
        Top = 0
        Width = 9
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Situacao:'
      end
      object SZRDBText7: TSZRDBText
        Left = 102
        Top = 0
        Width = 15
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = qrOrcamento
        DataField = 'ORC_SITUACAO'
      end
      object SZRLabel10: TSZRLabel
        Left = 118
        Top = 0
        Width = 9
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Total R$:'
      end
      object SZRDBText8: TSZRDBText
        Left = 128
        Top = 0
        Width = 8
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = qrOrcamento
        DataField = 'ORC_VALOR'
      end
      object SZRLabel11: TSZRLabel
        Left = 93
        Top = 1
        Width = 8
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Mes/Ano:'
      end
      object SZRDBText9: TSZRDBText
        Left = 102
        Top = 1
        Width = 7
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = qrOrcamento
        DataField = 'ORC_MES_ANO'
      end
      object SZRLabel13: TSZRLabel
        Left = 1
        Top = 2
        Width = 14
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Centro Orcado:'
      end
      object SZRDBText10: TSZRDBText
        Left = 16
        Top = 2
        Width = 13
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = qrOrcamento
        DataField = 'CNC_RZ_SOCIAL'
      end
      object SZRLabel15: TSZRLabel
        Left = 1
        Top = 3
        Width = 11
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Observacao:'
      end
      object SZRDBText11: TSZRDBText
        Left = 13
        Top = 3
        Width = 123
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = qrOrcamento
        DataField = 'ORC_OBS'
      end
      object SZRLabel16: TSZRLabel
        Left = 0
        Top = 6
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
      object SZRLabel17: TSZRLabel
        Left = 1
        Top = 5
        Width = 4
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Item'
      end
      object SZRLabel18: TSZRLabel
        Left = 9
        Top = 5
        Width = 17
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Descricao do Item'
      end
      object SZRLabel19: TSZRLabel
        Left = 93
        Top = 5
        Width = 4
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Tipo'
      end
      object SZRLabel20: TSZRLabel
        Left = 118
        Top = 5
        Width = 8
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Valor R$'
      end
      object SZRLabel1: TSZRLabel
        Left = 113
        Top = 1
        Width = 9
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'SZRLabel1'
      end
      object SZRLabel3: TSZRLabel
        Left = 113
        Top = 2
        Width = 9
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'SZRLabel3'
      end
    end
    object SZRBand2: TSZRBand
      Left = 1
      Top = 17
      Width = 136
      Height = 3
      BandType = rbPageFooter
      ForceNewColumn = False
      ForceNewPage = False
      object ZRLabel15: TSZRLabel
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
      object ZRLabel16: TSZRLabel
        Left = 0
        Top = 2
        Width = 34
        Height = 1
        AlignToBand = False
        FontStyle = [esItalic]
        WordWrap = True
        Caption = 'Lantech Conectividade'
      end
      object ZRSysData3: TSZRSysData
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
    end
    object SZRBand3: TSZRBand
      Left = 1
      Top = 4
      Width = 136
      Height = 4
      BandType = rbPageHeader
      ForceNewColumn = False
      ForceNewPage = False
      object ZRLabel2: TSZRLabel
        Left = 0
        Top = 1
        Width = 38
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'SACI - Relatorio de Orcamento Previsto'
      end
      object ZRSysData2: TSZRSysData
        Left = 104
        Top = 1
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
        Left = 121
        Top = 0
        Width = 15
        Height = 1
        Alignment = taRightJustify
        AlignToBand = True
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Centro de Custo'
      end
    end
  end
  object qrOrcamento: TQuery
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      
        'SELECT ORC.ORC_CODIGO, CNC_CENTRO_ORCADO, CNC_RZ_SOCIAL, ORC_DES' +
        'CRICAO, ORC_MES_ANO, ORC_VALOR,'
      'ORC_DT_CADASTRO, ORC_DT_ALTERADO, ORC_OBS,'
      #9'CASE ORC_SITUACAO '
      '  '#9'  WHEN 0 THEN '#39'AGUARDANDO'#39
      '  '#9'  WHEN 1 THEN '#39'PROCESSADO'#39
      '  '#9'  WHEN 2 THEN '#39'CANCELADO'#39
      #9'END AS ORC_SITUACAO,'
      'IOR_CODIGO, IOR_ITEM, IOR_VALOR, '
      #9'CASE IOR_TIPO_ITEM'
      #9'  WHEN 1 THEN '#39'PRODUTO'#39
      #9'  WHEN 2 THEN '#39'CONTA DE CAIXA'#39
      #9'END AS IOR_TIPO_ITEM, '
      'IOR_OBS'
      'FROM ORCAMENTO ORC'
      'INNER JOIN CENTRO_DE_CUSTO CNC'
      'ON CNC.CNC_CODIGO=ORC.CNC_CENTRO_ORCADO'
      'INNER JOIN ITEM_DE_ORCAMENTO IOR'
      'ON IOR.ORC_CODIGO=ORC.ORC_CODIGO'
      'WHERE ORC.CNC_CENTRO_ORCADO=:CNC_CODIGO AND '
      'ORC.ORC_CODIGO=:ORC_CODIGO')
    Left = 231
    Top = 238
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CNC_CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ORC_CODIGO'
        ParamType = ptUnknown
      end>
    object qrOrcamentoORC_CODIGO: TIntegerField
      FieldName = 'ORC_CODIGO'
    end
    object qrOrcamentoCNC_CENTRO_ORCADO: TIntegerField
      FieldName = 'CNC_CENTRO_ORCADO'
    end
    object qrOrcamentoCNC_RZ_SOCIAL: TStringField
      FieldName = 'CNC_RZ_SOCIAL'
      FixedChar = True
      Size = 60
    end
    object qrOrcamentoORC_DESCRICAO: TStringField
      FieldName = 'ORC_DESCRICAO'
      FixedChar = True
      Size = 80
    end
    object qrOrcamentoORC_DT_CADASTRO: TDateTimeField
      FieldName = 'ORC_DT_CADASTRO'
    end
    object qrOrcamentoORC_DT_ALTERADO: TDateTimeField
      FieldName = 'ORC_DT_ALTERADO'
    end
    object qrOrcamentoORC_OBS: TStringField
      FieldName = 'ORC_OBS'
      FixedChar = True
      Size = 255
    end
    object qrOrcamentoORC_SITUACAO: TStringField
      FieldName = 'ORC_SITUACAO'
      FixedChar = True
      Size = 10
    end
    object qrOrcamentoIOR_CODIGO: TIntegerField
      FieldName = 'IOR_CODIGO'
    end
    object qrOrcamentoIOR_ITEM: TIntegerField
      FieldName = 'IOR_ITEM'
    end
    object qrOrcamentoIOR_TIPO_ITEM: TStringField
      FieldName = 'IOR_TIPO_ITEM'
      FixedChar = True
      Size = 14
    end
    object qrOrcamentoIOR_OBS: TStringField
      FieldName = 'IOR_OBS'
      FixedChar = True
      Size = 255
    end
  end
  object qConsultaItem: TQuery
    DatabaseName = 'DBGuerra'
    Left = 216
    Top = 289
  end
end

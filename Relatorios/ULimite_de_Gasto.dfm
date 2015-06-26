object rpt_Limite_Gasto: Trpt_Limite_Gasto
  Left = 314
  Top = 116
  Width = 816
  Height = 627
  Caption = 'rpt_Limite_Gasto'
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
    DataSet = Limite_Gasto1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Margins.Left = 1
    Margins.Top = 2
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
    object zrTitulo: TSZRBand
      Left = 1
      Top = 2
      Width = 136
      Height = 3
      BeforePrint = zrTituloBeforePrint
      BandType = rbPageHeader
      ForceNewColumn = False
      ForceNewPage = False
      object ZRLabel2: TSZRLabel
        Left = 0
        Top = 1
        Width = 35
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'SIAC - Relatorio de Contas de Caixa'
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
    object zrlDetail: TSZRBand
      Left = 1
      Top = 9
      Width = 136
      Height = 3
      BandType = rbDetail
      ForceNewColumn = False
      ForceNewPage = False
      object ZRDBText1: TSZRDBText
        Left = 0
        Top = 0
        Width = 6
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Limite_Gasto1
        DataField = 'LMG_CODIGO'
      end
      object ZRDBText2: TSZRDBText
        Left = 7
        Top = 0
        Width = 71
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Limite_Gasto1
        DataField = 'CCX_DESCRICAO'
      end
      object ZRDBText5: TSZRDBText
        Left = 79
        Top = 0
        Width = 5
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Limite_Gasto1
        DataField = 'CCX_DC'
      end
      object SZRDBText1: TSZRDBText
        Left = 7
        Top = 1
        Width = 129
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Limite_Gasto1
        DataField = 'LMG_OBSERVACAO'
      end
      object SZRDBText3: TSZRDBText
        Left = 98
        Top = 0
        Width = 12
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Limite_Gasto1
        DataField = 'CCX_CONTABIL_1'
      end
      object SZRDBText4: TSZRDBText
        Left = 111
        Top = 0
        Width = 12
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Limite_Gasto1
        DataField = 'CCX_CONTABIL_2'
      end
      object SZRDBText5: TSZRDBText
        Left = 124
        Top = 0
        Width = 12
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Limite_Gasto1
        DataField = 'CCX_HISTORICO_CONTABIL'
      end
      object ZRExpression1: TSZRExpression
        Left = 85
        Top = 0
        Width = 12
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Currency = False
        ResetAfterPrint = False
        Expression = 'LMG_LIMITE_MENSAL'
        Mask = '0.00'
      end
    end
    object zrPageFooter: TSZRBand
      Left = 1
      Top = 14
      Width = 136
      Height = 2
      BeforePrint = zrPageFooterBeforePrint
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
          '--------'
      end
      object ZRLabel4: TSZRLabel
        Left = 0
        Top = 1
        Width = 32
        Height = 1
        AlignToBand = False
        FontStyle = [esItalic]
        WordWrap = True
        Caption = 'EmpresaDesenvolvedora'
      end
    end
    object zrbGrupoGrupo: TSZRGroup
      Left = 1
      Top = 5
      Width = 136
      Height = 1
      Expression = 'CNC_CODIGO'
      FooterBand = zrbRodapeGrupo
      Master = report
      ForceNewColumn = False
      ForceNewPage = False
      object SZRLabel1: TSZRLabel
        Left = 0
        Top = 0
        Width = 16
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Centro de Custo:'
      end
      object SZRDBText6: TSZRDBText
        Left = 17
        Top = 0
        Width = 3
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Limite_Gasto1
        DataField = 'CNC_CODIGO'
      end
      object SZRDBText7: TSZRDBText
        Left = 21
        Top = 0
        Width = 13
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Limite_Gasto1
        DataField = 'CNC_RZ_SOCIAL'
      end
      object SZRLabel2: TSZRLabel
        Left = 20
        Top = 0
        Width = 1
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = '-'
      end
    end
    object zrbRodapeGrupo: TSZRBand
      Left = 1
      Top = 12
      Width = 136
      Height = 2
      BandType = rbGroupFooter
      ForceNewColumn = False
      ForceNewPage = False
      object SZRLabel4: TSZRLabel
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
      Height = 3
      BeforePrint = SZRGroup1BeforePrint
      Expression = 'CCX_GRUPO'
      FooterBand = SZRBand1
      Master = report
      ForceNewColumn = False
      ForceNewPage = False
      object SZRLabel7: TSZRLabel
        Left = 0
        Top = 0
        Width = 6
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Grupo:'
      end
      object SZRLabel8: TSZRLabel
        Left = 7
        Top = 0
        Width = 9
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'SZRLabel8'
      end
      object SZRLabel9: TSZRLabel
        Left = 0
        Top = 1
        Width = 6
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Cod.'
      end
      object SZRLabel10: TSZRLabel
        Left = 7
        Top = 1
        Width = 9
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Descricao'
      end
      object SZRLabel11: TSZRLabel
        Left = 79
        Top = 1
        Width = 5
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Tipo'
      end
      object SZRLabel12: TSZRLabel
        Left = 85
        Top = 1
        Width = 12
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Limite Gasto'
      end
      object SZRLabel13: TSZRLabel
        Left = 0
        Top = 2
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
      object SZRLabel14: TSZRLabel
        Left = 98
        Top = 1
        Width = 12
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Devedora'
      end
      object SZRLabel15: TSZRLabel
        Left = 111
        Top = 1
        Width = 12
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Credora'
      end
      object SZRLabel16: TSZRLabel
        Left = 124
        Top = 1
        Width = 12
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Historico'
      end
    end
    object SZRBand1: TSZRBand
      Left = 1
      Top = 12
      Width = 136
      Height = 0
      BandType = rbGroupFooter
      ForceNewColumn = False
      ForceNewPage = False
    end
  end
  object Limite_Gasto1: TQuery
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT CNC.CNC_CODIGO,CNC_RZ_SOCIAL,CCX_GRUPO,LMG_CODIGO,'
      'CCX_DESCRICAO,CCX_DC,LMG_LIMITE_MENSAL,CCX_CONTABIL_1,'
      'CCX_CONTABIL_2,CCX_HISTORICO_CONTABIL,LMG_OBSERVACAO '
      'FROM LIMITE_GASTO LMG'
      'INNER JOIN CONTA_DE_CAIXA CCX'
      'ON CCX.CCX_CODIGO=LMG.CCX_CODIGO'
      'INNER JOIN CENTRO_DE_CUSTO CNC'
      'ON CNC.CNC_CODIGO=LMG.CNC_CODIGO'
      'WHERE (LMG_SITUACAO = 0 OR LMG_SITUACAO IS NULL)'
      'group BY CNC.CNC_CODIGO,CNC_RZ_SOCIAL,CCX_GRUPO,LMG_CODIGO,'
      'CCX_DESCRICAO,CCX_DC,LMG_LIMITE_MENSAL,CCX_CONTABIL_1,'
      'CCX_CONTABIL_2,CCX_HISTORICO_CONTABIL,LMG_OBSERVACAO')
    Left = 15
    Top = 234
    object Limite_Gasto1CNC_CODIGO: TIntegerField
      FieldName = 'CNC_CODIGO'
    end
    object Limite_Gasto1CNC_RZ_SOCIAL: TStringField
      FieldName = 'CNC_RZ_SOCIAL'
      FixedChar = True
      Size = 60
    end
    object Limite_Gasto1LMG_CODIGO: TIntegerField
      FieldName = 'LMG_CODIGO'
    end
    object Limite_Gasto1CCX_DESCRICAO: TStringField
      FieldName = 'CCX_DESCRICAO'
      FixedChar = True
      Size = 40
    end
    object Limite_Gasto1CCX_DC: TStringField
      FieldName = 'CCX_DC'
      FixedChar = True
    end
    object Limite_Gasto1LMG_LIMITE_MENSAL: TFloatField
      FieldName = 'LMG_LIMITE_MENSAL'
    end
    object Limite_Gasto1CCX_CONTABIL_1: TStringField
      FieldName = 'CCX_CONTABIL_1'
      FixedChar = True
    end
    object Limite_Gasto1CCX_HISTORICO_CONTABIL: TStringField
      FieldName = 'CCX_HISTORICO_CONTABIL'
      FixedChar = True
    end
    object Limite_Gasto1LMG_OBSERVACAO: TStringField
      FieldName = 'LMG_OBSERVACAO'
      FixedChar = True
      Size = 255
    end
    object Limite_Gasto1CCX_CONTABIL_2: TStringField
      FieldName = 'CCX_CONTABIL_2'
      FixedChar = True
    end
    object Limite_Gasto1CCX_GRUPO: TIntegerField
      FieldName = 'CCX_GRUPO'
    end
  end
end

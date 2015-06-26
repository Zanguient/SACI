object rpt_Log: Trpt_Log
  Left = 92
  Top = 119
  Width = 952
  Height = 752
  Caption = 'Relat'#243'rio de Log'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object report: TSZReport
    Left = 7
    Top = 0
    Width = 132
    Height = 65
    Columns = 1
    ColumnSpace = 0
    DataSet = Log1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
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
    Options.PageWidth = 132
    Options.PaperType = zptSheet
    object ZRBand1: TSZRBand
      Left = 1
      Top = 1
      Width = 130
      Height = 6
      BeforePrint = ZRBand1BeforePrint
      BandType = rbPageHeader
      ForceNewColumn = False
      ForceNewPage = False
      object ZRLabel2: TSZRLabel
        Left = 0
        Top = 1
        Width = 44
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'SIAC - Relatorio de Auditoria do sistema'
      end
      object ZRSysData2: TSZRSysData
        Left = 90
        Top = 1
        Width = 40
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
        Width = 44
        Height = 1
        AlignToBand = False
        FontStyle = [esUnderline]
        BeforePrint = ZRLabel3BeforePrint
        WordWrap = True
        Caption = 'Eletro Guerra'
      end
      object ZRLabel5: TSZRLabel
        Left = 0
        Top = 3
        Width = 130
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          '================================================================' +
          '================================================================' +
          '=='
      end
      object ZRLabel1: TSZRLabel
        Left = 90
        Top = 0
        Width = 40
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Centro de Custo'
      end
      object SZRLabel2: TSZRLabel
        Left = 0
        Top = 5
        Width = 130
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--'
      end
      object SZRLabel3: TSZRLabel
        Left = 0
        Top = 4
        Width = 8
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Codigo'
      end
      object SZRLabel4: TSZRLabel
        Left = 10
        Top = 4
        Width = 20
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Modulo'
      end
      object SZRLabel5: TSZRLabel
        Left = 31
        Top = 4
        Width = 29
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'SubModulo'
      end
      object SZRLabel6: TSZRLabel
        Left = 61
        Top = 4
        Width = 36
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Operacao do Sistema'
      end
      object SZRLabel7: TSZRLabel
        Left = 107
        Top = 4
        Width = 19
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Data/Hora'
      end
      object SZRLabel8: TSZRLabel
        Left = 98
        Top = 4
        Width = 8
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Cod.Ent.'
      end
      object zrlFiltros: TSZRLabel
        Left = 24
        Top = 2
        Width = 106
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel11: TSZRLabel
        Left = 11
        Top = 2
        Width = 1
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'a'
      end
      object zrlDataINI: TSZRLabel
        Left = 0
        Top = 2
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object zrlDataFIM: TSZRLabel
        Left = 13
        Top = 2
        Width = 10
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRLabel9: TSZRLabel
        Left = 127
        Top = 4
        Width = 3
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'USU'
      end
    end
    object zrbGrupoUSU: TSZRGroup
      Left = 1
      Top = 7
      Width = 130
      Height = 1
      BeforePrint = zrbGrupoUSUBeforePrint
      Expression = 'CNC_CODIGO+USU_CODIGO'
      Master = report
      ForceNewColumn = False
      ForceNewPage = False
      object SZRLabel1: TSZRLabel
        Left = 0
        Top = 0
        Width = 12
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = '*** Usuario:'
      end
      object zrlUsuarioResp: TSZRLabel
        Left = 13
        Top = 0
        Width = 47
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
    end
    object ZRBand3: TSZRBand
      Left = 1
      Top = 13
      Width = 130
      Height = 2
      BeforePrint = ZRBand3BeforePrint
      BandType = rbPageFooter
      ForceNewColumn = False
      ForceNewPage = False
      object ZRSysData1: TSZRSysData
        Left = 119
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
        Width = 130
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--'
      end
      object ZRLabel4: TSZRLabel
        Left = 0
        Top = 1
        Width = 26
        Height = 1
        AlignToBand = False
        FontStyle = [esItalic]
        WordWrap = True
        Caption = 'EmpresaDesenvolvedora'
      end
      object zrlUsuario: TSZRLabel
        Left = 27
        Top = 1
        Width = 44
        Height = 1
        AlignToBand = False
        FontStyle = [esItalic]
        WordWrap = True
      end
    end
    object zrbDetalhe: TSZRBand
      Left = 1
      Top = 8
      Width = 130
      Height = 3
      BeforePrint = zrbDetalheBeforePrint
      BandType = rbDetail
      ForceNewColumn = False
      ForceNewPage = False
      object SZRDBText2: TSZRDBText
        Left = 0
        Top = 0
        Width = 9
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Log1
        DataField = 'LOG_CODIGO'
      end
      object SZRDBText3: TSZRDBText
        Left = 10
        Top = 0
        Width = 20
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Log1
        DataField = 'MDL_DESCRICAO'
      end
      object SZRDBText4: TSZRDBText
        Left = 31
        Top = 0
        Width = 29
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Log1
        DataField = 'SML_DESCRICAO'
      end
      object SZRDBText6: TSZRDBText
        Left = 107
        Top = 0
        Width = 19
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Log1
        DataField = 'LOG_DATA_HORA'
      end
      object SZRDBText7: TSZRDBText
        Left = 10
        Top = 1
        Width = 120
        Height = 2
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Log1
        DataField = 'LOG_TIPO_ENT'
      end
      object SZRDBText8: TSZRDBText
        Left = 98
        Top = 0
        Width = 8
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Log1
        DataField = 'LOG_CODIGO_ENT'
      end
      object zrlOperacaoDoSistema: TSZRLabel
        Left = 61
        Top = 0
        Width = 36
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
      object SZRDBText1: TSZRDBText
        Left = 127
        Top = 0
        Width = 3
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Log1
        DataField = 'USU_CODIGO'
      end
      object SZRLabel12: TSZRLabel
        Left = 1
        Top = 1
        Width = 4
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Maq:'
      end
      object zrlMaquina: TSZRLabel
        Left = 5
        Top = 1
        Width = 4
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
    end
    object zrlRodape: TSZRBand
      Left = 1
      Top = 11
      Width = 130
      Height = 2
      BeforePrint = zrlRodapeBeforePrint
      BandType = rbSummary
      ForceNewColumn = False
      ForceNewPage = False
      object SZRLabel10: TSZRLabel
        Left = 0
        Top = 0
        Width = 130
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '--'
      end
      object SZRLabel13: TSZRLabel
        Left = 0
        Top = 1
        Width = 19
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Total de Registros:'
      end
      object zrlTotalRegistros: TSZRLabel
        Left = 20
        Top = 1
        Width = 8
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
    end
  end
  object Log1: TLog
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT DISTINCT T1.*, T2.OPS_OPERACAO, T3.MDL_DESCRICAO,'
      'T4.SML_DESCRICAO, T5.USU_NOME'
      
        'FROM Log T1, Operacao_do_Sistema T2, Modulo T3, Submodulo T4, Us' +
        'uario T5'
      
        'WHERE(T1.CNC_CODIGO=:CNC_CODIGO) AND (T5.CNC_CODIGO=T1.CNC_CODIG' +
        'O) AND'
      '(T1.OPS_CODIGO = T2.OPS_CODIGO) AND'
      '(T2.SML_CODIGO = T4.SML_CODIGO) AND'
      '(T4.MDL_CODIGO = T3.MDL_CODIGO) AND'
      '(T1.USU_CODIGO = T5.USU_CODIGO) AND'
      '(T1.LOG_DATA_HORA>=:DATAINI) AND (T1.LOG_DATA_HORA<:DATAFIM)'
      'ORDER BY T5.USU_NOME ASC,T1.LOG_CODIGO DESC'
      ' '
      ' '
      ' ')
    CncCodigoEnt = 0
    CodigoCNC = 0
    CodigoEnt = 0
    CodigoLOG = 0
    CodigoOPS = 0
    CodigoUSU = 0
    MaquinaLOG = 0
    Left = 23
    Top = 226
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CNC_CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end>
  end
end

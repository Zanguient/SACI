object rpt_Permissao: Trpt_Permissao
  Left = 171
  Top = 111
  Width = 952
  Height = 776
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
    Left = 2
    Top = 0
    Width = 132
    Height = 65
    Columns = 1
    ColumnSpace = 0
    DataSet = Permissao1
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
    object zrbCabecalhoPagina: TSZRBand
      Left = 1
      Top = 1
      Width = 130
      Height = 6
      BeforePrint = zrbCabecalhoPaginaBeforePrint
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
        Caption = 'SIAC - Relatorio de Permissoes'
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
        FontStyle = []
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
        Caption = 'Cod.OPS'
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
        Width = 49
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Operacao do Sistema'
      end
      object SZRLabel7: TSZRLabel
        Left = 111
        Top = 4
        Width = 19
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 'Data/Hora'
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
    end
    object zrbGrupoUSU: TSZRGroup
      Left = 1
      Top = 7
      Width = 130
      Height = 1
      BeforePrint = zrbGrupoUSUBeforePrint
      Expression = 'USU_NOME'
      Master = report
      ForceNewColumn = False
      ForceNewPage = True
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
    object zrbRodapePagina: TSZRBand
      Left = 1
      Top = 11
      Width = 130
      Height = 2
      BeforePrint = zrbRodapePaginaBeforePrint
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
      Height = 1
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
        DataSet = Permissao1
        DataField = 'OPS_CODIGO'
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
        DataSet = Permissao1
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
        DataSet = Permissao1
        DataField = 'SML_DESCRICAO'
      end
      object SZRDBText6: TSZRDBText
        Left = 111
        Top = 0
        Width = 19
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Permissao1
        DataField = 'PRM_DT_CADASTRO'
      end
      object zrlOperacaoDoSistema: TSZRLabel
        Left = 61
        Top = 0
        Width = 49
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
      end
    end
    object zrbSumario: TSZRBand
      Left = 1
      Top = 9
      Width = 130
      Height = 2
      BeforePrint = zrbSumarioBeforePrint
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
  object Permissao1: TPermissao
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM PERMISSAO'
      'ORDER BY CNC_CODIGO, USU_CODIGO, PRM_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = 4
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    Tabela = 'PERMISSAO'
    CodigoOPS = 0
    CodigoPRM = 0
    Perfil = 0
    Left = 28
    Top = 191
  end
end

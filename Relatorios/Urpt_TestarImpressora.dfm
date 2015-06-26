object rpt_TestarImpressora: Trpt_TestarImpressora
  Left = 100
  Top = 238
  Width = 939
  Height = 146
  Caption = 'Testar Impressora'
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
    Left = 2
    Top = 0
    Width = 132
    Height = 6
    Columns = 1
    ColumnSpace = 0
    DataSet = Permissao1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
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
    Options.PageLength = 6
    Options.PageWidth = 132
    Options.PaperType = zptSheet
    object zrbCabecalhoPagina: TSZRBand
      Left = 0
      Top = 0
      Width = 132
      Height = 6
      BandType = rbPageHeader
      ForceNewColumn = False
      ForceNewPage = False
      object zrlFinal: TSZRLabel
        Left = 0
        Top = 5
        Width = 132
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '---------------------'
      end
      object zrlInicio: TSZRLabel
        Left = 0
        Top = 0
        Width = 132
        Height = 1
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '---------------------'
      end
      object zrlEsquerda: TSZRLabel
        Left = 0
        Top = 0
        Width = 1
        Height = 6
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '---------------------'
      end
      object zrlDireita: TSZRLabel
        Left = 131
        Top = 0
        Width = 1
        Height = 6
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '---------------------'
      end
    end
  end
  object Permissao1: TPermissao
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM PERMISSAO'
      'ORDER BY CNC_CODIGO, USU_CODIGO, PRM_CODIGO')
    CNCOrigem = 0
    CentroDeCusto = 1
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    Tabela = 'PERMISSAO'
    CodigoOPS = 0
    CodigoPRM = 0
    Perfil = 0
    Left = 8
    Top = 86
  end
end

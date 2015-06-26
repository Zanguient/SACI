object rpt_CartaTitulosAtrasoZRep: Trpt_CartaTitulosAtrasoZRep
  Left = 133
  Top = 162
  Width = 991
  Height = 662
  Caption = 'rpt_CartaTitulosAtrasoZRep'
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
    DataSet = Etiquetas2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Margins.Left = 1
    Margins.Top = 1
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
    object zrbDetalhe: TSZRBand
      Left = 1
      Top = 28
      Width = 136
      Height = 2
      BandType = rbDetail
      ForceNewColumn = False
      ForceNewPage = False
      object SZRLabel22: TSZRLabel
        Left = 23
        Top = 1
        Width = 90
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 
          '----------------------------------------------------------------' +
          '--------------------------'
      end
      object SZRLabel23: TSZRLabel
        Left = 23
        Top = 0
        Width = 1
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel24: TSZRLabel
        Left = 40
        Top = 0
        Width = 1
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel25: TSZRLabel
        Left = 58
        Top = 0
        Width = 1
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel27: TSZRLabel
        Left = 76
        Top = 0
        Width = 1
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel28: TSZRLabel
        Left = 94
        Top = 0
        Width = 1
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel26: TSZRLabel
        Left = 112
        Top = 0
        Width = 1
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRDBText4: TSZRDBText
        Left = 25
        Top = 0
        Width = 14
        Height = 1
        Alignment = taCenter
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Etiquetas2
        DataField = 'PDV_CODIGO'
      end
      object SZRDBText5: TSZRDBText
        Left = 42
        Top = 0
        Width = 15
        Height = 1
        Alignment = taCenter
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Etiquetas2
        DataField = 'TRC_CODIGO'
      end
      object SZRDBText6: TSZRDBText
        Left = 60
        Top = 0
        Width = 15
        Height = 1
        Alignment = taCenter
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Etiquetas2
        DataField = 'TRC_SEQUENCIA'
      end
      object SZRDBText7: TSZRDBText
        Left = 78
        Top = 0
        Width = 15
        Height = 1
        Alignment = taCenter
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Etiquetas2
        DataField = 'TRC_VENCIMENTO'
      end
      object SZRDBText8: TSZRDBText
        Left = 98
        Top = 0
        Width = 13
        Height = 1
        Alignment = taRightJustify
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Etiquetas2
        DataField = 'TRC_VALOR'
      end
      object SZRLabel29: TSZRLabel
        Left = 96
        Top = 0
        Width = 2
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'R$'
      end
    end
    object zrbRodapePagina: TSZRBand
      Left = 1
      Top = 47
      Width = 136
      Height = 1
      BandType = rbPageFooter
      ForceNewColumn = False
      ForceNewPage = False
      object ZRLabel4: TSZRLabel
        Left = 3
        Top = 0
        Width = 64
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = [esItalic]
        WordWrap = True
        Caption = 'OBS: Caso j'#225' tenha liquidado seu d'#233'bito desconsiderar este aviso'
      end
    end
    object SZRGroup1: TSZRGroup
      Left = 1
      Top = 1
      Width = 136
      Height = 27
      BeforePrint = SZRGroup1BeforePrint
      Expression = 'Etiquetas2.CLI_CODIGO'
      FooterBand = SZRBand1
      Master = report
      ForceNewColumn = False
      ForceNewPage = True
      object SZRLabel1: TSZRLabel
        Left = 0
        Top = 0
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
      object SZRLabel2: TSZRLabel
        Left = 0
        Top = 6
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
      object SZRLabel4: TSZRLabel
        Left = 40
        Top = 3
        Width = 56
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'MATRIZ - TRAV. PROF. APRIGIO, 166 - CENTRO - RUSSAS - CE'
      end
      object SZRLabel5: TSZRLabel
        Left = 40
        Top = 4
        Width = 35
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'CEP: 62900-000 - FONE 088 411- 0738'
      end
      object SZRDBText1: TSZRDBText
        Left = 3
        Top = 8
        Width = 11
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Etiquetas2
        DataField = 'razaosocial'
      end
      object SZRDBText2: TSZRDBText
        Left = 3
        Top = 9
        Width = 16
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Etiquetas2
        DataField = 'enderecocompleto'
      end
      object SZRDBText3: TSZRDBText
        Left = 3
        Top = 10
        Width = 15
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = Etiquetas2
        DataField = 'bairrocidadecep'
      end
      object SZRLabel6: TSZRLabel
        Left = 0
        Top = 12
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
      object SZRSysData1: TSZRSysData
        Left = 3
        Top = 18
        Width = 12
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Data = zrsDate
      end
      object SZRLabel7: TSZRLabel
        Left = 15
        Top = 21
        Width = 118
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 
          'Comunicamos a V.S.a que at'#233' a presente data encontra(m)-se em ab' +
          'erto em nossa carteira  de cobran'#231'a  a(s)  seguinte(s)'
      end
      object SZRLabel8: TSZRLabel
        Left = 3
        Top = 22
        Width = 14
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'duplicata(s): '
      end
      object SZRLabel9: TSZRLabel
        Left = 23
        Top = 24
        Width = 90
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 
          '----------------------------------------------------------------' +
          '--------------------------'
      end
      object SZRLabel10: TSZRLabel
        Left = 29
        Top = 25
        Width = 6
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Pedido'
      end
      object SZRLabel11: TSZRLabel
        Left = 45
        Top = 25
        Width = 9
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Duplicata'
      end
      object SZRLabel12: TSZRLabel
        Left = 64
        Top = 25
        Width = 7
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Parcela'
      end
      object SZRLabel13: TSZRLabel
        Left = 80
        Top = 25
        Width = 10
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Vencimento'
      end
      object SZRLabel14: TSZRLabel
        Left = 101
        Top = 25
        Width = 5
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Valor'
      end
      object SZRLabel15: TSZRLabel
        Left = 23
        Top = 25
        Width = 1
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel16: TSZRLabel
        Left = 40
        Top = 25
        Width = 1
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel17: TSZRLabel
        Left = 58
        Top = 25
        Width = 1
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel18: TSZRLabel
        Left = 23
        Top = 26
        Width = 90
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 
          '----------------------------------------------------------------' +
          '--------------------------'
      end
      object SZRLabel19: TSZRLabel
        Left = 76
        Top = 25
        Width = 1
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel20: TSZRLabel
        Left = 94
        Top = 25
        Width = 1
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRLabel21: TSZRLabel
        Left = 112
        Top = 25
        Width = 1
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = '|'
      end
      object SZRDBText9: TSZRDBText
        Left = 3
        Top = 2
        Width = 130
        Height = 1
        Alignment = taCenter
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        BlankIfZero = False
        DataSet = CentroCusto1
        DataField = 'CNC_NOME_FAN'
      end
    end
    object SZRBand1: TSZRBand
      Left = 1
      Top = 30
      Width = 136
      Height = 17
      BandType = rbGroupFooter
      ForceNewColumn = False
      ForceNewPage = False
      object SZRLabel30: TSZRLabel
        Left = 3
        Top = 2
        Width = 130
        Height = 3
        AlignToBand = False
        FontStyle = []
        WordWrap = True
        Caption = 
          'perante nossa empresa. Esgotado o prazo contado a partir do rece' +
          'bimento desta, enviaremos seu nome para  registro no  SPC (servi' +
          #231'o de prote'#231#227'o ao cr'#233'dito) para que o  mesmo tome providencias c' +
          'ab'#237'veis.  Agradecemos a sua aten'#231#227'o e  ficamos na expectativa de' +
          '  sua vinda.'
      end
      object SZRLabel31: TSZRLabel
        Left = 15
        Top = 1
        Width = 118
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 
          'Solicitamos entrar em contato com o nosso setor de cobran'#231'a no p' +
          'razo de 05 (cinco) dias, para regularizar sua situa'#231#227'o'
      end
      object SZRLabel32: TSZRLabel
        Left = 72
        Top = 9
        Width = 15
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Atenciosamente,'
      end
      object SZRLabel33: TSZRLabel
        Left = 93
        Top = 14
        Width = 24
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = 'Departamento de Cobran'#231'a'
      end
      object SZRLabel34: TSZRLabel
        Left = 72
        Top = 13
        Width = 61
        Height = 1
        AlignToBand = False
        AutoSize = True
        FontStyle = []
        WordWrap = True
        Caption = '-------------------------------------------------------------'
      end
    end
  end
  object Etiquetas2: TCliente
    OnCalcFields = Etiquetas2CalcFields
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      
        'SELECT * FROM CLIENTE C, TITULO_A_RECEBER T, ITEM_DE_COBRANCA_CO' +
        'BRADOR B'
      '               WHERE T.CLI_CODIGO=C.CLI_CODIGO AND '
      '               C.CNC_CODIGO=T.CNC_CLIENTE'
      '               AND T.TRC_CODIGO=B.TRC_CODIGO AND '
      '               B.CNC_TITULO=T.CNC_CODIGO'
      '               AND T.TRC_SITUACAO <> 2 ')
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
    Left = 64
    Top = 64
    object Etiquetas2CLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Origin = 'DBGUERRA.CLIENTE.CLI_CODIGO'
    end
    object Etiquetas2CNC_CODIGO: TIntegerField
      FieldName = 'CNC_CODIGO'
      Origin = 'DBGUERRA.CLIENTE.CNC_CODIGO'
    end
    object Etiquetas2CLI_PESSOA_FISICA: TSmallintField
      FieldName = 'CLI_PESSOA_FISICA'
      Origin = 'DBGUERRA.CLIENTE.CLI_PESSOA_FISICA'
    end
    object Etiquetas2CLI_DT_CADASTRO: TDateTimeField
      FieldName = 'CLI_DT_CADASTRO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_CADASTRO'
    end
    object Etiquetas2CLI_DATA_NASC: TDateTimeField
      FieldName = 'CLI_DATA_NASC'
      Origin = 'DBGUERRA.CLIENTE.CLI_DATA_NASC'
    end
    object Etiquetas2CLI_RZ_SOCIAL: TStringField
      FieldName = 'CLI_RZ_SOCIAL'
      Origin = 'DBGUERRA.CLIENTE.CLI_RZ_SOCIAL'
      FixedChar = True
      Size = 60
    end
    object Etiquetas2CLI_NOME_FAN: TStringField
      FieldName = 'CLI_NOME_FAN'
      Origin = 'DBGUERRA.CLIENTE.CLI_NOME_FAN'
      FixedChar = True
      Size = 60
    end
    object Etiquetas2CLI_CGC_CPF: TStringField
      FieldName = 'CLI_CGC_CPF'
      Origin = 'DBGUERRA.CLIENTE.CLI_CGC_CPF'
      FixedChar = True
    end
    object Etiquetas2CLI_CGF_RG: TStringField
      FieldName = 'CLI_CGF_RG'
      Origin = 'DBGUERRA.CLIENTE.CLI_CGF_RG'
      FixedChar = True
    end
    object Etiquetas2CLI_LOGRADOURO: TIntegerField
      FieldName = 'CLI_LOGRADOURO'
      Origin = 'DBGUERRA.CLIENTE.CLI_LOGRADOURO'
    end
    object Etiquetas2CLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      Origin = 'DBGUERRA.CLIENTE.CLI_ENDERECO'
      FixedChar = True
      Size = 40
    end
    object Etiquetas2CLI_BAIRRO: TStringField
      FieldName = 'CLI_BAIRRO'
      Origin = 'DBGUERRA.CLIENTE.CLI_BAIRRO'
      FixedChar = True
    end
    object Etiquetas2CLI_CIDADE: TStringField
      FieldName = 'CLI_CIDADE'
      Origin = 'DBGUERRA.CLIENTE.CLI_CIDADE'
      FixedChar = True
    end
    object Etiquetas2CLI_UF: TStringField
      FieldName = 'CLI_UF'
      Origin = 'DBGUERRA.CLIENTE.CLI_UF'
      FixedChar = True
    end
    object Etiquetas2CLI_CEP: TStringField
      FieldName = 'CLI_CEP'
      Origin = 'DBGUERRA.CLIENTE.CLI_CEP'
      FixedChar = True
    end
    object Etiquetas2CLI_FONE: TStringField
      FieldName = 'CLI_FONE'
      Origin = 'DBGUERRA.CLIENTE.CLI_FONE'
      FixedChar = True
    end
    object Etiquetas2CLI_SITUACAO: TIntegerField
      FieldName = 'CLI_SITUACAO'
      Origin = 'DBGUERRA.CLIENTE.CLI_SITUACAO'
    end
    object Etiquetas2CLI_CREDITO: TFloatField
      FieldName = 'CLI_CREDITO'
      Origin = 'DBGUERRA.CLIENTE.CLI_CREDITO'
    end
    object Etiquetas2CLI_PAI: TStringField
      FieldName = 'CLI_PAI'
      Origin = 'DBGUERRA.CLIENTE.CLI_PAI'
      FixedChar = True
      Size = 50
    end
    object Etiquetas2CLI_MAE: TStringField
      FieldName = 'CLI_MAE'
      Origin = 'DBGUERRA.CLIENTE.CLI_MAE'
      FixedChar = True
      Size = 50
    end
    object Etiquetas2CLI_CONJUGE: TStringField
      FieldName = 'CLI_CONJUGE'
      Origin = 'DBGUERRA.CLIENTE.CLI_CONJUGE'
      FixedChar = True
      Size = 50
    end
    object Etiquetas2CLI_OBS1: TStringField
      FieldName = 'CLI_OBS1'
      Origin = 'DBGUERRA.CLIENTE.CLI_OBS1'
      FixedChar = True
      Size = 255
    end
    object Etiquetas2CLI_LOCALTRABALHO: TStringField
      FieldName = 'CLI_LOCALTRABALHO'
      Origin = 'DBGUERRA.CLIENTE.CLI_LOCALTRABALHO'
      FixedChar = True
      Size = 255
    end
    object Etiquetas2CLI_FAX: TStringField
      FieldName = 'CLI_FAX'
      Origin = 'DBGUERRA.CLIENTE.CLI_FAX'
      FixedChar = True
    end
    object Etiquetas2CLI_SITE: TStringField
      FieldName = 'CLI_SITE'
      Origin = 'DBGUERRA.CLIENTE.CLI_SITE'
      FixedChar = True
      Size = 100
    end
    object Etiquetas2CLI_EMAIL: TStringField
      FieldName = 'CLI_EMAIL'
      Origin = 'DBGUERRA.CLIENTE.CLI_EMAIL'
      FixedChar = True
      Size = 100
    end
    object Etiquetas2USU_CODIGO: TIntegerField
      FieldName = 'USU_CODIGO'
      Origin = 'DBGUERRA.CLIENTE.USU_CODIGO'
    end
    object Etiquetas2CLI_DT_ALTERADO: TDateTimeField
      FieldName = 'CLI_DT_ALTERADO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_ALTERADO'
    end
    object Etiquetas2CLI_CELULAR: TStringField
      FieldName = 'CLI_CELULAR'
      Origin = 'DBGUERRA.CLIENTE.CLI_CELULAR'
      FixedChar = True
    end
    object Etiquetas2CLI_SPC: TIntegerField
      FieldName = 'CLI_SPC'
      Origin = 'DBGUERRA.CLIENTE.CLI_SPC'
    end
    object Etiquetas2CLI_VENDA_ATACADO: TIntegerField
      FieldName = 'CLI_VENDA_ATACADO'
      Origin = 'DBGUERRA.CLIENTE.CLI_VENDA_ATACADO'
    end
    object Etiquetas2CLI_DESCONTO: TFloatField
      FieldName = 'CLI_DESCONTO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DESCONTO'
    end
    object Etiquetas2CLI_ORGAO: TIntegerField
      FieldName = 'CLI_ORGAO'
      Origin = 'DBGUERRA.CLIENTE.CLI_ORGAO'
    end
    object Etiquetas2CLI_DT_SPC: TDateTimeField
      FieldName = 'CLI_DT_SPC'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_SPC'
    end
    object Etiquetas2CLI_REFERENCIA1: TStringField
      FieldName = 'CLI_REFERENCIA1'
      Origin = 'DBGUERRA.CLIENTE.CLI_REFERENCIA1'
      FixedChar = True
      Size = 100
    end
    object Etiquetas2CLI_REFERENCIA2: TStringField
      FieldName = 'CLI_REFERENCIA2'
      Origin = 'DBGUERRA.CLIENTE.CLI_REFERENCIA2'
      FixedChar = True
      Size = 100
    end
    object Etiquetas2CLI_REFERENCIA3: TStringField
      FieldName = 'CLI_REFERENCIA3'
      Origin = 'DBGUERRA.CLIENTE.CLI_REFERENCIA3'
      FixedChar = True
      Size = 100
    end
    object Etiquetas2CLI_IDENTIFICACAO: TStringField
      FieldName = 'CLI_IDENTIFICACAO'
      Origin = 'DBGUERRA.CLIENTE.CLI_IDENTIFICACAO'
      FixedChar = True
      Size = 100
    end
    object Etiquetas2CLI_PROFISSAO: TStringField
      FieldName = 'CLI_PROFISSAO'
      Origin = 'DBGUERRA.CLIENTE.CLI_PROFISSAO'
      FixedChar = True
      Size = 100
    end
    object Etiquetas2CLI_QUINZENAL: TIntegerField
      FieldName = 'CLI_QUINZENAL'
      Origin = 'DBGUERRA.CLIENTE.CLI_QUINZENAL'
    end
    object Etiquetas2CLI_MENSAL: TIntegerField
      FieldName = 'CLI_MENSAL'
      Origin = 'DBGUERRA.CLIENTE.CLI_MENSAL'
    end
    object Etiquetas2CLI_NOTA: TIntegerField
      FieldName = 'CLI_NOTA'
      Origin = 'DBGUERRA.CLIENTE.CLI_NOTA'
    end
    object Etiquetas2CLI_CLASSIFICACAO: TIntegerField
      FieldName = 'CLI_CLASSIFICACAO'
      Origin = 'DBGUERRA.CLIENTE.CLI_CLASSIFICACAO'
    end
    object Etiquetas2CLI_MAQUINA: TIntegerField
      FieldName = 'CLI_MAQUINA'
      Origin = 'DBGUERRA.CLIENTE.CLI_MAQUINA'
    end
    object Etiquetas2CLI_TIPO: TIntegerField
      FieldName = 'CLI_TIPO'
      Origin = 'DBGUERRA.CLIENTE.CLI_TIPO'
    end
    object Etiquetas2CNC_CONVENIO: TIntegerField
      FieldName = 'CNC_CONVENIO'
      Origin = 'DBGUERRA.CLIENTE.CNC_CONVENIO'
    end
    object Etiquetas2CLI_CONVENIO: TIntegerField
      FieldName = 'CLI_CONVENIO'
      Origin = 'DBGUERRA.CLIENTE.CLI_CONVENIO'
    end
    object Etiquetas2CNC_ORIGEM: TIntegerField
      FieldName = 'CNC_ORIGEM'
      Origin = 'DBGUERRA.CLIENTE.CNC_ORIGEM'
    end
    object Etiquetas2CLI_DT_IMPORTACAO_INS: TDateTimeField
      FieldName = 'CLI_DT_IMPORTACAO_INS'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_INS'
    end
    object Etiquetas2CLI_DT_IMPORTACAO_ALT: TDateTimeField
      FieldName = 'CLI_DT_IMPORTACAO_ALT'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_CODIGO: TIntegerField
      FieldName = 'TRC_CODIGO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2CNC_CODIGO_1: TIntegerField
      FieldName = 'CNC_CODIGO_1'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2PDV_CODIGO: TIntegerField
      FieldName = 'PDV_CODIGO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2AGF_CODIGO: TIntegerField
      FieldName = 'AGF_CODIGO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2CCX_CODIGO: TIntegerField
      FieldName = 'CCX_CODIGO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_NUMERO: TStringField
      FieldName = 'TRC_NUMERO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
      FixedChar = True
    end
    object Etiquetas2TRC_SEQUENCIA: TStringField
      FieldName = 'TRC_SEQUENCIA'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
      FixedChar = True
    end
    object Etiquetas2CLI_CODIGO_1: TIntegerField
      FieldName = 'CLI_CODIGO_1'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_VENCIMENTO: TDateTimeField
      FieldName = 'TRC_VENCIMENTO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_VALOR: TFloatField
      FieldName = 'TRC_VALOR'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
      DisplayFormat = '#,##0.00'
    end
    object Etiquetas2TRC_PAGAMENTO: TDateTimeField
      FieldName = 'TRC_PAGAMENTO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_VALOR_PAGO: TFloatField
      FieldName = 'TRC_VALOR_PAGO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_SITUACAO: TIntegerField
      FieldName = 'TRC_SITUACAO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_OBSERVACAO: TStringField
      FieldName = 'TRC_OBSERVACAO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
      FixedChar = True
      Size = 255
    end
    object Etiquetas2TRC_CUSTODIA: TStringField
      FieldName = 'TRC_CUSTODIA'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
      FixedChar = True
    end
    object Etiquetas2TRC_TIPO_DOC: TIntegerField
      FieldName = 'TRC_TIPO_DOC'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_CRED_CLI: TFloatField
      FieldName = 'TRC_CRED_CLI'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_TIPO_PAG: TIntegerField
      FieldName = 'TRC_TIPO_PAG'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2CNC_CLIENTE: TIntegerField
      FieldName = 'CNC_CLIENTE'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_TITULOANT: TIntegerField
      FieldName = 'TRC_TITULOANT'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2BOL_CODIGO: TIntegerField
      FieldName = 'BOL_CODIGO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_TRCORIGINAL: TIntegerField
      FieldName = 'TRC_TRCORIGINAL'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_DTORIGINAL: TDateTimeField
      FieldName = 'TRC_DTORIGINAL'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2USU_CODIGO_1: TIntegerField
      FieldName = 'USU_CODIGO_1'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_DT_ALTERADO: TDateTimeField
      FieldName = 'TRC_DT_ALTERADO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_RGB_DT_INICIO: TDateTimeField
      FieldName = 'TRC_RGB_DT_INICIO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_RGB_DT_SITUACAO: TDateTimeField
      FieldName = 'TRC_RGB_DT_SITUACAO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2CPC_CODIGO: TIntegerField
      FieldName = 'CPC_CODIGO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_RGB_SITUACAO: TIntegerField
      FieldName = 'TRC_RGB_SITUACAO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_RGB_VISITADO: TSmallintField
      FieldName = 'TRC_RGB_VISITADO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_RGB_DT_PROMESSA: TDateTimeField
      FieldName = 'TRC_RGB_DT_PROMESSA'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_PROCESSO: TIntegerField
      FieldName = 'TRC_PROCESSO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_RGB_DT_VISITADO: TDateTimeField
      FieldName = 'TRC_RGB_DT_VISITADO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2CCX_CODIGO_REC: TIntegerField
      FieldName = 'CCX_CODIGO_REC'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_GEROU_MOVIMENTO: TSmallintField
      FieldName = 'TRC_GEROU_MOVIMENTO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_NOTA_SERVICO: TIntegerField
      FieldName = 'TRC_NOTA_SERVICO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_DT_CADASTRO: TDateTimeField
      FieldName = 'TRC_DT_CADASTRO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_DESCONTO: TFloatField
      FieldName = 'TRC_DESCONTO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_JUROS: TFloatField
      FieldName = 'TRC_JUROS'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2CNC_ORIGEM_1: TIntegerField
      FieldName = 'CNC_ORIGEM_1'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_PEDIDO_SERVICO: TIntegerField
      FieldName = 'TRC_PEDIDO_SERVICO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_TIPO_PEDIDO: TIntegerField
      FieldName = 'TRC_TIPO_PEDIDO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_DT_EMISSAO_BOLETO: TDateTimeField
      FieldName = 'TRC_DT_EMISSAO_BOLETO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_DT_RECEBIMENTO_BOLETO: TDateTimeField
      FieldName = 'TRC_DT_RECEBIMENTO_BOLETO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2FPE_CODIGO: TIntegerField
      FieldName = 'FPE_CODIGO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2CNC_FATURAMENTO_PENDENTE: TIntegerField
      FieldName = 'CNC_FATURAMENTO_PENDENTE'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_DT_COMPETENCIA: TDateTimeField
      FieldName = 'TRC_DT_COMPETENCIA'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_EQUIFAX: TIntegerField
      FieldName = 'TRC_EQUIFAX'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_DT_EQUIFAX: TDateTimeField
      FieldName = 'TRC_DT_EQUIFAX'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_AGENCIA_NUMERO: TStringField
      FieldName = 'TRC_AGENCIA_NUMERO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
      FixedChar = True
      Size = 50
    end
    object Etiquetas2TRC_DT_CHEQUE: TDateTimeField
      FieldName = 'TRC_DT_CHEQUE'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_SIT_CHEQUE: TIntegerField
      FieldName = 'TRC_SIT_CHEQUE'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_REABERTURA: TIntegerField
      FieldName = 'TRC_REABERTURA'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_VERIFICADO: TIntegerField
      FieldName = 'TRC_VERIFICADO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_DT_VERIFICADO: TDateTimeField
      FieldName = 'TRC_DT_VERIFICADO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2CHQ_CODIGO: TIntegerField
      FieldName = 'CHQ_CODIGO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2CNC_CHEQUE: TIntegerField
      FieldName = 'CNC_CHEQUE'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2CNC_MOVIMENTO_CONTA_CORRENTE: TIntegerField
      FieldName = 'CNC_MOVIMENTO_CONTA_CORRENTE'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2MCC_CODIGO: TIntegerField
      FieldName = 'MCC_CODIGO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_PAGAMENTO_PARCIAL: TIntegerField
      FieldName = 'TRC_PAGAMENTO_PARCIAL'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_CHEQUE_DEVOLVIDO: TIntegerField
      FieldName = 'TRC_CHEQUE_DEVOLVIDO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_CV: TStringField
      FieldName = 'TRC_CV'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
      FixedChar = True
    end
    object Etiquetas2TRC_LOCAL: TStringField
      FieldName = 'TRC_LOCAL'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
      FixedChar = True
      Size = 100
    end
    object Etiquetas2TRF_CODIGO: TIntegerField
      FieldName = 'TRF_CODIGO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2CNC_CODIGO_2: TIntegerField
      FieldName = 'CNC_CODIGO_2'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2ICC_CODIGO: TIntegerField
      FieldName = 'ICC_CODIGO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2CPC_CODIGO_1: TIntegerField
      FieldName = 'CPC_CODIGO_1'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2CNC_TITULO: TIntegerField
      FieldName = 'CNC_TITULO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2TRC_CODIGO_1: TIntegerField
      FieldName = 'TRC_CODIGO_1'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2ICC_DT_CADASTRO: TDateTimeField
      FieldName = 'ICC_DT_CADASTRO'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2USU_CODIGO_2: TIntegerField
      FieldName = 'USU_CODIGO_2'
      Origin = 'DBGUERRA.CLIENTE.CLI_DT_IMPORTACAO_ALT'
    end
    object Etiquetas2razaosocial: TStringField
      FieldKind = fkCalculated
      FieldName = 'razaosocial'
      Size = 70
      Calculated = True
    end
    object Etiquetas2bairrocidadecep: TStringField
      FieldKind = fkCalculated
      FieldName = 'bairrocidadecep'
      Size = 200
      Calculated = True
    end
    object Etiquetas2enderecocompleto: TStringField
      FieldKind = fkCalculated
      FieldName = 'enderecocompleto'
      Size = 100
      Calculated = True
    end
  end
  object Parametro2: TParametro
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM PARAMETRO'
      'WHERE TPR_CODIGO=3 AND PAR_CODIGO=:PAR_CODIGO')
    CConfiguracao = DM.Configuracao1
    CLog = DM.Log1
    CNCOrigem = 0
    CentroDeCusto = 2
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    CodigoPAR = 0
    CodigoTPR = 0
    Informacao = 0
    Situacao = 0
    Left = 120
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PAR_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object CentroCusto1: TParametro
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      
        'SELECT CNC_RZ_SOCIAL, CNC_NOME_FAN, PAR_DESCRICAO, CNC_ENDERECO,' +
        ' CNC_BAIRRO, CNC_CIDADE,'
      'CNC_UF, CNC_FONE, CNC_CEP FROM CENTRO_DE_CUSTO CNC'
      'INNER JOIN PARAMETRO PAR'
      'ON PAR.PAR_CODIGO=CNC.CNC_LOGRADOURO'
      'WHERE CNC.CNC_CODIGO=:CNC_CODIGO')
    CConfiguracao = DM.Configuracao1
    CLog = DM.Log1
    CNCOrigem = 0
    CentroDeCusto = 2
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = 0
    Maquina = 1
    CodigoPAR = 0
    CodigoTPR = 0
    Informacao = 0
    Situacao = 0
    Left = 504
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CNC_CODIGO'
        ParamType = ptUnknown
      end>
    object CentroCusto1CNC_RZ_SOCIAL: TStringField
      FieldName = 'CNC_RZ_SOCIAL'
      Origin = 'DBGUERRA.CENTRO_DE_CUSTO.CNC_RZ_SOCIAL'
      FixedChar = True
      Size = 60
    end
    object CentroCusto1CNC_NOME_FAN: TStringField
      FieldName = 'CNC_NOME_FAN'
      Origin = 'DBGUERRA.CENTRO_DE_CUSTO.CNC_NOME_FAN'
      FixedChar = True
      Size = 60
    end
    object CentroCusto1PAR_DESCRICAO: TStringField
      FieldName = 'PAR_DESCRICAO'
      Origin = 'DBGUERRA.PARAMETRO.PAR_DESCRICAO'
      FixedChar = True
      Size = 40
    end
    object CentroCusto1CNC_ENDERECO: TStringField
      FieldName = 'CNC_ENDERECO'
      Origin = 'DBGUERRA.CENTRO_DE_CUSTO.CNC_ENDERECO'
      FixedChar = True
      Size = 40
    end
    object CentroCusto1CNC_BAIRRO: TStringField
      FieldName = 'CNC_BAIRRO'
      Origin = 'DBGUERRA.CENTRO_DE_CUSTO.CNC_BAIRRO'
      FixedChar = True
    end
    object CentroCusto1CNC_CIDADE: TStringField
      FieldName = 'CNC_CIDADE'
      Origin = 'DBGUERRA.CENTRO_DE_CUSTO.CNC_CIDADE'
      FixedChar = True
    end
    object CentroCusto1CNC_UF: TStringField
      FieldName = 'CNC_UF'
      Origin = 'DBGUERRA.CENTRO_DE_CUSTO.CNC_UF'
      FixedChar = True
    end
    object CentroCusto1CNC_FONE: TStringField
      FieldName = 'CNC_FONE'
      Origin = 'DBGUERRA.CENTRO_DE_CUSTO.CNC_FONE'
      FixedChar = True
    end
    object CentroCusto1CNC_CEP: TStringField
      FieldName = 'CNC_CEP'
      Origin = 'DBGUERRA.CENTRO_DE_CUSTO.CNC_CEP'
      FixedChar = True
    end
  end
end

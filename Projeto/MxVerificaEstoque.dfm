object fMxVerificaEstoque: TfMxVerificaEstoque
  Left = 226
  Top = 188
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Verifica'
  ClientHeight = 124
  ClientWidth = 469
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 469
    Height = 49
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 10
      Width = 76
      Height = 13
      Caption = 'Centro de Custo'
    end
    object Label3: TLabel
      Left = 101
      Top = 10
      Width = 37
      Height = 13
      Caption = 'Produto'
    end
    object Label4: TLabel
      Left = 185
      Top = 10
      Width = 74
      Height = 13
      Caption = 'Total Verificado'
    end
    object Label5: TLabel
      Left = 270
      Top = 10
      Width = 78
      Height = 13
      Caption = 'Total Registrado'
    end
    object edtCodigoCNC: TEdit
      Left = 15
      Top = 22
      Width = 84
      Height = 21
      TabOrder = 0
      Text = '1'
    end
    object edtCodigoPRD: TEdit
      Left = 100
      Top = 22
      Width = 84
      Height = 21
      TabOrder = 1
      Text = '0'
    end
    object edtTotalVerificado: TEdit
      Left = 185
      Top = 22
      Width = 84
      Height = 21
      Enabled = False
      TabOrder = 2
      Text = '0'
    end
    object edtTotalRegistrado: TEdit
      Left = 270
      Top = 22
      Width = 84
      Height = 21
      Enabled = False
      TabOrder = 3
      Text = '0'
    end
    object ckbOficial: TCheckBox
      Left = 358
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Oficial'
      TabOrder = 4
      OnClick = ckbOficialClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 469
    Height = 75
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      469
      75)
    object Gauge1: TGauge
      Left = 1
      Top = 1
      Width = 467
      Height = 36
      Align = alTop
      Progress = 0
    end
    object bitTabelaCusto: TButton
      Left = 16
      Top = 45
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Tab.Custo'
      TabOrder = 2
      Visible = False
      OnClick = bitTabelaCustoClick
    end
    object btnMovCompra: TButton
      Left = 90
      Top = 45
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Mov.Compra'
      TabOrder = 3
      Visible = False
      OnClick = btnMovCompraClick
    end
    object bitMovimentoComercial: TButton
      Left = 164
      Top = 45
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Mov.Comercial'
      TabOrder = 4
      OnClick = bitMovimentoComercialClick
    end
    object bitMovimentoFisico: TButton
      Left = 238
      Top = 45
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Mov.Fisico'
      TabOrder = 5
      OnClick = bitMovimentoFisicoClick
    end
    object bitConfirmar: TButton
      Left = 312
      Top = 45
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Confirmar'
      TabOrder = 0
      OnClick = bitConfirmarClick
    end
    object bitParar: TButton
      Left = 386
      Top = 45
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Parar'
      Enabled = False
      TabOrder = 1
      OnClick = bitPararClick
    end
  end
  object sqlProduto1: TQuery
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT PRD_CODIGO, PRD_DESCRICAO,PRD_REFERENCIA '
      'FROM PRODUTO'
      'WHERE PRD_SITUACAO<>1'
      'ORDER BY PRD_CODIGO DESC')
    Left = 128
    Top = 53
  end
  object sqlAux: TQuery
    DatabaseName = 'DBguerra'
    Left = 98
    Top = 53
  end
  object Custo1: TCusto
    DatabaseName = 'DBguerra'
    SQL.Strings = (
      'SELECT * FROM CUSTO '
      'WHERE CUS_DT_CADASTRO>"01/01/2003"')
    CNCOrigem = 0
    CentroDeCusto = -1
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = -1
    Maquina = -1
    Tabela = 'CUSTO'
    CodigoCUS = 0
    CodigoFOR = 0
    CodigoPCP = 0
    CodigoPRD = 0
    PedidoCNC = 0
    Left = 9
    Top = 53
  end
  object Custo2: TCusto
    DatabaseName = 'DBguerra'
    Filtered = True
    SQL.Strings = (
      'SELECT TOP 1 C1.* '
      'FROM CUSTO C1'
      'WHERE C1.PRD_CODIGO=:PRD_CODIGO'
      'AND C1.CUS_DT_CADASTRO<:DT_CADASTRO'
      'ORDER BY C1.CUS_DT_CADASTRO DESC')
    CConfiguracao = DM.Configuracao1
    CNCOrigem = 0
    CentroDeCusto = -1
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = -1
    Maquina = -1
    Tabela = 'CUSTO'
    CodigoCUS = 0
    CodigoFOR = 0
    CodigoPCP = 0
    CodigoPRD = 0
    PedidoCNC = 0
    Left = 38
    Top = 53
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PRD_CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_CADASTRO'
        ParamType = ptUnknown
      end>
  end
  object Pedido_de_Compra1: TPedido_de_Compra
    DatabaseName = 'DBguerra'
    CNCOrigem = 0
    CentroDeCusto = -1
    CodigoCNC = 0
    CodigoUSU = 0
    Mafalda = -1
    Maquina = -1
    Tabela = 'PEDIDO_DE_COMPRA'
    ArquivoGerado = 0
    CNCEntrega = 0
    CodigoCNT = 0
    CodigoFOR = 0
    CodigoFPE = 0
    CodigoFPG = 0
    CodigoFPGTRN = 0
    CodigoOPF = 0
    CodigoPCP = 0
    CodigoTPG = 0
    CodigoTRN = 0
    Conhecimento = 0
    Fabricar = False
    FreteNota = False
    LJ4 = False
    NotaFiscal = 0
    PrecoFinalDefinido = False
    SN = False
    Selo = 0
    Situacao = 0
    TipoFrete = 0
    Left = 68
    Top = 53
  end
end

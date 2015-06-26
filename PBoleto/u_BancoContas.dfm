object frmBancoContas: TfrmBancoContas
  Left = 360
  Top = 223
  Width = 623
  Height = 453
  Caption = 'frmBancoContas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 10
    Width = 36
    Height = 13
    Caption = 'Bancos'
  end
  object cbxBancos: TComboBox
    Left = 10
    Top = 25
    Width = 181
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 0
    Text = 'BANCO DO BRASIL'
    Items.Strings = (
      'BANCO DO BRASIL'
      'CAIXA ECON'#212'MICA FEDERAL'
      'BANCO ITA'#218
      'BRADESCO')
  end
end

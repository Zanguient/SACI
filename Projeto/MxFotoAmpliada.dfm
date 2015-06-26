object fMxFotoAmpliada: TfMxFotoAmpliada
  Left = 321
  Top = 137
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Foto Ampliada'
  ClientHeight = 530
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
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
    Width = 628
    Height = 530
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object lblSemFoto: TLabel
      Left = 291
      Top = 244
      Width = 45
      Height = 13
      Alignment = taCenter
      Caption = 'Sem Foto'
    end
    object imgFotoAmpliada: TImage
      Left = 1
      Top = 1
      Width = 626
      Height = 450
      Hint = 'Clique para fechar'
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      Center = True
      ParentShowHint = False
      ShowHint = True
      OnClick = imgFotoAmpliadaClick
    end
    object memRodapeFoto: TMemo
      Left = 1
      Top = 453
      Width = 626
      Height = 76
      TabStop = False
      Align = alBottom
      ReadOnly = True
      TabOrder = 0
    end
  end
end

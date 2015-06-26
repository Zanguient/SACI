object fMxMensagemTempo: TfMxMensagemTempo
  Left = 373
  Top = 401
  BorderStyle = bsNone
  Caption = 'fMxMensagemTempo'
  ClientHeight = 68
  ClientWidth = 269
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 269
    Height = 68
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 265
      Height = 64
      Align = alClient
      TabOrder = 0
      object DRLabel1: TDRLabel
        Left = 40
        Top = 24
        Width = 70
        Height = 16
        Caption = 'DRLabel1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        HiColor = clBlue
        LoColor = clNavy
        Border = boNone
        Ctl3D = True
        BlinkInterval = 300
        Blink = blNone
        Deep = 1
      end
    end
  end
end

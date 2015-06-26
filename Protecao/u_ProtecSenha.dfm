object frProtecSenha: TfrProtecSenha
  Left = 487
  Top = 190
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Prote'#231#227'o'
  ClientHeight = 481
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox4: TGroupBox
    Left = 8
    Top = 8
    Width = 313
    Height = 166
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 13
      Top = 14
      Width = 287
      Height = 49
      Caption = 'Serial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object edSerial1: TEdit
        Left = 16
        Top = 18
        Width = 121
        Height = 21
        Color = clYellow
        TabOrder = 0
        OnExit = edSerial1Exit
      end
      object edSerial2: TEdit
        Left = 153
        Top = 18
        Width = 121
        Height = 21
        Color = clYellow
        TabOrder = 1
        OnExit = edSerial1Exit
      end
    end
    object Button1: TButton
      Left = 13
      Top = 72
      Width = 81
      Height = 25
      Caption = 'Gerar Chave'
      TabOrder = 1
      OnClick = Button1Click
    end
    object GroupBox2: TGroupBox
      Left = 13
      Top = 106
      Width = 287
      Height = 49
      Caption = 'Chave'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object edSenha1: TEdit
        Left = 16
        Top = 18
        Width = 121
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 0
      end
      object edSenha2: TEdit
        Left = 153
        Top = 18
        Width = 121
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 180
    Width = 313
    Height = 292
    TabOrder = 1
    object Label1: TLabel
      Left = 10
      Top = 15
      Width = 23
      Height = 13
      Caption = 'Qtde'
    end
    object btnSenhaSup: TButton
      Left = 70
      Top = 25
      Width = 140
      Height = 25
      Caption = 'Gerar GUID'
      TabOrder = 0
      OnClick = btnSenhaSupClick
    end
    object edtQtde: TEdit
      Left = 10
      Top = 29
      Width = 51
      Height = 21
      TabOrder = 1
      Text = '50'
    end
    object mmGuid: TMemo
      Left = 10
      Top = 60
      Width = 290
      Height = 221
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 2
    end
  end
end

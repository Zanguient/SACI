object frmOcorrencia: TfrmOcorrencia
  Left = 301
  Top = 162
  Width = 840
  Height = 492
  BorderIcons = [biSystemMenu]
  Caption = 'Livro de ocorr'#234'ncia'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 722
    Height = 465
    Align = alClient
    TabOrder = 0
    DesignSize = (
      722
      465)
    object Label1: TLabel
      Left = 15
      Top = 55
      Width = 52
      Height = 13
      Caption = 'Ocorr'#234'ncia'
    end
    object Label3: TLabel
      Left = 15
      Top = 15
      Width = 36
      Height = 13
      Caption = 'Porteiro'
    end
    object edtData: TLabel
      Left = 205
      Top = 15
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Label4: TLabel
      Left = 276
      Top = 15
      Width = 23
      Height = 13
      Caption = 'Hora'
    end
    object Label5: TLabel
      Left = 15
      Top = 360
      Width = 135
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Anexos (N'#227'o anexar v'#237'deos)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object mmMensagem: TMemo
      Left = 15
      Top = 70
      Width = 692
      Height = 279
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        
          'Crie uma nova Application no delphi, adicione e modifique a prop' +
          'riedades dos seguintes componentes: Crie '
        'uma nova Application no delphi, '
        'adicione e modifique a '
        'propriedades dos seguintes '
        
          'componentes: Crie uma nova Application no delphi, adicione e mod' +
          'ifique a propriedades dos seguintes '
        'componentes:'
        
          'Crie uma nova Application no delphi, adicione e modifique a prop' +
          'riedades dos seguintes componentes:'
        'ComponenteNomeValor'
        'Label1CaptionPara :'
        'Label2CaptionCC :'
        'Label3CaptionCCO :'
        'Label4CaptionAssunto'
        'Edit1Text '
        'NameEdtPara'
        'Edit2Text '
        'NameEdtCC'
        'Edit3Text '
        'NameEdtCCO'
        'LabelCaptionPrioridade'
        'ComboBoxNameCbxPrioridade'
        'ItemsAlta'
        'Normal'
        'Baixa'
        'CheckBoxcbxConfirmaLeitura&Solicitar confirma'#231#227'o de leitura'
        'MemoLines '
        'NameMmMensagem'
        'MemoNamemmAnexos'
        'BitBtnNamebtnEnviar'
        'Caption&Enviar'
        'MemoNamemmAnexos'
        'BitBtnNamebtnAnexar'
        'CaptionAnexar'
        'MemoNamemmAnexos'
        'MemoNamemmAnexos'
        'MemoNamemmAnexos'
        'MemoNamemmAnexos'
        'MemoNamemmAnexos'
        'MemoNamemmAnexos'
        'MemoNamemmAnexos'
        'MemoNamemmAnexos'
        'MemoNamemmAnexos'
        'MemoNamemmAnexos'
        'MemoNamemmAnexos'
        'Lines '
        'ScrollBarsSsVertical'
        ''
        'OpenDialogNameodAnexos'
        'TitleAnexando Arquivos'
        'Filter | Filter NameTodos os Arquivos (*.*)'
        'Filter | Filter *.*'
        
          'Agora v'#225' at'#233' a paleta Indy Clients e adicione o componente IdSMT' +
          'P, depois v'#225' at'#233' a paleta Indy Misc e '
        'adicione o componente IdMessage e '
        'altere as seguintes '
        'propriedades:'
        'ComponenteNomeValor'
        'IdMessageNameIdMessage'
        'From | Addressseuemail@provedor.com'
        'From | NameSeunome'
        'IdSMTPNameIdSMTP'
        'HostSeuhost.com.br'
        'UserIdSeu Nome do usu'#225'rio'
        ''
        
          'Bom, todos os componentes necess'#225'rios para que possamos enviar u' +
          'm email j'#225' est'#227'o em nosso formul'#225'rio. '
        'Agora vamos come'#231'ar a codificar '
        '('#233' a parte que mais gosto de '
        'um sistema, odeio '
        'instanciar componentes).'
        ''
        'D'#234' um duplo clique em btnAnexar, e adicione o seguinte c'#243'digo :'
        ''
        '//Insere o nome do arquivo no memo mmAnexos'
        'if odAnexos.Execute Then'
        'mmAnexos.Lines.Add(odAnexos.FileName);'
        ''
        
          'Nesse ponto cada vez que voc'#234' clicar no bot'#227'o Anexar e voc'#234' sele' +
          'cionar um arquivo ele vai gravar o nome e o '
        'caminho do arquivo no '
        'Memo mmAnexos.'
        ''
        'Agora d'#234' clique duplo no btnEnviar e adicione mais esse c'#243'digo :'
        ''
        'Var'
        'xAnexo : Integer;'
        'begin'
        ''
        'IdMessage.Recipients.EMailAddresses := edtPara.Text;'
        'IdMessage.CCList.EMailAddresses := edtCC.Text;'
        'IdMessage.BccList.EMailAddresses := edtCCO.Text;'
        ''
        '//Trata a Prioridade da mensagem'
        'case cbxPrioridade.ItemIndex of'
        '0 : IdMessage.Priority := mpHigh;'
        '1 : IdMessage.Priority := mpNormal;'
        '2 : IdMessage.Priority := mpLow;'
        ''
        'end;'
        ''
        'IdMessage.Subject := edtAssunto.Text;'
        'IdMessage.Sender.Text := mmMensagem.Lines.Text;'
        ''
        'if cbxConfirmaLeitura.Checked Then'
        
          'idmessage.ReceiptRecipient.Text := IDMessage.From.Text; // Auto ' +
          'Resposta'
        ''
        '//Tratando os arquivos anexos'
        'For xAnexo := 0 to mmAnexos.Lines.Count-1 do'
        
          'TIdAttachment.create(idmessage.MessageParts, TFileName(mmAnexos.' +
          'Lines.Strings[xAnexo]));'
        ''
        ''
        'IdSMTP.Connect;'
        ''
        'Try'
        'IdSMTP.Send(IdMessage);'
        'Finally'
        'IdSMTP.Disconnect;'
        'End;'
        ''
        
          'Nosso sistema de envio de email j'#225' est'#225' conclu'#237'do agora '#233' s'#243' voc' +
          #234' realizar seus testes, os indy s'#227'o muito uteis '
        'principalmente para enviar '
        'email com anexos, tendo em '
        'vista que quando voc'#234' '
        'usa o ShellExecute para enviar email ele n'#227'o envia email anexo.'
        ''
        
          'Mas os componentes Indy n'#227'o resume-se apenas a isso, vale a pena' +
          ' voc'#234' dar uma olhada com mais calma e '
        'descobrir a potencialidade dos '
        'mesmos.'
        ''
        'Confira abaixo como ficou o c'#243'digo completo do sistema.'
        ''
        ''
        'unit fSendIndy;'
        ''
        'interface'
        ''
        'uses'
        
          'Windows, Messages, SysUtils, Variants, Classes, Graphics, Contro' +
          'ls, Forms,'
        'Dialogs, StdCtrls, Buttons, Menus, IdMessage, IdBaseComponent,'
        
          'IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient, IdSM' +
          'TP;'
        ''
        'type'
        'TForm1 = class(TForm)'
        'Label1: TLabel;'
        'edtPara: TEdit;'
        'Label2: TLabel;'
        'Label3: TLabel;'
        'edtCC: TEdit;'
        'edtCCo: TEdit;'
        'cbxConfirmaLeitura: TCheckBox;'
        'mmMensagem: TMemo;'
        'btnEnviar: TBitBtn;'
        'Label4: TLabel;'
        'edtAssunto: TEdit;'
        'IdSMTP: TIdSMTP;'
        'IdMessage: TIdMessage;'
        'btnAnexar: TBitBtn;'
        'mmAnexos: TMemo;'
        'odAnexos: TOpenDialog;'
        'cbxPrioridade: TComboBox;'
        'Label5: TLabel;'
        'procedure btnEnviarClick(Sender: TObject);'
        'procedure btnAnexarClick(Sender: TObject);'
        'private'
        '{ Private declarations }'
        'public'
        '{ Public declarations }'
        'end;'
        ''
        'var'
        'Form1: TForm1;'
        ''
        'implementation'
        ''
        '{$R *.dfm}'
        ''
        'procedure TForm1.btnEnviarClick(Sender: TObject);'
        'Var'
        'xAnexo : Integer;'
        'begin'
        ''
        'IdMessage.Recipients.EMailAddresses := edtPara.Text;'
        'IdMessage.CCList.EMailAddresses := edtCC.Text;'
        'IdMessage.BccList.EMailAddresses := edtCCO.Text;'
        ''
        '//Trata a Prioridade da mensagem'
        'case cbxPrioridade.ItemIndex of'
        '0 : IdMessage.Priority := mpHigh;'
        '1 : IdMessage.Priority := mpNormal;'
        '2 : IdMessage.Priority := mpLow;'
        ''
        'end;'
        ''
        'IdMessage.Subject := edtAssunto.Text;'
        'IdMessage.Sender.Text := mmMensagem.Lines.Text;'
        ''
        'if cbxConfirmaLeitura.Checked Then'
        
          'idmessage.ReceiptRecipient.Text := IDMessage.From.Text; // Auto ' +
          'Resposta'
        ''
        '//Tratando os arquivos anexos'
        'For xAnexo := 0 to mmAnexos.Lines.Count-1 do'
        
          'TIdAttachment.create(idmessage.MessageParts, TFileName(mmAnexos.' +
          'Lines.Strings[xAnexo]));'
        ''
        ''
        'IdSMTP.Connect;'
        ''
        'Try'
        'IdSMTP.Send(IdMessage);'
        'Finally'
        'IdSMTP.Disconnect;'
        'End;'
        ''
        'end;'
        ''
        'procedure TForm1.btnAnexarClick(Sender: TObject);'
        'begin'
        ''
        '//Insere o nome do arquivo no memo mmAnexos'
        'if odAnexos.Execute Then'
        'mmAnexos.Lines.Add(odAnexos.FileName);'
        ''
        'end;'
        ''
        'end.'
        ''
        ''
        ''
        '---------------------------'
        'Livroocorrencia'
        '---------------------------'
        
          '4.7.0 [201.49.59.54      15] Our system has detected that this m' +
          'essage is'
        
          '4.7.0 suspicious due to the very low reputation of the sending I' +
          'P address.'
        
          '4.7.0 To protect our users from spam, mail sent from your IP add' +
          'ress has'
        '4.7.0 been temporarily rate limited. Please visit'
        
          '4.7.0  https://support.google.com/mail/answer/188131 for more in' +
          'formation. g10si18390245qkb.4 - gsmtp'
        ''
        '---------------------------'
        'OK   '
        '---------------------------')
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object mmAnexos: TMemo
      Left = 15
      Top = 377
      Width = 593
      Height = 59
      TabStop = False
      Anchors = [akLeft, akRight, akBottom]
      Color = clMenu
      Lines.Strings = (
        
          'Crie uma nova Application no delphi, adicione e modifique a prop' +
          'riedades dos seguintes componentes:'
        'ComponenteNomeValor'
        'Label1CaptionPara :'
        'Label2CaptionCC :'
        'Label3CaptionCCO :'
        'Label4CaptionAssunto'
        'Edit1Text '
        'NameEdtPara'
        'Edit2Text '
        'NameEdtCC'
        'Edit3Text '
        'NameEdtCCO'
        'LabelCaptionPrioridade'
        'ComboBoxNameCbxPrioridade'
        'ItemsAlta'
        'Normal'
        'Baixa'
        'CheckBoxcbxConfirmaLeitura&Solicitar confirma'#231#227'o de leitura'
        'MemoLines '
        'NameMmMensagem'
        ''
        'BitBtnNamebtnEnviar'
        'Caption&Enviar'
        ''
        'BitBtnNamebtnAnexar'
        'CaptionAnexar'
        ''
        'MemoNamemmAnexos'
        'Lines '
        'ScrollBarsSsVertical'
        ''
        'OpenDialogNameodAnexos'
        'TitleAnexando Arquivos'
        'Filter | Filter NameTodos os Arquivos (*.*)'
        'Filter | Filter *.*'
        
          'Agora v'#225' at'#233' a paleta Indy Clients e adicione o componente IdSMT' +
          'P, depois v'#225' at'#233' a paleta Indy Misc e adicione o '
        'componente IdMessage e altere as '
        'seguintes '
        'propriedades:'
        'ComponenteNomeValor'
        'IdMessageNameIdMessage'
        'From | Addressseuemail@provedor.com'
        'From | NameSeunome'
        'IdSMTPNameIdSMTP'
        'HostSeuhost.com.br'
        'UserIdSeu Nome do usu'#225'rio'
        ''
        
          'Bom, todos os componentes necess'#225'rios para que possamos enviar u' +
          'm email j'#225' est'#227'o em nosso formul'#225'rio. Agora vamos '
        'come'#231'ar a codificar ('#233' a parte '
        'que mais gosto de um '
        'sistema, odeio instanciar componentes).'
        ''
        'D'#234' um duplo clique em btnAnexar, e adicione o seguinte c'#243'digo :'
        ''
        '//Insere o nome do arquivo no memo mmAnexos'
        'if odAnexos.Execute Then'
        'mmAnexos.Lines.Add(odAnexos.FileName);'
        ''
        
          'Nesse ponto cada vez que voc'#234' clicar no bot'#227'o Anexar e voc'#234' sele' +
          'cionar um arquivo ele vai gravar o nome e o '
        'caminho do arquivo no Memo '
        'mmAnexos.'
        ''
        'Agora d'#234' clique duplo no btnEnviar e adicione mais esse c'#243'digo :'
        ''
        'Var'
        'xAnexo : Integer;'
        'begin'
        ''
        'IdMessage.Recipients.EMailAddresses := edtPara.Text;'
        'IdMessage.CCList.EMailAddresses := edtCC.Text;'
        'IdMessage.BccList.EMailAddresses := edtCCO.Text;'
        ''
        '//Trata a Prioridade da mensagem'
        'case cbxPrioridade.ItemIndex of'
        '0 : IdMessage.Priority := mpHigh;'
        '1 : IdMessage.Priority := mpNormal;'
        '2 : IdMessage.Priority := mpLow;'
        ''
        'end;'
        ''
        'IdMessage.Subject := edtAssunto.Text;'
        'IdMessage.Sender.Text := mmMensagem.Lines.Text;'
        ''
        'if cbxConfirmaLeitura.Checked Then'
        
          'idmessage.ReceiptRecipient.Text := IDMessage.From.Text; // Auto ' +
          'Resposta'
        ''
        '//Tratando os arquivos anexos'
        'For xAnexo := 0 to mmAnexos.Lines.Count-1 do'
        
          'TIdAttachment.create(idmessage.MessageParts, TFileName(mmAnexos.' +
          'Lines.Strings[xAnexo]));'
        ''
        ''
        'IdSMTP.Connect;'
        ''
        'Try'
        'IdSMTP.Send(IdMessage);'
        'Finally'
        'IdSMTP.Disconnect;'
        'End;'
        ''
        
          'Nosso sistema de envio de email j'#225' est'#225' conclu'#237'do agora '#233' s'#243' voc' +
          #234' realizar seus testes, os indy s'#227'o muito uteis '
        'principalmente para enviar email com '
        'anexos, tendo em vista '
        
          'que quando voc'#234' usa o ShellExecute para enviar email ele n'#227'o env' +
          'ia email anexo.'
        ''
        
          'Mas os componentes Indy n'#227'o resume-se apenas a isso, vale a pena' +
          ' voc'#234' dar uma olhada com mais calma e descobrir a '
        'potencialidade dos mesmos.'
        ''
        'Confira abaixo como ficou o c'#243'digo completo do sistema.'
        ''
        ''
        'unit fSendIndy;'
        ''
        'interface'
        ''
        'uses'
        
          'Windows, Messages, SysUtils, Variants, Classes, Graphics, Contro' +
          'ls, Forms,'
        'Dialogs, StdCtrls, Buttons, Menus, IdMessage, IdBaseComponent,'
        
          'IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient, IdSM' +
          'TP;'
        ''
        'type'
        'TForm1 = class(TForm)'
        'Label1: TLabel;'
        'edtPara: TEdit;'
        'Label2: TLabel;'
        'Label3: TLabel;'
        'edtCC: TEdit;'
        'edtCCo: TEdit;'
        'cbxConfirmaLeitura: TCheckBox;'
        'mmMensagem: TMemo;'
        'btnEnviar: TBitBtn;'
        'Label4: TLabel;'
        'edtAssunto: TEdit;'
        'IdSMTP: TIdSMTP;'
        'IdMessage: TIdMessage;'
        'btnAnexar: TBitBtn;'
        'mmAnexos: TMemo;'
        'odAnexos: TOpenDialog;'
        'cbxPrioridade: TComboBox;'
        'Label5: TLabel;'
        'procedure btnEnviarClick(Sender: TObject);'
        'procedure btnAnexarClick(Sender: TObject);'
        'private'
        '{ Private declarations }'
        'public'
        '{ Public declarations }'
        'end;'
        ''
        'var'
        'Form1: TForm1;'
        ''
        'implementation'
        ''
        '{$R *.dfm}'
        ''
        'procedure TForm1.btnEnviarClick(Sender: TObject);'
        'Var'
        'xAnexo : Integer;'
        'begin'
        ''
        'IdMessage.Recipients.EMailAddresses := edtPara.Text;'
        'IdMessage.CCList.EMailAddresses := edtCC.Text;'
        'IdMessage.BccList.EMailAddresses := edtCCO.Text;'
        ''
        '//Trata a Prioridade da mensagem'
        'case cbxPrioridade.ItemIndex of'
        '0 : IdMessage.Priority := mpHigh;'
        '1 : IdMessage.Priority := mpNormal;'
        '2 : IdMessage.Priority := mpLow;'
        ''
        'end;'
        ''
        'IdMessage.Subject := edtAssunto.Text;'
        'IdMessage.Sender.Text := mmMensagem.Lines.Text;'
        ''
        'if cbxConfirmaLeitura.Checked Then'
        
          'idmessage.ReceiptRecipient.Text := IDMessage.From.Text; // Auto ' +
          'Resposta'
        ''
        '//Tratando os arquivos anexos'
        'For xAnexo := 0 to mmAnexos.Lines.Count-1 do'
        
          'TIdAttachment.create(idmessage.MessageParts, TFileName(mmAnexos.' +
          'Lines.Strings[xAnexo]));'
        ''
        ''
        'IdSMTP.Connect;'
        ''
        'Try'
        'IdSMTP.Send(IdMessage);'
        'Finally'
        'IdSMTP.Disconnect;'
        'End;'
        ''
        'end;'
        ''
        'procedure TForm1.btnAnexarClick(Sender: TObject);'
        'begin'
        ''
        '//Insere o nome do arquivo no memo mmAnexos'
        'if odAnexos.Execute Then'
        'mmAnexos.Lines.Add(odAnexos.FileName);'
        ''
        'end;'
        ''
        'end.'
        ''
        ''
        ''
        '---------------------------'
        'Livroocorrencia'
        '---------------------------'
        
          '4.7.0 [201.49.59.54      15] Our system has detected that this m' +
          'essage is'
        
          '4.7.0 suspicious due to the very low reputation of the sending I' +
          'P address.'
        
          '4.7.0 To protect our users from spam, mail sent from your IP add' +
          'ress has'
        '4.7.0 been temporarily rate limited. Please visit'
        
          '4.7.0  https://support.google.com/mail/answer/188131 for more in' +
          'formation. g10si18390245qkb.4 - gsmtp'
        ''
        '---------------------------'
        'OK   '
        '---------------------------')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 5
    end
    object btnAnexar: TBitBtn
      Left = 617
      Top = 377
      Width = 90
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Anexar'
      TabOrder = 6
      OnClick = btnAnexarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
        7700333333337777777733333333008088003333333377F73377333333330088
        88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
        000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
        FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
        99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
    end
    object btnLimpar: TBitBtn
      Left = 617
      Top = 410
      Width = 90
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Limpar'
      TabOrder = 7
      OnClick = btnLimparClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
        05555777775555557F5555000555555505555577755555557555}
      NumGlyphs = 2
    end
    object medtData: TMaskEdit
      Left = 205
      Top = 30
      Width = 66
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
    object medtHora: TMaskEdit
      Left = 276
      Top = 30
      Width = 59
      Height = 21
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 2
      Text = '  :  '
    end
    object edtPorteiro: TEdit
      Left = 15
      Top = 30
      Width = 186
      Height = 21
      TabStop = False
      Color = clMenu
      Enabled = False
      TabOrder = 0
    end
    object cbxImportante: TCheckBox
      Left = 350
      Top = 31
      Width = 76
      Height = 17
      Cursor = crHandPoint
      Caption = '&Importante'
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 722
    Top = 0
    Width = 110
    Height = 465
    Align = alRight
    TabOrder = 1
    DesignSize = (
      110
      465)
    object btnSalvar: TBitBtn
      Left = 10
      Top = 15
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        7F2B287F2B28A18283A18283A18283A18283A18283A18283A182837A1C1C7F2B
        28FF00FFFF00FFFF00FFFF00FFFF00FF8E8E8E8E8E8EBEBEBEBEBEBEBEBEBEBE
        BEBEBEBEBEBEBEBEBEBEBE8686868E8E8EFF00FFFF00FFFF00FFFF00FF7F2B28
        CA4D4DB64545DDD4D5791617791617DCE0E0D7DADECED5D7BDBABD76100F9A2D
        2D7F2B28FF00FFFF00FFFF00FF8E8E8EB8B8B8AEAEAEECECEC838383838383F0
        F0F0EEEEEEE8E8E8DADADA7E7E7E9A9A9A8E8E8EFF00FFFF00FFFF00FF7F2B28
        C24A4BB14444E2D9D9791617791617D9D8DAD9DEE1D3D9DCC1BDC1761111982D
        2D7F2B28FF00FFFF00FFFF00FF8E8E8EB4B4B4ACACACF0F0F0838383838383ED
        EDEDF0F0F0ECECECDCDCDC7F7F7F9999998E8E8EFF00FFFF00FFFF00FF7F2B28
        C24A4AB04242E6DCDC791617791617D5D3D5D8DEE1D7DDE0C6C2C5700F0F962C
        2C7F2B28FF00FFFF00FFFF00FF8E8E8EB4B4B4ABABABF2F2F2838383838383EA
        EAEAEFEFEFEEEEEEE0E0E07C7C7C9898988E8E8EFF00FFFF00FFFF00FF7F2B28
        C24A4AB04141EADEDEE7DDDDDDD4D5D7D3D5D5D7D9D7D8DACAC2C57E17179E31
        317F2B28FF00FFFF00FFFF00FF8E8E8EB4B4B4AAAAAAF4F4F4F3F3F3ECECECEA
        EAEAECECECECECECE1E1E18585859D9D9D8E8E8EFF00FFFF00FFFF00FF7F2B28
        BF4748B84545BA4C4CBD5757BB5756B64E4EB44949BD5251BB4B4CB54242BF4A
        4A7F2B28FF00FFFF00FFFF00FF8E8E8EB1B1B1AFAFAFB2B2B2B8B8B8B6B6B6B1
        B1B1AFAFAFB5B5B5B2B2B2ACACACB3B3B38E8E8EFF00FFFF00FFFF00FF7F2B28
        A33B39B1605DC68684CB918FCC9190CC908FCB8988C98988CB9391CC9696BD4B
        4C7F2B28FF00FFFF00FFFF00FF8E8E8EA2A2A2B6B6B6CBCBCBD0D0D0D1D1D1D0
        D0D0CECECECDCDCDD1D1D1D3D3D3B3B3B38E8E8EFF00FFFF00FFFF00FF7F2B28
        BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B
        4C7F2B28FF00FFFF00FFFF00FF8E8E8EB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B38E8E8EFF00FFFF00FFFF00FF7F2B28
        BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B
        4C7F2B28FF00FFFF00FFFF00FF8E8E8EB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B38E8E8EFF00FFFF00FFFF00FF7F2B28
        BD4B4CF7F7F7BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFF7F7F7BD4B
        4C7F2B28FF00FFFF00FFFF00FF8E8E8EB3B3B3FFFFFFDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCFFFFFFB3B3B38E8E8EFF00FFFF00FFFF00FF7F2B28
        BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B
        4C7F2B28FF00FFFF00FFFF00FF8E8E8EB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B38E8E8EFF00FFFF00FFFF00FF7F2B28
        BD4B4CF7F7F7BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFF7F7F7BD4B
        4C7F2B28FF00FFFF00FFFF00FF8E8E8EB3B3B3FFFFFFDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCFFFFFFB3B3B38E8E8EFF00FFFF00FFFF00FF7F2B28
        BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B
        4C7F2B28FF00FFFF00FFFF00FF8E8E8EB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B38E8E8EFF00FFFF00FFFF00FFFF00FF
        7F2B28F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F77F2B
        28FF00FFFF00FFFF00FFFF00FFFF00FF8E8E8EFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8E8EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
    end
    object btnSair: TBitBtn
      Left = 10
      Top = 45
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Sai&r'
      TabOrder = 1
      OnClick = btnSairClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        0800000000000002000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD0101FD
        FDFDFDFDFD0101FDFDFDFDFDFD9B9BFDFDFDFDFDFD9B9BFDFDFDFDFD01171701
        FDFDFDFD010F1701FDFDFDFD9BF7F79BFDFDFDFD9BF7F79BFDFDFDFD01171717
        01FDFD010F170F01FDFDFDFD9BF7F7F79BFDFD9BF7F7F79BFDFDFDFDFD011717
        1701010F170F01FDFDFDFDFDFD9BF7F7F79B9BF7F7F79BFDFDFDFDFDFDFD0117
        1F1717170F01FDFDFDFDFDFDFDFD9BF7F7F7F7F7F79BFDFDFDFDFDFDFDFDFD01
        1717171701FDFDFDFDFDFDFDFDFDFD9BF7F7F7F79BFDFDFDFDFDFDFDFDFDFD01
        5717171701FDFDFDFDFDFDFDFDFDFD9BF7F7F7F79BFDFDFDFDFDFDFDFDFD015F
        5F57571F1701FDFDFDFDFDFDFDFD9B070707F707F79BFDFDFDFDFDFDFD015F5F
        5F01015F1F5F01FDFDFDFDFDFD9B0707F79B9BF707F79BFDFDFDFDFD0167675F
        01FDFD015F5F5701FDFDFDFD9B0707F79BFDFD9BF707F79BFDFDFDFD01675F01
        FDFDFDFD015F1F01FDFDFDFD9B07079BFDFDFDFD9BF7079BFDFDFDFDFD0101FD
        FDFDFDFDFD0101FDFDFDFDFDFD9B9BFDFDFDFDFDFD9B9BFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
      NumGlyphs = 2
    end
    object cbxEmail: TCheckBox
      Left = 10
      Top = 85
      Width = 46
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Email'
      Checked = True
      State = cbChecked
      TabOrder = 2
      Visible = False
    end
  end
  object IdSMTP1: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 25
    AuthenticationType = atNone
    Left = 270
    Top = 220
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 300
    Top = 220
  end
  object odAnexos: TOpenDialog
    Left = 330
    Top = 220
  end
  object ConnectionLagoa: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 270
    Top = 190
  end
  object InsertOcorrencia: TADOQuery
    Connection = ConnectionLagoa
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PORTEIRO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'DATA'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'DATAOCORRENCIA'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'OCORRENCIA'
        Size = -1
        Value = Null
      end
      item
        Name = 'IMPORTANTE'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO OCORRENCIA'
      '(PORTEIRO, DATA, DATAOCORRENCIA, OCORRENCIA, IMPORTANTE)'
      'VALUES'
      '(:PORTEIRO, :DATA, :DATAOCORRENCIA, :OCORRENCIA, :IMPORTANTE)')
    Left = 300
    Top = 190
  end
end

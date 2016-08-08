object frmOcorrencia: TfrmOcorrencia
  Left = 301
  Top = 161
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
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
    end
    object btnSair: TBitBtn
      Left = 10
      Top = 50
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Sai&r'
      TabOrder = 1
      OnClick = btnSairClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
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
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=agfm1901;Persist Security Info=True' +
      ';User ID=lagoa;Initial Catalog=buildsis_lagoa;Data Source=70.38.' +
      '11.27;Use Procedure for Prepare=1;Auto Translate=True;Packet Siz' +
      'e=4096;Workstation ID=FONTESD7-VM;Use Encryption for Data=False;' +
      'Tag with column collation when possible=False'
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

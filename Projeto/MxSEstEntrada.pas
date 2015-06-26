unit MxSEstEntrada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, StdCtrls, DBCtrls, ExtCtrls, Buttons, Db, Inifiles, ShellApi,
  Movimento_Estoque_Comercial, Produto, CentroCusto, DBTables, SQuery,
  Parametro, Item_de_Estoque, Usuario, Menus, Movimento_Fisico, StrUtils;

type
  TfMxSEstEntrada = class(TForm)
    Panel2: TPanel;
    Label15: TLabel;
    Panel1: TPanel;
    Label7: TLabel;
    edtQuantidade: TEdit;
    Edit5: TEdit;
    Label12: TLabel;
    Label3: TLabel;
    edtDescricao: TEdit;
    bitConfirmar: TBitBtn;
    bitFechar: TBitBtn;
    Item_de_Estoque2: TItem_de_Estoque;
    Produto1: TProduto;
    edtDocumento: TEdit;
    rdbEntrada: TRadioButton;
    rdbSaida: TRadioButton;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    edtCodigoPRD: TEdit;
    edtProduto: TEdit;
    edtReferencia: TEdit;
    Edit1: TEdit;
    Label1: TLabel;
    edtCodigoMEC: TEdit;
    lblDescLote: TLabel;
    edtCodigoLOT: TEdit;
    ckbFiscal: TCheckBox;
    cbxTxt: TCheckBox;
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure bitConfirmarClick(Sender: TObject);
    procedure bitFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure rdbEntradaClick(Sender: TObject);
    procedure rdbSaidaClick(Sender: TObject);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoLOTExit(Sender: TObject);
    procedure edtCodigoLOTKeyPress(Sender: TObject; var Key: Char);
    procedure ckbFiscalClick(Sender: TObject);
  private
    { Private declarations }
  public
    Cancelar: Boolean;
  end;

var
  fMxSEstEntrada: TfMxSEstEntrada;

implementation
Uses
  UDM, MxSPediProd, funcoes, MxSPediProdMotCal, CdLote, DigSenha;

{$R *.DFM}


procedure TfMxSEstEntrada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;


procedure TfMxSEstEntrada.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=7;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=7;
        ShowModal;
      end;
    end;
    edtQuantidade.SetFocus;
  End;
end;

procedure TfMxSEstEntrada.bitConfirmarClick(Sender: TObject);
var
  mensagem, sAutorizado:string;
  Trans:Boolean;
  sDirAtual, sNomeArquivo : String;
  fArq :TextFile;
begin
  If not VerificaInteiroBranco(edtCodigoLOT.Text) then
    edtCodigoLOT.Text := '0';

  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise exception.Create('Não é possível gerar movimento em outro centro!');

  mensagem:='';
  if not ((rdbEntrada.Checked) or (rdbSaida.Checked)) then
    mensagem:=mensagem+'Tipo (Entrada/Saída) Inválido!'+#13;
  if Trim(edtDescricao.Text) = '' then
    mensagem:=mensagem+'Descrição do Movimento Inválida!'+#13;
  If not VerificaInteiro(edtDocumento.Text) then
    mensagem:=mensagem+'Código do Documento Inválido!'+#13;
  If not VerificaInteiroBranco(edtCodigoPRD.Text) then
    mensagem:=mensagem+'Código do Produto Inválido!'+#13;
  If not VerificaFloatBranco(edtQuantidade.Text) then
    mensagem:=mensagem+'Quantidade Inválida!'+#13;
  if mensagem<>'' then
    raise Exception.Create(mensagem);

  If MessageDlg('Esse processo irá gerar movimentos Avulsos!'+#13+'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  if DM.Usuario1.Permissoes.IndexOf(IntToStr(4050)) < 0 then //Movimento Avulso
  Begin
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      DigCdPDVCNC := 0;
      DigCdPDV    := 0;
      DigCdCLICNC := 0;
      DigCdCLI    := 0;
      DigCdPRD    := StrToInt(edtCodigoPRD.Text);
      DigvPrecoPRD:= StrToFloat(edtQuantidade.Text);
      if rdbEntrada.Checked then
        DigiTipoPendencia := 8 //Entrada Avulsa
      else
        DigiTipoPendencia := 9; //Saída Avulsa
      onClose:=nil;
      Tag:=46;
      Cancelar:=False;
      Showmodal;
      If not cancelar Then
      begin
        if usuario1.Permissoes.IndexOf(IntToStr(4050)) < 0 then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão para Movimentação Avulsa!');
        end
        else
          sAutorizado := 'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU);
      end
      else
      begin
        free;
        exit;
      end;
      free;
    End;
  end;


  if StrToInt(edtCodigoLOT.Text) > 0 then
  Begin
    DM.Item_de_Estoque_Detalhe1.Close;
    DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
    DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := StrToInt(edtCodigoLOT.Text);
    DM.Item_de_Estoque_Detalhe1.open;
    If DM.Item_de_Estoque_Detalhe1.isempty then
    begin
      DM.Item_de_Estoque_Detalhe1.Inserir(DM.Configuracao1.CodigoCNC,StrToInt(edtCodigoLOT.Text),StrToInt(edtCodigoPRD.Text));
      DM.Item_de_Estoque_Detalhe1.Close;
      DM.Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
      DM.Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := StrToInt(edtCodigoLOT.Text);
      DM.Item_de_Estoque_Detalhe1.open;
    end;
  end
  else if DM.Configuracao1.Empresa = empLuciano then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM ITEM_DE_ESTOQUE_DETALHE '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND PRD_CODIGO='+edtCodigoPRD.Text+
        ' AND IED_QTD_FISICO>0 ';
      Open;
      if not isEmpty then
        if MessageDlg('Existe lote para esse produto.'+
                      'Deseja continuar sem definir o Lote?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
    end;
  end;

  with Item_de_Estoque2 do
  Begin
    Trans:=false;
    with DM.Database2 do
    begin
      try
        If DM.Configuracao1.ControleTransacao then
        Begin
          StartTransaction;
          Trans:=True;
        end;

        if ckbFiscal.Checked then //somente estoque fiscal
        begin
          if MessageDlg('Atenção, será gerado movimento avulso de estoque fiscal, isso pode causar problemas junto a SEFAZ.'+
                        'Deseja continuar e se responsabilizar pelo processo?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            exit;

          if rdbEntrada.Checked then //Entrada
          Begin
            if StrToInt(edtCodigoLOT.Text)>0 then
            Begin
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                ' IED_QTD_FISCAL=IED_QTD_FISCAL+'+VirgPonto(edtQuantidade.Text)+
                ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(Item_de_Estoque2.CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(Item_de_Estoque2.CodigoCNC)+
                ' AND LOT_CODIGO='+edtCodigoLOT.Text);
            end;

            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
              ' IES_SFISCAL=IES_SFISCAL+'+VirgPonto(edtQuantidade.Text)+
              ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(Item_de_Estoque2.CodigoPRD)+
              ' AND CNC_CODIGO='+IntToStr(Item_de_Estoque2.CodigoCNC));

            //Gerar Movimento Fiscal
            if not DM.Mov_Est_Fiscal1.Inserir(CodigoCNC,CodigoPRD,0(*CdFUN*),0,
                CodigoCNC,0,365, 'E',StrToFloat(edtQuantidade.Text),
                Item_de_Estoque2.SFiscal,
                Item_de_Estoque2.SAmostraFiscal, 0, Item_de_Estoque2.SBonificacaoFiscal, 0) then
            Begin
              ShowMessage('Falha ao gerar Mov. Fiscal!');
              raise exception.Create('');
            end;

            //Gerar LOG
            DM.Usuario1.GeraLog(4050, DM.Configuracao1.CodigoCNC, StrToInt(edtCodigoMEC.Text),
              Trim(sAutorizado+' Entrada Avulso Estoque Fiscal PRD:'+IntToStr(CodigoPRD)+' '+edtDescricao.Text));

          end
          else
          Begin
            if StrToInt(edtCodigoLOT.Text)>0 then
            Begin
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                ' IED_QTD_FISCAL=IED_QTD_FISCAL-'+VirgPonto(edtQuantidade.Text)+
                ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(Item_de_Estoque2.CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(Item_de_Estoque2.CodigoCNC)+
                ' AND LOT_CODIGO='+edtCodigoLOT.Text);
            end;

            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
              ' IES_SFISCAL=IES_SFISCAL-'+VirgPonto(edtQuantidade.Text)+
              ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(Item_de_Estoque2.CodigoPRD)+
              ' AND CNC_CODIGO='+IntToStr(Item_de_Estoque2.CodigoCNC));


            //Gerar Movimento Fiscal
            if not DM.Mov_Est_Fiscal1.Inserir(CodigoCNC,CodigoPRD,0(*CdFUN*),0,
                CodigoCNC,0,265, 'S',StrToFloat(edtQuantidade.Text),
                Item_de_Estoque2.SFiscal,
                Item_de_Estoque2.SAmostraFiscal, 0, Item_de_Estoque2.SBonificacaoFiscal, 0) then
            Begin
              ShowMessage('Falha ao gerar Mov. Fiscal!');
              raise exception.Create('');
            end;

            //Gerar LOG
            DM.Usuario1.GeraLog(4050, DM.Configuracao1.CodigoCNC, StrToInt(edtCodigoMEC.Text),
                'Saída Avulso Estoque Fiscal PRD:'+IntToStr(CodigoPRD)+' '+edtDescricao.Text);
          end;


          if cbxTxt.Checked then
          begin
            sDirAtual := 'C:\Importação';

            if not DirectoryExists(sDirAtual) then
              CreateDir(sDirAtual);

            sNomeArquivo := sDirAtual+'\AVULSO.TXT';


            Memo1.Lines.Add(
            Copy(edtCodigoPRD.Text     +'                                              ',1,5) +' '+
            IfThen(rdbEntrada.Checked,'E ','S ')                                                  +
            Copy(edtQuantidade.Text    +'                                              ',1,10)+' ');

            Memo1.Lines.SaveToFile(sNomeArquivo);


            {
            AssignFile(fArq,sNomeArquivo);
            Rewrite(fArq);
            WriteLn(FArq,
            Copy(edtCodigoPRD.Text     +'                                              ',1,5) +' '+
            IfThen(rdbEntrada.Checked,'E ','S ')                                                  +
            Copy(edtQuantidade.Text    +'                                              ',1,10)+' ');
            Closefile(fArq);
            ShellExecute( 0, 'Open',pChar(sNomeArquivo),'','', SW_SHOWNORMAL);
            }
          end;

        end
        else
        begin
          if rdbEntrada.Checked then //Entrada
          Begin
            if StrToInt(edtCodigoLOT.Text)>0 then
            Begin
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                ' IED_QTD_FISICO=IED_QTD_FISICO+'+VirgPonto(edtQuantidade.Text)+
                ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(Item_de_Estoque2.CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(Item_de_Estoque2.CodigoCNC)+
                ' AND LOT_CODIGO='+edtCodigoLOT.Text);
            end;

            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
              ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(edtQuantidade.Text)+
              ',IES_SFISICO=IES_SFISICO+'+VirgPonto(edtQuantidade.Text)+
              ',IES_SSN=IES_SSN+'+VirgPonto(edtQuantidade.Text)+
              ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(Item_de_Estoque2.CodigoPRD)+
              ' AND CNC_CODIGO='+IntToStr(Item_de_Estoque2.CodigoCNC));

            //Gerar Movimento Comercial
            if not DM.Movimento_Estoque_Comercial1.Inserir(CodigoCNC,StrToInt(edtCodigoMEC.Text),
                CodigoPRD,0(*CdFUN*),380(*Tipo*),CodigoCNC,StrToInt(edtCodigoMEC.Text),
                'E',StrToFloat(edtQuantidade.Text),SComercial,SReservado,Indisponivel,
                SAmostra, 0(*Amostra*), SBonificacao, 0(*Bonus*),
                edtDescricao.Text) then
            Begin
              ShowMessage('Falha ao Gerar Mov. Comercial!');
              Raise Exception.Create('');
            end;

            //Gerar Movimento Fisico
            if not DM.Movimento_Fisico1.Inserir(CodigoCNC,0,CodigoPRD,0(*CdFUN*),CodigoCNC,StrToInt(edtCodigoMEC.Text),
                380(*Entrada Avulsa*),'E',
                StrToFloat(edtQuantidade.Text),SFisico,edtDescricao.Text) then
            Begin
              ShowMessage('Falha ao Gerar Mov. Físico!');
              Raise Exception.Create('');
            end;

            //Gerar Movimento SN
            If not DM.Movimento_Estoque_SN1.Inserir(CodigoCNC,CodigoPRD,0(*CdFUN*),380(*Tipo*),
                CodigoCNC,StrToInt(edtCodigoMEC.Text),'E',
                StrToFloat(edtQuantidade.Text),SSN,edtDescricao.Text) then
            Begin
              ShowMessage('Falha ao Gerar Mov. SN!');
              Raise Exception.Create('');
            end;

            //Gerar LOG
            DM.Usuario1.GeraLog(4050, DM.Configuracao1.CodigoCNC, StrToInt(edtCodigoMEC.Text),
              Trim(sAutorizado+' Entrada PRD:'+IntToStr(CodigoPRD)+' '+edtDescricao.Text));
          end
          else
          Begin
            if StrToInt(edtCodigoLOT.Text)>0 then
            Begin
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                ' IED_QTD_FISICO=IED_QTD_FISICO-'+VirgPonto(edtQuantidade.Text)+
                ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(Item_de_Estoque2.CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(Item_de_Estoque2.CodigoCNC)+
                ' AND LOT_CODIGO='+edtCodigoLOT.Text);
            end;

            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
              ' IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(edtQuantidade.Text)+
              ',IES_SFISICO=IES_SFISICO-'+VirgPonto(edtQuantidade.Text)+
              ',IES_SSN=IES_SSN-'+VirgPonto(edtQuantidade.Text)+
              ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(Item_de_Estoque2.CodigoPRD)+
              ' AND CNC_CODIGO='+IntToStr(Item_de_Estoque2.CodigoCNC));

            //Gerar Movimento Comercial
            if not DM.Movimento_Estoque_Comercial1.Inserir(CodigoCNC,StrToInt(edtCodigoMEC.Text),
                CodigoPRD,0(*CdFUN*),385(*Tipo*),CodigoCNC,StrToInt(edtCodigoMEC.Text),
                'S',StrToFloat(edtQuantidade.Text),SComercial, SReservado, Indisponivel,
                SAmostra, 0(*Amostra*), SBonificacao, 0(*Bonus*),
                edtDescricao.Text) then
            Begin
              ShowMessage('Falha ao Gerar Mov. Comercial!');
              Raise Exception.Create('');
            end;

            //Gerar Movimento Físico
            if not DM.Movimento_Fisico1.Inserir(CodigoCNC,0,CodigoPRD,0(*CdFUN*),CodigoCNC,StrToInt(edtCodigoMEC.Text),
                385(*Saida Avulsa*),'S',
                StrToFloat(edtQuantidade.Text),SFisico,edtDescricao.Text) then
            Begin
              ShowMessage('Falha ao Gerar Mov. Físico!');
              Raise Exception.Create('');
            end;

            //Gerar Movimento SN
            If not DM.Movimento_Estoque_SN1.Inserir(CodigoCNC,CodigoPRD,0(*CdFUN*),385(*Tipo*),
                 CodigoCNC,StrToInt(edtCodigoMEC.Text),'S',
                 StrToFloat(edtQuantidade.Text),SSN,edtDescricao.Text) then
            Begin
              ShowMessage('Falha ao Gerar Mov. SN!');
              Raise Exception.Create('');
            end;

            //Gerar LOG
            DM.Usuario1.GeraLog(4050, DM.Configuracao1.CodigoCNC, StrToInt(edtCodigoMEC.Text),
                'Saída PRD:'+IntToStr(CodigoPRD)+' '+edtDescricao.Text);
          end;
        end;

        If DM.Configuracao1.ControleTransacao then
          Commit;
        ShowMessage('Movimento Realizado!');
      except
        If DM.Configuracao1.ControleTransacao then
          if trans then
          Begin
            RollBack;
            ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
          end;
      end;
    end;
  end;
  rdbEntrada.Checked := False;
  rdbSaida.Checked := False;
  edtQuantidade.Clear;
  edtCodigoPRD.Clear;
  edtProduto.Clear;
  edtReferencia.Clear;
  Edit5.Clear;
  edtCodigoLOT.Text := '0';
  edtCodigoMEC.Text := IntToStr(DM.Movimento_Estoque_Comercial1.ProximoCodigo('MEC_CODIGO'));
  edtDescricao.SetFocus;
end;

procedure TfMxSEstEntrada.bitFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSEstEntrada.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);

  Memo1.Text := '';

  edtCodigoLOT.Text := '0';
  if DM.Configuracao1.Empresa <> empLuciano then
  Begin
    lblDescLote.Visible := False;
    edtCodigoLOT.Visible := False;
  end
  else
    edtCodigoLOT.Enabled := True;

  Edit1.Text:=DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  edtCodigoMEC.Text := IntToStr(DM.Movimento_Estoque_Comercial1.ProximoCodigo('MEC_CODIGO'));
  edtDescricao.SetFocus;


  if DM.Configuracao1.Empresa = empLuciano then
  begin
    if ( DM.Configuracao1.CodigoUSU = 40 ) or ( DM.Configuracao1.CodigoUSU = 44 ) or ( DM.Configuracao1.CodigoUSU = 1 ) then //somente a solange, ireuma e ADM visualiza
      ckbFiscal.Visible := true
    else
      ckbFiscal.Visible := false;
  end
  else
    ckbFiscal.Visible := false;
end;

procedure TfMxSEstEntrada.edtCodigoPRDExit(Sender: TObject);
begin
  if bitFechar.Focused then
    Exit;
  If not VerificaInteiroBranco(edtCodigoPRD.Text) then
    edtCodigoPRD.Text := '0';
  Produto1.Close;
  Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
  Produto1.Open;
  if not Produto1.IsEmpty then
  Begin
    edtProduto.text:=Trim(Produto1.Descricao+' '+Produto1.Caracteristica);
    edtReferencia.text:=Produto1.Referencia;
//    edtMarca.text:=Produto1.Marca;
  End
  else
  begin
    Edit5.Clear;
    edtProduto.Clear;
    edtReferencia.Clear;
//    edtMarca.Clear;
    Showmessage('Produto inexistente!');
    edtCodigoPRD.SetFocus;
    Exit;
  end;
  Item_de_Estoque2.Close;
  Item_de_Estoque2.ParamByName('CNC_CODIGO').AsInteger:=DM.Configuracao1.CodigoCNC;  
  Item_de_Estoque2.ParamByName('PRD_CODIGO').AsInteger:=StrToInt(edtCodigoPRD.Text);
  Item_de_Estoque2.open;
  If Item_de_Estoque2.isempty then
  begin
    Item_de_Estoque2.Inserir(DM.Configuracao1.CodigoCNC,StrToInt(edtCodigoPRD.Text),0(*CdFUN*),0,0,0,0,0,
      DM.Configuracao1.DataHora,0,0,0,0,0,0);
    Item_de_Estoque2.Close;
    Item_de_Estoque2.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
    Item_de_Estoque2.ParamByName('PRD_CODIGO').AsInteger := StrToInt(edtCodigoPRD.Text);
    Item_de_Estoque2.open;
  end;
  Edit5.Text:=FloatToStr(Item_de_Estoque2.Saldo);
end;

procedure TfMxSEstEntrada.rdbEntradaClick(Sender: TObject);
begin
  edtDescricao.SetFocus;
end;

procedure TfMxSEstEntrada.rdbSaidaClick(Sender: TObject);
begin
  edtDescricao.SetFocus;
end;

procedure TfMxSEstEntrada.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if (edtQuantidade.Focused) and (Key = '.') then
    Key := ',';
end;

procedure TfMxSEstEntrada.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (edtQuantidade.Text = '') then
    edtQuantidade.SetFocus
  else if (Key = #13) then
    bitConfirmarClick(bitConfirmar);
end;

procedure TfMxSEstEntrada.edtCodigoLOTExit(Sender: TObject);
begin
  if (not VerificaInteiroBranco(edtCodigoPRD.Text)) or
     (not VerificaInteiroBranco(edtCodigoLOT.Text)) then
    edtCodigoLOT.Text := '0';

  if StrToInt(edtCodigoLOT.Text) <= 0 then
  Begin
    edtCodigoLOT.Text := '0';
    Exit;
  end;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT LOT_CODIGO '+
      ' FROM LOTE '+
      ' WHERE PRD_CODIGO='+edtCodigoPRD.Text+
      ' AND LOT_CODIGO='+edtCodigoLOT.Text;
    Open;
    if isEmpty then
    Begin
      edtCodigoLOT.Text := '0';
      Exit;
    end;
  end;
end;

procedure TfMxSEstEntrada.edtCodigoLOTKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfCadLote, fCadLote);
    with fCadLote do
    Begin
      tag:=7;
      edtCodigoPRD.text := self.edtCodigoPRD.Text;
      edtProduto.Text := self.edtProduto.Text;
      ShowModal;
    end;
  end;
end;

procedure TfMxSEstEntrada.ckbFiscalClick(Sender: TObject);
begin
  cbxTxt.Visible := ckbFiscal.Checked;
  cbxTxt.Checked := False;
end;

end.

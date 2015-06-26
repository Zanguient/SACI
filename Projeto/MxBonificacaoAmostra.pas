unit MxBonificacaoAmostra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, StdCtrls, DBCtrls, ExtCtrls, Buttons, Db,
  Movimento_Estoque_Comercial, Produto, CentroCusto, DBTables, SQuery,
  Parametro, Item_de_Estoque, Usuario, Menus, Movimento_Fisico, Cliente;

type
  TfMxBonificacaoAmostra = class(TForm)
    Panel2: TPanel;
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
    edtCodigoCLI: TEdit;
    rdbEntrada: TRadioButton;
    rdbSaida: TRadioButton;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    edtCodigoPRD: TEdit;
    edtProduto: TEdit;
    edtReferencia: TEdit;
    edtMarca: TEdit;
    edtUsuario: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtRazaoSocial: TEdit;
    ckbBonificacao: TCheckBox;
    ckbAmostra: TCheckBox;
    Cliente1: TCliente;
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
    procedure edtCodigoCLIExit(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure ckbBonificacaoClick(Sender: TObject);
    procedure ckbAmostraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxBonificacaoAmostra: TfMxBonificacaoAmostra;

implementation
Uses
  UDM, MxSPediProd, funcoes, MxSPediProdMotCal, CdCliente,
  UComprovanteMovimento;

{$R *.DFM}


procedure TfMxBonificacaoAmostra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;


procedure TfMxBonificacaoAmostra.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=61;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=61;
        ShowModal;
      end;
    end;
    edtQuantidade.SetFocus;
  End;
end;

procedure TfMxBonificacaoAmostra.bitConfirmarClick(Sender: TObject);
var
  mensagem,sBonificacaoAmostra:string;
  Trans:Boolean;
  vBonificacao, vAmostra: double;
  CdCNC, CdPRD, iTipoMov: integer;
begin
  mensagem:='';
  if not ((rdbEntrada.Checked) or (rdbSaida.Checked)) then
    mensagem:=mensagem+'Tipo (Entrada/Saída) Inválido!'+#13;
  if Trim(edtDescricao.Text) = '' then
    mensagem:=mensagem+'Descrição do Movimento Inválida!'+#13;
  If not VerificaInteiro(edtCodigoCLI.Text) then
    mensagem:=mensagem+'Código do Cliente Inválido!'+#13;
  If not VerificaInteiroBranco(edtCodigoPRD.Text) then
    mensagem:=mensagem+'Código do Produto Inválido!'+#13;
  If not VerificaFloatBranco(edtQuantidade.Text) then
    mensagem:=mensagem+'Quantidade Inválida!'+#13;
  if (not ckbBonificacao.Checked) and
     (not ckbAmostra.Checked) then
    mensagem:=mensagem+'Selecione o tipo de movimento (Bonificação ou Amostra Grátis)!'+#13;
  if mensagem<>'' then
    raise Exception.Create(mensagem);

  If MessageDlg('Esse processo irá gerar movimentos de estoque!'+#13+
                'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  vBonificacao := 0;
  vAmostra := 0;

  if ckbBonificacao.Checked then
    iTipoMov := 4470 //Bonificacao
  else
    iTipoMov := 4480; //Amostra

  with Item_de_Estoque2 do
  Begin
    CdCNC := CodigoCNC;
    CdPRD := CodigoPRD;

    Trans:=false;
    with DM.Database2 do
    begin
      try
        If DM.Configuracao1.ControleTransacao then
        Begin
          StartTransaction;
          Trans:=True;
        end;

        if rdbEntrada.Checked then //Entrada
        Begin
          if ckbBonificacao.Checked then
          Begin
            sBonificacaoAmostra := ',IES_SBONIFICACAO=IES_SBONIFICACAO+'+VirgPonto(edtQuantidade.Text);
            vBonificacao := StrToFloat(edtQuantidade.Text);
          end
          else
          Begin
            sBonificacaoAmostra := ',IES_SAMOSTRA=IES_SAMOSTRA+'+VirgPonto(edtQuantidade.Text);
            vAmostra := StrToFloat(edtQuantidade.Text);
          end;

          ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
            ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(edtQuantidade.Text)+
            ',IES_SFISICO=IES_SFISICO+'+VirgPonto(edtQuantidade.Text)+
            sBonificacaoAmostra+
            ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
            ' AND CNC_CODIGO='+IntToStr(CdCNC));

          //Gerar Movimento Comercial
          if not DM.Movimento_Estoque_Comercial1.Inserir(CdCNC,0,
              CdPRD,0(*CdFUN*),iTipoMov(*Tipo*),CdCNC,StrToInt(edtCodigoCLI.Text),
              'E',StrToFloat(edtQuantidade.Text),SComercial,SReservado,Indisponivel,
              SAmostra, vAmostra, SBonificacao, vBonificacao,
              Trim(edtDescricao.Text+' '+edtRazaoSocial.Text)) then
          Begin
            ShowMessage('Falha ao Gerar Mov. Comercial!');
            Raise Exception.Create('');
          end;

          //Gerar Movimento Fisico
          if not DM.Movimento_Fisico1.Inserir(CdCNC,0,CdPRD,0(*CdFUN*),CdCNC,StrToInt(edtCodigoCLI.Text),
              iTipoMov,'E',
              StrToFloat(edtQuantidade.Text),SFisico,Trim(edtDescricao.Text+' '+edtRazaoSocial.Text)) then
          Begin
            ShowMessage('Falha ao Gerar Mov. Físico!');
            Raise Exception.Create('');
          end;

          //Gerar LOG
          DM.Usuario1.GeraLog(8130, DM.Configuracao1.CodigoCNC, StrToInt(edtCodigoCLI.Text),
            'Entrada PRD:'+IntToStr(CdPRD)+' '+edtDescricao.Text+
            ' CLI:'+edtRazaoSocial.Text+
            ' BONUS:'+Format('%.2f',[vBonificacao])+
            ' Amostra:'+Format('%.2f',[vAmostra]));
        end
        else
        Begin
          if ckbBonificacao.Checked then
          Begin
            sBonificacaoAmostra := ',IES_SBONIFICACAO=IES_SBONIFICACAO-'+VirgPonto(edtQuantidade.Text);
            vBonificacao := StrToFloat(edtQuantidade.Text);
          end
          else
          Begin
            sBonificacaoAmostra := ',IES_SAMOSTRA=IES_SAMOSTRA-'+VirgPonto(edtQuantidade.Text);
            vAmostra := StrToFloat(edtQuantidade.Text);
          end;

          ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
            ' IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(edtQuantidade.Text)+
            ',IES_SFISICO=IES_SFISICO-'+VirgPonto(edtQuantidade.Text)+
            sBonificacaoAmostra+
            ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
            ' AND CNC_CODIGO='+IntToStr(CdCNC));

          //Gerar Movimento Comercial
          if not DM.Movimento_Estoque_Comercial1.Inserir(CdCNC,0,
              CdPRD,0(*CdFUN*),iTipoMov(*Tipo*),CdCNC,StrToInt(edtCodigoCLI.Text),
              'S',StrToFloat(edtQuantidade.Text),SComercial, SReservado, Indisponivel,
              SAmostra, vAmostra, SBonificacao, vBonificacao,
              Trim(edtDescricao.Text+' '+edtRazaoSocial.Text)) then
          Begin
            ShowMessage('Falha ao Gerar Mov. Comercial!');
            Raise Exception.Create('');
          end;

          //Gerar Movimento Físico
          if not DM.Movimento_Fisico1.Inserir(CdCNC,0,CdPRD,0(*CdFUN*),CdCNC,StrToInt(edtCodigoCLI.Text),
              iTipoMov,'S',
              StrToFloat(edtQuantidade.Text),SFisico,Trim(edtDescricao.Text+' '+edtRazaoSocial.Text)) then
          Begin
            ShowMessage('Falha ao Gerar Mov. Físico!');
            Raise Exception.Create('');
          end;

          //Gerar LOG
          DM.Usuario1.GeraLog(8130, DM.Configuracao1.CodigoCNC, StrToInt(edtCodigoCLI.Text),
              'Saida PRD:'+IntToStr(CdPRD)+' '+edtDescricao.Text+
              ' CLI:'+edtRazaoSocial.Text+
              ' BONUS:'+Format('%.2f',[vBonificacao])+
              ' Amostra:'+Format('%.2f',[vAmostra]));
        end;

        If DM.Configuracao1.ControleTransacao then
          Commit;
        Trans := False;

        //Mostrar Comprovante
        Application.CreateForm(Trpt_ComprovanteMovimento, rpt_ComprovanteMovimento);
        with rpt_ComprovanteMovimento do
        Begin
          Tag := 0;
          Produto1.Close;
          Produto1.ParamByName('PRD_CODIGO').asInteger := CdPRD;
          Produto1.Open;

          Movimento_Fisico1.Close;
          Movimento_Fisico1.ParamByName('CNC_CODIGO').asInteger     := CdCNC;
          Movimento_Fisico1.ParamByName('PRD_CODIGO').asInteger     := CdPRD;
          Movimento_Fisico1.ParamByName('MEF_TIPO_MOV').asInteger   := iTipoMov; //Bonificação/Amostra
          Movimento_Fisico1.ParamByName('MEF_ENT_CODIGO').asInteger := StrToInt(edtCodigoCLI.Text);
          Movimento_Fisico1.Open;
          report.Preview;
          Close;
        end;
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
  (*rdbEntrada.Checked := False;
  rdbSaida.Checked := False;*)
  edtQuantidade.Clear;
  edtCodigoPRD.Clear;
  edtProduto.Clear;
  edtReferencia.Clear;
  edtMarca.Clear;
  Edit5.Clear;
  (*edtDescricao.SetFocus;*)
  edtCodigoPRD.SetFocus;
end;

procedure TfMxBonificacaoAmostra.bitFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxBonificacaoAmostra.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);;
  edtDescricao.SetFocus;
end;

procedure TfMxBonificacaoAmostra.edtCodigoPRDExit(Sender: TObject);
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
    edtMarca.text:=Produto1.Marca;
  End
  else
  begin
    Edit5.Clear;
    edtProduto.Clear;
    edtReferencia.Clear;
    edtMarca.Clear;
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
  Edit5.Text:=FloatToStr(Item_de_Estoque2.Saldo)
end;

procedure TfMxBonificacaoAmostra.rdbEntradaClick(Sender: TObject);
begin
  edtDescricao.SetFocus;
end;

procedure TfMxBonificacaoAmostra.rdbSaidaClick(Sender: TObject);
begin
  edtDescricao.SetFocus;
end;

procedure TfMxBonificacaoAmostra.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if (edtQuantidade.Focused) and (Key = '.') then
    Key := ',';
end;

procedure TfMxBonificacaoAmostra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (edtQuantidade.Text = '') then
    edtQuantidade.SetFocus
  else if (Key = #13) then
    bitConfirmarClick(bitConfirmar); 
end;

procedure TfMxBonificacaoAmostra.edtCodigoCLIExit(Sender: TObject);
begin
  if bitFechar.Focused then
    Exit;

  if not VerificaInteiroBranco(edtCodigoCLI.Text) then
    Raise exception.Create('Código do Cliente inválido!');

  with Cliente1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
    ParamByName('CLI_CODIGO').asInteger := StrToInt(edtCodigoCLI.Text);
    Open;
    edtRazaoSocial.Text := RazaoSocial;
  end;
end;

procedure TfMxBonificacaoAmostra.edtCodigoCLIKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Clear;
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=44;
    fCadCli.CentroCusto2.open;
    fCadCli.dblCentroDeCusto.KeyValue:=DM.Configuracao1.CodigoCNC;
    fCadCli.Showmodal;
  End;
end;

procedure TfMxBonificacaoAmostra.ckbBonificacaoClick(Sender: TObject);
begin
  if ckbBonificacao.Checked then
    ckbAmostra.Checked := False;
end;

procedure TfMxBonificacaoAmostra.ckbAmostraClick(Sender: TObject);
begin
  if ckbAmostra.Checked then
    ckbBonificacao.Checked := False;
end;

end.

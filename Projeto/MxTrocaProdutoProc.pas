unit MxTrocaProdutoProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, checklst, Pedido_de_Venda, Db, DBTables,
  SQuery, Item_Pedido_Venda, Produto, Cliente, Item_de_Troca, Troca,
  DBCtrls, Vendedor, Titulo_receber, Item_de_Embarque,
  Direito_de_Bonus, Item_de_Estoque;

type
  TfMxTrocaProdutoProc = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    bitProcessar: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    edtCodigoPDV: TEdit;
    Label2: TLabel;
    edtCodigoCLI: TEdit;
    edtDataHora: TEdit;
    Label3: TLabel;
    edtCliente: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtCodigoPRD: TEdit;
    edtQuantiade: TEdit;
    edtProduto: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtPrecoUnitario: TEdit;
    Label8: TLabel;
    edtValor: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    edtMotivo: TEdit;
    Label12: TLabel;
    edtDiferenca: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Pedido_de_Venda1: TPedido_de_Venda;
    Produto1: TProduto;
    DSPedido_de_Venda1: TDataSource;
    Cliente1: TCliente;
    Pedido_de_Venda1PDV_CODIGO: TIntegerField;
    Pedido_de_Venda1CNC_CODIGO: TIntegerField;
    Pedido_de_Venda1CLI_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_DATA_HORA: TDateTimeField;
    Pedido_de_Venda1PDV_SITUACAO: TIntegerField;
    Pedido_de_Venda1CNC_CLIENTE: TIntegerField;
    Pedido_de_Venda1Cliente: TStringField;
    Item_Pedido_Venda1CNC_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_CODIGO: TIntegerField;
    Item_Pedido_Venda1FUN_CODIGO: TIntegerField;
    Item_Pedido_Venda1IEB_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_CODIGO: TIntegerField;
    Item_Pedido_Venda1SEC_CODIGO: TIntegerField;
    Item_Pedido_Venda1PRD_CODIGO: TIntegerField;
    Item_Pedido_Venda1TBP_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_ENTREGA: TSmallintField;
    Item_Pedido_Venda1IPV_AVISTA: TSmallintField;
    Item_Pedido_Venda1IPV_QUANTIDADE: TFloatField;
    Item_Pedido_Venda1IPV_DESCONTO: TFloatField;
    Item_Pedido_Venda1IPV_BONIFICACAO: TFloatField;
    Item_Pedido_Venda1CNC_LOCAL_ESTOQUE: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO: TFloatField;
    Item_Pedido_Venda1IPV_SITUACAO: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO_DESC: TFloatField;
    Item_Pedido_Venda1IPV_NOTA: TIntegerField;
    Item_Pedido_Venda1IPV_ITEMNOTA: TIntegerField;
    Item_Pedido_Venda1Produto: TStringField;
    BitBtn4: TBitBtn;
    ListBox1: TListBox;
    Troca1: TTroca;
    Item_de_Troca1: TItem_de_Troca;
    Vendedor1: TVendedor;
    DSVendedor1: TDataSource;
    Item_de_Estoque1: TItem_de_Estoque;
    Titulo_receber1: TTitulo_receber;
    Label18: TLabel;
    Vendedor2: TVendedor;
    Item_Pedido_Venda1IPV_PRECO_NOTA: TFloatField;
    Item_Pedido_Venda1IPV_PENDENCIA: TIntegerField;
    Item_Pedido_Venda1IPV_ESTOQUE_LOCAL: TFloatField;
    Item_Pedido_Venda1IPV_ESTOQUE_EXTERNO: TFloatField;
    Item_Pedido_Venda1IPV_PRECO_SUGERIDO: TFloatField;
    Pedido_de_Venda1PDV_NOTA_FISCAL: TSmallintField;
    Item_de_Embarque1: TItem_de_Embarque;
    rdbGerarCredito: TRadioButton;
    rdbGerarExtorno: TRadioButton;
    Bevel1: TBevel;
    Pedido_de_Venda1PDV_OBS: TStringField;
    Direito_de_Bonus1: TDireito_de_Bonus;
    Item_Pedido_Venda1IPV_DIAS_ENTREGA: TIntegerField;
    Item_Pedido_Venda1IPV_DT_ENTRADA: TDateTimeField;
    Item_Pedido_Venda1IPV_DT_SAIDA: TDateTimeField;
    Item_Pedido_Venda1IPV_SERVICO: TIntegerField;
    Item_Pedido_Venda1USU_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_OBSERVACAO: TStringField;
    rdbIgnorarValor: TRadioButton;
    Item_Pedido_Venda1IPV_DT_ALTERADO: TDateTimeField;
    Item_Pedido_Venda1IPV_DT_CADASTRO: TDateTimeField;
    Pedido_de_Venda1USU_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_TOTAL: TFloatField;
    Pedido_de_Venda1PDV_LISTADO: TIntegerField;
    Pedido_de_Venda1PDV_DIAS_RESERV: TIntegerField;
    Pedido_de_Venda1AGF_CODIGO: TIntegerField;
    Pedido_de_Venda1FPG_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_TIPO_PAG: TIntegerField;
    Pedido_de_Venda1PDV_ENTRADA: TFloatField;
    Pedido_de_Venda1PDV_EM_USO: TIntegerField;
    Pedido_de_Venda1PDV_ACRESCIMO: TFloatField;
    Pedido_de_Venda1PDV_DT_ALTERADO: TDateTimeField;
    Pedido_de_Venda1PDV_MAQUINA: TIntegerField;
    Pedido_de_Venda1PDV_MELHOR_DATA: TDateTimeField;
    Pedido_de_Venda1PDV_VENCIMENTOS: TStringField;
    Pedido_de_Venda1PDV_MEDIA_PAGAMENTO: TIntegerField;
    Pedido_de_Venda1PDV_NOTA_CUPOM: TIntegerField;
    Pedido_de_Venda1PDV_IMPRESSO: TIntegerField;
    Pedido_de_Venda1PDV_DT_EMISSAO_VENDA: TDateTimeField;
    Pedido_de_Venda1PDV_DT_DEVOLUCAO: TDateTimeField;
    Pedido_de_Venda1PDV_CONTATO: TStringField;
    Pedido_de_Venda1PDV_CREDITO: TFloatField;
    Pedido_de_Venda1FUN_ARQUITETO: TIntegerField;
    Pedido_de_Venda1PDV_TITULO_GERADO: TIntegerField;
    Pedido_de_Venda1PDV_TIPO_VENDA: TIntegerField;
    Pedido_de_Venda1PDV_PACOTE: TIntegerField;
    Pedido_de_Venda1PDV_GRUPO_ESPECIAL: TIntegerField;
    Pedido_de_Venda1PDV_DT_PREVISAO: TDateTimeField;
    Pedido_de_Venda1PDV_DT_ENTREGA: TDateTimeField;
    Pedido_de_Venda1PDV_DOCUMENTO: TStringField;
    Pedido_de_Venda1PDV_CAIXA: TStringField;
    Pedido_de_Venda1PDV_SERVICO: TIntegerField;
    Pedido_de_Venda1PDV_FONE_CONTATO: TStringField;
    Pedido_de_Venda1FPE_CODIGO: TIntegerField;
    Pedido_de_Venda1CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Pedido_de_Venda1PDV_DT_FPE: TDateTimeField;
    Pedido_de_Venda1CNT_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_GARANTIA: TIntegerField;
    Pedido_de_Venda1PDV_CODIGO_ORIGEM: TIntegerField;
    Pedido_de_Venda1PDV_FRETE: TFloatField;
    Item_Pedido_Venda1IPV_VINCULO: TIntegerField;
    Item_Pedido_Venda1IPV_SEQUENCIA: TIntegerField;
    Item_Pedido_Venda1LOT_CODIGO: TIntegerField;
    procedure BitBtn2Click(Sender: TObject);
    procedure edtQuantiadeExit(Sender: TObject);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure Edit9Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Pedido_de_Venda1CalcFields(DataSet: TDataSet);
    procedure Item_Pedido_Venda1CalcFields(DataSet: TDataSet);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitProcessarClick(Sender: TObject);
    procedure Vendedor1BeforeOpen(DataSet: TDataSet);
    procedure ListBox1Click(Sender: TObject);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPRDChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Diferenca:Double;
    Cancelar:Boolean;
    { Public declarations }
  end;

var
  fMxTrocaProdutoProc: TfMxTrocaProdutoProc;

implementation
Uses UDM, funcoes, MxSPediProd, DigSenha, MxSPediDesc, UCredito, Math,
  MxSRecPedido;
{$R *.DFM}


procedure TfMxTrocaProdutoProc.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxTrocaProdutoProc.edtQuantiadeExit(Sender: TObject);
begin
  If BitBtn2.Focused then
    Exit;
  if not VerificaFloatBranco(edtQuantiade.Text) then
  Begin
    ShowMessage('Quantidade inválida!');
    edtQuantiade.SetFocus;
    Exit;
  end;
  if StrToFloat(edtQuantiade.Text) > 0 then
  Begin
    edtQuantiade.Text:=format('%.2f',[StrToFloat(edtQuantiade.Text)]);
    edtValor.Text:=format('%.2f',[StrToFloat(edtPrecoUnitario.Text)*StrToFloat(edtQuantiade.Text)]);
  end
  else
  Begin
    ShowMessage('Quantidade inválida!');
    edtQuantiade.SetFocus;
    Exit;
  end;
end;

procedure TfMxTrocaProdutoProc.edtCodigoPRDExit(Sender: TObject);
var
  j : integer;
begin
  if edtCodigoPRD.Text = '' then
    edtQuantiade.Enabled := False;
  If bitProcessar.Focused then
    Exit;
  If BitBtn2.Focused then
    Exit;
  If ListBox1.Focused then
    Exit;
  If edtMotivo.Focused then
    Exit;
  If (rdbGerarCredito.Focused) or (rdbGerarExtorno.Focused) then
    Exit;
  if not VerificaInteiroBranco(edtCodigoPRD.text) then
  Begin
    Showmessage('Código de produto inválido');
    TEdit(Sender).SetFocus;
    Exit;
  End;

  edtPrecoUnitario.Clear;
  for j:=0 to ListBox1.Items.Count-1 do
  Begin
    if StrToInt(Copy(ListBox1.Items[j],1,6)) = StrToInt(edtCodigoPRD.Text) then
      edtPrecoUnitario.text:=Format('%.2f',[StrToFloat(Copy(ListBox1.Items[j],57,10))/StrToFloat(Copy(ListBox1.Items[j],48,9))]);
  end;

  if edtPrecoUnitario.text = '' then
  Begin
    Showmessage('Produto não Vendido ou já devolvido!');
    TEdit(Sender).SetFocus;
    Exit;
  end;

  Produto1.Close;
  Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
  Produto1.Open;
  If not Produto1.IsEmpty Then
    edtProduto.text := Trim(Produto1.Descricao+' '+Produto1.Referencia)
  else
  Begin
    Showmessage('Produto inexistente!');
    TEdit(Sender).SetFocus;
    Exit;
  End;
  edtQuantiade.Enabled:=True;
  edtQuantiade.SetFocus;
end;

procedure TfMxTrocaProdutoProc.Edit9Exit(Sender: TObject);
begin
  If BitBtn2.Focused then
    Exit;
  edtCodigoPRDExit(Sender);

  edtValor.Text:=format('%.2f',[StrToFloat(edtPrecoUnitario.Text)*StrToFloat(edtQuantiade.Text)]);

end;

procedure TfMxTrocaProdutoProc.FormShow(Sender: TObject);
var
  valor:Double;
  TRO,i,tam:integer;
  temp,temp2,temp3:string;
begin
  Diferenca:=0;
  DM.Usuario1.AlteraCorComponentes(self);
  if Pedido_de_venda1.CodigoCLI = DM.Configuracao1.CodigoCliAVista then
  Begin
    rdbGerarCredito.Enabled := False;
    rdbGerarExtorno.Checked := True;
    rdbGerarExtorno.Enabled := False;
  end;

  edtCodigoPDV.Text:=IntToStr(Pedido_de_Venda1.CodigoPDV);
  edtCodigoCLI.Text:=IntToStr(Pedido_de_venda1.CodigoCLI);
  edtDataHora.Text:=formatDateTime('dd/mm/yyyy hh:mm',Pedido_de_Venda1.DataHora);
  edtCliente.Text:=Pedido_de_Venda1.FieldByName('Cliente').asString;
  With Item_Pedido_Venda1 do
  Begin
    first;
    While not EOF do
    Begin
      Temp:='';
      Temp2:='';
      Temp3:='';
      if PrecoDesc > 0 then
        Valor:=PrecoDesc
      else
        Valor:=Preco;
      Tam:=Length(FieldByName('Produto').asString);
      For i:=1 to 40-Tam do
        Temp:=Temp+' ';
      Tam:=Length(format('%.2f',[Quantidade]));
      For i:=1 to 9-Tam do
        Temp2:=Temp2+' ';
      Tam:=Length(format('%.2f',[valor*Quantidade]));
      For i:=1 to 10-Tam do
        Temp3:=Temp3+' ';
      Vendedor2.Close;
      Vendedor2.ParamByName('CNC_CODIGO').asInteger:=CodigoCNC;
      Vendedor2.ParamByName('FUN_CODIGO').asInteger:=CodigoFUN;
      Vendedor2.Open;
      ListBox1.Items.Add(PreencheZero(6,CodigoPRD)+' '+FieldByName('Produto').asString+Temp+Temp2+
          format('%.2f',[Quantidade])+Temp3+format('%.2f',[valor*Quantidade])+
          ' '+Vendedor2.NomeFun);
      Next;
    End;
  End;
  ExecutaSQL(DM.QR_Comandos,'DELETE FROM ITEM_DE_TROCA WHERE PDV_CODIGO='+
    IntToStr(Pedido_de_Venda1.CodigoPDV)+' AND CNC_CODIGO='+
    IntToStr(Troca1.CodigoCNC)+' AND ITO_SITUACAO=0');
  ExecutaSQL(DM.QR_Comandos,'DELETE FROM TROCA WHERE PDV_CODIGO='+
    IntToStr(Pedido_de_Venda1.CodigoPDV)+' AND CNC_CODIGO='+
    IntToStr(Troca1.CodigoCNC)+' AND TRO_SITUACAO=0');
  Troca1.Open;
  Troca1.Inserir(Pedido_de_Venda1.CodigoCNC,Pedido_de_Venda1.CodigoPDV,0,DM.Usuario1.CodigoUSU,DM.Configuracao1.DataHora,edtMotivo.Text);
  TRO:=Troca1.SCodigo;
  Troca1.Close;
  Troca1.ParamByName('CNC_CODIGO').asInteger:=Pedido_de_Venda1.CodigoCNC;
  Troca1.ParamByName('TRO_CODIGO').asInteger:=TRO;
  Troca1.Open;
  Item_de_Troca1.Close;
  Item_de_Troca1.ParamByName('CNC_CODIGO').asInteger:=Troca1.CodigoCNC;
  Item_de_Troca1.ParamByName('TRO_CODIGO').asInteger:=Troca1.CodigoTRO;
  Item_de_Troca1.Open;
  Vendedor1.Open;
  edtMotivo.SetFocus;
end;

procedure TfMxTrocaProdutoProc.Pedido_de_Venda1CalcFields(
  DataSet: TDataSet);
begin
  Cliente1.Close;
  Cliente1.ParamByName('CNC_CODIGO').asInteger := Pedido_de_Venda1.ClienteCNC;
  Cliente1.ParamByName('CLI_CODIGO').asInteger := Pedido_de_Venda1.CodigoCLI;
  Cliente1.Open;
  Pedido_de_Venda1.FieldByName('Cliente').asString:=Cliente1.RazaoSocial;
end;

procedure TfMxTrocaProdutoProc.Item_Pedido_Venda1CalcFields(
  DataSet: TDataSet);
begin
  Produto1.Close;
  Produto1.ParamByName('PRD_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoPRD;
  Produto1.Open;
  Item_Pedido_Venda1.FieldByName('Produto').asString := Trim(Produto1.Descricao+' '+Produto1.Referencia);
end;


procedure TfMxTrocaProdutoProc.BitBtn4Click(Sender: TObject);
var
  mensagem,Temp,Temp2,Temp3:string;
  valor:Double;
  i,j,Tam:integer;
  Sai:Boolean;
begin
  Edit9Exit(Sender);
  Valor:=0;
  mensagem:='';
  if edtProduto.Text = '' then
    mensagem:='Produto inválido!'+#13;
  if not VerificaFloatBranco(edtQuantiade.Text) then
    mensagem:=mensagem+'Quantidade inválida!'+#13;
  if mensagem <> '' then
    Raise Exception.Create(mensagem);
  if StrToFloat(edtQuantiade.Text) <= 0 then
    Raise Exception.Create('Quantidade inválida!');
  Temp:='';
  Temp2:='';
  Temp3:='';
  with Item_Pedido_Venda1 do
  Begin
    If LocalizarProd(StrToInt(edtCodigoPRD.Text)) Then
    Begin
      J:=0;
      Sai:=False;
      while (J<ListBox1.Items.Count) and (not Sai) do
      Begin
        if StrToInt(Copy(ListBox1.Items[j],1,6)) = StrToInt(edtCodigoPRD.Text) then
        Begin
          Sai:=True;
          if StrToFloat(Copy(ListBox1.Items[j],48,9))>=StrToFloat(edtQuantiade.Text) then
          Begin
            if StrToFloat(Copy(ListBox1.Items[j],48,9)) <> 0 then
              valor:=(StrToFloat(Copy(ListBox1.Items[j],57,10))/(StrToFloat(Copy(ListBox1.Items[j],48,9))))
            else
              valor:=0;
          end
          else
          Begin
            ShowMessage('Quantidade comprada inferior a devolvida!');
            Exit;
          end;
          Tam:=Length(Copy(Trim(Produto1.Descricao+' '+Produto1.Referencia),1,40));
          For i:=1 to 40-Tam do
            Temp:=Temp+' ';
          Tam:=Length(format('%.2f',[StrToFloat(Copy(ListBox1.Items[j],48,9))-StrToFloat(edtQuantiade.Text)]));
          For i:=1 to 9-Tam do
            Temp2:=Temp2+' ';
          Tam:=Length(format('%.2f',[valor*(StrToFloat(Copy(ListBox1.Items[j],48,9))-StrToFloat(edtQuantiade.Text))]));
          For i:=1 to 10-Tam do
            Temp3:=Temp3+' ';

          //Inserir Item de Troca Saída
          if not Item_de_Troca1.Inserir(Troca1.CodigoCNC,0,Troca1.CodigoPDV,Troca1.CodigoTRO,StrToInt(edtCodigoPRD.Text),
             CodigoLOT,CodigoFUN,valor,0,StrToFloat(edtQuantiade.Text),True,DM.Configuracao1.DataHora) then
          Begin
            ShowMessage('Falha ao inserir item de Troca!');
            Exit;
          end;

          ListBox1.Items[j]:=PreencheZero(6,edtCodigoPRD.Text)+' '+Copy(Trim(Produto1.Descricao+' '+Produto1.Referencia),1,40)+Temp+Temp2+
             format('%.2f',[StrToFloat(Copy(ListBox1.Items[j],48,9))-StrToFloat(edtQuantiade.Text)])+Temp3+
             format('%.2f',[valor*(StrToFloat(Copy(ListBox1.Items[j],48,9))-StrToFloat(edtQuantiade.Text))]);

          Diferenca:=Diferenca+(StrToFloat(edtQuantiade.Text)*valor);

          edtDiferenca.Text:=format('%.2f',[Diferenca]);
        end;
        J:=J+1;
      end;
    End
    else
    Begin
        ShowMessage('Produto não comprado nesse pedido!');
        Exit;
    end;
  end;
  edtQuantiade.Enabled:=False;
  edtCodigoPRD.Text:='';
  edtQuantiade.Text:='0,00';
  edtValor.Text:='';
  edtProduto.Text:='';
  edtPrecoUnitario.Text:='';
  edtCodigoPRD.SetFocus;
end;


procedure TfMxTrocaProdutoProc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Item_de_Troca1.Close;
  Troca1.Close;
  Vendedor1.Close;
  Produto1.Close;
  Pedido_de_Venda1.Close;
  Cliente1.Close;
  Titulo_receber1.Close;
  Item_de_Estoque1.Close;
  Action:=Cafree;
end;

procedure TfMxTrocaProdutoProc.bitProcessarClick(Sender: TObject);
var
  CdCNCCLI,CdCLI,CdCNC,CdPDV,CdTRO,CdPRD,iTotal, CaixaCNC, CdFUN, CdLOT:integer;
  Falha : Boolean;
  vQuantidade: Double;
  sTipoCredito, sAutorizacao: string;
begin
  Falha := False;
  CdCNC := Troca1.CodigoCNC;
  CdTRO := Troca1.CodigoTRO;
  CdPDV := Troca1.CodigoPDV;
  CdCNCCLI := Cliente1.CodigoCNC;
  CdCLI    := Cliente1.CodigoCLI;

  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC <> 3) then
    CaixaCNC := 1
  else
    CaixaCNC := DM.Configuracao1.CodigoCNC;

  with Item_de_Troca1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := CdCNC;
    ParamByName('TRO_CODIGO').asInteger := CdTRO;
    Open;
    if IsEmpty then
    Begin
      ShowMessage('Nenhuma alteração foi realizada!');
      Raise Exception.Create('');
    end;
    First;
  end;

  //Verifica Permissão de Devolução Parcial
  while not Item_de_Troca1.Eof do
  Begin
    If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3610)) < 0) then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        DigCdPDVCNC := CdCNC;
        DigCdPDV    := CdPDV;
        DigCdCLICNC := CdCNCCLI;
        DigCdCLI    := CdCLI;
        DigCdPRD    := Item_de_Troca1.CodigoPRD;
        if rdbGerarCredito.Checked then
          DigiCreditoExtorno := 0
        else if rdbGerarExtorno.Checked then
          DigiCreditoExtorno := 1
        else
          DigiCreditoExtorno := 2;
        DigiTipoPendencia := 1; //Dev. Parcial
        onClose:=nil;
        Tag:=23;
        Cancelar:=False;
        Showmodal;
        If not cancelar Then
        Begin
          if (usuario1.Permissoes.IndexOf(IntToStr(3610)) < 0) then
          begin
            free;
            raise Exception.Create('O usuário não tem permissão para efetuar Devolução Parcial!');
          end
          else
          Begin
            if DigCdPEN > 0 then
              ExecutaSQL(QR_Consultas, 'UPDATE PENDENCIA SET '+
                ' PEN_SITUACAO=3 '+ //Processado
                ',PEN_DT_ALTERADO="'+MesDiaHora(Configuracao1.DataHora)+'" '+
                ',PEN_USU_LIBEROU='+IntToStr(Usuario1.CodigoUSU)+
                ' WHERE CNC_ORIGEM='+IntToStr(DigCNCOrigem)+
                ' AND CNC_CODIGO='+IntToStr(DigCdPENCNC)+
                ' AND PEN_CODIGO='+IntToStr(DigCdPEN));
            sAutorizacao := 'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU);
          end;
        end
        else
        begin
          free;
          exit;
        end;
        free;
      End;
    End;
    Item_de_Troca1.Next;
  end;
  Item_de_Troca1.First;

  if edtMotivo.Text = '' then
    Raise Exception.Create('Motivo inválido!');

  bitProcessar.Enabled := False;

  Item_Pedido_Venda1.Close;
  Item_Pedido_Venda1.ParamByName('CNC_CODIGO').asInteger := CdCNC;
  Item_Pedido_Venda1.ParamByName('PDV_CODIGO').asInteger := CdPDV;
  Item_Pedido_Venda1.Open;

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT SUM(IPV_QUANTIDADE) AS TOTAL '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PDV_CODIGO='+IntToStr(CdPDV);
    Open;
    iTotal := FieldByName('TOTAL').asInteger;
    Close;
    SQL.Text := 'SELECT SUM(ITO_QUANTIDADE) AS TOTAL '+
      ' FROM ITEM_DE_TROCA '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND TRO_CODIGO='+IntToStr(CdTRO);
    Open;
    if iTotal <= FieldByName('TOTAL').asInteger then
      Raise exception.Create('Para devoluções totais utilize a tela de Devolução!');
  end;

  with DM.Database2 do
  begin
    try
      StartTransaction;

      with Item_de_Troca1 do
      Begin
        while not EOF do
        Begin
          CdPRD := CodigoPRD;
          CdLOT := CodigoLOT;
          Produto1.Close;
          Produto1.ParamByName('PRD_CODIGO').asInteger := CdPRD;
          Produto1.Open;
//          CdGRP := Produto1.CodigoGRP;
//          CdSGP := Produto1.CodigoSGP;
          vQuantidade := Quantidade;
          if DM.Configuracao1.Empresa in TEmpresasEstFUN then
            CdFUN := CodigoFUN
          else
            CdFUN := 0;

          Item_de_Estoque1.Close;
          Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger := CdCNC;
          Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger := CdPRD;
          Item_de_Estoque1.ParamByName('FUN_CODIGO').asInteger := CdFUN;
          Item_de_Estoque1.Open;
          
          if not Item_Pedido_Venda1.LocalizarProd(CdPRD) then
          Begin
            ShowMessage('Produto não encontrado no pedido!');
            Raise exception.Create('');
          end;

          with Direito_de_Bonus1 do
          Begin
            Close;
            SQL.Text := 'SELECT * FROM DIREITO_DE_BONUS '+
              ' WHERE PDV_CODIGO='+IntToStr(CdPDV)+
              ' AND PRD_CODIGO='+IntToStr(CdPRD)+
              ' ORDER BY DIB_CODIGO DESC ';
            Open;

            if not isEmpty then
            Begin
              if not Direito_de_Bonus1.Inserir(CdPDV, CdPRD, CodigoFUN,
                  BonusFOR, BonusLoja, vQuantidade, -QuantidadeBonus,Preco,'Devolucao Parcial') then
              Begin
                ShowMessage('Falha a gerar Direito de Bonus!');
                Raise exception.Create('');
              end;
            end;
          end;

          Item_de_Embarque1.Close;
          Item_de_Embarque1.ParamByName('CNC_CODIGO').asInteger := CdCNC;
          if Item_Pedido_Venda1.CodigoIEB > 0 then
            Item_de_Embarque1.ParamByName('IEB_CODIGO').asInteger := Item_Pedido_Venda1.CodigoIEB
          else
            Item_de_Embarque1.ParamByName('IEB_CODIGO').asInteger := -1;
          Item_de_Embarque1.Open;
          if Arredonda(Item_Pedido_Venda1.Quantidade-vQuantidade) <> 0 then
            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
              ' IPV_QUANTIDADE=IPV_QUANTIDADE-'+VirgPonto(vQuantidade)+
              ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND IPV_CODIGO='+IntToStr(Item_Pedido_Venda1.CodigoIPV))
          else
          Begin
            ExecutaSQL(DM.QR_Comandos,'DELETE FROM ITEM_DE_PEDIDO_DE_VENDA '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND IPV_CODIGO='+IntToStr(Item_Pedido_Venda1.CodigoIPV));
            if not DM.Usuario1.RegistrarDel(CdCNC,1640(*ItemDePedidoDeVenda*),Item_Pedido_Venda1.CodigoIPV,
              'PDV:'+IntToStr(CdPDV)+' PRD:'+IntToStr(CdPRD)+
              ' [DEVOLUCAO PARCIAL] QTD:'+format('%.2f',[vQuantidade])) then
            Begin
              ShowMessage('Falha ao gerar RegistrarDel!');
              Raise exception.Create('');
            end;
          end;

          if Item_Pedido_Venda1.Vinculo >= 0 then
          Begin
            if Item_Pedido_Venda1.Entrega or
               (DM.Configuracao1.Empresa <> 1) or
               (DM.Usuario1.Mafalda = 1) then
            Begin
              if not DM.Movimento_Estoque_Comercial1.Inserir(CdCNC,0,CdPRD,CdFUN,362,
                 CdCNC,CdPDV,'E', vQuantidade,
                 Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
                 Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*),
                 'PARCIAL') then
              Begin
                ShowMessage('Falha ao gerar Mov. Comercial!');
                Raise Exception.Create('');
              end;

              //Movimento SN
              if Pedido_de_Venda1.NotaFiscal = -1 then
              Begin
                if not DM.Movimento_Estoque_SN1.Inserir(CdCNC,CdPRD,CdFUN,362,
                   CdCNC,CdPDV,'E',
                   vQuantidade, Item_de_Estoque1.SSN, 'PARCIAL') then
                Begin
                  ShowMessage('Falha ao gerar Mov. SN!');
                  Raise Exception.Create('');
                end;
              end
              //Movimento LJ4
              else if Pedido_de_Venda1.NotaFiscal = -2 then
              Begin
                if not DM.Movimento_Estoque_LJ41.Inserir(CdCNC,CdPRD,CdFUN,362,
                   CdCNC,CdPDV,'E',
                   vQuantidade, Item_de_Estoque1.SLJ4, 'PARCIAL') then
                Begin
                  ShowMessage('Falha ao gerar Mov. LJ4!');
                  Raise Exception.Create('');
                end;
              end;
            end;


            if CdLOT>0 then
            Begin
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                ' IED_QTD_FISICO=IED_QTD_FISICO+'+VirgPonto(vQuantidade)+
                ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
                ' AND CNC_CODIGO='+IntToStr(CdCNC)+
                ' AND LOT_CODIGO='+IntToStr(CdLOT));
            end;


            if (Item_de_Embarque1.IsEmpty) or
               (Item_de_Embarque1.Situacao=1) or
               (Item_Pedido_Venda1.Entrega) or
               (DM.Usuario1.Mafalda = 1) then //Já embarcado
            Begin
              if not DM.Movimento_Fisico1.Inserir(CdCNC,0,CdPRD,CdFUN,CdCNC,
                  CdPDV,362(*Devolução*),'E',
                  vQuantidade,Item_de_Estoque1.SFisico, 'PARCIAL') then
              Begin
                ShowMessage('Falha ao gerar Mov. Físico!');
                Raise Exception.Create('');
              end;
              if Pedido_de_Venda1.NotaFiscal = -1 then
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SFISICO=IES_SFISICO+'+VirgPonto(vQuantidade)+
                  ',IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(vQuantidade)+
                  ',IES_SSN=IES_SSN+'+VirgPonto(vQuantidade)+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
                  ' AND CNC_CODIGO='+IntToStr(CdCNC)+
                  ' AND FUN_CODIGO='+IntToStr(CdFUN))                  
              else if Pedido_de_Venda1.NotaFiscal = -2 then
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SFISICO=IES_SFISICO+'+VirgPonto(vQuantidade)+
                  ',IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(vQuantidade)+
                  ',IES_SLJ4=IES_SLJ4+'+VirgPonto(vQuantidade)+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
                  ' AND CNC_CODIGO='+IntToStr(CdCNC)+
                  ' AND FUN_CODIGO='+IntToStr(CdFUN))                  
              else
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SFISICO=IES_SFISICO+'+VirgPonto(vQuantidade)+
                  ',IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(vQuantidade)+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
                  ' AND CNC_CODIGO='+IntToStr(CdCNC)+
                  ' AND FUN_CODIGO='+IntToStr(CdFUN));                  
            end
            else if (DM.Configuracao1.Empresa <> 1) or
                    (DM.Usuario1.Mafalda = 1) then
            Begin
              if Pedido_de_Venda1.NotaFiscal = -1 then
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(vQuantidade)+
                  ',IES_SSN=IES_SSN+'+VirgPonto(vQuantidade)+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
                  ' AND CNC_CODIGO='+IntToStr(CdCNC)+
                  ' AND FUN_CODIGO='+IntToStr(CdFUN))                  
              else if Pedido_de_Venda1.NotaFiscal = -2 then
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(vQuantidade)+
                  ',IES_SLJ4=IES_SLJ4+'+VirgPonto(vQuantidade)+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
                  ' AND CNC_CODIGO='+IntToStr(CdCNC)+
                  ' AND FUN_CODIGO='+IntToStr(CdFUN))                  
              else
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(vQuantidade)+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
                  ' AND CNC_CODIGO='+IntToStr(CdCNC)+
                  ' AND FUN_CODIGO='+IntToStr(CdFUN));                  
              Item_de_Embarque1.Deletar(Item_de_Embarque1.CodigoCNC, Item_de_Embarque1.CodigoIEB);
            end;

{Não Voltar para o Pacote. Só volta se for devolução Total ou Reabrir
            if Pedido_de_Venda1.CodigoPacote > 0 then
              ExecutaSQL(DM.Configuracao1.QueryComandos,'UPDATE ITEM_DE_PACOTE_DE_VENDA SET '+
                ' IPC_QUANTIDADE_ENTREGUE=IPC_QUANTIDADE_ENTREGUE-'+IntToStr(Trunc(vQuantidade))+
                ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
                ' AND PDV_CODIGO='+IntToStr(Pedido_de_Venda1.CodigoPacote)+
                ' AND GRP_CODIGO='+IntToStr(CdGRP)+
                ' AND (SGP_CODIGO_1='+IntToStr(CdSGP)+
                '   OR SGP_CODIGO_2='+IntToStr(CdSGP)+
                '   OR SGP_CODIGO_3='+IntToStr(CdSGP)+
                '   OR SGP_CODIGO_4='+IntToStr(CdSGP)+')');
}
          end;
          Next;
        end;
      end;
      with Troca1 do
      Begin
        if (not (DM.Configuracao1.Empresa in [empMotical,empHope])) or
           (Pedido_de_Venda1.TipoDeVenda=0) then //Venda Normal (Faturamento Imediato)
        Begin
          if (Diferenca > 0) then
          Begin
            if (Pedido_de_Venda1.TipoPag <> 13) and //Diferente de Cartão
               (Pedido_de_Venda1.CodigoFPG <> 1) and //Diferente de à Vista
               (CdCLI<>DM.Configuracao1.CodigoCliAVista) then
              ExecutaSQL(DM.QR_Comandos,'UPDATE INFORMACOES_DE_CREDITO SET '+
                ' ICR_CRED_UTIL=ICR_CRED_UTIL-'+VirgPonto(Diferenca)+
                ' WHERE CNC_CODIGO='+IntToStr(CdCNCCLI)+
                ' AND CLI_CODIGO='+IntToStr(CdCLI));
            if not rdbIgnorarValor.Checked then
            Begin
              ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
                ' PDV_CREDITO=PDV_CREDITO+'+VirgPonto(Diferenca)+
                ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
                ' AND PDV_CODIGO='+IntToStr(CdPDV));
              if (rdbGerarCredito.Checked) and
                 (CdCLI<>DM.Configuracao1.CodigoCliAVista) then
              Begin
                if Cliente1.FieldByName('CLI_CREDITO').asString <> '' then
                  ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
                    ' CLI_CREDITO=CLI_CREDITO+'+VirgPonto(Diferenca)+
                    ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                    ' WHERE CNC_CODIGO='+IntToStr(CdCNCCLI)+
                    ' AND CLI_CODIGO='+IntToStr(CdCLI))
                else
                  ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
                    ' CLI_CREDITO='+VirgPonto(Diferenca)+
                    ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                    ' WHERE CNC_CODIGO='+IntToStr(Cliente1.CodigoCNC)+
                    ' AND CLI_CODIGO='+IntToStr(CdCLI));

                if not DM.Movimento_de_Credito1.Inserir(DM.Configuracao1.CodigoCNC,
                    CdCNCCLI, CdCLI, 1002, CdCNC, CdPDV,CdCNC,CdPDV, 'C',
                    Cliente1.Credito (*ValorAnt*), Diferenca(*Valor*)) then
                Begin
                  ShowMessage('Falha ao gerar Mov. Credito!');
                  Raise exception.Create('');
                end;
              end
              else if (rdbGerarExtorno.Checked) and
                      (CdCLI<>DM.Configuracao1.CodigoCliAVista)then
              Begin
                DM.Caixa1.Close;
                DM.Caixa1.ParamByName('CAX_CODIGO').asInteger := DM.Configuracao1.CodigoCAX;
                DM.Caixa1.Open;
                if not DM.Movimento_caixa1.Inserir(CdCNC,0,DM.Configuracao1.ContRecCli,
                    DM.Configuracao1.ContRecCli,DM.Configuracao1.CodigoCAX,
                    5(*Dinheiro*),DM.Configuracao1.TipoDocumento(*TipoDoc*),CodigoCNC,
                    0 (*CdCHQCNC*),0 (*CdCHQ*),
                    'Tro-Ext.Dev.Par.: '+IntToStr(CdPDV),'1'(*Flag*),
                    edtCodigoPDV.Text(*Numero*),'','1','D',Diferenca,
                    0(*Desconto*),0(*Juros*),
                    0(*CredCli*),Diferenca(*ValorDoc*),
                    DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
                    0(*DtCheque*),0,DM.Configuracao1.CodigoCNC,'D',CodigoCNC) then
                Begin
                  ShowMessage('Falha ao gerar Mov. Caixa!');
                  Raise Exception.Create('');
                end
                else if (DM.Configuracao1.CodigoUSU <> DM.Caixa1.CodigoFUN) then //Mensagem para Rejane
                  DM.Mensagem3.Inserir(DM.Configuracao1.CodigoCNC,0,CaixaCNC,DM.Caixa1.CodigoFUN,1,0,'Movimento de Caixa',
                      'Devolução Parcial do Pedido: '+edtCodigoPDV.Text+#13+#10+
                      'Valor: R$ '+format('%.2f',[Diferenca])+'( Dinheiro)');
              end
              else
              Begin
                Titulo_receber1.Close;
                Titulo_receber1.ParamByName('CNC_CODIGO').asInteger:=CdCNC;
                Titulo_receber1.ParamByName('PDV_CODIGO').asInteger:=CdPDV;
                Titulo_receber1.ParamByName('TRC_TIPO_PEDIDO').AsInteger := 0; //Pedido de Venda
                Titulo_receber1.Open;
                if Titulo_receber1.Situacao = 2 then
                Begin
                  if not DM.Movimento_caixa1.Inserir(CdCNC,0,DM.Configuracao1.ContRecCli,
                      DM.Configuracao1.ContRecCli,DM.Configuracao1.CodigoCAX,
                      5(*Dinheiro*),5(*TipoPag*),CodigoCNC,0 (*CdCHQCNC*),0 (*CdCHQ*),
                      'Tro-Ext.Dev.Par.TRC: '+
                      IntToStr(Titulo_receber1.CodigoTRC),'1'(*Flag*),
                      Titulo_receber1.Numero(*Numero*),'','1','D',Diferenca,
                      0(*Desconto*),0(*Juros*),
                      Titulo_receber1.Credcli(*CredCli*),Titulo_receber1.Valor(*ValorDoc*),
                      DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
                      0(*DtCheque*),0,DM.Configuracao1.CodigoCNC,'D',CodigoCNC) then
                  Begin
                    ShowMessage('Falha ao gerar Mov. Caixa!');
                    Raise Exception.Create('');
                  end;
                end;
              end;
            end;
          end;
        end
        else if (Pedido_de_Venda1.TipoDeVenda = 3) or
                (Pedido_de_Venda1.CodigoFPE > 0) then
        Begin
          if not rdbIgnorarValor.Checked then
          Begin
            if Cliente1.FieldByName('CLI_CREDITO').asString <> '' then
              ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
                ' CLI_CREDITO=CLI_CREDITO+'+VirgPonto(Diferenca)+
                ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE CNC_CODIGO='+IntToStr(CdCNCCLI)+
                ' AND CLI_CODIGO='+IntToStr(CdCLI))
            else
              ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
                ' CLI_CREDITO='+VirgPonto(Diferenca)+
                ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE CNC_CODIGO='+IntToStr(Cliente1.CodigoCNC)+
                ' AND CLI_CODIGO='+IntToStr(CdCLI));

            if not DM.Movimento_de_Credito1.Inserir(DM.Configuracao1.CodigoCNC,
                CdCNCCLI, CdCLI, 1002, CdCNC, CdPDV,CdCNC,CdPDV, 'C',
                Cliente1.Credito (*ValorAnt*), Diferenca(*Valor*)) then
            Begin
              ShowMessage('Falha ao gerar Mov. Credito!');
              Raise exception.Create('');
            end;
          end;
          if (Pedido_de_Venda1.TipoPag <> 13) and //Diferente de Cartão
             (Pedido_de_Venda1.CodigoFPG <> 1) then //Diferente de à Vista
            ExecutaSQL(DM.QR_Comandos,'UPDATE INFORMACOES_DE_CREDITO SET '+
              ' ICR_CRED_UTIL=ICR_CRED_UTIL-'+VirgPonto(Diferenca)+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNCCLI)+
              ' AND CLI_CODIGO='+IntToStr(CdCLI));
        end;
      end;
      ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_TROCA SET '+
        ' ITO_SITUACAO=1 '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND TRO_CODIGO='+IntToStr(CdTRO));

      ExecutaSQL(DM.QR_Comandos,'UPDATE TROCA SET '+
        ' USU_CODIGO='+IntToStr(DM.Usuario1.CodigoUSU)+
        ',TRO_MOTIVO="'+edtMotivo.Text+'" '+
        ',TRO_SITUACAO=1 '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND TRO_CODIGO='+IntToStr(CdTRO));


      if rdbGerarCredito.Checked then
        sTipoCredito := ' (Credito)'
      else if rdbGerarCredito.Checked then
        sTipoCredito := ' (Extorno)'
      else
        sTipoCredito := ' (Ignorar)';

      Pedido_de_Venda1.GeraLog(3610,CdCNC,CdPDV,'CNC: '+IntToStr(CdCNC)+' TRO:'+IntToStr(Troca1.SCodigo)+sTipoCredito+sAutorizacao);

      Commit;
      ShowMessage('Troca realizada com Sucesso!');
    except
      Falha := True;
      RollBack;
      ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
    end;
  End;
  if (not rdbIgnorarValor.Checked) and
     (Diferenca > 0) and ((rdbGerarCredito.Checked) OR (rdbGerarExtorno.Checked)) and
     (CdCLI<>DM.Configuracao1.CodigoCliAVista) and (not Falha) then
  Begin
    //Imprimir Comprovante de Crédito
    Application.CreateForm(Trpt_Credito,rpt_Credito);
    with rpt_Credito do
    Begin
      Tag:=1;
      Cliente1.Close;
      Cliente1.ParamByName('CNC_CODIGO').asInteger := CdCNCCLI;
      Cliente1.ParamByName('CLI_CODIGO').asInteger := CdCLI;
      Cliente1.Open;
      if rdbGerarCredito.Checked then
        ZRLabel10.Caption:='REFERENTE A DEVOLUCAO PARCIAL DO PEDIDO '+IntToStr(CdPDV)
      else
      Begin
        ZRLabel9.Caption:='GEROU UM EXTORNO NO VALOR DE: R$';
        ZRLabel10.Caption:='REFERENTE A DEVOLUCAO (Extorno) PARCIAL DO PEDIDO '+IntToStr(CdPDV);
      end;
      Credi := Diferenca;
      report.Preview;
    end;

    If MessageDlg('Deseja ver os títulos desse Cliente?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
      with Cliente1 do
      Begin
        Close;
        ParamByName('CLI_CODIGO').AsInteger := CdCLI;
        ParamByName('CNC_CODIGO').AsInteger := CdCNCCLI;
        Open;
      end;
      Application.CreateForm(TfMxSRecPed, fMxSRecPed);
      with fMxSRecPed do
      Begin
        Tag :=11;
        edtCodigoCLI.Text     :=  IntToStr(self.Cliente1.CodigoCLI);
        edtRazaoSocial.Text   :=  self.Cliente1.RazaoSocial;
        mskCNPJ_CPF.Text      :=  self.Cliente1.CPFCGC;
        edtCGF_RG.Text        :=  self.Cliente1.CGFRG;
        edtObservacaoCLI.Text :=  self.Cliente1.OBS;
        Cliente1.Close;
        Cliente1.ParamByName('CNC_CODIGO').AsInteger := self.Cliente1.CodigoCNC;
        Cliente1.ParamByName('CLI_CODIGO').AsInteger := self.Cliente1.CodigoCLI;
        ShowModal;
      end;
    End;
  end
  else if (not rdbIgnorarValor.Checked) and (Diferenca > 0) and (not Falha) then
  Begin
      Application.CreateForm(Trpt_Credito,rpt_Credito);
      with rpt_Credito do
      Begin
        Cliente1.Close;
        Cliente1.ParamByName('CNC_CODIGO').asInteger:=CdCNCCLI;
        Cliente1.ParamByName('CLI_CODIGO').asInteger:=CdCLI;
        Cliente1.Open;
        ZRLabel9.Caption:='GEROU UM EXTORNO NO VALOR DE: R$';
        ZRLabel10.Caption:='REFERENTE A DEVOLUCAO (Extorno) PARCIAL DO PEDIDO '+IntToStr(CdPDV);
        Credi := Diferenca;
        Tag:=1;
        report.Preview;
      end;
  end;
  Close;
end;

procedure TfMxTrocaProdutoProc.Vendedor1BeforeOpen(DataSet: TDataSet);
begin
  Vendedor1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
end;


procedure TfMxTrocaProdutoProc.ListBox1Click(Sender: TObject);
begin
  ListBox1.Hint:='Vendedor(a): '+Copy(ListBox1.Items[ListBox1.ItemIndex],68,30);
end;

procedure TfMxTrocaProdutoProc.Edit9KeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    Key:=chr(0);
    Application.CreateForm(TfMxSPedDesc, fMxSPedDesc);
    fMxSPedDesc.edtProduto.Text   :=  edtProduto.Text;
    fMxSPedDesc.edtUnidade.Text   :=  Produto1.Unidade;
    fMxSPedDesc.edtMarca.Text  :=  Produto1.Marca;
    fMxSPedDesc.edtReferencia.Text  :=  Produto1.Referencia;
    fMxSPedDesc.edtPreco.Text   :=  edtPrecoUnitario.Text;
    fMxSPedDesc.edtPrecoComDesconto.Text   :=  edtPrecoUnitario.Text;
    fMxSPedDesc.Tag:=7;
    fMxSPedDesc.ShowModal;
  End;
end;

procedure TfMxTrocaProdutoProc.edtCodigoPRDChange(Sender: TObject);
begin
  if edtCodigoPRD.Text <> '' then
    edtQuantiade.Enabled := True
  else
    edtQuantiade.Enabled := False;
end;

procedure TfMxTrocaProdutoProc.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

end.

unit MxItemNF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Db, DBTables, SQuery,
  Produto, Menus, NotaFiscal, Item_Nota_Fiscal, Classificacao_fiscal, Variants,
  Cod_Barr;

type
  TfMxSItemNF = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    edtCodigoPRD: TEdit;
    edtProduto: TEdit;
    lblDescProduto: TLabel;
    bitFechar: TBitBtn;
    DSItem_de_Nota_Fiscal1: TDataSource;
    edtQuantidade: TEdit;
    edtValorUnit: TEdit;
    edtValorTotal: TEdit;
    edtAliquota: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    labDescAliqICMS: TLabel;
    SB_Nov: TSpeedButton;
    SB_Exc: TSpeedButton;
    SB_Con: TBitBtn;
    SB_Can: TBitBtn;
    Item_Nota_Fiscal1: TItem_Nota_Fiscal;
    Item_Nota_Fiscal1ValorTotal: TStringField;
    Item_Nota_Fiscal1Valor: TStringField;
    NotaFiscal1: TNotaFiscal;
    Produto1: TProduto;
    Item_Nota_Fiscal1INF_CODIGO: TIntegerField;
    Item_Nota_Fiscal1CNC_CODIGO: TIntegerField;
    Item_Nota_Fiscal1NTF_CODIGO: TIntegerField;
    Item_Nota_Fiscal1PRD_CODIGO: TIntegerField;
    Item_Nota_Fiscal1INF_SERVICO: TStringField;
    Item_Nota_Fiscal1INF_QUANTIDADE: TFloatField;
    Item_Nota_Fiscal1INF_PRECO: TFloatField;
    Item_Nota_Fiscal1INF_DESCONTO: TFloatField;
    Item_Nota_Fiscal1INF_TIPO_ALIQUOTA: TIntegerField;
    Item_Nota_Fiscal1INF_ALIQUOTA: TFloatField;
    Item_Nota_Fiscal1LOT_CODIGO: TIntegerField;    
    lblDadosDoProduto: TLabel;
    Classificacao_fiscal1: TClassificacao_fiscal;
    Label4: TLabel;
    edtDesconto: TEdit;
    cmbTipoICMS: TComboBox;
    labDesTipo: TLabel;
    Classificacao_fiscal2: TClassificacao_fiscal;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    ItemdaNota1: TMenuItem;
    Inserir1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    edtAliquotaIPI: TEdit;
    Item_Nota_Fiscal1INF_ALIQUOTA_IPI: TFloatField;
    Item_Nota_Fiscal1CNC_ORIGEM: TIntegerField;
    Item_Nota_Fiscal1INF_BONIFICACAO: TFloatField;
    edtBonificacao: TEdit;
    edtAliquotaISS: TEdit;
    Label1: TLabel;
    Item_Nota_Fiscal1INF_ALIQUOTA_ISS: TFloatField;
    labDescAliqIPI: TLabel;
    Item_Nota_Fiscal1INF_DT_CADASTRO: TDateTimeField;
    Item_Nota_Fiscal1INF_DT_ALTERADO: TDateTimeField;
    Item_Nota_Fiscal1USU_CODIGO: TIntegerField;
    Item_Nota_Fiscal1INF_AMOSTRA: TFloatField;
    edtAmostra: TEdit;
    Label8: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    edtCodigoLOT: TEdit;
    procedure bitFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Item_Nota_Fiscal1CalcFields(DataSet: TDataSet);
    procedure Item_Nota_Fiscal1AfterScroll(DataSet: TDataSet);
    procedure SB_ConClick(Sender: TObject);
    procedure SB_NovClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure SB_CanClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtValorUnitExit(Sender: TObject);
    procedure edtAliquotaExit(Sender: TObject);
    procedure Produto1AfterOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edtAliquotaISSChange(Sender: TObject);
    procedure edtAliquotaISSExit(Sender: TObject);
    procedure edtAliquotaChange(Sender: TObject);
  private
    CdUltimoGRP, CdUltimoSGP: integer;
  public
    vValoresAlterados: Boolean;
  end;

var
  fMxSItemNF: TfMxSItemNF;

implementation
Uses
 UDM, MxNotaFiscal, funcoes, MxSPediProd, MxSPediProdMotCal, Fornecedor;

{$R *.DFM}


procedure TfMxSItemNF.bitFecharClick(Sender: TObject);
Begin
  Close;
end;

procedure TfMxSItemNF.FormClose(Sender: TObject; var Action: TCloseAction);
Var
  vBase,vBaseS,vTotalPRD,vTotalSER,vBaseSER,vAliqICMS,vValorICMS,vValorICMSS,vValorISS,
    PrecoUnitNota,vPercentualReducao,vValorIPI,vTotalBonusAmostra:double;
begin
  if SB_Con.Enabled then
    raise Exception.Create('Salve ou cancele este item!');

  if not vValoresAlterados then  //Não houve alteração
    Exit;

  vBase       :=0;
  vBaseS      :=0;
  vTotalPRD   :=0;
  vTotalSER   :=0;
  vBaseSER    :=0;
  vValorICMS  :=0;
  vValorISS   :=0;
  vValorICMSS :=0;
  vValorIPI   :=0;
  vPercentualReducao := 1;
  //Diferente de Devolução de Compra
  if (fMxNotaFiscal.dblNaturezaDaOperacao.KeyValue = 5202) or
     (fMxNotaFiscal.dblNaturezaDaOperacao.KeyValue = 6202) then
    vPercentualReducao := 1-fMxNotaFiscal.Fornecedor1.ReducaoICMS/100;

  vTotalBonusAmostra := 0;
  with Item_Nota_Fiscal1 do
  Begin
    first;
    while not EOF do
    Begin
      if Produto1.CodigoPRD <> CodigoPRD then
      Begin
        Produto1.Close;
        Produto1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
        Produto1.Open;
      end;

      vAliqICMS := Aliquota;

     if (vAliqICMS = 0) and
         (fMxNotaFiscal.dblTipoNota.KeyValue <> 363) and //Correção de Dados
         (fMxNotaFiscal.dblTipoNota.KeyValue <> 364) then //Simples Remessa
        vAliqICMS := Classificacao_fiscal1.ICMS;

     vTotalBonusAmostra := vTotalBonusAmostra + (ValorUnit-Desconto)*(Bonificacao+Amostra);

      if (fMxNotaFiscal.dblTipoNota.KeyValue = 368) or
          ((CodigoPRD = 0) and (vAliqICMS = 0) and ((not (DM.Configuracao1.Empresa in [empEletro, empHOPE])) or (AliquotaISS > 0))) or
            (Produto1.Servico) then //Serviço
      Begin
        vTotalSER := vTotalSER + Arredonda(Quantidade*Arredonda(ValorUnit-Desconto,4));
        if AliquotaISS > 0 then
          vBaseSER := vBaseSER + Arredonda(Quantidade*Arredonda(ValorUnit-Desconto,4));
        vValorISS := vValorISS + Arredonda(Quantidade*Arredonda(ValorUnit-Desconto,4)*AliquotaISS/100);
      end
      else
      Begin
        PrecoUnitNota:= Arredonda(ValorUnit-Desconto,4);

        //Calcular IPI
        if IPI > 0 then //Aliquota
          vValorIPI := vValorIPI + Arredonda(Arredonda(PrecoUnitNota,4)*IPI/100*Quantidade);

        if Classificacao_fiscal1.CodigoCLF = 5 then
        Begin
          vTotalPrd  :=vTotalPrd   + Arredonda(Arredonda(PrecoUnitNota,4)*Quantidade);
          vBaseS     :=vBaseS      + Arredonda(Arredonda(PrecoUnitNota*vPercentualReducao,4)*Quantidade);
          vValorICMSS:=vValorICMSS + Arredonda(Arredonda(PrecoUnitNota*vPercentualReducao,4)*vAliqICMS*Quantidade/100);
        end
        else
        Begin
          vTotalPrd :=vTotalPrd  + Arredonda(Arredonda(PrecoUnitNota,4)*Quantidade);
          if Aliquota > 0 then
          Begin
            vBase     :=vBase      + Arredonda(Arredonda(PrecoUnitNota*vPercentualReducao,4)*Quantidade);
            vValorICMS:=vValorICMS + Arredonda(Arredonda(PrecoUnitNota*vPercentualReducao,4)*Aliquota*Quantidade/100);
          end;
        end;
      end;
      Next;
    end;
  end;
  if (fMxNotaFiscal.dblTipoNota.KeyValue <> 363)  and  //Correção de Dados
     (fMxNotaFiscal.dblTipoNota.KeyValue <> 364)  and  //Simples Remessa
     (fMxNotaFiscal.dblTipoNota.KeyValue <> 1020) and //Beneficiamento
     (fMxNotaFiscal.dblTipoNota.KeyValue <> 4000) then //Comodato     
  Begin
    fMxNotaFiscal.edtBaseICMS.Text     := format('%.2f',[vBase]);
    fMxNotaFiscal.edtICMS.Text         := format('%.2f',[vValorICMS]);
    fMxNotaFiscal.edtBaseICMSSub.Text  := format('%.2f',[vBaseS]);
    fMxNotaFiscal.edtICMSSub.Text      := format('%.2f',[vValorICMSS]);
    fMxNotaFiscal.edtTotalProduto.Text := format('%.2f',[vTotalPrd]);
    fMxNotaFiscal.edtValorServico.Text := format('%.2f',[vTotalSER]);
    fMxNotaFiscal.edtBaseISS.Text      := format('%.2f',[vBaseSER]);
    fMxNotaFiscal.edtIPI.Text          := format('%.2f',[vValorIPI]);
    if (vBaseSER > 0) then
      fMxNotaFiscal.edtAliquotaISS.Text := format('%.2f',[DM.Configuracao1.AliquotaISS])
    else
      fMxNotaFiscal.edtAliquotaISS.Text := '0,00';
    fMxNotaFiscal.edtISS.Text:=format('%.2f',[vValorISS]);
  end
  else if (fMxNotaFiscal.dblTipoNota.KeyValue = 1020) or //Beneficiamento
          (fMxNotaFiscal.dblTipoNota.KeyValue = 4000) then //Comodato
  Begin
    fMxNotaFiscal.edtBaseICMS.Text     := '0,00';
    fMxNotaFiscal.edtICMS.Text         := '0,00';
    fMxNotaFiscal.edtBaseICMSSub.Text  := '0,00';
    fMxNotaFiscal.edtICMSSub.Text      := '0,00';
    fMxNotaFiscal.edtTotalProduto.Text := format('%.2f',[vTotalPRD]);
    fMxNotaFiscal.edtValorServico.Text := format('%.2f',[vTotalSER]);
    fMxNotaFiscal.edtBaseISS.Text      := '0,00';
    fMxNotaFiscal.edtISS.Text          := '0,00';
  end
  else
  Begin
    fMxNotaFiscal.edtBaseICMS.Text     := '0,00';
    fMxNotaFiscal.edtICMS.Text         := '0,00';
    fMxNotaFiscal.edtBaseICMSSub.Text  := '0,00';
    fMxNotaFiscal.edtICMSSub.Text      := '0,00';
    fMxNotaFiscal.edtTotalProduto.Text := '0,00';
    fMxNotaFiscal.edtValorServico.Text := '0,00';
    fMxNotaFiscal.edtBaseISS.Text      := '0,00';
    fMxNotaFiscal.edtISS.Text          := '0,00';
  end;
  fMxNotaFiscal.edtTotalNota.Text:=format('%.2f',[vTotalPRD+vTotalSER+vValorIPI+fMxNotaFiscal.NotaFiscal1.Frete+
    fMxNotaFiscal.NotaFiscal1.Seguro+fMxNotaFiscal.NotaFiscal1.Outras]);
  Item_Nota_Fiscal1.close;
  Action:=Cafree;
end;

procedure TfMxSItemNF.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  if not Item_Nota_Fiscal1.IsEmpty then
    Item_Nota_Fiscal1.CarregaDados;
  CdUltimoGRP := 0;
  CdUltimoSGP := 0;    
end;

procedure TfMxSItemNF.Item_Nota_Fiscal1CalcFields(DataSet: TDataSet);
begin
  with Item_Nota_Fiscal1 do
  Begin
    FieldByName('ValorTotal').asString:=format('%.2f',[(ValorUnit-Desconto)*Quantidade]);
    FieldByName('Valor').asString:=format('%.2f',[ValorUnit]);
  end;
end;

procedure TfMxSItemNF.Item_Nota_Fiscal1AfterScroll(DataSet: TDataSet);
begin
  Item_Nota_Fiscal1.CarregaDados;
  edtValorTotal.Text:=Item_Nota_Fiscal1.FieldByName('ValorTotal').asString;
end;

procedure TfMxSItemNF.SB_ConClick(Sender: TObject);
var
  mensagem:string;
  iEstado: integer;
begin
  if edtAliquota.Text = '' then
    edtAliquota.Text:='0';
  mensagem := '';
  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    mensagem:=mensagem+'Código do produto inválido!'+#13;
  if edtProduto.Text = '' then
    mensagem:=mensagem+'Descrição do produto inválido!'+#13;
  if not VerificaFloatBranco(edtQuantidade.Text) then
    mensagem:=mensagem+'Quantidade inválida!'+#13;
  if not VerificaFloatBranco(edtBonificacao.Text) then
    mensagem:=mensagem+'Bonificação inválida!'+#13;
  if not VerificaFloatBranco(edtAmostra.Text) then
    mensagem:=mensagem+'Amostra Grátis inválida!'+#13;
  if not VerificaFloatBranco(edtValorUnit.Text) then
    mensagem:=mensagem+'Preço inválido!'+#13;
  if not VerificaFloat(edtAliquota.Text) then
    mensagem:=mensagem+'Alíquota inválida!'+#13;
  if mensagem <> '' then
    raise Exception.Create(mensagem);

  iEstado := Item_Nota_Fiscal1.Estado;
  if not Item_Nota_Fiscal1.FinalizaEdicao then
    Raise exception.Create('Os dados não forma salvos!');
    
  vValoresAlterados := True;
  SB_Nov.Enabled:=True;
  SB_Exc.Enabled:=True;
  SB_Con.Enabled:=False;
  SB_Can.Enabled:=False;
  Inserir1.Enabled:=True;
  Excluir1.Enabled:=True;
  Salvar1.Enabled:=False;
  Cancelar1.Enabled:=False;
  DBGrid1.Enabled:=True;
  edtProduto.Enabled := False;
  if iEstado = 1 then
    SB_NovClick(sender);
end;

procedure TfMxSItemNF.SB_NovClick(Sender: TObject);
begin
  if fMxNotaFiscal.NotaFiscal1.Situacao > 0 then
    raise Exception.Create('Esta Nota não pode ser alterada!');
  SB_Nov.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Con.Enabled:=True;
  SB_Can.Enabled:=True;
  Inserir1.Enabled:=False;
  Excluir1.Enabled:=False;
  Salvar1.Enabled:=True;
  Cancelar1.Enabled:=True;
  DBGrid1.Enabled:=False;
  Item_Nota_Fiscal1.PreparaInsercao;
  edtAliquota.Text := '0';
  edtAliquotaISS.Text := '0';
  edtAliquotaIPI.Text := '0';
  edtValorTotal.Text:='';
  if (fMxNotaFiscal.dblNaturezaDaOperacao.KeyValue = 5202) or
     (fMxNotaFiscal.dblNaturezaDaOperacao.KeyValue = 6202) then
    edtAliquotaIPI.Enabled := True;   

  if fMxNotaFiscal.Entidade.TipoNota = 368 then
  Begin
    edtCodigoPRD.Text := '0';
    edtCodigoPRD.Enabled := False;
    if SB_Con.Enabled then
      edtProduto.Enabled := True;
    if edtAliquota.Text = '' then
      edtAliquota.Text := '0';
    edtAliquotaISS.Enabled := True;
    edtAliquotaISS.Text := format('%.2f',[DM.Configuracao1.AliquotaISS]);
    edtProduto.SetFocus;
    cmbTipoICMS.ItemIndex := -1;
  end
  else
    edtCodigoPRD.SetFocus;
end;

procedure TfMxSItemNF.SB_ExcClick(Sender: TObject);
begin
  if Item_Nota_Fiscal1.IsEmpty then
    raise Exception.Create('Selecione o item a ser excluído!');
  if fMxNotaFiscal.NotaFiscal1.Situacao > 0 then
    raise Exception.Create('Esta Nota não pode ser alterada!');
  if Item_Nota_Fiscal1.deletarauto then
    vValoresAlterados := True;
  if Item_Nota_Fiscal1.isEmpty then
  Begin
    Item_Nota_Fiscal1.LimpaCampos;
    edtValorTotal.Clear;
  end;
end;

procedure TfMxSItemNF.SB_CanClick(Sender: TObject);
begin
  SB_Nov.Enabled:=True;
  SB_Exc.Enabled:=True;
  SB_Con.Enabled:=False;
  SB_Can.Enabled:=False;
  Inserir1.Enabled:=True;
  Excluir1.Enabled:=True;
  Salvar1.Enabled:=False;
  Cancelar1.Enabled:=False;
  DBGrid1.Enabled:=True;
  edtProduto.Enabled := False;
  Item_Nota_Fiscal1.CancelaEdicao;
  if Item_Nota_Fiscal1.isEmpty then
  Begin
    Item_Nota_Fiscal1.LimpaCampos;
    edtValorTotal.Clear;
  end;  
end;

procedure TfMxSItemNF.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoPRD.Text:='';
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then 
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=20;
        dblCodigoGRP.KeyValue := CdUltimoGRP;
        dblCodigoGRPClick(sender);
        dblCodigoSGP.KeyValue := CdUltimoSGP;
        dblCodigoSGPClick(sender);
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=20;
        ShowModal;
      end;
    end;
    try
      if SB_Nov.Enabled then
        SB_NovClick(sender)
      else
        edtQuantidade.SetFocus;
    except
    end;
  End;
end;

procedure TfMxSItemNF.edtCodigoPRDExit(Sender: TObject);
begin
  If SB_Can.Focused or
     (not SB_Can.Enabled) then
    Exit;

  if (edtCodigoPRD.Text <> '0') then
  Begin
    with Produto1 do
    Begin
      try
        if CodigoPRD <> StrToInt(edtCodigoPRD.Text) then
        Begin
          Close;
          ParamByName('PRD_CODIGO').asInteger := StrToInt(edtCodigoPRD.Text);
          Open;
        end;
      except
        Close;
        ParamByName('PRD_CODIGO').asInteger := -10;
        Open;
      end;
      if IsEmpty then
      Begin
        with DM.Codigo_Barras1 do
        Begin
          if CodigoCDB_Barras <> edtCodigoPRD.Text then
          Begin
            Close;
            paramByName('CDB_CODIGO_BARRAS').asString := edtCodigoPRD.Text;
            Open;
          end;
          if not IsEmpty then
          Begin
            edtCodigoPRD.Text := IntToStr(CodigoCDB_Entrada);
            Produto1.Close;
            Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
            Produto1.Open;
          end;
        end;
      End;
      if IsEmpty and
         (Length(edtCodigoPRD.Text) > 3) then //Referências maiores que 3 caracteres
      Begin
        with DM.QR_Consultas do
        Begin
          Close;
          SQL.Text := 'SELECT PRD_CODIGO '+
            ' FROM PRODUTO '+
            ' WHERE PRD_REFERENCIA="'+edtCodigoPRD.Text+'"';
          Open;
          if not IsEmpty then
            edtCodigoPRD.Text := FieldByName('PRD_CODIGO').asString
          else
            edtCodigoPRD.Text := '-1';
        end;
        Close;
        ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
        Open;
      End;
      If IsEmpty Then
      Begin
        Showmessage('Produto inexistente!');
        edtCodigoPRD.SetFocus;
        Exit;
      End
      else if Produto1.Situacao = 1 then
      Begin
        Showmessage('Produto desativado!');
        edtCodigoPRD.SetFocus;
        Exit;
      end;

      If Item_Nota_Fiscal1.Locate('NTF_CODIGO;PRD_CODIGO',
          VarArrayof([NotaFiscal1.CodigoNTF,edtCodigoPRD.Text]),[]) and (edtCodigoPRD.Text <> '0') Then
      Begin
        Raise Exception.Create('Item já cadastrado!');
        Exit;
      end;

      edtProduto.text := Produto1.Descricao+' '+Produto1.Referencia;
      edtValorUnit.text := Format('%.2f',[Produto1.PrecoVenda]);
      if ((fMxNotaFiscal.dblTipoNota.KeyValue <> 362) or //Diferente de Devolução
          (fMxNotaFiscal.dblNaturezaDaOperacao.KeyValue = 5202) or    //Dev. de Compra
          (fMxNotaFiscal.dblNaturezaDaOperacao.KeyValue = 6202) or
          (fMxNotaFiscal.edtCodigoPDV.Text='0')) and  //Dev. de Compra
          (fMxNotaFiscal.dblTipoNota.KeyValue <> 367) then //Conserto
      Begin
        if Produto1.Servico then
        Begin
          edtAliquota.Text := '0';
          edtAliquotaISS.Text := format('%.2f',[DM.Configuracao1.AliquotaISS]);
        end
        else
        Begin
          edtAliquota.Text := Format('%.2f',[Classificacao_fiscal1.ICMS]);
          edtAliquotaISS.Text := '0';
        end;
      end
      else if (fMxNotaFiscal.dblTipoNota.KeyValue <> 367) and //Conserto
              (fMxNotaFiscal.dblTipoNota.KeyValue <> 1020) and //Beneficiamento
              (fMxNotaFiscal.dblTipoNota.KeyValue <> 4000) then //Comodato
      Begin
        if not VerificaInteiroBranco(fMxNotaFiscal.edtNotaCupomAntigo.Text) then
        Begin
          edtCodigoPRD.SetFocus;
          Raise exception.Create('Não foi identificada a nota de Origem da Devolução!')
        end
        else
         Begin
          with DM.QR_Consultas do
          Begin
            Close;
            SQL.Text := 'SELECT INF_PRECO,INF_BONIFICACAO,INF_AMOSTRA,INF_DESCONTO, '+
              ' INF_QUANTIDADE,INF_ALIQUOTA,INF_ALIQUOTA_IPI '+
              ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
              ' WHERE N1.NTF_NOTA_FISCAL='+fMxNotaFiscal.edtNotaCupomAntigo.Text+
              ' AND N1.CNC_PEDIDO='+fMxNotaFiscal.edtPedidoCNC.Text+
              ' AND N1.NTF_PEDIDO='+fMxNotaFiscal.edtCodigoPDV.Text+
              ' AND I1.PRD_CODIGO='+edtCodigoPRD.Text+
              ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
              ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
              ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
            Open;
            if IsEmpty then
            Begin
              edtCodigoPRD.SetFocus;
              Raise exception.Create('Não foi identificado esse produto na nota de Origem!')
            end
            else
            Begin
              edtValorUnit.Text   := format('%.2f',[FieldByName('INF_PRECO').asFloat]);
              edtDesconto.Text    := format('%.2f',[FieldByName('INF_DESCONTO').asFloat]);
              edtQuantidade.Text  := format('%.2f',[FieldByName('INF_QUANTIDADE').asFloat]);
              edtBonificacao.Text := format('%.2f',[FieldByName('INF_BONIFICACAO').asFloat]);
              edtAmostra.Text     := format('%.2f',[FieldByName('INF_AMOSTRA').asFloat]);              
              edtAliquota.Text    := format('%.2f',[FieldByName('INF_ALIQUOTA').asFloat]);
              edtAliquotaIPI.Text := format('%.2f',[FieldByName('INF_ALIQUOTA_IPI').asFloat]);
            end;
          end;
        end;
      end
      else
      Begin
        edtAliquota.Text    := '0';
        edtAliquotaISS.Text := '0';
      end;
    End;
  end;
  
  if (edtCodigoPRD.Text = '0') and (SB_Con.Enabled) then
  Begin
    cmbTipoICMS.ItemIndex := -1;
    if SB_Con.Enabled then
      edtProduto.Enabled := True;
    edtProduto.SetFocus;
  end
  else if sb_con.Enabled then
    edtQuantidade.SetFocus;
  CdUltimoGRP := Produto1.CodigoGRP;
  CdUltimoSGP := Produto1.CodigoSGP;    
end;

procedure TfMxSItemNF.edtQuantidadeExit(Sender: TObject);
begin
  if SB_Can.Enabled then
    Exit;
  if not VerificaFloatBranco(edtQuantidade.Text) then
  Begin
    ShowMessage('Quantidade Inválida!');
    edtQuantidade.SetFocus;
    exit;
  end;
  if StrToFloat(edtQuantidade.Text) <= 0 then
  Begin
    ShowMessage('Quantidade Inválida!');
    edtQuantidade.SetFocus;
  end
  else if edtValorUnit.Text <> '' then
  Begin
    if Trim(edtAliquota.Text) = '' then
      edtAliquota.Text:='0,00';
    if Trim(edtBonificacao.Text) = '' then
      edtBonificacao.Text:='0';
    if Trim(edtAmostra.Text) = '' then
      edtAmostra.Text:='0';
    if Trim(edtDesconto.Text) = '' then
      edtDesconto.Text := '0,00';
    edtValorTotal.Text := format('%.2f',[StrToFloat(edtQuantidade.Text)*(StrToFloat(edtValorUnit.Text)-
      StrToFloat(edtDesconto.Text))]);
  end;
end;

procedure TfMxSItemNF.edtValorUnitExit(Sender: TObject);
begin
  if SB_Con.Focused then
    Exit;
  if not VerificaFloatBranco(edtValorUnit.Text) then
  Begin
    ShowMessage('Valor Unitário Inválido!');
    edtValorUnit.SetFocus;
    exit;
  end;
  if edtQuantidade.Text <> '' then
  Begin
    if edtDesconto.Text = '' then
      edtDesconto.Text:='0,00';
    if edtBonificacao.Text = '' then
      edtBonificacao.Text:='0';
    if edtAmostra.Text = '' then
      edtAmostra.Text:='0';
    edtValorTotal.Text := format('%.2f',[StrToFloat(edtQuantidade.Text)*(StrToFloat(edtValorUnit.Text)-
      StrToFloat(edtDesconto.Text))]);
  end;
end;

procedure TfMxSItemNF.edtAliquotaExit(Sender: TObject);
begin
  if not VerificaFloatBranco(edtAliquota.Text) then
  Begin
    ShowMessage('Alíquota Inválida!');
    edtAliquota.SetFocus;
    exit;
  end;
  if StrToFloat(edtAliquota.Text) < 0 then
  Begin
    ShowMessage('Alíquota Inválida!');
    edtAliquota.SetFocus;
  end;
end;

procedure TfMxSItemNF.Produto1AfterOpen(DataSet: TDataSet);
begin
  Classificacao_fiscal1.Close;
  if Produto1.CodigoCLF = 0 then
    Classificacao_fiscal1.ParamByName('CLF_CODIGO').asInteger:=1
  else
    Classificacao_fiscal1.ParamByName('CLF_CODIGO').asInteger:=Produto1.CodigoCLF;
  Classificacao_fiscal1.Open;
  Classificacao_fiscal2.Close;
  if Produto1.CodigoCLF = 0 then
    Classificacao_fiscal2.ParamByName('CLF_CODIGO').asInteger:=1
  else
    Classificacao_fiscal2.ParamByName('CLF_CODIGO').asInteger:=Produto1.CodigoCLF;
  Classificacao_fiscal2.Open;
end;

procedure TfMxSItemNF.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_Can.Enabled then
    Begin
      SB_Can.SetFocus;
      SB_CanClick(sender);
    end
    else
      Close;
  end
  else if key=chr(13) then
  Begin
    SB_Con.SetFocus;
    SB_ConClick(sender);
  end;
end;

procedure TfMxSItemNF.FormCreate(Sender: TObject);
begin
  vValoresAlterados := False;
end;

procedure TfMxSItemNF.edtAliquotaISSChange(Sender: TObject);
begin
  try
    if edtAliquotaISS.Enabled then
      if StrToFloat(edtAliquotaISS.Text) > 0 then
        edtAliquota.Text := '0';
  except
  end;
end;

procedure TfMxSItemNF.edtAliquotaISSExit(Sender: TObject);
begin
  if not VerificaFloatBranco(edtAliquotaISS.Text) then
  Begin
    ShowMessage('Alíquota ISS Inválida!');
    edtAliquotaISS.SetFocus;
    exit;
  end;
  if StrToFloat(edtAliquotaISS.Text) < 0 then
  Begin
    ShowMessage('Alíquota ISS Inválida!');
    edtAliquotaISS.SetFocus;
  end;
end;

procedure TfMxSItemNF.edtAliquotaChange(Sender: TObject);
begin
  try
    if edtAliquota.Enabled then
      if StrToFloat(edtAliquota.Text) > 0 then
        edtAliquotaISS.Text := '0';
  except
  end;
end;

end.

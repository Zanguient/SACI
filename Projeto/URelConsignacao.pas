unit URelConsignacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, MxRetCobrador, ComCtrls, funcoes,
  DBCtrls, DB, DBTables, SQuery, CentroCusto, AgenteFin, Parametro,
  SubGrupo, Vendedor;

type
  TfMxRelConsignacao = class(TForm)
    Panel1: TPanel;
    ckbCodigoCNC: TCheckBox;
    dblCodigoCNC: TDBLookupComboBox;
    ckbCodigoCLI: TCheckBox;
    edtCodigoCLI: TEdit;
    ckbSituacao: TCheckBox;
    cmbSituacao: TComboBox;
    ckbCodigoPDV: TCheckBox;
    edtCodigoPDV: TEdit;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    Panel3: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    ckbCodigoFUN: TCheckBox;
    DSCentroCusto1: TDataSource;
    CentroCusto1: TCentroCusto;
    ckbCodigoGRP: TCheckBox;
    dblCodigoGRP: TDBLookupComboBox;
    ckbCodigoSGP: TCheckBox;
    dblCodigoSGP: TDBLookupComboBox;
    DSGrupo: TDataSource;
    Grupo: TQuery;
    SubGrupo1: TSubGrupo;
    DSSubGrupo1: TDataSource;
    ckbSintetico: TCheckBox;
    Label1: TLabel;
    ckbConsignacao: TCheckBox;
    edtConsignacao: TEdit;
    ckbCodigoPRD: TCheckBox;
    edtCodigoPRD: TEdit;
    Vendedor1: TVendedor;
    DSVendedor1: TDataSource;
    dblVendedor: TDBLookupComboBox;
    ckbSomenteItens: TCheckBox;
    procedure ckbCodigoCLIClick(Sender: TObject);
    procedure ckbCodigoPDVClick(Sender: TObject);
    procedure ckbCodigoFUNClick(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckbSituacaoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCodigoGRPClick(Sender: TObject);
    procedure ckbCodigoSGPClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ckbConsignacaoClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckbSinteticoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxRelConsignacao: TfMxRelConsignacao;

implementation

uses UDM, URelConsignacaoAnalitico, CdCliente, MxSPediProdMotCal,
  MxSPediProd, UConsignacaoSomenteItens;

{$R *.dfm}

procedure TfMxRelConsignacao.ckbCodigoCLIClick(Sender: TObject);
begin
  if ckbCodigoCLI.Checked then
  Begin
    edtCodigoCLI.Color:=clWindow;
    edtCodigoCLI.Enabled:=True;
    edtCodigoCLI.SetFocus;
  end
  else
  Begin
    edtCodigoCLI.Color:=AlteraCorComponentes;
    edtCodigoCLI.Text:='';
    edtCodigoCLI.Enabled:=False;
  end;
end;

procedure TfMxRelConsignacao.ckbCodigoPDVClick(Sender: TObject);
begin
  if ckbCodigoPDV.Checked then
  Begin
    edtCodigoPDV.Color:=clWindow;
    edtCodigoPDV.Enabled:=True;
    edtCodigoPDV.SetFocus;
  end
  else
  Begin
    edtCodigoPDV.Color:=AlteraCorComponentes;
    edtCodigoPDV.Clear;
    edtCodigoPDV.Enabled:=False;
  end;
end;

procedure TfMxRelConsignacao.ckbCodigoFUNClick(Sender: TObject);
begin
  if ckbCodigoFUN.Checked then
  Begin
    with Vendedor1 do
    Begin
      Close;
      SQL.Text := 'SELECT * '+
        ' FROM FUNCIONARIO '+
        //' WHERE (FUN_APARECE_VENDAS=1 '+
        //'  OR FUN_APARECE_SERVICOS=1) '+
        ' WHERE FUN_FUNCAO IN (56,58,45)';
        if ckbCodigoCNC.Checked then
          SQL.ADD(' AND (CNC_CODIGO='+IntToStr(dblCOdigoCNC.KeyValue)+
                  '  OR  FUN_TODOS_CENTROS=1) ');
        SQL.ADD(' ORDER BY FUN_APELIDO ');
      Open;
    end;
    dblVendedor.Color:=clWindow;
    dblVendedor.Enabled:=True;
    dblVendedor.KeyValue := Vendedor1.CodigoFUN;
    dblVendedor.SetFocus;
  end
  else
  Begin
    Vendedor1.Close;
    dblVendedor.Color:=AlteraCorComponentes;
    dblVendedor.Enabled:=False;
    dblVendedor.KeyValue := 0;
  end;
end;

procedure TfMxRelConsignacao.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  Begin
    CentroCusto1.Open;
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.KeyValue := DM.Configuracao1.CodigoCNC;
    dblCodigoCNC.SetFocus;
  end
  else
  Begin
    CentroCusto1.Close;
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.KeyValue:=-1;
    dblCodigoCNC.Enabled:=False;
  end;
end;

procedure TfMxRelConsignacao.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  CentroCusto1.Open;
  mskDataINI.SetFocus;
end;

procedure TfMxRelConsignacao.ckbSituacaoClick(Sender: TObject);
begin
  if ckbSituacao.Checked then
  Begin
    cmbSituacao.Color := clWindow;
    cmbSituacao.Enabled := True;
    cmbSituacao.ItemIndex := 0;
    cmbSituacao.SetFocus;
  end
  else
  Begin
    cmbSituacao.Color := AlteraCorComponentes;
    cmbSituacao.ItemIndex := -1;
    cmbSituacao.Enabled := False;
  end;
end;

procedure TfMxRelConsignacao.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfMxRelConsignacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfMxRelConsignacao.ckbCodigoGRPClick(Sender: TObject);
begin
  if ckbCodigoGRP.Checked then
  Begin
    Grupo.Open;
    dblCodigoGRP.Enabled:=True;
    dblCodigoGRP.Color:=clWindow;
    ckbCodigoSGP.Enabled:=True;
    dblCodigoGRP.KeyValue:=Grupo.FieldByName('GRP_CODIGO').asInteger;
    dblCodigoGRP.SetFocus;
  end
  else
  Begin
    Grupo.Close;
    dblCodigoGRP.Enabled:=False;
    dblCodigoGRP.Color:=AlteraCorComponentes;
    ckbCodigoSGP.Checked:=False;
    ckbCodigoSGP.Enabled:=False;
    dblCodigoGRP.KeyValue:=0;
  end;
end;

procedure TfMxRelConsignacao.ckbCodigoSGPClick(Sender: TObject);
begin
  if ckbCodigoSGP.Checked then
  Begin
    if not (dblCodigoGRP.KeyValue > 0)then
    Begin
      ShowMessage('Selecione primeiro o grupo!');
      ckbCodigoGRP.Checked:=False;
      exit;
    end
    else
    Begin
      SubGrupo1.Close;
      SubGrupo1.ParamByName('GRP_CODIGO').asInteger:=dblCodigoGRP.KeyValue;
      SubGrupo1.Open;
      dblCodigoSGP.Enabled:=True;
      dblCodigoSGP.color:=clWindow;
      dblCodigoSGP.KeyValue:=SubGrupo1.CodigoSGP;
      dblCodigoSGP.SetFocus;
    end;
  end
  else
  Begin
      dblCodigoSGP.Enabled:=False;
      dblCodigoSGP.color:=AlteraCorComponentes;
      dblCodigoSGP.KeyValue:=0;
  end;
end;

procedure TfMxRelConsignacao.BitBtn1Click(Sender: TObject);
var
  mensagem,cDtINI,cDtFIM,sFiltros,cCSG,cCLI,cFUN,cPRD,cPDV,cCNC,cSITUACAO,cGRP,cSGP: string;
begin
  mensagem := '';
  cDtINI := '';
  cDtFIM := '';
  sFiltros := '';
  cCSG := '';
  cCLI := '';
  cFUN := '';
  cPRD := '';
  cPDV := '';
  cCNC := '';
  cSITUACAO := '';
  cGRP := '';
  cSGP := '';

  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
  if mensagem<>'' then
    raise exception.Create(mensagem);

  if VerificaDataBranco(mskDataINI.Text)then
  Begin
    sFiltros := sFiltros + ' (DtINI:'+mskDataINI.Text+')';
    cDtINI:=' AND (CSG.CSG_DATA>="'+MesDia(mskDataINI.Text)+'") ';
  end;

  if VerificaDataBranco(mskDataFIM.Text)then
  Begin
    sFiltros := sFiltros + ' (DtFIM:'+mskDataFIM.Text+')';
    cDtFIM:=' AND (CSG.CSG_DATA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
  end;

  if ckbCodigoCLI.Checked then
  begin
    if edtCodigoCLI.Text = '' then
      Raise Exception.Create('Código do cliente inválido!')
    else
    Begin
      cCLI := ' AND (CSG.CLI_CODIGO ='+edtCodigoCLI.Text+') ';
      sFiltros := sFiltros + '(CLI='+edtCodigoCLI.Text+') ';
    end;
  end;

  if ckbConsignacao.Checked then
  begin
    if edtConsignacao.Text = '' then
      Raise Exception.Create('Código da consignação inválido!')
    else
    Begin
      cCSG := ' AND (CSG.CSG_CODIGO ='+edtConsignacao.Text+') ';
      sFiltros := sFiltros + '(CSG='+edtConsignacao.Text+') ';
    end;
  end;

  if ckbCodigoFUN.Checked then
  begin
    if (dblVendedor.Text = '') then
      Raise exception.Create('Vendedor inválido!')
    else
    Begin
      cFUN := ' AND (CSG.FUN_CODIGO ='+IntToStr(dblVendedor.KeyValue)+') ';
      sFiltros := sFiltros + '(FUN='+IntToStr(dblVendedor.KeyValue)+') ';
    end;
  end;

  if ckbCodigoPRD.Checked then
  begin
    if edtCodigoPRD.Text = '' then
      Raise Exception.Create('Código do produto inválido!')
    else
    Begin
      cPRD := ' AND (ICS.PRD_CODIGO ='+edtCodigoPRD.Text+') ';
      sFiltros := sFiltros + '(PRD='+edtCodigoPRD.Text+') ';
    end;
  end;

  if ckbCodigoPDV.Checked then
  begin
    if edtCodigoPDV.Text = '' then
      Raise Exception.Create('Código do pedido inválido!')
    else
    Begin
      cPRD := ' AND (SELECT PDV.PDV_CODIGO FROM PEDIDO_DE_VENDA PDV WHERE PDV.CSG_CODIGO = CSG.CSG_CODIGO AND PDV.PDV_CODIGO = '+edtCodigoPDV.Text+') > 0 ';
      sFiltros := sFiltros + '(PDV='+edtCodigoPDV.Text+') ';
    end;
  end;

  if ckbCodigoCNC.Checked then
  begin
    if dblCodigoCNC.Text = '' then
      Raise Exception.Create('Centro de Custo inválido!')
    else
    Begin
      cCNC:=' AND (CSG.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
      sFiltros := sFiltros + ' (CNC:'+IntToStr(dblCodigoCNC.KeyValue)+')';
    end;
  end;

  if ckbSituacao.Checked then
  begin
    if cmbSituacao.Text = '' then
      Raise Exception.Create('Situação inválida!')
    else
    Begin
      cSITUACAO := ' AND (CSG.CSG_SITUACAO ='+IntToStr(cmbSituacao.ItemIndex)+') ';
      sFiltros := sFiltros + '(Situacao='+cmbSituacao.Text+') ';
    end;
  end;

  if ckbCodigoGRP.Checked then
  begin
    if dblCodigoGRP.Text = '' then
      Raise Exception.Create('Grupo inválido!')
    else
    Begin
      cGRP := ' AND (PRD.GRP_CODIGO ='+IntToStr(dblCodigoGRP.KeyValue)+') ';
      sFiltros := sFiltros + '(GRP='+dblCodigoGRP.Text+') ';
    end;
  end;

  if ckbCodigoSGP.Checked then
  begin
    if dblCodigoSGP.Text = '' then
      Raise Exception.Create('SubGrupo inválido!')
    else
    Begin
      cSGP := ' AND (PRD.SGP_CODIGO ='+IntToStr(dblCodigoSGP.KeyValue)+') ';
      sFiltros := sFiltros + '(SGP='+dblCodigoSGP.Text+') ';
    end;
  end;

  if ckbSomenteItens.Checked then
  begin
    Application.CreateForm(Trpt_UConsignacaoSomenteItens, rpt_UConsignacaoSomenteItens);
    with rpt_UConsignacaoSomenteItens do
    begin
      qProdutos.Close;
      qProdutos.SQL.Text := 'SELECT ' +
                               'PRD.PRD_CODIGO, '+
                               'PRD.PRD_DESCRICAO, '+
                               'PRD.PRD_REFERENCIA, '+
                               'SUM(ICS.ICS_QUANTIDADE) AS QUANTIDADE, '+
                               //'ICS.ICS_VALOR, '+
                               'SUM(ICS.ICS_VALOR * ICS.ICS_QUANTIDADE) AS VALOR_TOTAL '+
                               'FROM CONSIGNACAO CSG '+
                               'INNER JOIN ITEM_DE_CONSIGNACAO ICS ON CSG.CSG_CODIGO = ICS.CSG_CODIGO AND CSG.CNC_CODIGO = ICS.CNC_CODIGO '+
                               'INNER JOIN CLIENTE CLI ON CSG.CLI_CODIGO = CLI.CLI_CODIGO AND CSG.CNC_CODIGO = CLI.CNC_CODIGO '+
                               'INNER JOIN FUNCIONARIO FUN ON CSG.FUN_CODIGO = FUN.FUN_CODIGO '+
                               'INNER JOIN CENTRO_DE_CUSTO CNC ON CNC.CNC_CODIGO = CSG.CNC_CODIGO '+
                               'INNER JOIN PRODUTO PRD ON PRD.PRD_CODIGO = ICS.PRD_CODIGO '+
                               'INNER JOIN GRUPO GRP ON PRD.GRP_CODIGO = GRP.GRP_CODIGO '+
                               'INNER JOIN SUBGRUPO SGP ON PRD.SGP_CODIGO = SGP.SGP_CODIGO '+
                               'WHERE 1=1 '+
                               cDtINI + cDtFIM + cCLI + cCSG + cFUN + cPRD + cPDV + cCNC + cSITUACAO + cGRP + cSGP +
                               ' GROUP BY PRD.PRD_CODIGO, PRD.PRD_DESCRICAO, PRD.PRD_REFERENCIA '+ //, ICS.ICS_VALOR
                               ' ORDER BY PRD.PRD_CODIGO, PRD.PRD_DESCRICAO';
//showmessage(qProdutos.SQL.Text);
      qProdutos.Open;
      if qProdutos.isEmpty then
        Showmessage('Tabela vazia!')
      else
      begin
        report.Preview;
        Close;
      end;
      Free;
    end;
  end
  else
  begin
    Application.CreateForm(Trpt_URelConsignacaoAnalitico, rpt_URelConsignacaoAnalitico);
    with rpt_URelConsignacaoAnalitico do
    begin

      qVendedor.Close;
      qVendedor.SQL.Text := 'SELECT ' +
                               'SUM(ICS.ICS_VALOR * ICS.ICS_QUANTIDADE) AS TOTAL_VENDEDOR '+
                               'FROM CONSIGNACAO CSG '+
                               'INNER JOIN ITEM_DE_CONSIGNACAO ICS ON CSG.CSG_CODIGO = ICS.CSG_CODIGO AND CSG.CNC_CODIGO = ICS.CNC_CODIGO '+
                               'INNER JOIN CLIENTE CLI ON CSG.CLI_CODIGO = CLI.CLI_CODIGO AND CSG.CNC_CODIGO = CLI.CNC_CODIGO '+
                               'INNER JOIN FUNCIONARIO FUN ON CSG.FUN_CODIGO = FUN.FUN_CODIGO '+
                               'INNER JOIN CENTRO_DE_CUSTO CNC ON CNC.CNC_CODIGO = CSG.CNC_CODIGO '+
                               'INNER JOIN PRODUTO PRD ON PRD.PRD_CODIGO = ICS.PRD_CODIGO '+
                               'INNER JOIN GRUPO GRP ON PRD.GRP_CODIGO = GRP.GRP_CODIGO '+
                               'INNER JOIN SUBGRUPO SGP ON PRD.SGP_CODIGO = SGP.SGP_CODIGO '+
                               'WHERE 1=1 AND CSG.FUN_CODIGO =:FUN_CODIGO '+
                               cDtINI + cDtFIM + cCLI + cCSG + cFUN + cPRD + cPDV + cCNC + cSITUACAO + cGRP + cSGP +
                               ' GROUP BY CSG.FUN_CODIGO';


      qConsignacao.Close;
      qConsignacao.SQL.Text := 'SELECT DISTINCT ' +
                               '* '+
                               'FROM CONSIGNACAO CSG '+
                               'INNER JOIN ITEM_DE_CONSIGNACAO ICS ON CSG.CSG_CODIGO = ICS.CSG_CODIGO AND CSG.CNC_CODIGO = ICS.CNC_CODIGO '+
                               'INNER JOIN CLIENTE CLI ON CSG.CLI_CODIGO = CLI.CLI_CODIGO AND CSG.CNC_CODIGO = CLI.CNC_CODIGO '+
                               'INNER JOIN FUNCIONARIO FUN ON CSG.FUN_CODIGO = FUN.FUN_CODIGO '+
                               'INNER JOIN CENTRO_DE_CUSTO CNC ON CNC.CNC_CODIGO = CSG.CNC_CODIGO '+
                               'INNER JOIN PRODUTO PRD ON PRD.PRD_CODIGO = ICS.PRD_CODIGO '+
                               'INNER JOIN GRUPO GRP ON PRD.GRP_CODIGO = GRP.GRP_CODIGO '+
                               'INNER JOIN SUBGRUPO SGP ON PRD.SGP_CODIGO = SGP.SGP_CODIGO '+
                               'WHERE 1=1 '+
                               cDtINI + cDtFIM + cCLI + cCSG + cFUN + cPRD + cPDV + cCNC + cSITUACAO + cGRP + cSGP +
                               ' ORDER BY CNC.CNC_CODIGO, FUN.FUN_CODIGO, CSG.CSG_CODIGO, PRD.PRD_CODIGO';

                               {'AND CLI.CLI_CODIGO = 2 '+
                               'AND CSG.CSG_CODIGO = 45 '+
                               'AND CSG.FUN_CODIGO = 2 '+
                               'AND PRD.PRD_CODIGO = 5 '+
                               'AND (SELECT PDV.PDV_CODIGO FROM PEDIDO_DE_VENDA PDV WHERE PDV.CSG_CODIGO = CSG.CSG_CODIGO AND PDV.PDV_CODIGO = 143) > 0 '+
                               'AND CSG.CNC_CODIGO = 2 '+
                               'AND CSG.CSG_SITUACAO = 1 '+
                               'AND PRD.GRP_CODIGO = 29 '+
                               'AND PRD.SGP_CODIGO = 4569 ';}
      qConsignacao.Open;

      if ckbSintetico.Checked then
      begin
        SZRLabel21.Enabled      := true;
        SZRGroup1.ForceNewPage  := false;
        SZRGroup2.Enabled       := false;
        zrbDetalhe.Enabled      := false;
        zrbConsignacao.Enabled  := false;
        zrbCNC.Enabled          := false;
        zrbVendedor.Enabled     := false;
        SZRLabel5.Enabled       := false;
        SZRGroup1.Height        := 1;
      end
      else
      begin
        SZRLabel21.Enabled      := false;
        SZRGroup1.ForceNewPage  := true;
        SZRGroup2.Enabled       := true;
        zrbDetalhe.Enabled      := true;
        zrbConsignacao.Enabled  := true;
        zrbCNC.Enabled          := true;
        zrbVendedor.Enabled     := true;
        SZRLabel5.Enabled       := true;
        SZRGroup1.Height        := 2;
      end;

      if qConsignacao.isEmpty then
        Showmessage('Tabela vazia!')
      else
      begin
        report.Preview;
        Close;
      end;
      Free;
    end;
  end;
end;

procedure TfMxRelConsignacao.ckbConsignacaoClick(Sender: TObject);
begin
  if ckbConsignacao.Checked then
  Begin
    edtConsignacao.Color:=clWindow;
    edtConsignacao.Enabled:=True;
    edtConsignacao.SetFocus;
  end
  else
  Begin
    edtConsignacao.Color:=AlteraCorComponentes;
    edtConsignacao.Text:='';
    edtConsignacao.Enabled:=False;
  end;
end;

procedure TfMxRelConsignacao.ckbCodigoPRDClick(Sender: TObject);
begin
  if ckbCodigoPRD.Checked then
  Begin
    edtCodigoPRD.Color:=clWindow;
    edtCodigoPRD.Enabled:=True;
    edtCodigoPRD.SetFocus;
  end
  else
  Begin
    edtCodigoPRD.Color:=AlteraCorComponentes;
    edtCodigoPRD.Clear;
    edtCodigoPRD.Enabled:=False;
  end;
end;

procedure TfMxRelConsignacao.edtCodigoCLIKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Clear;
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    with fCadCli do
    Begin
      tag := 53;
      dblCentroDeCusto.KeyValue := DM.Configuracao1.CodigoCNC;
      Showmodal;
    end;
  End;
end;

procedure TfMxRelConsignacao.edtCodigoPRDKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=75;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=75;
        ShowModal;
      end;
    end;
    edtCodigoPRD.SetFocus;
  End;
end;

procedure TfMxRelConsignacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    BitBtn1.Click;
end;

procedure TfMxRelConsignacao.ckbSinteticoClick(Sender: TObject);
begin
  ckbSomenteItens.Enabled := ckbSintetico.Checked;
  ckbSomenteItens.Checked := false;
end;

end.
{
SELECT
  *
FROM CONSIGNACAO CSG
INNER JOIN ITEM_DE_CONSIGNACAO ICS ON CSG.CSG_CODIGO = ICS.CSG_CODIGO
INNER JOIN CLIENTE CLI ON CSG.CLI_CODIGO = CLI.CLI_CODIGO
INNER JOIN FUNCIONARIO FUN ON CSG.FUN_CODIGO = FUN.FUN_CODIGO
INNER JOIN CENTRO_DE_CUSTO CNC ON CNC.CNC_CODIGO = CSG.CNC_CODIGO
INNER JOIN PRODUTO PRD ON PRD.PRD_CODIGO = ICS.PRD_CODIGO
INNER JOIN GRUPO GRP ON PRD.GRP_CODIGO = GRP.GRP_CODIGO
INNER JOIN SUBGRUPO SGP ON PRD.SGP_CODIGO = SGP.SGP_CODIGO
WHERE 1=1
AND CSG.CSG_DATA BETWEEN '2011-09-11' AND '2011-09-11'
AND CLI.CLI_CODIGO = 2
AND CSG.CSG_CODIGO = 45
AND CSG.FUN_CODIGO = 2
AND PRD.PRD_CODIGO = 5
AND (SELECT PDV.PDV_CODIGO FROM PEDIDO_DE_VENDA PDV WHERE PDV.CSG_CODIGO = CSG.CSG_CODIGO AND PDV.PDV_CODIGO = 143) > 0
AND CSG.CNC_CODIGO = 2
AND CSG.CSG_SITUACAO = 1
AND PRD.GRP_CODIGO = 29
AND PRD.SGP_CODIGO = 4569
}

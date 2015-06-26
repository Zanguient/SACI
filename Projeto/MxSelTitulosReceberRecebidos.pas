unit MxSelTitulosReceberRecebidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, DBCtrls, CentroCusto, Db, DBTables,
  SQuery, AgenteFin, Forma_de_Pagamento, Parametro,
  Conta_de_Caixa, Variants;

type
  TfMxSelTitulosReceberRecebidos = class(TForm)
    Panel2: TPanel;
    bitConfirmar: TBitBtn;
    bitFechar: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    Panel3: TPanel;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    GroupBox1: TGroupBox;
    dblCOdigoCNC: TDBLookupComboBox;
    ckbCentroDeCusto: TCheckBox;
    ckbNaoOficial: TCheckBox;
    GroupBox2: TGroupBox;
    ckbSintetico: TCheckBox;
    ckbSaltarPagina: TCheckBox;
    ckbMeiaFolha: TCheckBox;
    ckbOficial: TCheckBox;
    ckbNaoVerificado: TCheckBox;
    ckbVerificados: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure bitConfirmarClick(Sender: TObject);
    procedure bitFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCentroDeCustoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckbOficialClick(Sender: TObject);
    procedure ckbNaoOficialClick(Sender: TObject);
    procedure ckbVerificadosClick(Sender: TObject);
    procedure ckbNaoVerificadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelTitulosReceberRecebidos: TfMxSelTitulosReceberRecebidos;

implementation

uses UDM, Funcoes, UTitulosReceberRecebidos;

{$R *.DFM}

procedure TfMxSelTitulosReceberRecebidos.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  mskDataINI.SetFocus;
end;

procedure TfMxSelTitulosReceberRecebidos.bitConfirmarClick(Sender: TObject);
var
  mensagem,CdTRCCNC, CdNTFCNC, sOrdem,DataINI,DataFIM,DataININTF, DataFIMNTF,
    sTRCOficial,sVerificados,sEFIN,sFiltros:string;
begin
  CdTRCCNC := '';
  CdNTFCNC := '';
  sTRCOficial := '';
  sFiltros := '';
  sVerificados := '';
  sEFIN := '';
  sOrdem := '';
  mensagem:='';
  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
  if mensagem<>'' then
    raise exception.Create(mensagem);

  if not VerificaDataBranco(mskDataINI.Text)then
  Begin
    DataINI    := '';
    DataININTF := '';
  end
  else
  Begin
    DataININTF := ' AND N1.NTF_DT_EMISSAO>="'+MesDia(mskDataINI.Text)+'" ';
    DataINI    := ' AND T1.TRC_PAGAMENTO>="'+MesDia(mskDataINI.Text)+'" ';
  end;

  if not VerificaDataBranco(mskDataFIM.Text)then
  Begin
    DataFIM    := '';
    DataFIMNTF := '';
  end
  else
  Begin
    DataFIM    := ' AND T1.TRC_PAGAMENTO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
    DataFIMNTF := ' AND N1.NTF_DT_EMISSAO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
  end;

  if DM.Configuracao1.Empresa = empMotical then
    sEFIN := ' AND T1.CCX_CODIGO<>292 ';

  if ckbCentroDeCusto.Checked then
    if dblCOdigoCNC.Text = '' then
      Raise Exception.Create('Centro de Custo inválido!')
    else
    Begin
      CdTRCCNC := ' AND (T1.CNC_CODIGO='+IntToStr(dblCOdigoCNC.KeyValue)+') ';
      CdNTFCNC := ' AND (N1.CNC_CODIGO='+IntToStr(dblCOdigoCNC.KeyValue)+') ';
      sFiltros := sFiltros + ' (CNC:'+IntToStr(dblCOdigoCNC.KeyValue)+')';
    end;

  if ckbOficial.Checked then
  Begin
    sTRCOficial := ' AND (T1.TRC_NUMERO<>"" AND T1.TRC_NUMERO IS NOT NULL) ';
    sFiltros := sFiltros + ' (Of)';
  end
  else if ckbNaoOficial.Checked then
  Begin
    sTRCOficial := ' AND (T1.TRC_NUMERO="" OR T1.TRC_NUMERO IS NULL) ';
    sFiltros := sFiltros + ' (N.Of)';
  end;

  if ckbVerificados.Checked then
  Begin
    sVerificados := ' AND T1.TRC_VERIFICADO>0 ';
    sFiltros := sFiltros + '(Verificado)';
  end
  else if ckbNaoVerificado.Checked then
  Begin
    sVerificados := ' AND T1.TRC_VERIFICADO=0 ';
    sFiltros := sFiltros + '(Verificado)';
  end;

  sOrdem := ' ORDER BY ANO, MES, DIA, TIPO, NUMERO ';

  if tag = 0 then //Relatório Diário Auxiliar
  Begin
    Application.CreateForm(Trpt_TitulosReceberRecebidos,rpt_TitulosReceberRecebidos);
    with rpt_TitulosReceberRecebidos do
    Begin
      zrbGrupoTipo.Height := 0; //Não tem Campos nessa Band

      if ckbMeiaFolha.Checked then
        report.Options.PageLength := 32;

      zrlFiltros.Caption := sFiltros;

      if ckbSaltarPagina.Checked then
        zrbGrupoDia.ForceNewPage := True;
      if ckbSintetico.Checked then
      Begin
        zrbDetalhe.Height:=0;
        zrlDescCodigo.Enabled:=False;
        zrlDescNumero.Enabled:=False;
        zrlDescSeq.Enabled:=False;
        zrlDescCliente.Enabled:=False;
        zrlDescAgente.Enabled:=False;
        zrlDescVencimento.Enabled:=False;
      end;

      zrlDataINI.Caption := mskDataINI.Text;
      zrlDataFIM.Caption := mskDataFIM.Text;

      Entidade.Close;
      Entidade.SQL.Text:=
        //Títulos Recebidos
        ' SELECT '+
        ' T1.CNC_CODIGO                      AS CENTRO, '+
        ' T1.TRC_CODIGO                      AS CODIGO, '+
        ' T1.TRC_NUMERO                      AS NUMERO, '+
        ' T1.PDV_CODIGO                      AS PEDIDO, '+
        ' T1.TRC_SEQUENCIA                   AS SEQ, '+
        ' T1.CNC_CLIENTE                     AS CLICNC, '+
        ' T1.CLI_CODIGO                      AS CLI, '+
        ' T1.AGF_CODIGO                      AS AGF, '+
        ' T1.TRC_VENCIMENTO                  AS DATA, '+
        ' T1.TRC_DT_EMISSAO_BOLETO           AS DT_BOLETO, '+
        ' T1.TRC_DT_VERIFICADO               AS DT_VERIFICADO, '+
        ' T1.TRC_JUROS                       AS JUROS, '+
        ' T1.TRC_DESCONTO                    AS DESCONTO, '+
        ' 0                                  AS CREDITO, '+
        ' (T1.TRC_VALOR_PAGO+'+
        ' CASE TRC_CRED_CLI '+
        '  WHEN NULL THEN 0 '+
        '  ELSE TRC_CRED_CLI '+
        ' END)                               AS DEBITO, '+
        ' CASE T1.TRC_TIPO_PAG '+
        '  WHEN 13 THEN 0 '+                                     //Tipo: Banco
        '  WHEN 412 THEN 0 '+                                    //Tipo: Banco
        '  ELSE 1 '+                                             //Tipo: Outros Recebimentos
        ' END                                AS TIPO, '+
        ' DATEPART(day,   T1.TRC_PAGAMENTO)  AS DIA, '+
        ' DATEPART(month, T1.TRC_PAGAMENTO)  AS MES, '+
        ' DATEPART(year,  T1.TRC_PAGAMENTO)  AS ANO '+
        ' FROM Titulo_a_receber T1 '+
        ' WHERE (T1.TRC_SITUACAO = 2) '+
        CdTRCCNC+DataINI+DataFIM+sTRCOficial+sVerificados+sEFIN+

        //Notas de Devolução
        ' UNION '+
        ' SELECT '+
        ' N1.CNC_CODIGO                           AS CENTRO, '+
        ' N1.NTF_CODIGO                           AS CODIGO, '+
        ' CAST(N1.NTF_NOTA_FISCAL AS VARCHAR(20)) AS NUMERO, '+
        ' N1.NTF_PEDIDO                           AS PEDIDO, '+
        ' " "                                     AS SEQ, '+
        ' N1.CNC_CLIENTE                          AS CLICNC, '+
        ' N1.CLI_CODIGO                           AS CLI, '+
        ' 0                                       AS AGF, '+
        ' N1.NTF_DT_EMISSAO                       AS DATA, '+
        ' 0                                       AS DT_BOLETO, '+
        ' 0                                       AS DT_VERIFICADO, '+
        ' 0                                       AS JUROS, '+
        ' 0                                       AS DESCONTO, '+
        ' 0                                       AS CREDITO, '+
        ' N1.NTF_TOTAL_NOTA                       AS DEBITO, '+
        ' 10                                      AS TIPO, '+    //Tipo: Nota Devolução
        ' DATEPART(day,   N1.NTF_DT_EMISSAO)      AS Dia, '+
        ' DATEPART(month, N1.NTF_DT_EMISSAO)      AS Mes, '+
        ' DATEPART(year,  N1.NTF_DT_EMISSAO)      AS Ano '+
        ' FROM NOTA_FISCAL N1 '+
        ' WHERE N1.NTF_SITUACAO=2 '+
        ' AND N1.NTF_TIPO_NOTA=362 '+ //Devoluçao
        CdNTFCNC+DataININTF+DataFIMNTF+

        //Notas de Venda
        ' UNION '+
        ' SELECT '+
        ' N1.CNC_CODIGO                           AS CENTRO, '+
        ' N1.NTF_CODIGO                           AS CODIGO, '+
        ' CAST(N1.NTF_NOTA_FISCAL AS VARCHAR(20)) AS NUMERO, '+
        ' N1.NTF_PEDIDO                           AS PEDIDO, '+
        ' " "                                     AS SEQ, '+
        ' N1.CNC_CLIENTE                          AS CLICNC, '+
        ' N1.CLI_CODIGO                           AS CLI, '+
        ' 0                                       AS AGF, '+
        ' N1.NTF_DT_EMISSAO                       AS DATA, '+
        ' 0                                       AS DT_BOLETO, '+
        ' 0                                       AS DT_VERIFICADO, '+
        ' 0                                       AS JUROS, '+
        ' 0                                       AS DESCONTO, '+
        ' N1.NTF_TOTAL_NOTA                       AS CREDITO, '+
        ' 0                                       AS DEBITO, '+
        ' 20                                      AS TIPO, '+    //Tipo: Nota Venda
        ' DATEPART(day,   N1.NTF_DT_EMISSAO)      AS Dia, '+
        ' DATEPART(month, N1.NTF_DT_EMISSAO)      AS Mes, '+
        ' DATEPART(year,  N1.NTF_DT_EMISSAO)      AS Ano '+
        ' FROM NOTA_FISCAL N1 '+
        ' WHERE N1.NTF_SITUACAO=2 '+
        ' AND N1.NTF_TIPO_NOTA IN (361,368,460) '+ //Venda ou Serviço ou Pacote
        CdNTFCNC+DataININTF+DataFIMNTF+

        sOrdem;
      Entidade.Open;
      if Titulo_receber1.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      if (report.Height > DM.Configuracao1.MaxLinhasImp) and
         (DM.Configuracao1.MaxLinhasImp <> 65) then
        report.Height := DM.Configuracao1.MaxLinhasImp;
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfMxSelTitulosReceberRecebidos.bitFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelTitulosReceberRecebidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CentroCusto1.Active := False;
  Action := cafree;
end;

procedure TfMxSelTitulosReceberRecebidos.ckbCentroDeCustoClick(Sender: TObject);
begin
  if ckbCentroDeCusto.Checked then
  Begin
    CentroCusto1.Open;
    dblCOdigoCNC.Color:=clWindow;
    dblCOdigoCNC.Enabled:=True;
    dblCOdigoCNC.KeyValue := DM.Configuracao1.CodigoCNC;
    try
      dblCOdigoCNC.SetFocus;
    except
    end;
  end
  else
  Begin
    CentroCusto1.Close;
    dblCOdigoCNC.Color:=AlteraCorComponentes;
    dblCOdigoCNC.KeyValue:=-1;
    dblCOdigoCNC.Enabled:=False;
  end;
end;

procedure TfMxSelTitulosReceberRecebidos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=chr(27) then
    Close;
end;

procedure TfMxSelTitulosReceberRecebidos.ckbOficialClick(Sender: TObject);
begin
  if ckbOficial.Checked then
    ckbNaoOficial.Checked := False;
end;

procedure TfMxSelTitulosReceberRecebidos.ckbNaoOficialClick(Sender: TObject);
begin
  if ckbNaoOficial.Checked then
    ckbOficial.Checked := False;
end;

procedure TfMxSelTitulosReceberRecebidos.ckbVerificadosClick(Sender: TObject);
begin
  if ckbVerificados.Checked then
    ckbNaoVerificado.Checked := False;
end;

procedure TfMxSelTitulosReceberRecebidos.ckbNaoVerificadoClick(
  Sender: TObject);
begin
  if ckbNaoVerificado.Checked then
    ckbVerificados.Checked := False;
end;

end.

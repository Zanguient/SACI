unit MxControleEquifax;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Mask, StdCtrls, Buttons, DB, DBTables, SQuery, Cliente, Gauges,
  DateUtils, Parametro, Informacoes;

type
  TfMxControleEquifax = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SB_Gerar: TSpeedButton;
    Label1: TLabel;
    SB_Fechar: TSpeedButton;
    mskDataInicio: TMaskEdit;
    memDados: TMemo;
    Label2: TLabel;
    edtLocalArquivo: TEdit;
    Label3: TLabel;
    mskDataFIM: TMaskEdit;
    Cliente1: TCliente;
    barProgresso: TGauge;
    SB_MesProximo: TSpeedButton;
    SB_MesAnterior: TSpeedButton;
    SB_Negativados: TSpeedButton;
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_GerarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SB_MesProximoClick(Sender: TObject);
    procedure SB_MesAnteriorClick(Sender: TObject);
    procedure SB_NegativadosClick(Sender: TObject);
  private
    procedure DefinirDatas(pData: TDateTime; Acrescentar: integer=0);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxControleEquifax: TfMxControleEquifax;

implementation

uses UDM, funcoes, UReceber;

{$R *.DFM}

procedure TfMxControleEquifax.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxControleEquifax.SB_GerarClick(Sender: TObject);
var
  Registro, sEndereco, sDDDFone, sDDDFax, sFone, sFax : string;
  TotalRegistros: integer;
begin
  try
    ExecutaSQL(DM.QR_Comandos,'CREATE INDEX TRC_CLI_DTCAD_DTVEN ON TITULO_A_RECEBER (CLI_CODIGO,TRC_DT_CADASTRO,TRC_VENCIMENTO)');
  except
  end;

  SB_NegativadosClick(sender);

  If MessageDlg('Atenção!!!'+#13+'Esse procedimento irá substituir o arquivo existente!'+#13+
      'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  with Cliente1 do
  Begin
    Close;
    SQL.Text := 'SELECT C1.*,T1.*,P1.PDV_DT_EMISSAO_VENDA '+
      ' FROM CLIENTE C1, TITULO_A_RECEBER T1, PEDIDO_DE_VENDA P1 '+
      ' WHERE C1.CLI_CODIGO>0 '+

      //Títulos Pagos no Período
      ' AND ((T1.TRC_SITUACAO = 2 '+ //Título Pago
      ' AND T1.TRC_PAGAMENTO>="'+MesDia(mskDataInicio.Text)+'" '+
      ' AND T1.TRC_PAGAMENTO<"'+MesDia(StrToDate(mskDataFim.Text)+1)+'") '+

      //Título com Vencimento superior a 30 dias com cliente (não libera inadiplente)
      ' OR (T1.TRC_SITUACAO=0 '+
      ' AND T1.TRC_VENCIMENTO<"'+MesDia(StrToDate(mskDataFIM.Text)-30)+'" '+
      ' AND T1.TRC_EQUIFAX=0 '+
      ' AND NOT EXISTS (SELECT CLI_CODIGO FROM INFORMACOES_DE_CREDITO I1 '+
      ' WHERE I1.ICR_LIBERA_INADIPLENCIA=1 '+
      ' AND I1.CNC_CODIGO=C1.CNC_CODIGO '+
      ' AND I1.CLI_CODIGO=C1.CLI_CODIGO)) '+

      //Título em aberto gerado no período
      ' OR (T1.TRC_SITUACAO=0 '+
      ' AND T1.TRC_VENCIMENTO>"'+MesDia(mskDataFIM.Text)+'" '+
      ' AND T1.TRC_DT_CADASTRO>="'+MesDia(mskDataInicio.Text)+'" '+
      ' AND T1.TRC_DT_CADASTRO<"'+MesDia(StrToDate(mskDataFim.Text)+1)+'") '+

      //Título Cancelados no período
      ' OR (T1.TRC_SITUACAO=5 '+
      ' AND T1.TRC_DT_ALTERADO>="'+MesDia(mskDataInicio.Text)+'" '+
      ' AND T1.TRC_DT_ALTERADO<"'+MesDia(StrToDate(mskDataFim.Text)+1)+'")) '+

      ' AND P1.PDV_NOTA_FISCAL>0 '+
      ' AND C1.CNC_CODIGO=T1.CNC_CLIENTE '+
      ' AND C1.CLI_CODIGO=T1.CLI_CODIGO '+
      ' AND T1.CNC_CODIGO=P1.CNC_CODIGO '+
      ' AND T1.PDV_CODIGO=P1.PDV_CODIGO '+
      ' ORDER BY C1.CLI_CODIGO, T1.TRC_CODIGO ';
    Open;
    TotalRegistros := RecordCount;
  end;
  if TotalRegistros = 0 then
    Raise exception.Create('Nenhum título disponível para envio!');
  barProgresso.MaxValue := TotalRegistros;
  barProgresso.Progress := 0;

  memDados.Clear;

  with DM.CentroCusto1 do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM CENTRO_DE_CUSTO '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC);
    Open;
    if (Length(RetiraMascara(CGC)) <> 14) then
      Raise exception.Create('CNPJ da Loja inválido!');
  end;

  SB_MesProximo.Enabled := False;
  SB_MesAnterior.Enabled := False;
  edtLocalArquivo.Enabled := False;
  SB_Gerar.Enabled := False;

  try
    with Cliente1 do
    Begin
      First;
      while not Eof do
      Begin
        //Definir Endereço
        sEndereco := Trim(Trim(DM.SelecionaParametro(Logradouro)+' '+Endereco)+' '+Bairro);

        sDDDFone := '';
        sFone    := '';
        sDDDFax  := '';
        sFax     := '';
{          //Definir DDD e Telefones
        if Trim(Fone) <> '' then
        Begin
          if Length(Fone) > 8 then
          Begin
            sDDDFone := PreencheZero(4,Copy(Fone,1,4));
            sFone    := PreencheZero(4,Copy(Fone,5,Length(Fone)-4));
          end
          else
            sFone := PreencheZero(10,Fone);
        end;

        //Definir DDD e Fax
        if Trim(Fax) <> '' then
        Begin
          if Length(Fax) > 8 then
          Begin
            sDDDFax := PreencheZero(4,Copy(Fax,1,4));
            sFax    := PreencheZero(4,Copy(Fax,5,Length(Fax)-4));
          end
          else
            sFax := PreencheZero(10,Fax);
        end;
}
        //Registro
        Registro := '';
        if not PessoaFisica then //Pessoa Jurídica
        Begin
          if (FieldByName('TRC_SITUACAO').AsInteger = 2) or
             ((FieldByName('TRC_SITUACAO').AsInteger = 0) and
              (FieldByName('TRC_VENCIMENTO').asDateTime >= StrToDate(mskDataInicio.Text))) then   //Título Pago
            Registro := Registro + 'J'
          else if FieldByName('TRC_SITUACAO').AsInteger = 5 then //Título Excluído
            Registro := Registro + 'B'
          else
            Registro := Registro + 'U';
          //CNPJ
          Registro := Registro + RetiraMascara(CPFCGC,14);
          //Razão Social
          Registro := Registro + PreencheEspaco(55, TiraAcento(RazaoSocial));
          //Nome Fantasia
          Registro := Registro + PreencheEspaco(55,TiraAcento(NomeFantasia));
          //Natureza do Endereço (C - Cobrança; E - Entrega; M - Matriz; D - Desconhecido)
          Registro := Registro + 'E';
        end
        else //Pessoa Física
        Begin
          if (FieldByName('TRC_SITUACAO').AsInteger = 2) or      //Título Pago
             ((FieldByName('TRC_SITUACAO').AsInteger = 0) and
              (FieldByName('TRC_VENCIMENTO').asDateTime >= StrToDate(mskDataInicio.Text))) then   //Título Pago
            Registro := Registro + 'F'
          else if FieldByName('TRC_SITUACAO').AsInteger = 5 then //Título Excluído
            Registro := Registro + 'A'
          else                                                   //Título Atrasados
            Registro := Registro + 'I';
          //CPF
          Registro := Registro + PreencheEspaco(11,RetiraMascara(CPFCGC,11));
          //RG
          Registro := Registro + PreencheEspaco(20,RetiraMascara(CGFRG,20));
          //Órgão Emissor
//          if Trim(CGFRG) <> '' then
//            Registro := Registro + PreencheEspaco(4,'SSP')
//          else
          Registro := Registro + PreencheEspaco(4,'');
          //Nome do Cliente
          Registro := Registro + PreencheEspaco(55,TiraAcento(RazaoSocial));
          //Natureza do Endereço C(comercial), R(residencial) ou D(desconhecido)
          Registro := Registro + 'R';
        end;

        //Parte Comum aos cliente Jurídico e Físicos

        //Endereço
        Registro := Registro + PreencheEspaco(70,TiraAcento(sEndereco));
        //Cidade
        Registro := Registro + PreencheEspaco(30,TiraAcento(Cidade));
        //UF
        Registro := Registro + PreencheEspaco(2,TiraAcento(Uf));
        //CEP
        Registro := Registro + PreencheEspaco(8,CEP);
        //DDD do Telefone
        Registro := Registro + PreencheEspaco(4,sDDDFone);
        //Telefone
        Registro := Registro + PreencheEspaco(10,sFone);
        //DDD do Fax
        Registro := Registro + PreencheEspaco(4,sDDDFax);
        //Fax
        Registro := Registro + PreencheEspaco(10,sFax);
        //E-Mail
//         Registro := Registro + PreencheEspaco(50,TiraAcento(EMail));
        Registro := Registro + PreencheEspaco(50,''); 
        //Cliente Desde
        Registro := Registro + formatDateTime('MMYYYY',DataCadastro);
        //Identificador da Transação
        Registro := Registro + PreencheZero(12,FieldByName('TRC_NUMERO').asString);
        //Tipo de Documento da Transação (D - Duplicata; N - Nota Fiscal; F - Fatura; B - Boleto; C - Cheque; O - Outros)
        Registro := Registro + 'D';
        //Moeda
        Registro := Registro + PreencheEspaco(4, 'R$');
        //Valor Inteiro da Transação
        Registro := Registro + PreencheZero(11,Trunc(int(Arredonda(FieldByName('TRC_VALOR').asFloat))));
        //Centavos do Valor da Transação
        Registro := Registro + PreencheZero(2,Trunc(Frac(Arredonda(FieldByName('TRC_VALOR').asFloat))*100));
        if FieldByName('TRC_VALOR_PAGO').asFloat > 0 then
        Begin
          //Valor Inteiro Pago
          Registro := Registro + PreencheZero(11,Trunc(int(Arredonda(FieldByName('TRC_VALOR_PAGO').asFloat))));
          //Centavos do Valor Pago
          Registro := Registro + PreencheZero(2,Trunc(Frac(Arredonda(FieldByName('TRC_VALOR_PAGO').asFloat))*100));
        end
        else
          Registro := Registro + PreencheEspaco(13,'');

        //Data da Venda
        if (FieldByName('TRC_PAGAMENTO').asDateTime > 0) and
           (FieldByName('TRC_PAGAMENTO').asDateTime < FieldByName('PDV_DT_EMISSAO_VENDA').asDateTime) then
          Registro := Registro + formatDateTime('DDMMYYYY',FieldByName('TRC_PAGAMENTO').asDateTime)
        else
          Registro := Registro + formatDateTime('DDMMYYYY',FieldByName('PDV_DT_EMISSAO_VENDA').asDateTime);

        //Data da Vencimento
        if (FieldByName('TRC_PAGAMENTO').asDateTime > 0) and
           ((FieldByName('TRC_PAGAMENTO').asDateTime < FieldByName('PDV_DT_EMISSAO_VENDA').asDateTime) or
            (FieldByName('TRC_PAGAMENTO').asDateTime < FieldByName('TRC_VENCIMENTO').asDateTime)) then
          Registro := Registro + formatDateTime('DDMMYYYY',FieldByName('TRC_PAGAMENTO').asDateTime)
        else if (FieldByName('TRC_VENCIMENTO').asDateTime < FieldByName('PDV_DT_EMISSAO_VENDA').asDateTime) then
          Registro := Registro + formatDateTime('DDMMYYYY',FieldByName('PDV_DT_EMISSAO_VENDA').asDateTime)
        else
          Registro := Registro + formatDateTime('DDMMYYYY',FieldByName('TRC_VENCIMENTO').asDateTime);

        //Data do Pagamento
        if FieldByName('TRC_PAGAMENTO').asDateTime > 0 then
          Registro := Registro + formatDateTime('DDMMYYYY',FieldByName('TRC_PAGAMENTO').asDateTime)
        else
          Registro := Registro + PreencheEspaco(8, '');

        memDados.Lines.Add(Registro);
        Next;
        barProgresso.Progress := barProgresso.Progress + 1;
      end;
    end;

    //Salvar Arquivo Principal
    try
      If MessageDlg('ATENÇÃO!!!'+#13+'Deseja gerar o arquivo e alterar os registros bloqueados?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        Exit;
      memDados.Lines.SaveToFile(edtLocalArquivo.Text);
      //Campo TRC_EQUIFAX / TRC_DT_EQUIFAX
      //Alterar para EQUIFAX 1 (Títulos Negativados)
      ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
        ' TRC_EQUIFAX=1 '+
        ',TRC_DT_EQUIFAX="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE TRC_SITUACAO=0 '+
        ' AND TRC_EQUIFAX=0 '+
        ' AND TRC_VENCIMENTO<"'+MesDia(StrToDate(mskDataFIM.Text)-30)+'" '+
        ' AND NOT EXISTS (SELECT CLI_CODIGO FROM INFORMACOES_DE_CREDITO I1 '+
        ' WHERE I1.ICR_LIBERA_INADIPLENCIA=1 '+
        ' AND I1.CNC_CODIGO=TITULO_A_RECEBER.CNC_CODIGO '+
        ' AND I1.CLI_CODIGO=TITULO_A_RECEBER.CLI_CODIGO) '+
        ' AND PDV_CODIGO IN (SELECT PDV_CODIGO FROM PEDIDO_DE_VENDA '+
        ' WHERE PDV_NOTA_FISCAL>0) ');

      //Alterar para EQUIFAX 2 (Títulos Liberados da Negativação)
      ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
        ' TRC_EQUIFAX=2 '+
        ',TRC_DT_EQUIFAX="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        //Títulos Pagos no Período
        ' WHERE TRC_SITUACAO = 2 '+ //Título Pago
        ' AND TRC_EQUIFAX=1 '+
        ' AND TRC_PAGAMENTO>="'+MesDia(mskDataInicio.Text)+'" '+
        ' AND TRC_PAGAMENTO<"'+MesDia(StrToDate(mskDataFim.Text)+1)+'" '+
        ' AND PDV_CODIGO IN (SELECT PDV_CODIGO FROM PEDIDO_DE_VENDA '+
        ' WHERE PDV_NOTA_FISCAL>0) ');
      ShowMessage('Arquivo gerado com Sucesso!');
    except
      ShowMessage('Falha ao Salvar o Arquivo!');
    end;

    //Salvar Backup
    try
      memDados.Lines.SaveToFile(DM.Configuracao1.PastaSistema+'\'+
        Copy(mskDataInicio.Text,7,4)+Copy(mskDataInicio.Text,4,2)+'_EQUIFAX.TXT');
    except
      ShowMessage('Falha ao Salvar o Arquivo de Backup!');
    end;
  except
    ShowMessage('Falha ao gerar os Dados para o EQUIFAX!');
  end;
  SB_MesProximo.Enabled := True;
  SB_MesAnterior.Enabled := True;
  edtLocalArquivo.Enabled := True;
  SB_Gerar.Enabled := True;
end;

procedure TfMxControleEquifax.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

procedure TfMxControleEquifax.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfMxControleEquifax.FormShow(Sender: TObject);
Begin
  DM.Usuario1.AlteraCorComponentes(self);
  DefinirDatas(DM.Configuracao1.Data);
  //Definir Local do Arquivo
  edtLocalArquivo.Text := 'C:\EQUIFAX.TXT';
end;

procedure TfMxControleEquifax.DefinirDatas(pData:TDateTime; Acrescentar:integer=0);
var
  DtAux, PrimeiroDia, UltimoDia: TDateTime;
begin
  Case DayOfTheWeek(pData) of
    1: DtAux := pData+6;
    2: DtAux := pData+5;
    3: DtAux := pData+4;
    4: DtAux := pData+3;
    5: DtAux := pData+2;
    6: DtAux := pData+1;
  else
    DtAux := pData;
  end;

  if (Trunc(IncWeek(DtAux,1)) >= DM.Configuracao1.Data) and (Acrescentar > 0) then
    Raise exception.Create('Data superior a permitida para gerar o Arquivo!');

  PrimeiroDia := IncWeek(pData,Acrescentar-1);
  case DayOfTheWeek(PrimeiroDia) of
    2: PrimeiroDia := PrimeiroDia-1;
    3: PrimeiroDia := PrimeiroDia-2;
    4: PrimeiroDia := PrimeiroDia-3;
    5: PrimeiroDia := PrimeiroDia-4;
    6: PrimeiroDia := PrimeiroDia-5;
    7: PrimeiroDia := PrimeiroDia-6;
  end;

  //Definir 1o dia do Mês
  mskDataInicio.Text := formatDateTime('DD/MM/YYYY',PrimeiroDia);

  //Definir Último dia da Semana
  UltimoDia := PrimeiroDia+6;
  mskDataFim.Text := DateToStr(UltimoDia);
end;

procedure TfMxControleEquifax.SB_MesProximoClick(Sender: TObject);
begin
  DefinirDatas(StrToDate(mskDataFim.Text),2);
end;

procedure TfMxControleEquifax.SB_MesAnteriorClick(Sender: TObject);
begin
  DefinirDatas(StrToDate(mskDataFim.Text));
end;

procedure TfMxControleEquifax.SB_NegativadosClick(Sender: TObject);
begin
  //Imprimir Clientes que serão Negativados
  Application.CreateForm(Trpt_receber,rpt_receber);
  with rpt_receber do
  Begin
    zrlFiltros.Caption := '(Clientes que serao Negativados - EQUIFAX)';

    zrbGrupo.Expression := '';
    zrbGrupo.Height := 0;
    zrbRodapeDia.Height := 0;

    zrbGrupoCaixa.Expression := 'CNC_CLIENTE,CLI_RZ_SOCIAL';
    zrbGrupoCaixa.Height := 0;

    Titulo_receber1.Close;
    Titulo_receber1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL, T5.CCX_GRUPO, '+
      ' DATEPART(day, T1.TRC_VENCIMENTO) AS Dia, '+
      ' DATEPART(month, T1.TRC_VENCIMENTO) AS Mes, '+
      ' DATEPART(year, T1.TRC_VENCIMENTO) AS Ano '+
      ' FROM Titulo_a_receber T1, Cliente T2, CONTA_DE_CAIXA T5 '+
      ' WHERE (T1.TRC_SITUACAO IN (0,1,8,9)) '+
      ' AND T1.TRC_VENCIMENTO<"'+MesDia(StrToDate(mskDataFIM.Text)-30)+'" '+
      ' AND T1.TRC_EQUIFAX=0 '+
      ' AND NOT EXISTS (SELECT CLI_CODIGO FROM INFORMACOES_DE_CREDITO I1 '+
      ' WHERE I1.ICR_LIBERA_INADIPLENCIA=1 '+
      ' AND I1.CNC_CODIGO=T1.CNC_CLIENTE '+
      ' AND I1.CLI_CODIGO=T1.CLI_CODIGO) '+
      ' AND (T1.CCX_CODIGO *= T5.CCX_CODIGO) '+
      ' AND (T1.CLI_CODIGO *= T2.CLI_CODIGO) '+
      ' AND (T1.CNC_CLIENTE *= T2.CNC_CODIGO) '+
      ' ORDER BY T1.CNC_CLIENTE, T1.CLI_CODIGO, T1.TRC_CODIGO ';

    Titulo_receber1.Open;
    report.Preview;
    Titulo_receber1.Close;
    Close;
  end;
end;

end.

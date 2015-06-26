unit UTitAtrazo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Cliente,
  Titulo_receber;

type
  Trpt_TitAtrazo = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrbDetalhe: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    zrlNomeEmpresa: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRDBText9: TSZRDBText;
    Titulo_receber1: TTitulo_receber;
    zrlValor: TSZRLabel;
    zrlJuros: TSZRLabel;
    zrbRoapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel4: TSZRLabel;
    ZRLabel8: TSZRLabel;
    zrbSumario: TSZRBand;
    ZRLabel16: TSZRLabel;
    zrlTotalJuros: TSZRLabel;
    zrlTotal: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrbGrupoCLI: TSZRGroup;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel13: TSZRLabel;
    zrbRodapeGrupo: TSZRBand;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlTotalCLIJuros: TSZRLabel;
    zrlTotalCLI: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRLabel7: TSZRLabel;
    SZRDBText3: TSZRDBText;
    zrlCliente: TSZRLabel;
    zrlApelido: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    zrlEndereco: TSZRLabel;
    zrlBairro: TSZRLabel;
    zrlCidade: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel24: TSZRLabel;
    zrlConjuge: TSZRLabel;
    SZRLabel26: TSZRLabel;
    zrlPaiMae: TSZRLabel;
    SZRLabel28: TSZRLabel;
    zrlProfissaoLocalTrabalho: TSZRLabel;
    SZRLabel30: TSZRLabel;
    SZRLabel32: TSZRLabel;
    zrlRGCGF: TSZRLabel;
    SZRLabel34: TSZRLabel;
    zrlCPFCNPJ: TSZRLabel;
    SZRLabel36: TSZRLabel;
    zrlFone: TSZRLabel;
    SZRLabel38: TSZRLabel;
    zrlDataNascimento: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlCEP: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRLabel27: TSZRLabel;
    zrlFax: TSZRLabel;
    SZRLabel46: TSZRLabel;
    zrlCelular: TSZRLabel;
    zrlObservacao: TSZRLabel;
    Cliente1: TCliente;
    zrlFiltros: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel25: TSZRLabel;
    zrlSequenc: TSZRLabel;
    Titulo_receber2: TTitulo_receber;
    SZRLabel53: TSZRLabel;
    SZRLabel54: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRDBText5: TSZRDBText;
    SZRLabel14: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlTIPO: TSZRLabel;
    SZRLabel17: TSZRLabel;
    zrlClassificacao: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRClassificacao: TSZRLabel;
    SZRDBText6: TSZRDBText;
    SZRLabel19: TSZRLabel;
    SZRLabel22: TSZRLabel;
    zrlSaldoAnterior: TSZRLabel;
    SZRLabel29: TSZRLabel;
    zrlTotalLancado: TSZRLabel;
    SZRLabel31: TSZRLabel;
    zrlTotalRecebido: TSZRLabel;
    SZRLabel33: TSZRLabel;
    zrlTotalVencido: TSZRLabel;
    SZRLabel35: TSZRLabel;
    zrlTotalAVencer: TSZRLabel;
    SZRLabel37: TSZRLabel;
    zrlSaldoAtual: TSZRLabel;
    SZRLabel39: TSZRLabel;
    zrlSadoAtualComJuros: TSZRLabel;
    SZRLabel40: TSZRLabel;
    zrlValorMaiorPDV: TSZRLabel;
    SZRLabel41: TSZRLabel;
    zrlDataPrimeiroPDV: TSZRLabel;
    SZRLabel42: TSZRLabel;
    zrlValorUltimoPDV: TSZRLabel;
    SZRLabel43: TSZRLabel;
    zrlDataUltimoPDV: TSZRLabel;
    SZRLabel44: TSZRLabel;
    zrlMaiorAtraso: TSZRLabel;
    SZRLabel45: TSZRLabel;
    Titulo_receber3: TTitulo_receber;
    SZRLabel48: TSZRLabel;
    SZRLabel49: TSZRLabel;
    Grupo: TQuery;
    SZRLabel50: TSZRLabel;
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRGroup1AfterPrint(Sender: TObject; Printed: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbRoapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbGrupoCLIBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    DtReferencia: TDateTime;
  public
    Entidade: TTitulo_receber;
    vTotalCli, vTotalCliJuros, vTotalJuros, vTotal :Double;
    QtdTRC, QtdCLI: Integer;
    vExibirPagos: Boolean;
    SubTotalDoc,SubTotalPago,SubTotalComJuros,SubVencidos,SubAVencer:Double;
  end;

var
  rpt_TitAtrazo: Trpt_TitAtrazo;
  obs_1: string;

implementation
uses
 UDM, Funcoes;

{$R *.DFM}

procedure Trpt_TitAtrazo.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
Var
  vAux, vTitu :Double;
begin
  //
  if (not vExibirPagos) and
     (Entidade.Situacao = 2) then
  Begin
    DoPrint := False;
    Exit;
  end
  else
    DoPrint := True;

  zrlSequenc.Caption := '';
  if DM.Configuracao1.Empresa = empLuciano then
  begin
    Titulo_receber2.Close;
    if Entidade.FieldByName('PDV_CODIGO').AsInteger > 0 then
    begin
      Titulo_receber2.ParamByName('PDV_CODIGO').asInteger :=  Entidade.FieldByName('PDV_CODIGO').AsInteger;
      Titulo_receber2.ParamByName('CNC_CODIGO').asInteger :=  Entidade.FieldByName('CNC_CODIGO').AsInteger;
      Titulo_receber2.Open;
      if not Titulo_receber2.IsEmpty then
        zrlSequenc.Caption := '/'+PreencheZero(2,Titulo_Receber2.RecordCount);
    end;
  end
  else
  begin
    zrlSequenc.Enabled := False;
    ZRDBText9.Width := 15;
  end;
  //
  vAux := Entidade.Valor+Entidade.Valor*(DM.Configuracao1.TaxaJuros*
                   (DM.Configuracao1.Data-Entidade.Vencimento)/3000);
  vTitu := Entidade.Valor;
  //
  zrlValor.Caption := Format('%.2f',[Entidade.Valor]);
  if Entidade.Situacao = 2 then  //Pago
  begin
    zrlJuros.Caption := '0,00';
    SZRLabel54.Caption := Format('%.2f',[Entidade.ValorPG]);
    vAux := 0;
    vTitu := 0;
  end
  else if DM.Configuracao1.Data-Entidade.Vencimento < 0 then
  begin
    zrlJuros.Caption := '0,00';
    SZRLabel54.Caption := '';
    vAux := 0;
    vTitu := 0;
  end
  else
  begin
    zrlJuros.Caption := Format('%.2f',[vAux]);
    SZRLabel54.Caption := '';
  end;

  vTotalCli      := vTotalCli + vTitu;
  vTotalCliJuros := vTotalCliJuros + vAux;
  vTotal         := vTotal + vTitu;  //Entidade.Valor;
  QtdTRC         := QtdTRC + 1;
  vTotalJuros    := vTotalJuros + vAux;

  //CLASSIFICACAO
  DM.QuerySelect.Close;
  DM.QuerySelect.SQL.text := 'SELECT T2.PAR_DESCRICAO FROM PEDIDO_DE_VENDA T1 '+
                             ' INNER JOIN PARAMETRO T2 ON T2.PAR_CODIGO = T1.PDV_CLASSIFICACAO '+
                             ' WHERE T1.PDV_CODIGO = '''+Titulo_receber1.FieldByName('PDV_CODIGO').AsString+'''';
  DM.QuerySelect.Open;
  SZRClassificacao.Caption := DM.QuerySelect.FieldByName('PAR_DESCRICAO').AsString;



  SubTotalDoc  := SubTotalDoc  + Arredonda(Entidade.Valor);
  SubTotalPago := SubTotalPago + Arredonda(Entidade.ValorPG);

  if Entidade.Situacao = 0 then
  begin
    SubTotalComJuros := SubTotalComJuros+Arredonda(Entidade.Valor)+
                       (Arredonda(Entidade.Valor)*(DM.Configuracao1.TaxaJuros*(DtReferencia-Entidade.Vencimento)/3000));
    SubVencidos := SubVencidos + Arredonda(Entidade.Valor);

    if Entidade.Vencimento > DM.Configuracao1.Data then
      SubAVencer := SubAVencer + Arredonda(Entidade.Valor);
  end;


  SZRDBText6.Enabled := false;
end;

procedure Trpt_TitAtrazo.ZRGroup1AfterPrint(Sender: TObject;
  Printed: Boolean);
begin
  vTotalJuros := 0;
end;

procedure Trpt_TitAtrazo.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotal.Caption:=Format('%.2f',[vTotal]);
  zrlTotalJuros.Caption:=Format('%.2f',[vTotalJuros]);
  SZRLabel12.Caption:=IntToStr(QtdTRC);
  SZRLabel25.Caption:=IntToStr(QtdCLI);

  
end;

procedure Trpt_TitAtrazo.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vTotal:=0;
  QtdTRC := 0;
  QtdCLI := 0;
end;

procedure Trpt_TitAtrazo.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption := DM.CentroCusto1.RazaoSocial;
  zrlNomeEmpresa.Caption := DM.Configuracao1.LojaNome;

  DtReferencia := DM.Configuracao1.Data
end;

procedure Trpt_TitAtrazo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Titulo_receber1.Active:=False;
  Action:=cafree;
end;

procedure Trpt_TitAtrazo.zrbRoapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;  
end;

procedure Trpt_TitAtrazo.zrbGrupoCLIBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  vTotalCli      := 0;
  vTotalCliJuros := 0;
  QtdCLI := QtdCLI + 1;

  with Cliente1 do
  Begin
    if (Entidade.CodigoCLI <> CodigoCLI) or
       (Entidade.ClienteCNC <> CodigoCNC) then
    Begin
      Close;
      ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
      ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
      Open;
    end;
    zrlCliente.Caption:=' ('+IntToStr(CodigoCLI)+') '+RazaoSocial;
    zrlApelido.Caption:=NomeFantasia;
    zrlFone.Caption:=Fone;
    zrlFax.Caption:=Fax;
    zrlCelular.Caption:=Celular;
    zrlRGCGF.Caption:=CGFRG;
    zrlCPFCNPJ.Caption:=CPFCGC;
    if DataNascimento > 0 then
      zrlDataNascimento.Caption:=formatDateTime('dd/mm/yyyy',DataNascimento)
    else
      zrlDataNascimento.Caption:='';

    zrlEndereco.Caption := Trim(DM.SelecionaParametro(Logradouro)+' '+Endereco);

    zrlBairro.Caption:=Bairro;
    zrlCidade.Caption:=Trim(Cidade)+'/'+Trim(Uf);
    zrlCEP.Caption := CEP;

    if DM.Configuracao1.Empresa <> empEletro then
    Begin
      SZRLabel24.Enabled := False;
      zrlConjuge.Enabled := False;
      if Cliente1.PessoaFisica then
        SZRLabel26.Caption := 'Pai/Mae:'
      else
        SZRLabel26.Caption := 'Contato:';
      SZRLabel26.Left    := 0;

      zrlPaiMae.Left    := 10;
    end
    else
      zrlConjuge.Caption:=Cliente1.Conjuge;

    if Trim(Pai) <> '' then
      if Trim(Mae) <> '' then
        zrlPaiMae.Caption:=Trim(Pai)+'/'+Trim(Mae)
      else
        zrlPaiMae.Caption:=Trim(Pai)
    else
      zrlPaiMae.Caption:=Trim(Mae);

    if PessoaFisica then
      zrlProfissaoLocalTrabalho.Caption := Trim(Profissao+' '+LocalTrabalho)
    else
      zrlProfissaoLocalTrabalho.Caption := '';

    zrlObservacao.Caption := '';
    zrlObservacao.Caption := zrlObservacao.Caption + Trim(Referencia1);
    if (zrlObservacao.Caption <> '') then
      zrlObservacao.Caption := zrlObservacao.Caption + ' / ';
    zrlObservacao.Caption := zrlObservacao.Caption + Referencia2;
    if (zrlObservacao.Caption <> '') then
      zrlObservacao.Caption := zrlObservacao.Caption + ' / ';
    zrlObservacao.Caption := zrlObservacao.Caption + Referencia3;
    if (zrlObservacao.Caption <> '') then
      zrlObservacao.Caption := zrlObservacao.Caption + ' / ';


    zrlObservacao.Caption := zrlObservacao.Caption + OBS + ' ';

    obs_1:= OBS;
  end;


  DM.QuerySelect.Close;
  DM.QuerySelect.SQL.Text := 'SELECT PAR_DESCRICAO FROM PARAMETRO WHERE PAR_CODIGO = '''+Cliente1.FieldByName('CLI_CLASSIFICACAO').AsString+'''';
  DM.QuerySelect.Open;
  zrlClassificacao.Caption := DM.QuerySelect.FieldByName('PAR_DESCRICAO').AsString;

  DM.QuerySelect.Close;
  DM.QuerySelect.SQL.Text := 'SELECT PAR_DESCRICAO FROM PARAMETRO WHERE PAR_CODIGO = '''+Cliente1.FieldByName('CLI_TIPO').AsString+'''';
  DM.QuerySelect.Open;
  zrlTIPO.Caption := DM.QuerySelect.FieldByName('PAR_DESCRICAO').AsString;

  SZRLabel19.Enabled := false;
end;

procedure Trpt_TitAtrazo.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_receber1;
  vExibirPagos := True;

  SZRLabel9.Enabled := false;
  zrlTIPO.Enabled := false;
  SZRLabel17.Enabled := false;
  zrlClassificacao.Enabled := false;

  SZRLabel18.Enabled := false;
  SZRClassificacao.Enabled := false;
end;

procedure Trpt_TitAtrazo.zrbRodapeGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  cProduto: string;
begin
  zrlTotalCLI.Caption:=Format('%.2f',[vTotalCli]);
  zrlTotalCLIJuros.Caption:=Format('%.2f',[vTotalCliJuros]);

  cProduto := '';

  Grupo.Close;
  Grupo.SQL.Text := 'SELECT DISTINCT(T4.SGP_DESCRICAO) FROM PEDIDO_DE_VENDA T1 '+
                    ' INNER JOIN ITEM_DE_PEDIDO_DE_VENDA T2 ON T1.PDV_CODIGO = T2.PDV_CODIGO '+
                    ' INNER JOIN PRODUTO T3 ON T2.PRD_CODIGO = T3.PRD_CODIGO '+
                    ' INNER JOIN SUBGRUPO T4 ON T3.SGP_CODIGO = T4.SGP_CODIGO '+
                    ' WHERE T2.PDV_CODIGO=:PDV_CODIGO '+
                    ' AND T1.CNC_CODIGO =:CNC_CODIGO';

  Grupo.ParamByName('PDV_CODIGO').Value := Entidade.FieldByName('PDV_CODIGO').AsInteger;
  Grupo.ParamByName('CNC_CODIGO').Value := Entidade.FieldByName('CNC_CODIGO').AsInteger;

  Grupo.Open;

  Grupo.First;
  while not Grupo.Eof do
  begin
    cProduto:= cProduto  + Grupo.FieldByName('SGP_DESCRICAO').AsString + ',';
    Grupo.Next;
  end;
  SZRLabel49.Caption := Copy(cProduto,1,length(cProduto) - 1);

  SubTotalDoc      := 0;
  SubTotalComJuros := 0;
  SubVencidos      := 0;
  SubAVencer       := 0;
  SubTotalPago     := 0;
end;

end.

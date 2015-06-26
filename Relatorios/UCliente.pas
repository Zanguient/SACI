unit UCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Informacoes,
  Funcionario, CentroCusto, Cliente;

type
  Trpt_cliente = class(TForm)
    report: TSZReport;
    zrlCabecalhoPagina: TSZRBand;
    zrbDetalhe: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    zdbRazaoSocial: TSZRDBText;
    zdbCPF: TSZRDBText;
    zdbFone: TSZRDBText;
    Cliente1: TCliente;
    zdbCodigoCLI: TSZRDBText;
    zrlLinhaDupla: TSZRLabel;
    zrlCredito: TSZRLabel;
    zrbGrupoCNC: TSZRGroup;
    ZRLabel7: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRLabel12: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    CentroCusto1: TCentroCusto;
    zrbRodapeGrupoCNC: TSZRBand;
    SZRLabel4: TSZRLabel;
    zrlDataINI: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlDataFIM: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlEndereco: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel17: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    zdbFax: TSZRDBText;
    SZRLabel22: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRLabel23: TSZRLabel;
    SZRLabel24: TSZRLabel;
    zdvCelular: TSZRDBText;
    SZRLabel25: TSZRLabel;
    SZRLabel26: TSZRLabel;
    zrlPaiMae: TSZRLabel;
    SZRLabel28: TSZRLabel;
    zrlConjuge: TSZRLabel;
    Funcionario1: TFuncionario;
    SZRLabel30: TSZRLabel;
    zrlObservacao: TSZRLabel;
    Informacoes1: TInformacoes;
    SZRLabel32: TSZRLabel;
    zrlReferencia: TSZRLabel;
    zrbSumario: TSZRBand;
    SZRLabel34: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    zrlFiltros: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    zrlLimiteCredito: TSZRLabel;
    zrlRendaMensal: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrlCreditoUtilizado: TSZRLabel;
    zrlProfissaoTrabalho: TSZRLabel;
    zrbGrupoVendedor: TSZRGroup;
    SZRLabel5: TSZRLabel;
    zrlVendedorPromotor: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRLabel7: TSZRLabel;
    SZRDBText5: TSZRDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrlCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoCNCBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoVendedorBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure Cliente1CalcFields(DataSet: TDataSet);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    TotalRegistros : integer;
  public
    Entidade: TCliente;
    vVerificaCNPJCGF: Boolean;
  end;

var
  rpt_cliente: Trpt_cliente;

implementation
uses
 UDM, funcoes, MxSelCliente;

{$R *.DFM}


procedure Trpt_cliente.FormCreate(Sender: TObject);
begin
  Entidade := Cliente1;
  if not Entidade.Active then
    Entidade.Open;
  TotalRegistros := 0;
  vVerificaCNPJCGF := False;
end;

procedure Trpt_cliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;


procedure Trpt_cliente.zrlCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_cliente.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sClassificacao: string;
  sCNPJ_OK, sCGF_OK: Boolean;
begin
  DoPrint := True;
  sCNPJ_OK := True;
  sCGF_OK := True;
  if vVerificaCNPJCGF then
  Begin
    //Verifica CNPJ
    if not VerificaCPFCNPJBranco(Entidade.CPFCGC) then
      sCNPJ_OK := False;

    //Verifica CGF
    if (not Entidade.PessoaFisica) and (Entidade.CGFRG <> '') then
      if (not VerificaCGFBranco(Entidade.CGFRG,Entidade.Uf,False)) then
        sCGF_OK := False;

    if sCNPJ_OK and sCGF_OK then
    Begin
      DoPrint := False;
      Exit;
    end;
  end;

  if (Entidade.Credito < 0) OR (Entidade.Credito > 0) then
    zrlCredito.Caption:=format('%.2f',[Entidade.Credito])
  else
    zrlCredito.Caption:='-';
  with Entidade do
  Begin
    zrlEndereco.Caption := Trim(DM.SelecionaParametro(Logradouro)+' '+Endereco+' '+Bairro+' '+Cidade+'/'+Uf);

    //Pai Mae
    zrlPaiMae.Caption := Trim(Pai);
    if Entidade.Pai <> '' then
      zrlPaiMae.Caption := zrlPaiMae.Caption + '/';
    zrlPaiMae.Caption := Trim(zrlPaiMae.Caption + Mae);

    //Referencia
    zrlReferencia.Caption := Referencia1;
    if Referencia2 <> '' then
      zrlReferencia.Caption := zrlReferencia.Caption + ' / '+Referencia2;
    if Entidade.Referencia3 <> '' then
      zrlReferencia.Caption := zrlReferencia.Caption + ' / '+Referencia3;

    //Profissao /Local de Trabalho
    zrlProfissaoTrabalho.Caption := Trim(Profissao+' '+LocalTrabalho);
  end;

  case Entidade.Situacao of
    0: SZRLabel24.Caption:='Novo';
    1: SZRLabel24.Caption:='Antigo';
    2: SZRLabel24.Caption:='Adiplente';
    3: SZRLabel24.Caption:='Inadiplente';
    4: SZRLabel24.Caption:='Fora Relatorio';
  else
    SZRLabel24.Caption:='';
  end;

  if (DM.Configuracao1.Empresa in [3,4]) and (VerificaInteiroBranco(Entidade.Conjuge))then
  Begin
    Funcionario1.Close;
    if (DM.Configuracao1.Empresa = 1) then
      Funcionario1.ParamByName('CNC_CODIGO').asInteger:=Entidade.CodigoCNC;
    Funcionario1.ParamByName('FUN_CODIGO').asInteger:=StrToInt(Entidade.Conjuge);
    Funcionario1.Open;
    zrlConjuge.Caption := IntToStr(Funcionario1.CodigoFUN)+'-'+Funcionario1.Apelido;
  end
  else
    zrlConjuge.Caption := Entidade.Conjuge;

  if Entidade.Classificacao > 0 then
    sClassificacao := '(Clas.: '+Trim(DM.SelecionaParametro(Entidade.Classificacao))+') '
  else
    sClassificacao := '';

  with Informacoes1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
    ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
    Open;
    zrlLimiteCredito.Caption := format('%.2f',[LimiteCredito]);
    zrlCreditoUtilizado.Caption := format('%.2f',[CreditoUtil]);
    zrlRendaMensal.Caption := format('%.2f',[RendaMensal])+'/'+format('%.2f',[RendaExtra]);
    if Trim(MOT_PROIB) <> '' then
      zrlObservacao.Caption :=  sClassificacao + Trim(MOT_PROIB)+' '+Trim(Entidade.OBS)
    else
      zrlObservacao.Caption := sClassificacao + Entidade.OBS;
  end;

  inc(TotalRegistros);


  {DM.QuerySelect.Close;
  DM.QuerySelect.SQL.Text := '';
  DM.QuerySelect.Open;

  SZRLabel10.Caption := DM.QuerySelect.FieldByName('NIVEL').AsString;
  SZRLabel14.Caption := DM.QuerySelect.FieldByName('DIAS').AsString;}
end;


procedure Trpt_cliente.zrbGrupoCNCBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  CentroCusto1.Close;
  CentroCusto1.ParamByName('CNC_CODIGO').asInteger:=Entidade.CodigoCNC;
  CentroCusto1.Open;
  SZRLabel3.Caption:=CentroCusto1.RazaoSocial;
  if DM.Configuracao1.Empresa in [3,4] then
    SZRLabel28.Caption := 'Vendedor';
  if fMxSelCliente.ckbVendaProibida.Checked then
    SZRLabel30.Caption := 'Motivo Cliente Bloqueado'
  else
    SZRLabel30.Caption := 'Observacao'
end;


procedure Trpt_cliente.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
end;

procedure Trpt_cliente.zrbGrupoVendedorBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  CdParceiro: integer;
begin
  if zrbGrupoVendedor.Height > 0 then
  Begin
    with Funcionario1 do
    Begin
      try
        if (not Active) or
           (CodigoFUN <> StrToInt(Entidade.Conjuge)) then
        Begin
          Close;
          ParamByName('FUN_CODIGO').asInteger := StrToInt(Entidade.Conjuge);
          Open;
        end;
        if not IsEmpty then
        Begin
          zrlVendedorPromotor.Caption := Apelido;
          CdParceiro := Parceiro;
          Close;
          ParamByName('FUN_CODIGO').asInteger := CdParceiro;
          Open;
          if not IsEmpty then
            zrlVendedorPromotor.Caption := zrlVendedorPromotor.Caption + ' (PARCEIRO(A): '+Apelido+')'
          else
            zrlVendedorPromotor.Caption := zrlVendedorPromotor.Caption + ' (SEM PARCEIRO)'
        end
        else
          zrlVendedorPromotor.Caption := 'SEM VENDEDOR/PROMOTOR CADASTRADO';
      except
        zrlVendedorPromotor.Caption := 'VENDEDOR/PROMOTOR INVALIDO';
      end;
    end;
  end;
end;

procedure Trpt_cliente.Cliente1CalcFields(DataSet: TDataSet);
begin
  if Trim(Entidade.Fone) <> '' then
    Cliente1.FieldByName('CLI_FONE').EditMask := '!\(####\) #999-9999;0;_'
  else
    Cliente1.FieldByName('CLI_FONE').EditMask := '';

  if Trim(Entidade.Fax) <> '' then
    Cliente1.FieldByName('CLI_FAX').EditMask := '!\(####\) #999-9999;0;_'
  else
    Cliente1.FieldByName('CLI_FAX').EditMask := '';

  if Trim(Entidade.Celular) <> '' then
    Cliente1.FieldByName('CLI_CELULAR').EditMask := '!\(####\) #999-9999;0;_'
  else
    Cliente1.FieldByName('CLI_CELULAR').EditMask := '';

  if Trim(Entidade.CPFCGC) <> '' then
  Begin
    if Entidade.PessoaFisica then
      Cliente1.FieldByName('CLI_CGC_CPF').EditMask := '999-999-999-99;0;_'
    else
      Cliente1.FieldByName('CLI_CGC_CPF').EditMask := '99-999-999/9999-99;0;_';
  end
  else
    Cliente1.FieldByName('CLI_CGC_CPF').EditMask := '';
end;

procedure Trpt_cliente.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.

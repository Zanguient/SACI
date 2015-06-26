unit UPagar;

interface       

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Operacao_do_Sistema, Modulo, Submodulo, Titulo_receber,
  Conta_de_Caixa, Titulo_a_Pagar, Fornecedor, CentroCusto,
  Transportadora, Parametro;

type
  Trpt_Pagar = class(TForm)
    report: TSZReport;
    zrbCabecalho: TSZRBand;
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
    zrlLinhaDupla: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRDBText5: TSZRDBText;
    ZRLabel10: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRDBText6: TSZRDBText;
    ZRLabel11: TSZRLabel;
    ZRLabel15: TSZRLabel;
    ZRDBText4: TSZRDBText;
    ZRLabel16: TSZRLabel;
    Titulo_a_pagar1: TTitulo_a_pagar;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    Fornecedor1: TFornecedor;
    zrbGrupoCNC: TSZRGroup;
    SZRLabel4: TSZRLabel;
    CentroCusto1: TCentroCusto;
    zrbRodapeCentro: TSZRBand;
    SZRLabel5: TSZRLabel;
    SZRBand2: TSZRBand;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    zrlTotalCentro: TSZRLabel;
    zrlTotal: TSZRLabel;
    Conta_de_Caixa1: TConta_de_Caixa;
    Transportadora1: TTransportadora;
    ZRLabel9: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRLabel12: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    Transportadora2: TTransportadora;
    Fornecedor2: TFornecedor;
    zrbGrupo1: TSZRGroup;
    zrlDescGrupo: TSZRLabel;
    zrlGrupoCaixa: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlFornecedor: TSZRLabel;
    zrlTipoDoc: TSZRLabel;
    zrlValorDoc: TSZRLabel;
    zrbRodapeGrupo: TSZRBand;
    SZRLabel8: TSZRLabel;
    zrlTotalGrupo: TSZRLabel;
    SZRLabel14: TSZRLabel;
    zrlConta: TSZRLabel;
    zrlSequen: TSZRLabel;
    Titulo_a_pagar2: TTitulo_a_pagar;
    SZRLabel9: TSZRLabel;
    zrlNumeroCheque: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoCNCBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeCentroBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupo1BeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    TotalRegistros : integer;
  public
    TotalGrupo,TotalCentro,Total:Double;
    Entidade: TTitulo_a_pagar;
  end;

var
  rpt_Pagar: Trpt_Pagar;

implementation
Uses
  UDM, Funcoes;

{$R *.DFM}

procedure Trpt_Pagar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_Pagar.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Pagar.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Pagar.zrbGrupoCNCBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  TotalCentro:=0;
  if zrbGrupoCNC.Height > 0 then
  Begin
    CentroCusto1.Close;
    CentroCusto1.ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
    CentroCusto1.Open;
    SZRLabel12.Caption := CentroCusto1.RazaoSocial;
  end;
end;

procedure Trpt_Pagar.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlFornecedor.Caption := '';
  zrlTipoDoc.Caption    := '';
  zrlConta.Caption      := '';
  if Entidade.CodigoFOR > 0 then
  Begin
    Fornecedor1.Close;
    Fornecedor1.ParamByName('FOR_CODIGO').asInteger:=Entidade.CodigoFOR;
    Fornecedor1.Open;
    zrlFornecedor.Caption := Fornecedor1.RazaoSocial;
  end
  else if (Entidade.CodigoTRN > 0) then
  Begin
    Transportadora1.Close;
    Transportadora1.ParamByName('TRN_CODIGO').asInteger:=Entidade.CodigoTRN;
    Transportadora1.Open;
    zrlFornecedor.Caption := Transportadora1.RazaoSocial;
  end;
  with Conta_de_Caixa1 do
  Begin
    if (not Active) or
       (CodigoCCX <> Entidade.CodigoCCX) then
    Begin
      Close;
      ParamByName('CCX_CODIGO').asInteger := Entidade.CodigoCCX;
      Open;
    end;
    zrlConta.Caption      := Descricao;
  end;

  zrlTipoDoc.Caption := DM.SelecionaParametro(Entidade.TipoDoc);

  zrlValorDoc.Caption := format('%.2f',[Entidade.Valor]);
  //
  Titulo_a_pagar2.Close;
  if Entidade.FieldByName('PCP_CODIGO').AsInteger > 0 then
  begin
    Titulo_a_pagar2.ParamByName('PCP_CODIGO').asInteger :=  Entidade.FieldByName('PCP_CODIGO').AsInteger;
    Titulo_a_pagar2.ParamByName('CNC_CODIGO').asInteger :=  Entidade.FieldByName('CNC_CODIGO').AsInteger;
    Titulo_a_pagar2.Open;
    if not Titulo_a_pagar2.IsEmpty then
      zrlSequen.Caption := '/'+PreencheZero(2,Titulo_a_pagar2.RecordCount)
    else
      zrlSequen.Caption := '';
  end
  else
    zrlSequen.Caption := '';

  zrlNumeroCheque.Caption := '';
  if Entidade.CodigoCHQ <> '' then
  Begin
    with DM.qr_consultas2 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CHEQUE '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.ChequeCNC)+
        ' AND CHQ_CODIGO='+Entidade.CodigoCHQ;
      Open;
      zrlNumeroCheque.Caption := FieldByname('CHQ_NUMERO').AsString;
    end;
  end;
  //
  inc(TotalRegistros);
  TotalCentro:=TotalCentro+Arredonda(Entidade.Valor);
  TotalGrupo:=TotalGrupo+Arredonda(Entidade.Valor);
  Total:=Total+Entidade.Valor;
end;

procedure Trpt_Pagar.zrbRodapeCentroBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalCentro.Caption:=Format('%.2f',[TotalCentro]);
end;

procedure Trpt_Pagar.SZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotal.Caption:=Format('%.2f',[Total]);
  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
end;

procedure Trpt_Pagar.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_a_pagar1;
  TotalRegistros := 0;
  Total:=0;
end;

procedure Trpt_Pagar.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_Pagar.SZRGroup2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
{  if SZRGroup2.Expression='FOR_CODIGO' then
  begin
    Fornecedor2.Close;
    Fornecedor2.ParamByName('FOR_CODIGO').asInteger:=Entidade.CodigoFOR;
    Fornecedor2.Open;
    SZRLabel15.Caption:=Fornecedor1.RazaoSocial;
  end
  else
  begin
    Transportadora2.Close;
    Transportadora2.SQL.Text:='SELECT * FROM TRANSPORTADORA '+
      ' WHERE CNC_CODIGO = '+IntToStr(Entidade.CodigoCNC)+
      ' AND TRN_CODIGO = '+IntToStr(Entidade.CodigoTRN);
    Transportadora2.Open;
    SZRLabel15.Caption:=Transportadora1.RazaoSocial;
  end;
}  
end;

procedure Trpt_Pagar.zrbGrupo1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  TotalGrupo := 0;
  if zrbGrupo1.Height <= 0 then
    Exit;

  if not zrlGrupoCaixa.Enabled then //Agrupar por Dia
    zrlDescGrupo.Caption := '* '+PreencheZero(2,Entidade.FieldByName('Dia').AsString)+'/'+
      PreencheZero(2,Entidade.FieldByName('Mes').AsString)+'/'+
      Entidade.FieldByName('Ano').AsString
  else
  Begin
    DM.SelecionaParametro(Entidade.fieldbyname('CCX_GRUPO').AsInteger);
    if not DM.Parametro1.IsEmpty then
      zrlGrupoCaixa.Caption := DM.Parametro1.Descricao
    else
      zrlGrupoCaixa.Caption := 'SEM GRUPO';
  end;
end;

procedure Trpt_Pagar.zrbRodapeGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalGrupo.Caption:=Format('%.2f',[TotalGrupo]);
end;

end.

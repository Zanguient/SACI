unit UBaixaPag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Operacao_do_Sistema, Modulo, Submodulo, Titulo_receber, 
  Conta_de_Caixa, Titulo_a_Pagar, Fornecedor, Parametro, Transportadora,
  Cheque;

type
  Trpt_BaixaPag = class(TForm)
    report: TSZReport;
    zrlCabecalho: TSZRBand;
    zrlDetalhe: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRDBText5: TSZRDBText;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRDBText6: TSZRDBText;
    ZRLabel11: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRLabel15: TSZRLabel;
    ZRDBText3: TSZRDBText;
    ZRDBText4: TSZRDBText;
    ZRLabel16: TSZRLabel;
    ZRLabel17: TSZRLabel;
    ZRLabel18: TSZRLabel;
    ZRLabel19: TSZRLabel;
    ZRDBText8: TSZRDBText;
    ZRDBText10: TSZRDBText;
    Titulo_a_pagar1: TTitulo_a_pagar;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    Fornecedor1: TFornecedor;
    Parametro1: TParametro;
    Parametro2: TParametro;
    Transportadora1: TTransportadora;
    zrlFornecedor: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRBand1: TSZRBand;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlContaRecebida: TSZRLabel;
    SZRLabel11: TSZRLabel;
    Conta_de_Caixa1: TConta_de_Caixa;
    SZRLabel12: TSZRLabel;
    zrlAgenciaCheque: TSZRLabel;
    SZRLabel14: TSZRLabel;
    zrlGerouMovimento: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    Parametro3: TParametro;
    Transportadora2: TTransportadora;
    Fornecedor2: TFornecedor;
    zrlLinhaDupla: TSZRLabel;
    zrbGrupoCaixa: TSZRGroup;
    zrlDescGrupo: TSZRLabel;
    zrlGrupoCaixa: TSZRLabel;
    SZRLabel20: TSZRLabel;
    zrlTipoPag: TSZRLabel;
    zrlTipoDoc: TSZRLabel;
    zrlValorDoc: TSZRLabel;
    zrlValorPago: TSZRLabel;
    zrbRodapeGrupo: TSZRBand;
    SZRLabel13: TSZRLabel;
    SZRLabel15: TSZRLabel;
    zrlTotalPagGrupo: TSZRLabel;
    zrlTotalDocGrupo: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrlCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoCaixaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    TotalRegistros : integer;
  public
    Entidade: TTitulo_a_pagar;
    TotalDocGrupo, TotalPagGrupo, TotalDoc,TotalPag:Double;
  end;

var
  rpt_BaixaPag: Trpt_BaixaPag;

implementation
Uses
  UDM, Funcoes;

{$R *.DFM}


procedure Trpt_BaixaPag.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_BaixaPag.zrlCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
End;

procedure Trpt_BaixaPag.zrlDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  inc(TotalRegistros);

  zrlValorDoc.Caption := format('%.2f',[Entidade.Valor]);
  zrlValorPago.Caption := format('%.2f',[Entidade.ValorPago]);  

  Parametro1.Close;
  Parametro1.ParamByName('PAR_CODIGO').asInteger := Entidade.TipoPag;
  Parametro1.Open;
  zrlTipoPag.Caption := Parametro1.Descricao;

  Parametro2.Close;
  Parametro2.ParamByName('PAR_CODIGO').asInteger:=Entidade.TipoDoc;
  Parametro2.Open;
  zrlTipoDoc.Caption := Parametro2.Descricao;

  if Entidade.CodigoFOR > 0 then
  Begin
    Fornecedor1.Close;
    Fornecedor1.ParamByName('FOR_CODIGO').asInteger:=Entidade.CodigoFOR;
    Fornecedor1.Open;
    zrlFornecedor.Caption:=Fornecedor1.RazaoSocial+'('+IntToStr(Entidade.CodigoFOR)+')';
  end
  else if Entidade.CodigoTRN > 0 then
  Begin
    Transportadora1.Close;
    Transportadora1.ParamByName('TRN_CODIGO').asInteger:=Entidade.CodigoTRN;
    Transportadora1.Open;
    zrlFornecedor.Caption:=Transportadora1.RazaoSocial+'('+IntToStr(Entidade.CodigoTRN)+')';
  end
  else
    zrlFornecedor.Caption:='X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X';
                                                                
  TotalDoc:=TotalDoc+Arredonda(Entidade.Valor);
  TotalDocGrupo:=TotalDocGrupo+Arredonda(Entidade.Valor);
  TotalPag:=TotalPag+Arredonda(Entidade.ValorPago);
  TotalPagGrupo:=TotalPagGrupo+Arredonda(Entidade.ValorPago);
  with Conta_de_Caixa1 do
  Begin
    if (not Active) or
       (CodigoCCX <> Entidade.CodigoCCX) then
    Begin
      Close;
      ParamByName('CCX_CODIGO').asInteger := Entidade.CodigoCCX;
      Open;
    end;
    SZRLabel9.Caption := Conta_de_Caixa1.Descricao;

    if (not Active) or
       (CodigoCCX <> Entidade.CodigoCCXRecebimento) then
    Begin
      Close;
      ParamByName('CCX_CODIGO').asInteger := Entidade.CodigoCCXRecebimento;
      Open;
    end;
    if (Entidade.CodigoCCX <> Entidade.CodigoCCXRecebimento) then
      zrlContaRecebida.Caption := Conta_de_Caixa1.Descricao
    else
      zrlContaRecebida.Caption := '';
  end;
  if Entidade.GerouMovimento then
    zrlGerouMovimento.Caption := 'SIM'
  else
    zrlGerouMovimento.Caption := 'NAO';

  if Length(Entidade.CodigoCHQ) <= zrlAgenciaCheque.Width then
    zrlAgenciaCheque.Caption := Entidade.CodigoCHQ
  else
    zrlAgenciaCheque.Caption := Copy(Entidade.CodigoCHQ,1,zrlAgenciaCheque.Width);
end;

procedure Trpt_BaixaPag.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  TotalDoc:=0;
  TotalPag:=0;
end;

procedure Trpt_BaixaPag.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel16.Caption:=format('%.2f',[TotalDoc]);
  SZRLabel8.Caption:=format('%.2f',[TotalPag]);
  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
end;

procedure Trpt_BaixaPag.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_a_pagar1;
  TotalRegistros := 0;
end;

procedure Trpt_BaixaPag.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_BaixaPag.SZRGroup2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
{ With parametro3 do
  begin
    close;
    ParamByName('PAR_CODIGO').AsInteger:=Entidade.fieldbyname('CCX_GRUPO').AsInteger;
    Open;
    SZRLabel23.Caption:=Descricao;
  end;
}
end;

procedure Trpt_BaixaPag.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
{  if SZRGroup1.Expression='FOR_CODIGO' then
  begin
    Fornecedor2.Close;
    Fornecedor2.ParamByName('FOR_CODIGO').asInteger:=Entidade.CodigoFOR;
    Fornecedor2.Open;
    SZRLabel20.Caption:=Fornecedor1.RazaoSocial;
  end
  else
  begin
    Transportadora2.Close;
    Transportadora2.SQL.Text:='SELECT * FROM TRANSPORTADORA '+
      ' WHERE CNC_CODIGO = '+IntToStr(Entidade.CodigoCNC)+
      ' AND TRN_CODIGO = '+IntToStr(Entidade.CodigoTRN);
    Transportadora2.Open;
    SZRLabel20.Caption:=Transportadora1.RazaoSocial;
  end;
}  
end;

procedure Trpt_BaixaPag.zrbGrupoCaixaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  TotalDocGrupo := 0;
  TotalPagGrupo := 0;

  if zrlGrupoCaixa.Height <= 0 then
    Exit;

  if not zrlGrupoCaixa.Enabled then //Agrupar por Dia
    zrlDescGrupo.Caption := '* '+PreencheZero(2,Entidade.FieldByName('Dia').AsString)+'/'+
      PreencheZero(2,Entidade.FieldByName('Mes').AsString)+'/'+
      Entidade.FieldByName('Ano').AsString
  else
  Begin
    with Parametro2 do
    begin
      close;
      ParamByName('PAR_CODIGO').AsInteger := Entidade.fieldbyname('CCX_GRUPO').AsInteger;
      Open;
      if not IsEmpty then
        zrlGrupoCaixa.Caption := Parametro2.Descricao
      else
        zrlGrupoCaixa.Caption := 'SEM GRUPO';
    end;
  end;
end;

procedure Trpt_BaixaPag.zrbRodapeGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalDocGrupo.Caption := format('%.2f',[TotalDocGrupo]);
  zrlTotalPagGrupo.Caption := format('%.2f',[TotalPagGrupo]);  
end;

end.

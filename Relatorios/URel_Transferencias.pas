unit URel_Transferencias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZReport, ZRCtrls, Db, DBTables, SQuery, Item_de_Embarque, Embarque,
  Produto, Transportadora, Funcionario, CentroCusto, Transferencia;

type
  Trpt_transferencias = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    SZRGroup1: TSZRGroup;
    zrbDetalhe: TSZRBand;
    ZRLabel15: TSZRLabel;
    ZRLabel18: TSZRLabel;
    Produto1: TProduto;
    ZRLabel17: TSZRLabel;
    ZRLabel20: TSZRLabel;
    ZRLabel21: TSZRLabel;
    ZRLabel11: TSZRLabel;
    Transferencia1: TTransferencia;
    CentroCusto1: TCentroCusto;
    ZRDBText1: TSZRDBText;
    ZRLabel25: TSZRLabel;
    zrbRodapeGrupo: TSZRBand;
    SZRLabel1: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRDBText8: TSZRDBText;
    ZRLabel9: TSZRLabel;
    ZRDBText9: TSZRDBText;
    ZRLabel13: TSZRLabel;
    zrlQuantidade: TSZRLabel;
    zrlAutomatica: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRDBText1: TSZRDBText;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlProduto: TSZRLabel;
    zrlReferencia: TSZRLabel;
    zrlSituacao: TSZRLabel;
    zrlNumeroDocumento: TSZRLabel;
    zrlOrigem: TSZRLabel;
    zrlDestino: TSZRLabel;
    ZRLabel16: TSZRLabel;
    zrlDescPreco: TSZRLabel;
    zrlDescTotalItem: TSZRLabel;
    zrlPreco: TSZRLabel;
    zrlTotalItem: TSZRLabel;
    SZRLabel9: TSZRLabel;
    Detalhe: TSZRLabel;
    zrlMarca: TSZRLabel;
    zrlDetalhe: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel10: TSZRLabel;
    zrlSubTotal: TSZRLabel;
    zrbSumario: TSZRBand;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    zrlTotal: TSZRLabel;
    ZRLabel5: TSZRLabel;
    SZRLabel7: TSZRLabel;
    zrlCodigoPCP: TSZRLabel;
    SZRLabel8: TSZRLabel;
    zrlFornecedor: TSZRLabel;
    SZRLabel14: TSZRLabel;
    zrlNotaCompra: TSZRLabel;
    SZRLabel16: TSZRLabel;
    zrlValor: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    vSubTotal, vTotal: Double;
  public
    { Public declarations }
  end;

var
  rpt_transferencias: Trpt_transferencias;

implementation

Uses UDM, Funcoes, MxSPreRecRec;

{$R *.DFM}

procedure Trpt_transferencias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure Trpt_transferencias.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_transferencias.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vPrecoUnit: Double;
begin
  if zrbDetalhe.Height = 0 then
    Exit;

  with Produto1  do
  Begin
    if CodigoPRD <> Transferencia1.FieldByName('PRD_CODIGO').asInteger then
    Begin
      CLose;
      ParamByName('PRD_CODIGO').asInteger := Transferencia1.FieldByName('PRD_CODIGO').asInteger;
      Open;
    end;
    if Length(Descricao) <= zrlProduto.Width then
      zrlProduto.Caption := Descricao + ' ' + Caracteristica
    else
      zrlProduto.Caption := Copy(Descricao,1,zrlProduto.Width);
    if Length(Referencia) <= zrlReferencia.Width then
      zrlReferencia.Caption := Referencia
    else
      zrlReferencia.Caption := Copy(Referencia,1,zrlReferencia.Width);
  end;

  zrlQuantidade.Caption:=format('%.2f',[Transferencia1.FieldByName('ITR_QUANTIDADE').asfloat]);

  vPrecoUnit := 0;
  if tag = 0 then //fMxSPreRecRec
  Begin
    if fMxSPreRecRec.ckbExibirPreco.Checked then
    Begin
      case fMxSPreRecRec.cmbExibirPreco.ItemIndex of
        0: vPrecoUnit := Produto1.Custo;
        1: vPrecoUnit := Produto1.Precocompra;
        2: vPrecoUnit := Produto1.Precovenda;
        3: vPrecoUnit := Transferencia1.FieldByName('ITR_PRECO').asfloat;
        else
          vPrecoUnit := 0;
      end;
    end
    else
    Begin
      zrbRodapeGrupo.Width := 0;
      zrbSumario.Width := 0;
      zrlDescPreco.Enabled := False;
      zrlDescTotalItem.Enabled := False;
      zrlPreco.Enabled := False;
      zrlTotalItem.Enabled := False;
    end;
  end
  else
  Begin
    zrbRodapeGrupo.Width := 0;
    zrbSumario.Width := 0;
    zrlDescPreco.Enabled := False;
    zrlDescTotalItem.Enabled := False;
    zrlPreco.Enabled := False;
    zrlTotalItem.Enabled := False;
  end;

  zrlPreco.Caption:=format('%.2f',[vPrecoUnit]);
  zrlTotalItem.Caption:=format('%.2f',[Transferencia1.FieldByName('ITR_QUANTIDADE').asfloat*Arredonda(vPrecoUnit)]);
  vSubTotal := vSubTotal + Arredonda(Transferencia1.FieldByName('ITR_QUANTIDADE').asfloat*Arredonda(vPrecoUnit));
  vTotal := vTotal + Arredonda(Transferencia1.FieldByName('ITR_QUANTIDADE').asfloat*Arredonda(vPrecoUnit));
end;

procedure Trpt_transferencias.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  CdPCP, CdFOR: integer;
begin
  vSubTotal := 0;
  if Transferencia1.Automatica then
    zrlAutomatica.Enabled := True
  else
    zrlAutomatica.Enabled := False;

  Case Transferencia1.Situacao of
    0: zrlSituacao.Caption := 'Solicitada';
    1: zrlSituacao.Caption := 'Processada';
    2: zrlSituacao.Caption := 'Embarcada';
    3: zrlSituacao.Caption := 'Recebida';
    4: zrlSituacao.Caption := 'Cancelada';
   End;

   zrlNumeroDocumento.Caption := 'TRF'+Transferencia1.FieldByName('TRF_CODIGO').AsString+
     '/'+IntToStr(Transferencia1.CNCDest)+'-'+FormatDateTime('dd.mm.yyyy',
     Transferencia1.FieldByName('TRF_DATA').asDateTime);

  with CentroCusto1 do
  Begin
    if CodigoCNC <> Transferencia1.FieldByName('TRF_CNC_ORIGEM').asInteger then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Transferencia1.FieldByName('TRF_CNC_ORIGEM').asInteger;
      Open;
    end;
    zrlOrigem.Caption := RazaoSocial;

    if CodigoCNC <> Transferencia1.FieldByName('TRF_CNC_DESTINO').asInteger then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Transferencia1.FieldByName('TRF_CNC_DESTINO').asInteger;
      Open;
    end;
    zrlDestino.Caption := RazaoSocial;
  end;

  CdPCP := Transferencia1.CodigoPCP;
  with DM.QR_Consultas do
  Begin
    zrlCodigoPCP.Caption := IntToStr(CdPCP);
    zrlNotaCompra.Caption := '';
    zrlValor.Caption := '';
    zrlFornecedor.Caption := '';


    if Transferencia1.CodigoPCP > 0 then
    Begin
      Close;
      SQL.Text := 'SELECT * FROM PEDIDO_DE_COMPRA '+
        ' WHERE PCP_CODIGO='+IntToStr(CdPCP);
      Open;
      CdFOR := FieldByName('FOR_CODIGO').asInteger;
      zrlNotaCompra.Caption := FieldByName('PCP_NOTA_FISCAL').asString;

      Close;
      SQL.Text := 'SELECT * FROM FORNECEDOR '+
        ' WHERE FOR_CODIGO='+IntToStr(CdFOR);
      Open;
      zrlFornecedor.Caption := FieldByName('FOR_RZ_SOCIAL').asString;

      Close;
      SQL.Text := 'SELECT SUM(ITR_PRECO*ITR_QUANTIDADE) AS TOTAL '+
        ' FROM ITEM_DE_TRANSFERENCIA '+
        ' WHERE CNC_CODIGO='+IntToStr(Transferencia1.CodigoCNC)+
        ' AND TRF_CODIGO='+IntToStr(Transferencia1.CodigoTRF);
      Open;
      zrlValor.Caption := Format('%.2f',[FieldByName('TOTAL').asFLoat]);
    end;
  end;
end;

procedure Trpt_transferencias.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_transferencias.FormCreate(Sender: TObject);
begin
  vSubTotal := 0;
  vTotal := 0;
end;

procedure Trpt_transferencias.zrbRodapeGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlSubTotal.Caption := format('%.2f',[vSubTotal]);
end;

procedure Trpt_transferencias.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotal.Caption := format('%.2f',[vTotal]);
end;

end.

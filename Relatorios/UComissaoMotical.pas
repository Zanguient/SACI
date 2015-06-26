unit UComissaoMotical;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Titulo_receber, Vendedor;

type
  Trpt_ComissaoMotical = class(TForm)
    report: TSZReport;
    zrbCabecalho: TSZRBand;
    zrbDetalhe: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    zrbSumario: TSZRBand;
    ZRLabel11: TSZRLabel;
    ZRLabel20: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    zrlFiltros: TSZRLabel;
    Vendedor1: TVendedor;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    zrlUsuario: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel4: TSZRLabel;
    zrlProduto: TSZRLabel;
    zrlServico: TSZRLabel;
    zrlTotalProduto: TSZRLabel;
    zrlTotalServico: TSZRLabel;
    zrlCliente: TSZRLabel;
    SZRLabel12: TSZRLabel;
    zrlValorPago: TSZRLabel;
    zrlTotalPago: TSZRLabel;
    Cliente1: TCliente;
    SZRLabel2: TSZRLabel;
    zrlTipo: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlOutras: TSZRLabel;
    SZRLabel15: TSZRLabel;
    zrlTotalOutros: TSZRLabel;
    zrlTotalProdutoNota: TSZRLabel;
    zrlTotalServicoNota: TSZRLabel;
    zrlTotalOutrosNota: TSZRLabel;
    SZRLabel17: TSZRLabel;
    zrlTotalProdutoGeral: TSZRLabel;
    zrlTotalServicoGeral: TSZRLabel;
    zrlTotalOutrosGeral: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel14: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    vTotalProduto, vTotalServico, vTotalOutros, vTotalProdutoNota, vTotalServicoNota, vTotalOutrosNota, vTotalPago: Double;
  public
    Entidade: TTitulo_receber;
  end;

var
  rpt_ComissaoMotical: Trpt_ComissaoMotical;

implementation
Uses
  UDM, Funcoes;
{$R *.DFM}

procedure Trpt_ComissaoMotical.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure Trpt_ComissaoMotical.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_ComissaoMotical.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vParteSer, vParteTotal, vPercSer: double;
  vExtorno: integer;
begin
  if Entidade.Situacao = 5 then //Extorno
    vExtorno := -1
  else
    vExtorno := 1;

  vTotalPago:=vTotalPago+vExtorno*Entidade.ValorPG;

  zrlValorPago.Caption := format('%.2f',[vExtorno*Entidade.ValorPG]);

  with Cliente1 do
  Begin
    if (not Active) or
       (CodigoCNC <> Entidade.ClienteCNC) or
       (CodigoCLI <> Entidade.CodigoCLI) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
      ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
      Open;
    end;
    if Entidade.Situacao = 5 then //Extorno
      zrlCliente.Caption := 'EXT-'+RazaoSocial + ' ('+IntToStr(Entidade.CodigoCLI)+')'
    else
      zrlCliente.Caption := RazaoSocial + ' ('+IntToStr(Entidade.CodigoCLI)+')'
  end;
  zrlTipo.Caption := '';

  zrlProduto.Caption := '0,00';
  zrlServico.Caption := '0,00';
  zrlOutras.Caption  := '0,00';

  with DM.QR_Consultas do
  Begin
    if Entidade.TipoPedido = 2 then //Pacote de Crédito
    Begin
      zrlTipo.Caption := 'Pacote Cre';
      zrlOutras.Caption := format('%.2f',[vExtorno*Entidade.ValorPG]);
      if (Entidade.Numero) <> '' then
        vTotalOutrosNota := vTotalOutrosNota + Arredonda(vExtorno*Entidade.ValorPG)
      else
        vTotalOutros := vTotalOutros + Arredonda(vExtorno*Entidade.ValorPG);
    end
    else
    Begin
      if Entidade.TipoPedido = 1 then //Pacote de Venda
      Begin
        zrlTipo.Caption := 'Pacote';
        Close;
        SQL.Text := 'SELECT SUM(ROUND(IPC_PRECO_DESCONTO,2)*IPC_QUANTIDADE) AS SERVICO '+
          ' FROM PACOTE_DE_VENDA P1, ITEM_DE_PACOTE_DE_VENDA I1 '+
          ' WHERE P1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
          ' AND P1.PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
          ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
          ' AND P1.PDV_CODIGO=I1.PDV_CODIGO '+
          ' AND I1.GRP_CODIGO IN (SELECT GRP_CODIGO FROM GRUPO WHERE GRP_SERVICO=1) ';
        Open;
        vParteSer := FieldByName('SERVICO').asFloat;

        Close;
        SQL.Text := 'SELECT SUM(ROUND(IPC_PRECO_DESCONTO,2)*IPC_QUANTIDADE) AS TOTAL '+
          ' FROM PACOTE_DE_VENDA P1, ITEM_DE_PACOTE_DE_VENDA I1 '+
          ' WHERE P1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
          ' AND P1.PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
          ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
          ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
        Open;
        vParteTotal := FieldByName('TOTAL').asFloat;
      end
      else  //Pedido de Venda
      Begin
        if Entidade.CodigoFPE > 0 then
        Begin
          zrlTipo.Caption := 'Fat.Pendente';
          Close;
          SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS SERVICO '+
            ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE P1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
            ' AND P1.FPE_CODIGO='+IntToStr(Entidade.CodigoFPE)+
            ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
            ' AND P1.PDV_CODIGO=I1.PDV_CODIGO '+
            ' AND I1.PRD_CODIGO IN (SELECT PRD_CODIGO FROM PRODUTO WHERE PRD_SERVICO=1) ';
          Open;
          vParteSer := FieldByName('SERVICO').asFloat;

          Close;
          SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
            ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE P1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
            ' AND P1.FPE_CODIGO='+IntToStr(Entidade.CodigoFPE)+
            ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
            ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
          Open;
          vParteTotal := FieldByName('TOTAL').asFloat;
        end
        else
        Begin
          zrlTipo.Caption := 'Venda';
          CLose;
          SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS SERVICO '+
            ' FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE I1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
            ' AND I1.PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
            ' AND I1.PRD_CODIGO IN (SELECT PRD_CODIGO FROM PRODUTO WHERE PRD_SERVICO=1) ';
          Open;
          vParteSer := FieldByName('SERVICO').asFloat;

          Close;
          SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
            ' FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE I1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
            ' AND I1.PDV_CODIGO='+IntToStr(Entidade.CodigoPDV);
          Open;
          vParteTotal := FieldByName('TOTAL').asFloat;
        end;
      end;

      if vParteTotal > 0 then
      Begin
        vPercSer := Arredonda(vParteSer/vParteTotal);
        zrlServico.Caption := format('%.2f',[vExtorno*Entidade.ValorPG*vPercSer]);
        zrlProduto.Caption := format('%.2f',[vExtorno*(Entidade.ValorPG-vExtorno*StrToFloat(zrlServico.Caption))]);
        if (Entidade.Numero) <> '' then
        Begin
          vTotalServicoNota := vTotalServicoNota + Arredonda(StrToFloat(zrlServico.Caption));
          vTotalProdutoNota := vTotalProdutoNota + Arredonda(StrToFloat(zrlProduto.Caption));
        end
        else
        Begin
          vTotalServico := vTotalServico + Arredonda(StrToFloat(zrlServico.Caption));
          vTotalProduto := vTotalProduto + Arredonda(StrToFloat(zrlProduto.Caption));
        end;
      end
      else
      Begin
        zrlTipo.Caption := 'Sem Pedido';
        zrlOutras.Caption := format('%.2f',[vExtorno*Entidade.ValorPG]);
        if Trim(Entidade.Numero) <> '' then
          vTotalOutrosNota := vTotalOutrosNota + Arredonda(StrToFloat(zrlOutras.Caption))
        else
          vTotalOutros := vTotalOutros + Arredonda(StrToFloat(zrlOutras.Caption));
      end;
    end;
  end;
end;

procedure Trpt_ComissaoMotical.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption  := EmpresaDesenvolvedora;  
end;

procedure Trpt_ComissaoMotical.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_receber1;
end;

procedure Trpt_ComissaoMotical.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalProduto.Caption := format('%.2f',[vTotalProduto]);
  zrlTotalServico.Caption := format('%.2f',[vTotalServico]);
  zrlTotalOutros.Caption  := format('%.2f',[vTotalOutros]);
  zrlTotalProdutoNota.Caption := format('%.2f',[vTotalProdutoNota]);
  zrlTotalServicoNota.Caption := format('%.2f',[vTotalServicoNota]);
  zrlTotalOutrosNota.Caption  := format('%.2f',[vTotalOutrosNota]);
  zrlTotalProdutoGeral.Caption := format('%.2f',[vTotalProduto+vTotalProdutoNota]);
  zrlTotalServicoGeral.Caption := format('%.2f',[vTotalServico+vTotalServicoNota]);
  zrlTotalOutrosGeral.Caption  := format('%.2f',[vTotalOutros+vTotalOutrosNota]);
  zrlTotalPago.Caption    := format('%.2f',[vTotalPago]);
end;

end.

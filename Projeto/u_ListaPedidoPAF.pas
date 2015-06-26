unit u_ListaPedidoPAF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables, StdCtrls, Buttons, ExtCtrls,
  SQuery, Item_de_Estoque;

type
  TfrmListaPedidoPAF = class(TForm)
    qPedidos: TQuery;
    dsPedidos: TDataSource;
    Panel3: TPanel;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qPedidosCNC_CODIGO: TIntegerField;
    qPedidosPDV_CODIGO: TIntegerField;
    qPedidosPDV_DATA_HORA: TDateTimeField;
    qPedidosPDV_TOTAL: TFloatField;
    qPedidosCLI_RZ_SOCIAL: TStringField;
    qPedidosCLI_CODIGO: TIntegerField;
    qItens: TQuery;
    Item_de_Estoque1: TItem_de_Estoque;
    qPedidosPDV_COO: TStringField;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    procedure SQL(bPendenteDia: boolean);
  public
    class function PAF_ImportarExecute(bManual: boolean): boolean;
  end;

var
  frmListaPedidoPAF: TfrmListaPedidoPAF;

implementation

uses UDMFB, UDM, funcoes;

{$R *.dfm}

procedure TfrmListaPedidoPAF.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmListaPedidoPAF.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    close;
end;

procedure TfrmListaPedidoPAF.BitBtn1Click(Sender: TObject);
begin
  TfrmListaPedidoPAF.PAF_ImportarExecute(true);
  Close;
end;

procedure TfrmListaPedidoPAF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

class function TfrmListaPedidoPAF.PAF_ImportarExecute(bManual: boolean): boolean;
var
  trans:Boolean;
  sData: string;
begin
  result := false;
  trans := false;

  Application.CreateForm(TfrmListaPedidoPAF, frmListaPedidoPAF);

  with frmListaPedidoPAF do
  begin
    if bManual then
      SQL(true)
    else
      SQL(false);

    if bManual then
    begin
      if qPedidos.IsEmpty then
        raise Exception.Create('Não existe pedidos a serem atualizados!');
    end
    else
    begin
      if qPedidos.IsEmpty then
      begin
        result := true;
        exit;
      end;
    end;

    try
      if DMFB.PAF_Conectar then
      begin
        with DM.Database2 do
        begin
          try
            qPedidos.First;
            If DM.Configuracao1.ControleTransacao then
            Begin
              StartTransaction;
              Trans:=True;
            end;

            while not qPedidos.Eof do
            begin
              //Seleciona o DAV
              DMFB.qConsultas.Close;
              DMFB.qConsultas.SQL.Clear;
              DMFB.qConsultas.SQL.Add('SELECT DISTINCT');
              DMFB.qConsultas.SQL.Add('  DATA,');
              DMFB.qConsultas.SQL.Add('  DAV,');
              DMFB.qConsultas.SQL.Add('  PEDIDO AS COO');
              DMFB.qConsultas.SQL.Add('FROM');
              DMFB.qConsultas.SQL.Add('  ALTERACA');
              DMFB.qConsultas.SQL.Add('WHERE');
              DMFB.qConsultas.SQL.Add('  DAV = ''' + FormatFloat('0000000000',qPedidos.FieldByName('PDV_CODIGO').AsFloat) + ''' ');
              DMFB.qConsultas.Open;
              sData := DateToStr(DMFB.qConsultas.FieldByName('DATA').AsDateTime) + ' ' + Formatdatetime('hh:MM:ss',now);

              if not DMFB.qConsultas.IsEmpty then
              begin
                //Atualiza o pedido
                DM.QR_Comandos.Close;
                DM.QR_Comandos.SQL.Clear;
                DM.QR_Comandos.SQL.Add('UPDATE PEDIDO_DE_VENDA SET');
                //DM.QR_Comandos.SQL.Add('PDV_CCF = ''' + DMFB.qConsultas.FieldByName('CCF').AsString + ''',');
                DM.QR_Comandos.SQL.Add('PDV_NOTA_FISCAL = ''' + DMFB.qConsultas.FieldByName('COO').AsString + ''',');
                DM.QR_Comandos.SQL.Add('PDV_COO = ''' + DMFB.qConsultas.FieldByName('COO').AsString + ''',');
                DM.QR_Comandos.SQL.Add('PDV_NOTA_CUPOM = 2,');
                DM.QR_Comandos.SQL.Add('PDV_LISTADO = 1,');
                DM.QR_Comandos.SQL.Add('PDV_DT_EMISSAO_VENDA = ''' + MesDiaHora(StrToDateTime(sData)) + ''',');
                DM.QR_Comandos.SQL.Add('PDV_DT_ALTERADO = ''' + MesDiaHora(StrToDateTime(sData)) + '''');
                DM.QR_Comandos.SQL.Add('WHERE PDV_CODIGO = ' + DMFB.qConsultas.FieldByName('DAV').AsString + '');
                DM.QR_Comandos.SQL.Add('AND CNC_CODIGO = ' + IntToStr(DM.Configuracao1.CodigoCNC) + '');
                DM.QR_Comandos.SQL.Add('AND PDV_DT_EMISSAO_VENDA IS NULL');
                DM.QR_Comandos.ExecSQL;

                qItens.Close;
                qItens.SQL.Clear;
                qItens.SQL.Add('SELECT');
                qItens.SQL.Add('  *');
                qItens.SQL.Add('FROM');
                qItens.SQL.Add('  ITEM_DE_PEDIDO_DE_VENDA');
                qItens.SQL.Add('WHERE');
                qItens.SQL.Add('  PDV_CODIGO = ''' + qPedidos.FieldByName('PDV_CODIGO').AsString + ''' AND');
                qItens.SQL.Add('  CNC_CODIGO = ''' + qPedidos.FieldByName('CNC_CODIGO').AsString + '''');
                qItens.Open;
                qItens.First;
                while not qItens.Eof do
                begin
                  with Item_de_Estoque1 do
                  Begin
                    Close;
                    ParamByName('CNC_CODIGO').asInteger:=qItens.FieldByName('CNC_CODIGO').AsInteger;
                    ParamByName('PRD_CODIGO').asInteger:=qItens.FieldByName('PRD_CODIGO').AsInteger;
                    Open;
                  end;

                  if not DM.Mov_Est_Fiscal1.Inserir(qItens.FieldByName('CNC_CODIGO').AsInteger,
                       qItens.FieldByName('PRD_CODIGO').AsInteger,
                       0(*CdFUN*),0,qItens.FieldByName('CNC_CODIGO').AsInteger,
                       DMFB.qConsultas.FieldByName('COO').AsInteger,361,'S', qItens.FieldByName('IPV_QUANTIDADE').AsFloat,
                       Item_de_Estoque1.SFiscal,
                       Item_de_Estoque1.SAmostraFiscal, 0(*AmostraFiscal*), Item_de_Estoque1.SBonificacaoFiscal, 0(*BonusFiscal*),
                       'MOVIMENTO PAF', StrToDatetime(sData)) then
                    Begin
                      ShowMessage('Falha ao gerar Mov. Estoque Fiscal Local!');
                      raise exception.Create('');
                    end;

                  ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                          'IES_SFISCAL=IES_SFISCAL-'+VirgPonto(qItens.FieldByName('IPV_QUANTIDADE').AsFloat)+
                          ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                          ' WHERE PRD_CODIGO='+IntToStr(qItens.FieldByName('PRD_CODIGO').AsInteger)+
                          ' AND CNC_CODIGO='+IntToStr(qItens.FieldByName('CNC_CODIGO').AsInteger));

                  qItens.Next;
                end;
              end;

              qPedidos.Next;
            end;

            If DM.Configuracao1.ControleTransacao then
              Commit;

            if bManual then
            begin
              qPedidos.Close;
              qPedidos.Open;
              Application.MessageBox('Atualização realizada com sucesso!','PAF',mb_Ok);
            end;

            result := true;
          except
            result := false;
            If DM.Configuracao1.ControleTransacao then
            begin
              if trans then
              Begin
                RollBack;
                ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
              end;
            end;
          end;
        end;
      end
      else
        result := false;
    finally
      DMFB.PAF_Desconectar;
      FreeAndNil(frmListaPedidoPAF);
    end;
  end;
end;

procedure TfrmListaPedidoPAF.SQL(bPendenteDia: boolean);
begin
  qPedidos.Close;
  qPedidos.SQL.Clear;
  qPedidos.SQL.Add('SELECT');
  qPedidos.SQL.Add('  PDV.CNC_CODIGO,');
  qPedidos.SQL.Add('	PDV.PDV_CODIGO,');
  qPedidos.SQL.Add('	PDV.PDV_DATA_HORA,');
  qPedidos.SQL.Add('	PDV.PDV_TOTAL,');
  qPedidos.SQL.Add('  PDV.PDV_COO,');
  qPedidos.SQL.Add('  CLI.CLI_CODIGO,');
  qPedidos.SQL.Add('	CLI.CLI_RZ_SOCIAL');
  qPedidos.SQL.Add('FROM');
  qPedidos.SQL.Add('	PEDIDO_DE_VENDA PDV');
  qPedidos.SQL.Add('INNER JOIN CLIENTE CLI ON');
  qPedidos.SQL.Add('	CLI.CNC_CODIGO = PDV.CNC_CLIENTE AND');
  qPedidos.SQL.Add('	CLI.CLI_CODIGO = PDV.CLI_CODIGO');
  qPedidos.SQL.Add('WHERE PDV.PDV_PAF = ''S'' AND');
  qPedidos.SQL.Add('  PDV.PDV_SITUACAO = ''4'' AND');
//  if bPendenteDia then
//    qPedidos.SQL.Add('  PDV.PDV_DATA_HORA >= ''' + MesDia(DM.Configuracao1.Data) + ''' AND');
  qPedidos.SQL.Add('  (PDV.PDV_COO = NULL OR PDV.PDV_COO <= 0)');
  qPedidos.SQL.Add('ORDER BY');
  qPedidos.SQL.Add('  PDV.CNC_CODIGO,');
  qPedidos.SQL.Add('  PDV.PDV_DATA_HORA,');
  qPedidos.SQL.Add('	PDV.PDV_CODIGO,');
  qPedidos.SQL.Add('	CLI.CLI_RZ_SOCIAL');
  qPedidos.Open;
end;

procedure TfrmListaPedidoPAF.FormShow(Sender: TObject);
begin
  SQL(true);
end;

end.

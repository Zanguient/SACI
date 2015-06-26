unit UPreferencia_Cliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Operacao_do_Sistema, Modulo, Submodulo, Produto;

type
  Trpt_PreferenciaCliente = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRDBText2: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRGroup1: TSZRGroup;
    ZRLabel11: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlCliente: TSZRLabel;
    Query1: TQuery;
    ZRLabel5: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel13: TSZRLabel;
    SZRLabel1: TSZRLabel;
    Cliente1: TCliente;
    Produto1: TProduto;
    SZRLabel5: TSZRLabel;
    ZRLabel6: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrlClienteBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRLabel1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_PreferenciaCliente: Trpt_PreferenciaCliente;
  entidade:TQuery;

implementation
Uses
  UDM, Funcoes;

{$R *.DFM}

procedure Trpt_PreferenciaCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  query1.Close;
end;

procedure Trpt_PreferenciaCliente.zrlClienteBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with cliente1 do
  begin
     close;
     sql.Text:='SELECT * FROM CLIENTE '+
       ' WHERE CNC_CODIGO='+Query1.FieldByName('CNC_CLIENTE').AsString+
       ' AND CLI_CODIGO='+Query1.FieldByName('CLI_CODIGO').AsString;
     Open;
     zrlCliente.Caption := RazaoSocial + ' ('+PreencheZero(2,CodigoCNC)+'-'+IntToStr(CodigoCLI)+')';
  end;
end;

procedure Trpt_PreferenciaCliente.SZRLabel1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if VerificaInteiroBranco(QUERY1.FIELDBYNAME('PRD_CODIGO').AsString) then
  Begin
    with produto1 do
    begin
      if (CodigoPRD <> QUERY1.FIELDBYNAME('PRD_CODIGO').AsInteger) then
      Begin
        close;
        sql.Text:='SELECT * FROM PRODUTO '+
          ' WHERE PRD_CODIGO='+QUERY1.FIELDBYNAME('PRD_CODIGO').AsString;
        Open;
      end;
      SZRLabel1.Caption := Trim(Descricao)+' '+Trim(Referencia)+' '+Trim(Marca);
    end;
  end
  else
    SZRLabel1.Caption := '';
end;

procedure Trpt_PreferenciaCliente.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_PreferenciaCliente.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.

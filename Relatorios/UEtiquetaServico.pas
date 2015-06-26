unit UEtiquetaServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Grupo;

type
  Trpt_EtiquetaServico = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrlDocumento: TSZRLabel;
    zrlNomeCliente: TSZRLabel;
    zrlCaixa: TSZRLabel;
    SZRLabel1: TSZRLabel;
    zrlDataPrevisao: TSZRLabel;
    zrlServicos: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlCodigoPDV: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_EtiquetaServico: Trpt_EtiquetaServico;

implementation
uses
  UDM;

{$R *.DFM}

procedure Trpt_EtiquetaServico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

end.

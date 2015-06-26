unit Urpt_TestarImpressora;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, Log, SQuery, Permissao;

type
  Trpt_TestarImpressora = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrlFinal: TSZRLabel;
    Permissao1: TPermissao;
    zrlInicio: TSZRLabel;
    zrlEsquerda: TSZRLabel;
    zrlDireita: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
  end;

var
  rpt_TestarImpressora: Trpt_TestarImpressora;

implementation

uses UDM, Funcoes;

{$R *.DFM}

procedure Trpt_TestarImpressora.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

end.

unit UEtiquetaUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls;

type
  Trpt_EtiquetaUsuario = class(TForm)
    report: TQuickRep;
    QRBand1: TQRBand;
    zrlCodigoBarras: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_EtiquetaUsuario: Trpt_EtiquetaUsuario;

implementation
                  
{$R *.dfm}

end.

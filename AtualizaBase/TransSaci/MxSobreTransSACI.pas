unit MxSobreTransSACI;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TfMxSobreTransSACI = class(TForm)
    OKButton: TButton;
    Panel1: TPanel;
    Version: TLabel;
    Copyright: TLabel;
    Bevel1: TBevel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSobreTransSACI: TfMxSobreTransSACI;

implementation

{$R *.DFM}     

procedure TfMxSobreTransSACI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
 

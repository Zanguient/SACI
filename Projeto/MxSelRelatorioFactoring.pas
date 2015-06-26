unit MxSelRelatorioFactoring;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Mask, SQuery, DateUtils,
  Forma_de_Pagamento, Pedido_de_Venda, Titulo_receber;

type
  TfMxSelRelatorioFactoring = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    bitConfirmar: TBitBtn;
    bitCancelar: TBitBtn;
    rdgGrafico: TRadioButton;
    rdgNormal: TRadioButton;
    procedure bitConfirmarClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    CdCNC, CdFCT: integer;
  end;

var
  fMxSelRelatorioFactoring: TfMxSelRelatorioFactoring;

implementation

uses UDM, funcoes, UFactoring, UFactoringGrafico;

{$R *.DFM}

procedure TfMxSelRelatorioFactoring.bitConfirmarClick(Sender: TObject);
begin
  if rdgGrafico.Checked then
  Begin
    Application.CreateForm(Trpt_factoringGrafico, rpt_factoringGrafico);
    with rpt_factoringGrafico do
    Begin
      Entidade.Close;
      Entidade.SQL.Text := 'SELECT * '+
        ' FROM FACTORING F1, ITEM_DE_FACTORING I1 '+
        ' WHERE F1.FCT_CODIGO='+IntToStr(self.CdFCT)+
        ' AND F1.CNC_CODIGO='+IntToStr(self.CdCNC)+
        ' AND F1.CNC_CODIGO=I1.CNC_CODIGO '+
        ' AND F1.FCT_CODIGO=I1.FCT_CODIGO '+
        ' ORDER BY F1.FCT_CODIGO, I1.IFC_CODIGO ';
      Entidade.Open;
      Report.Preview;
    end;
  end
  else
  Begin
    Application.CreateForm(Trpt_factoring, rpt_factoring);
    with rpt_factoring do
    Begin
      zrlLinhaFinal.Enabled := False;
      Entidade.Close;
      Entidade.SQL.Text := 'SELECT * '+
        ' FROM FACTORING F1, ITEM_DE_FACTORING I1 '+
        ' WHERE F1.FCT_CODIGO='+IntToStr(self.CdFCT)+
        ' AND F1.CNC_CODIGO='+IntToStr(self.CdCNC)+
        ' AND F1.CNC_CODIGO=I1.CNC_CODIGO '+
        ' AND F1.FCT_CODIGO=I1.FCT_CODIGO '+
        ' ORDER BY F1.FCT_CODIGO, I1.IFC_CODIGO ';
      Entidade.Open;
      Report.Preview;
    end;
  end;
  Close;
end;

procedure TfMxSelRelatorioFactoring.bitCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelRelatorioFactoring.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TfMxSelRelatorioFactoring.FormCreate(Sender: TObject);
begin
  CdCNC := 0;
  CdFCT := 0;
end;

procedure TfMxSelRelatorioFactoring.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.

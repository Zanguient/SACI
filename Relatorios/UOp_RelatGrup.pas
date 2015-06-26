unit UOp_RelatGrup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Db, DBTables, SQuery, Fornecedor,
  DBCtrls, Grupo, funcoes;

type
  TOp_RelatGrup = class(TForm)
    Panel1: TPanel;
    DBLookupComboBox1: TDBLookupComboBox;
    DSGrupo: TDataSource;
    Grupo1: TGrupo;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Op_RelatGrup: TOp_RelatGrup;

implementation

uses UProdGrupo, UDM;

{$R *.DFM}


procedure TOp_RelatGrup.RadioButton1Click(Sender: TObject);
begin
     DBLookupComboBox1.Color:=AlteraCorComponentes;
     DBLookupComboBox1.Enabled:=False;
end;

procedure TOp_RelatGrup.RadioButton2Click(Sender: TObject);
begin
     DBLookupComboBox1.Color:=clWindow;
     DBLookupComboBox1.Enabled:=True;
end;

procedure TOp_RelatGrup.BitBtn1Click(Sender: TObject);
var
    Cod : Integer;
begin
    Application.CreateForm(Trpt_prodgrupo,rpt_prodgrupo);
    rpt_prodgrupo.Produto1.Close;
    Cod := 0;
    if RadioButton2.Checked=True then
       Cod := Grupo1.FieldByName('GRP_CODIGO').AsInteger;
    if Cod=0 then
        ShowMessage('Código do Grupo Vazio!');

    if RadioButton2.Checked=True then
       begin
//         Cod := MEdit1.Text;
         rpt_prodgrupo.Produto1.SQL.Text:='SELECT * FROM Produto, Grupo, Item_de_Estoque WHERE (Produto.GRP_CODIGO = Grupo.GRP_CODIGO) AND'+
                                       ' (Produto.PRD_CODIGO = Item_de_Estoque.PRD_CODIGO) AND (Produto.GRP_CODIGO = '+IntToStr(Cod)+') AND'+
                                       ' (Produto.CNC_CODIGO=:CODIGO) ORDER BY Grupo.GRP_DESCRICAO, Produto.PRD_DESCRICAO';

         try
            rpt_prodgrupo.Produto1.Open;
            rpt_prodgrupo.report.Preview;
         except
            ShowMessage('Não existem registros!');
         end;
       end;

    if  RadioButton1.Checked=True then
      begin
       try
          rpt_prodgrupo.Produto1.Open;
          rpt_prodgrupo.report.Preview;
       except
          ShowMessage('Não existem registros!');
       end;
      end;
end;

procedure TOp_RelatGrup.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure TOp_RelatGrup.FormCreate(Sender: TObject);
begin
Grupo1.Active:=True;
end;

procedure TOp_RelatGrup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Grupo1.Active:=False;
end;

procedure TOp_RelatGrup.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.

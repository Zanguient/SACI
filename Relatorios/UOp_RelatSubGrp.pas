unit UOp_RelatSubGrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Db, DBTables, SQuery, Fornecedor, funcoes,
  DBCtrls, Grupo, SubGrupo;

type
  TOp_RelatSubGrp = class(TForm)
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Panel1: TPanel;
    DBLookupComboBox1: TDBLookupComboBox;
    DSSubGrupo: TDataSource;
    SubGrupo1: TSubGrupo;
    DBLookupComboBox2: TDBLookupComboBox;
    Grupo1: TGrupo;
    DSGrupo1: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Grupo1AfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Op_RelatSubGrp: TOp_RelatSubGrp;

implementation

uses UProdSubGrup, UDM;

{$R *.DFM}


procedure TOp_RelatSubGrp.RadioButton1Click(Sender: TObject);
begin
     DBLookupComboBox1.Color:=AlteraCorComponentes;
     DBLookupComboBox1.Enabled:=False;
     DBLookupComboBox2.Color:=AlteraCorComponentes;
     DBLookupComboBox2.Enabled:=False;
end;

procedure TOp_RelatSubGrp.RadioButton2Click(Sender: TObject);
begin
     DBLookupComboBox1.Color:=clWindow;
     DBLookupComboBox1.Enabled:=True;
     DBLookupComboBox2.Color:=clWindow;
     DBLookupComboBox2.Enabled:=True;
end;

procedure TOp_RelatSubGrp.BitBtn1Click(Sender: TObject);
var
    Cod : Integer;
begin
    Application.CreateForm(Trpt_prodsubgrup,rpt_prodsubgrup);
    rpt_prodsubgrup.Produto1.Close;
    Cod := 0;
    if RadioButton2.Checked=True then
       Cod := SubGrupo1.FieldByName('SGP_CODIGO').AsInteger;
       if Cod=0 then
        ShowMessage('Código do SubGrupo Vazio!');

    if RadioButton2.Checked=True then
       begin
//         Cod := MEdit1.Text;
         rpt_prodsubgrup.Produto1.SQL.Text:='SELECT * FROM Produto, SubGrupo, Item_de_Estoque WHERE (Produto.SGP_CODIGO = SubGrupo.SGP_CODIGO) AND'+
                                          ' (Produto.PRD_CODIGO = Item_de_Estoque.PRD_CODIGO) AND (Produto.SGP_CODIGO = '+IntToStr(Cod)+') AND'+
                                          ' (Produto.CNC_CODIGO=:CODIGO) ORDER BY SubGrupo.SGP_DESCRICAO, Produto.PRD_DESCRICAO';
         try
            rpt_prodsubgrup.Produto1.Open;
            rpt_prodsubgrup.report.Preview;
         except
            ShowMessage('Não existem registros!');
         end;
       end;

    if  RadioButton1.Checked=True then
      begin
       try
          rpt_prodsubgrup.Produto1.Open;
          rpt_prodsubgrup.report.Preview;
       except
          ShowMessage('Não existem registros!');
       end;
      end;
end;

procedure TOp_RelatSubGrp.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TOp_RelatSubGrp.FormCreate(Sender: TObject);
begin
  Grupo1.Active:=True;
  SubGrupo1.Active:=True;
end;

procedure TOp_RelatSubGrp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;


procedure TOp_RelatSubGrp.Grupo1AfterScroll(DataSet: TDataSet);
begin
  SubGrupo1.Close;
  SubGrupo1.ParamByName('GRP_CODIGO').AsInteger:=Grupo1.CodigoGRP;
  SubGrupo1.Open;
end;

procedure TOp_RelatSubGrp.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.

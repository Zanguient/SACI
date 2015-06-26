unit UOp_Relator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Db, DBTables, SQuery, Fornecedor, funcoes, 
  DBCtrls;

type
  TOp_Relator = class(TForm)
    Panel1: TPanel;
    DBLookupComboBox1: TDBLookupComboBox;
    Fornecedor1: TFornecedor;
    DSFornecedor: TDataSource;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioButton2: TRadioButton;
    RadioButton1: TRadioButton;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Op_Relator: TOp_Relator;

implementation

uses UProdForn, UDM;

{$R *.DFM}


procedure TOp_Relator.RadioButton1Click(Sender: TObject);
begin
//     DBLookupComboBox1.Text:=' ';
     DBLookupComboBox1.Color:=AlteraCorComponentes;
     DBLookupComboBox1.Enabled:=False;
end;

procedure TOp_Relator.RadioButton2Click(Sender: TObject);
begin
     DBLookupComboBox1.Color:=clWindow;
     DBLookupComboBox1.Enabled:=True;
end;

procedure TOp_Relator.BitBtn1Click(Sender: TObject);
var
    Cod : Integer;
begin
    Application.CreateForm(Trpt_prodforn,rpt_prodforn);
    rpt_prodforn.Produto1.Close;
    Cod := 0;
    if RadioButton2.Checked=True then
       Cod := Fornecedor1.FieldByName('FOR_CODIGO').AsInteger;
    if Cod=0 then
       ShowMessage('Código do Fornecedor Vazio!');

    if RadioButton2.Checked=True then
       begin
//         Cod := MEdit1.Text;
         rpt_prodforn.Produto1.SQL.Text:='SELECT Produto.*,Fornecedor.FOR_NOME_FAN,Fornecedor.FOR_RZ_SOCIAL '+
                                       'FROM Produto,Fornecedor WHERE '+
	                               '(Produto.FOR_CODIGO = Fornecedor.FOR_CODIGO) AND '+
                                       '(Produto.CNC_CODIGO=:CNC_CODIGO) and (Fornecedor.CNC_CODIGO=:CNC_CODIGO) '+
                                       'and Produto.FOR_CODIGO='+IntToStr(Fornecedor1.CodigoFor)+
                                       ' ORDER BY Fornecedor.FOR_RZ_SOCIAL, Produto.PRD_DESCRICAO';
         try
            rpt_prodforn.Produto1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
            rpt_prodforn.Produto1.Open;
            rpt_prodforn.report.Preview;
         except
         end;
       end;

    if  RadioButton1.Checked=True then
      begin
       try
          rpt_prodforn.Produto1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
          rpt_prodforn.Produto1.Open;
          rpt_prodforn.report.Preview;
       except
       end;
      end;
end;

procedure TOp_Relator.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure TOp_Relator.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Fornecedor1.Active:=False;
end;

procedure TOp_Relator.FormCreate(Sender: TObject);
begin
Fornecedor1.Active:=True;
end;

procedure TOp_Relator.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);  
end;

end.

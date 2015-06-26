unit MxSInventFuncion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  Produto;

type
  TfMxSInvFunc = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Entidade:TProduto;
    { Public declarations }
  end;

var
  fMxSInvFunc: TfMxSInvFunc;

implementation

uses
  UDM, MxPedido, MxCotacao, MxIntencao, MxPedCompra, MxTransferencia,
  MxAbastecimento, MxSConfPed;

{$R *.DFM}

procedure TfMxSInvFunc.BitBtn1Click(Sender: TObject);
begin
  If fMxSPedProd.tag=0 then
  Begin
    fMxPedido.Edit9.text:=IntToStr(Entidade.CodigoPRD);
    fMxPedido.Edit10.text:=Entidade.Descricao;
    fMxPedido.Edit11.text:=Entidade.Unidade;
    fMxPedido.Edit12.text:=Entidade.Referencia;
    fMxPedido.Edit13.text:=Entidade.Marca;
  End;
  If fMxSPedProd.tag=1 then
  Begin
    fMxCotacao.Edit9.text:=IntToStr(Entidade.CodigoPRD);
    fMxCotacao.Edit11.text:=Entidade.Descricao;
    fMxCotacao.Edit12.text:=Entidade.Unidade;
    fMxCotacao.Edit13.text:=Entidade.Referencia;
    fMxCotacao.Edit14.text:=Entidade.Marca;
  End;
  If fMxSPedProd.tag=2 then
  Begin
    fMxIntenc.Edit9.text:=IntToStr(Entidade.CodigoPRD);
    fMxIntenc.Edit10.text:=Entidade.Descricao;
    fMxIntenc.Edit11.text:=Entidade.Unidade;
    fMxIntenc.Edit12.text:=Entidade.Referencia;
    fMxIntenc.Edit13.text:=Entidade.Marca;
  End;
  If fMxSPedProd.tag=3 then
  Begin
    fMxPedComp.Edit9.text:=IntToStr(Entidade.CodigoPRD);
    fMxPedComp.Edit10.text:=Entidade.Descricao;
    fMxPedComp.Edit11.text:=Entidade.Unidade;
    fMxPedComp.Edit12.text:=Entidade.Referencia;
    fMxPedComp.Edit13.text:=Entidade.Marca;
  End;
  If fMxSPedProd.tag=4 then
  Begin
    fMxTransfer.Edit9.text:=IntToStr(Entidade.CodigoPRD);
    fMxTransfer.Edit10.text:=Entidade.Descricao;
    fMxTransfer.Edit11.text:=Entidade.Unidade;
    fMxTransfer.Edit12.text:=Entidade.Referencia;
    fMxTransfer.Edit13.text:=Entidade.Marca;
  End;
  If fMxSPedProd.tag=5 then
  Begin
    fMxAbastec.Edit9.text:=IntToStr(Entidade.CodigoPRD);
    fMxAbastec.Edit10.text:=Entidade.Descricao;
    fMxAbastec.Edit11.text:=Entidade.Unidade;
    fMxAbastec.Edit12.text:=Entidade.Referencia;
    fMxAbastec.Edit13.text:=Entidade.Marca;
  End;
  If fMxSPedProd.tag=6 then
  Begin
    fMxSConfPed.Edit9.text:=IntToStr(Entidade.CodigoPRD);
    fMxSConfPed.Edit10.text:=Entidade.Descricao;
    fMxSConfPed.Edit11.text:=Entidade.Unidade;
    fMxSConfPed.Edit12.text:=Entidade.Referencia;
    fMxSConfPed.Edit13.text:=Entidade.Marca;
  End;

  Entidade.Active:=False;
  fMxSPedProd.Close;
end;

procedure TfMxSInvFunc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Action:=Cafree;
end;

procedure TfMxSInvFunc.BitBtn2Click(Sender: TObject);
begin
  fMxSPedProd.Close;
end;

procedure TfMxSInvFunc.FormCreate(Sender: TObject);
begin
  Entidade:=Produto1;
  Entidade.Active:=True;
end;

end.

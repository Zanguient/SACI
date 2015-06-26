unit URelDataCobranca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, MxRetCobrador, ComCtrls, funcoes, Db,
  DBTables, SQuery, CentroCusto, DBCtrls, Menus;

type
  Trpt_DataProd = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label2: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    Label3: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Fsico1Click(Sender: TObject);
    procedure Comercial1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
//    DataOk: Boolean;
  end;

var
  rpt_DataProd: Trpt_DataProd;
  CNC:string;

implementation

uses UDM, UPrinc2, uMovEstoque, MxSPediProd, uMovEstoqueFisico,
  uMovEstoqueComercial;

{$R *.DFM}


procedure Trpt_DataProd.BitBtn1Click(Sender: TObject);
 var
  mensagem,PRD :string;
  CNC:Integer;
begin
  mensagem:='';
  PRD:='';
  if not VerificaInteiro(Edit1.text) then
     Mensagem:=mensagem+'Código do produto inválido!'+#13;
  if not VerificaData(MaskEdit1.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(MaskEdit2.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
  if not VerificaDataBranco(MaskEdit1.Text)then
    MaskEdit1.Text:='01/01/1900';
  if not VerificaDataBranco(MaskEdit2.Text)then
    MaskEdit2.Text:= FormatDateTime('dd/mm/yyyy',DM.Configuracao1.Data);
  if mensagem<>'' then
    raise exception.Create(mensagem);
  if ((rpt_DataProd.Tag=2) or (rpt_DataProd.Tag=4)) and (StrToDate(MaskEdit1.Text)<DM.Configuracao1.Data) Then
    raise exception.Create('Data Inicial não pode ser menor que a data atual!');
  if StrToDateTime(MaskEdit2.Text) < StrToDateTime(MaskEdit1.Text) then
    raise exception.Create('Data final não pode ser menor que data inicial!');
  if DBLookupComboBox1.KeyValue = NULL then
    CNC:=DM.Configuracao1.CodigoCNC
  else
    CNC:=DBLookupComboBox1.KeyValue;
  if Edit1.Text <> '' then
    PRD:=' AND (T2.PRD_CODIGO='+Edit1.Text+')';
  Dt_ini := MaskEdit1.Text;
  Dt_fim := MaskEdit2.Text;
  If rpt_DataProd.Tag=1 then
  begin
    Application.CreateForm(Trpt_MovEstoque, rpt_MovEstoque);
    rpt_MovEstoque.SZRLabel5.Caption := Dt_ini;
    rpt_MovEstoque.SZRLabel7.Caption := Dt_fim;
    rpt_MovEstoque.Produto1.Close;
    rpt_MovEstoque.Produto1.SQL.Clear;
    rpt_MovEstoque.Produto1.SQL.ADD('SELECT T1.PRD_DESCRICAO,T1.PRD_UNIDADE,T1.PRD_MARCA,'+
       'T1.PRD_REFERENCIA,T1.PRD_CODIGO,T2.* '+
       'FROM Produto T1,Movimento_de_Estoque_Fiscal T2 '+
       'WHERE (T1.PRD_CODIGO = T2.PRD_CODIGO) AND (T2.CNC_CODIGO=:CNC_CODIGO)'+PRD+
       ' AND(T2.MES_DATA_HORA>=:DATA_INI) AND '+
       '(T2.MES_DATA_HORA<:DATA_FIM) '+
       'ORDER BY T2.PRD_CODIGO,T2.MES_DATA_HORA,T2.MES_ES ASC');
    rpt_MovEstoque.Produto1.ParamByName('DATA_INI').AsDate := STrToDate(Dt_ini);
    rpt_MovEstoque.Produto1.ParamByName('DATA_FIM').AsDate := STrToDate(Dt_fim)+1;
    rpt_MovEstoque.Produto1.ParamByName('CNC_CODIGO').AsInteger := CNC;
    rpt_MovEstoque.Produto1.Open;
    rpt_MovEstoque.report.Preview;
    rpt_MovEstoque.Close;
  end;
 Close;
end;

procedure Trpt_DataProd.BitBtn2Click(Sender: TObject);
begin
 Close;
end;

procedure Trpt_DataProd.FormShow(Sender: TObject);
begin
  if (DM.CentroCusto1.CentroDeCusto=0) or (DM.Configuracao1.SqlInterbase=1) then
  Begin
    DBLookupComboBox1.Enabled := True;
    DBLookupComboBox1.color   :=clWindow;
  end;
  CentroCusto1.Open;
  Edit1.SetFocus;
end;

procedure Trpt_DataProd.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(8);
    Application.CreateForm(TfMxSPedProd, fMxSPedProd);
    fMxSPedProd.Tag:=18;
    fMxSPedProd.ShowModal;
    Edit1.SetFocus;
  End;
end;

procedure Trpt_DataProd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CentroCusto1.Close;
  Action:=caFree;
end;

procedure Trpt_DataProd.Fsico1Click(Sender: TObject);
 var
  mensagem,PRD :string;
  CNC:Integer;
begin
  mensagem:='';
  PRD:='';
  if not VerificaInteiro(Edit1.text) then
     Mensagem:=mensagem+'Código do produto inválido!'+#13;
  if not VerificaData(MaskEdit1.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(MaskEdit2.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
  if not VerificaDataBranco(MaskEdit1.Text)then
    MaskEdit1.Text:='01/01/1900';
  if not VerificaDataBranco(MaskEdit2.Text)then
    MaskEdit2.Text:= FormatDateTime('dd/mm/yyyy',DM.Configuracao1.Data);
  if mensagem<>'' then
    raise exception.Create(mensagem);
  if ((rpt_DataProd.Tag=2) or (rpt_DataProd.Tag=4)) and (StrToDate(MaskEdit1.Text)<DM.Configuracao1.Data) Then
    raise exception.Create('Data Inicial não pode ser menor que a data atual!');
  if StrToDateTime(MaskEdit2.Text) < StrToDateTime(MaskEdit1.Text) then
    raise exception.Create('Data final não pode ser menor que data inicial!');
  if DBLookupComboBox1.KeyValue = NULL then
    CNC:=DM.Configuracao1.CodigoCNC
  else
    CNC:=DBLookupComboBox1.KeyValue;
  if Edit1.Text <> '' then
    PRD:=' AND (T2.PRD_CODIGO='+Edit1.Text+')';
  Dt_ini := MaskEdit1.Text;
  Dt_fim := MaskEdit2.Text;
  If rpt_DataProd.Tag=1 then
  begin
    Application.CreateForm(Trpt_MovEstoqueFisico, rpt_MovEstoqueFisico);
    rpt_MovEstoqueFisico.SZRLabel5.Caption := Dt_ini;
    rpt_MovEstoqueFisico.SZRLabel7.Caption := Dt_fim;
    rpt_MovEstoqueFisico.Produto1.Close;
    rpt_MovEstoqueFisico.Produto1.SQL.Clear;
    rpt_MovEstoqueFisico.Produto1.SQL.ADD('SELECT T1.PRD_DESCRICAO,T1.PRD_UNIDADE,T1.PRD_MARCA,'+
       'T1.PRD_REFERENCIA,T1.PRD_CODIGO,T2.* '+
       'FROM Produto T1,Movimento_de_Estoque_Fisico T2 '+
       'WHERE (T1.PRD_CODIGO = T2.PRD_CODIGO) AND (T2.CNC_CODIGO=:CNC_CODIGO)'+PRD+
       ' AND(T2.MEF_DATA>=:DATA_INI) AND '+
       '(T2.MEF_DATA<:DATA_FIM) '+
       'ORDER BY T2.PRD_CODIGO,T2.MEF_DATA,T2.MEF_ES ASC');
    rpt_MovEstoqueFisico.Produto1.ParamByName('DATA_INI').AsDate := STrToDate(Dt_ini);
    rpt_MovEstoqueFisico.Produto1.ParamByName('DATA_FIM').AsDate := STrToDate(Dt_fim)+1;
    rpt_MovEstoqueFisico.Produto1.ParamByName('CNC_CODIGO').AsInteger := CNC;
    rpt_MovEstoqueFisico.Produto1.Open;
    rpt_MovEstoqueFisico.report.Preview;
    rpt_MovEstoqueFisico.Close;
  end;
 Close;
end;

procedure Trpt_DataProd.Comercial1Click(Sender: TObject);
 var
  mensagem,PRD :string;
  CNC:Integer;
begin
  mensagem:='';
  PRD:='';
  if not VerificaInteiro(Edit1.text) then
     Mensagem:=mensagem+'Código do produto inválido!'+#13;
  if not VerificaData(MaskEdit1.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(MaskEdit2.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
  if not VerificaDataBranco(MaskEdit1.Text)then
    MaskEdit1.Text:='01/01/1900';
  if not VerificaDataBranco(MaskEdit2.Text)then
    MaskEdit2.Text:= FormatDateTime('dd/mm/yyyy',DM.Configuracao1.Data);
  if mensagem<>'' then
    raise exception.Create(mensagem);
  if ((rpt_DataProd.Tag=2) or (rpt_DataProd.Tag=4)) and (StrToDate(MaskEdit1.Text)<DM.Configuracao1.Data) Then
    raise exception.Create('Data Inicial não pode ser menor que a data atual!');
  if StrToDateTime(MaskEdit2.Text) < StrToDateTime(MaskEdit1.Text) then
    raise exception.Create('Data final não pode ser menor que data inicial!');
  if DBLookupComboBox1.KeyValue = NULL then
    CNC:=DM.Configuracao1.CodigoCNC
  else
    CNC:=DBLookupComboBox1.KeyValue;
  if Edit1.Text <> '' then
    PRD:=' AND (T2.PRD_CODIGO='+Edit1.Text+')';
  Dt_ini := MaskEdit1.Text;
  Dt_fim := MaskEdit2.Text;
  If rpt_DataProd.Tag=1 then
  begin
    Application.CreateForm(Trpt_MovEstoqueComercial, rpt_MovEstoqueComercial);
    rpt_MovEstoqueComercial.SZRLabel5.Caption := Dt_ini;
    rpt_MovEstoqueComercial.SZRLabel7.Caption := Dt_fim;
    rpt_MovEstoqueComercial.Produto1.Close;
    rpt_MovEstoqueComercial.Produto1.SQL.Clear;
    rpt_MovEstoqueComercial.Produto1.SQL.ADD('SELECT T1.PRD_DESCRICAO,T1.PRD_UNIDADE,T1.PRD_MARCA,'+
       'T1.PRD_REFERENCIA,T1.PRD_CODIGO,T2.* '+
       'FROM Produto T1,Movimento_de_Estoque_Comercial T2 '+
       'WHERE (T1.PRD_CODIGO = T2.PRD_CODIGO) AND (T2.CNC_CODIGO=:CNC_CODIGO)'+PRD+
       ' AND(T2.MEC_DATA_HORA>=:DATA_INI) AND '+
       '(T2.MEC_DATA_HORA<:DATA_FIM) '+
       'ORDER BY T2.PRD_CODIGO,T2.MEC_DATA_HORA,T2.MEC_ES ASC');
    rpt_MovEstoqueComercial.Produto1.ParamByName('DATA_INI').AsDate := STrToDate(Dt_ini);
    rpt_MovEstoqueComercial.Produto1.ParamByName('DATA_FIM').AsDate := STrToDate(Dt_fim)+1;
    rpt_MovEstoqueComercial.Produto1.ParamByName('CNC_CODIGO').AsInteger := CNC;
    rpt_MovEstoqueComercial.Produto1.Open;
    rpt_MovEstoqueComercial.report.Preview;
    rpt_MovEstoqueComercial.Close;
  end;
 Close;
end;

end.

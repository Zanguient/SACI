unit MxLocalizaTroca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  Pedido_de_Venda, Cliente, Titulo_receber, Menus;

type
  TfMxLocalizaTroca = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DSPedido_de_Venda1: TDataSource;
    Pedido_de_Venda1: TPedido_de_Venda;
    DBGrid1: TDBGrid;
    Pedido_de_Venda1PDV_CODIGO: TIntegerField;
    Pedido_de_Venda1CNC_CODIGO: TIntegerField;
    Pedido_de_Venda1CLI_CODIGO: TIntegerField;
    Pedido_de_Venda1USU_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_DATA_HORA: TDateTimeField;
    Pedido_de_Venda1PDV_TOTAL: TFloatField;
    Pedido_de_Venda1PDV_LISTADO: TIntegerField;
    Pedido_de_Venda1PDV_SITUACAO: TIntegerField;
    Pedido_de_Venda1PDV_OBS: TStringField;
    Pedido_de_Venda1PDV_DIAS_RESERV: TIntegerField;
    Pedido_de_Venda1PDV_NOTA_FISCAL: TSmallintField;
    Pedido_de_Venda1AGF_CODIGO: TIntegerField;
    Pedido_de_Venda1FPG_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_TIPO_PAG: TIntegerField;
    Pedido_de_Venda1PDV_ENTRADA: TFloatField;
    Pedido_de_Venda1CNC_CLIENTE: TIntegerField;
    Pedido_de_Venda1PDV_EM_USO: TIntegerField;
    Pedido_de_Venda1CLI_RZ_SOCIAL: TStringField;
    Pedido_de_Venda1Total: TStringField;
    Titulo_receber1: TTitulo_receber;
    Titulo_receber1TOTALPEDIDO: TFloatField;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Panel2: TPanel;
    SB_Loc: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    Edit11: TEdit;
    ComboBox2: TComboBox;
    CheckBox3: TCheckBox;
    MainMenu1: TMainMenu;
    PedidodeVenda1: TMenuItem;
    Localizar1: TMenuItem;
    N1: TMenuItem;
    Confirmar1: TMenuItem;
    Fechar1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Pedido_de_Venda1CalcFields(DataSet: TDataSet);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxLocalizaTroca: TfMxLocalizaTroca;

implementation
uses UDM, Funcoes, MxPedidoRapido, MxNotaFiscal, MxPedidoLBM;

{$R *.DFM}

procedure TfMxLocalizaTroca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Pedido_de_Venda1.Active:=False;
  Titulo_receber1.Active:=False;
  Action:=Cafree;
end;

procedure TfMxLocalizaTroca.BitBtn2Click(Sender: TObject);
begin
  If Tag=2 then
    fMxPedidoRapido.CancelarLoc:=True
  Else if tag=4 then
    fMxNotaFiscal.CancelarLoc:=True
  Else If Tag=5 then
    fMxPedidoLBM.CancelarLoc:=True;
  Close;
end;

procedure TfMxLocalizaTroca.BitBtn1Click(Sender: TObject);
begin
  If not Pedido_de_Venda1.IsEmpty Then
  Begin
    If tag=2 then
      fMxPedidoRapido.Edit1.text:=Pedido_de_Venda1.FieldByName('PDV_CODIGO').AsString
    Else If tag=4 then
    Begin
      fMxNotaFiscal.Edit4.text := IntToStr(Pedido_de_Venda1.CodigoPDV);
      if (fMxNotaFiscal.DBLookupComboBox2.KeyValue = 362) and (CheckBox3.Checked) then
        fMxNotaFiscal.Edit22.text := Pedido_de_Venda1.FieldByName('TRO_CODIGO').asString
      else
        fMxNotaFiscal.Edit22.Clear;
    end
    Else If tag=5 then
      fMxPedidoLBM.Edit1.text:=Pedido_de_Venda1.FieldByName('PDV_CODIGO').AsString;

    Close;
  End
  Else
    ShowMessage('Escolha um pedido antes de continuar!');
end;

procedure TfMxLocalizaTroca.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(fMxSPedLoc);
  Pedido_de_Venda1.Close;

// Pedido Rápido
  If Tag IN [2,3,5] then
    Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
        'WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
        'T1.PDV_SITUACAO < 4 AND '+
        'T2.CLI_CODIGO=T1.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
        'AND T1.PDV_EM_USO=0 AND (T1.PDV_DIAS_RESERV = 0 OR T1.PDV_DIAS_RESERV IS NULL)'+
        'ORDER BY T1.PDV_CODIGO '

// Nota Fiscal
  Else If Tag = 4 then
  Begin
    CheckBox1.Visible := False;
    CheckBox2.Visible := False;
    Titulo_receber1.Close;
    Titulo_receber1.SQL.Text:='SELECT SUM(TRC_VALOR) as TotalPedido '+
      'FROM TITULO_A_RECEBER WHERE CNC_CODIGO=:CNC_CODIGO AND PDV_CODIGO=:PDV_CODIGO ';
    if fMxNotaFiscal.DBLookupComboBox2.KeyValue = 361 then //VENDA
      Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
          ' T1.PDV_SITUACAO = 4 AND '+
          ' T1.CLI_CODIGO=T2.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
          ' AND (T1.PDV_NOTA_FISCAL=0 OR T1.PDV_NOTA_FISCAL IS NULL) '+
          ' AND T1.PDV_EM_USO=0 '+
          ' ORDER BY T2.CLI_RZ_SOCIAL '
    else if fMxNotaFiscal.DBLookupComboBox2.KeyValue = 362 then //DEVOLUÇÃO
    Begin
      Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
          ' T1.PDV_EM_USO=0 AND T1.CLI_CODIGO=T2.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
          ' AND (T1.PDV_NOTA_FISCAL>0) AND T1.PDV_SITUACAO = 8 '+
          ' ORDER BY T2.CLI_RZ_SOCIAL ';
      CheckBox3.Visible := True;
    end
    else if fMxNotaFiscal.DBLookupComboBox2.KeyValue = 364 then //SIMPLES REMESSA
      Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
          ' T1.PDV_SITUACAO = 4 AND T1.PDV_EM_USO=0 AND '+
          ' T1.CLI_CODIGO=T2.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
          ' AND (T1.PDV_NOTA_FISCAL>0) '+
          ' ORDER BY T2.CLI_RZ_SOCIAL '
    else if fMxNotaFiscal.DBLookupComboBox2.KeyValue = 363 then //Correção de Dados
      Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
          ' T1.PDV_SITUACAO = 4 AND T1.PDV_EM_USO=0 AND '+
          ' T1.CLI_CODIGO=T2.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
          ' AND (T1.PDV_NOTA_FISCAL>0) '+
          ' ORDER BY T2.CLI_RZ_SOCIAL '
    else
      Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
          ' T1.PDV_SITUACAO = 4 AND T1.PDV_EM_USO=0 AND '+
          ' T1.CLI_CODIGO=T2.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
          ' AND (T1.PDV_NOTA_FISCAL>0) '+
          ' ORDER BY T2.CLI_RZ_SOCIAL ';
  end;
  Pedido_de_Venda1.Open;
  ComboBox2.ItemIndex := 0;
  Edit11.SetFocus;
end;

procedure TfMxLocalizaTroca.Pedido_de_Venda1CalcFields(DataSet: TDataSet);
begin
  Titulo_receber1.Active:=False;
  Titulo_receber1.ParamByName('CNC_CODIGO').asInteger:=Pedido_de_Venda1.CodigoCNC;
  Titulo_receber1.ParamByName('PDV_CODIGO').asInteger:=Pedido_de_Venda1.CodigoPDV;
  Titulo_receber1.Active:=True;
  Pedido_de_Venda1.FieldByName('Total').asString:=format('%.2f',[Titulo_receber1.FieldByName('TotalPedido').asFloat]);
end;

procedure TfMxLocalizaTroca.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  Begin
    CheckBox2.Checked := False;
    Pedido_de_Venda1.Close;
  // Pedido Rápido
    If Tag IN [2,3,5] then
      Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          'WHERE T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
          'T1.PDV_SITUACAO  < 4 AND '+
          'T2.CLI_CODIGO=T1.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
          'AND T1.PDV_EM_USO=0 AND T1.PDV_DIAS_RESERV > 0 '+
          'AND T1.PDV_DATA_HORA+T1.PDV_DIAS_RESERV<"'+MesDia(DM.Configuracao1.Data)+'" '+
          'ORDER BY T1.PDV_CODIGO ';
    Pedido_de_Venda1.Open;
  end
  else
  Begin
    Pedido_de_Venda1.Close;
    // Pedido Rápido
    If Tag IN [2,3,5] then
    Begin
      Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          'WHERE T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
          'T1.PDV_SITUACAO < 4 AND '+
          'T2.CLI_CODIGO=T1.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
          'AND T1.PDV_EM_USO=0 AND (T1.PDV_DIAS_RESERV = 0 OR T1.PDV_DIAS_RESERV IS NULL)'+
          'ORDER BY T1.PDV_CODIGO ';
    end
    Else If Tag = 4 then
    Begin
      CheckBox1.Visible := False;
      CheckBox2.Visible := False;
      Titulo_receber1.Close;
      Titulo_receber1.SQL.Text:='SELECT SUM(TRC_VALOR) as TotalPedido '+
        'FROM TITULO_A_RECEBER WHERE CNC_CODIGO=:CNC_CODIGO AND PDV_CODIGO=:PDV_CODIGO ';
      if fMxNotaFiscal.DBLookupComboBox2.KeyValue = 361 then //VENDA
        Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
            ' T1.PDV_SITUACAO = 4 AND '+
            ' T1.CLI_CODIGO=T2.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND (T1.PDV_NOTA_FISCAL=0 OR T1.PDV_NOTA_FISCAL IS NULL) '+
            ' AND T1.PDV_EM_USO=0 '+
            ' ORDER BY T2.CLI_RZ_SOCIAL '
      else if fMxNotaFiscal.DBLookupComboBox2.KeyValue = 362 then //DEVOLUÇÃO
        Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
            ' T1.PDV_EM_USO=0 AND T1.CLI_CODIGO=T2.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND (T1.PDV_NOTA_FISCAL>0) AND T1.PDV_SITUACAO = 8 '+
            ' ORDER BY T2.CLI_RZ_SOCIAL '
      else if fMxNotaFiscal.DBLookupComboBox2.KeyValue = 364 then //SIMPLES REMESSA
        Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
            ' T1.PDV_SITUACAO = 4 AND T1.PDV_EM_USO=0 AND '+
            ' T1.CLI_CODIGO=T2.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND (T1.PDV_NOTA_FISCAL>0) '+
            ' ORDER BY T2.CLI_RZ_SOCIAL '
      else if fMxNotaFiscal.DBLookupComboBox2.KeyValue = 363 then //Correção de Dados
        Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
            ' T1.PDV_SITUACAO = 4 AND T1.PDV_EM_USO=0 AND '+
            ' T1.CLI_CODIGO=T2.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND (T1.PDV_NOTA_FISCAL>0) '+
            ' ORDER BY T2.CLI_RZ_SOCIAL '
      else
        Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
            ' T1.PDV_SITUACAO = 4 AND T1.PDV_EM_USO=0 AND '+
            ' T1.CLI_CODIGO=T2.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND (T1.PDV_NOTA_FISCAL>0) '+
            ' ORDER BY T2.CLI_RZ_SOCIAL ';
      Pedido_de_Venda1.Open;
    end;
  end;
  Edit11.SetFocus;
end;

procedure TfMxLocalizaTroca.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
  Begin
    CheckBox1.Checked := False;
    Pedido_de_Venda1.Close;
  // Pedido Rápido
    If Tag IN [2,3,5] then
      Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          'WHERE T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
          'T1.PDV_SITUACAO < 4 AND '+
          'T2.CLI_CODIGO=T1.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
          'AND T1.PDV_EM_USO=0 AND T1.PDV_DIAS_RESERV > 0 '+
          'ORDER BY T1.PDV_CODIGO ';
    Pedido_de_Venda1.Open;
  end
  else
  Begin
    Pedido_de_Venda1.Close;
    // Pedido Rápido
    If Tag IN [2,3,5] then
    Begin
      Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          'WHERE T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
          'T1.PDV_SITUACAO < 4 AND '+
          'T2.CLI_CODIGO=T1.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
          'AND T1.PDV_EM_USO=0 AND (T1.PDV_DIAS_RESERV = 0 OR T1.PDV_DIAS_RESERV IS NULL)'+
          'ORDER BY T1.PDV_CODIGO ';
    end
    Else If Tag = 4 then
    Begin
      CheckBox1.Visible := False;
      CheckBox2.Visible := False;
      Titulo_receber1.Close;
      Titulo_receber1.SQL.Text:='SELECT SUM(TRC_VALOR) as TotalPedido '+
        'FROM TITULO_A_RECEBER WHERE CNC_CODIGO=:CNC_CODIGO AND PDV_CODIGO=:PDV_CODIGO ';
      if fMxNotaFiscal.DBLookupComboBox2.KeyValue = 361 then //VENDA
        Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
            ' T1.PDV_SITUACAO = 4 AND '+
            ' T1.CLI_CODIGO=T2.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND (T1.PDV_NOTA_FISCAL=0 OR T1.PDV_NOTA_FISCAL IS NULL) '+
            ' AND T1.PDV_EM_USO=0 '+
            ' ORDER BY T2.CLI_RZ_SOCIAL '
      else if fMxNotaFiscal.DBLookupComboBox2.KeyValue = 362 then //DEVOLUÇÃO
        Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
            ' T1.PDV_EM_USO=0 AND T1.CLI_CODIGO=T2.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND (T1.PDV_NOTA_FISCAL>0) AND T1.PDV_SITUACAO = 8 '+
            ' ORDER BY T2.CLI_RZ_SOCIAL '
      else if fMxNotaFiscal.DBLookupComboBox2.KeyValue = 364 then //SIMPLES REMESSA
        Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
            ' T1.PDV_SITUACAO = 4 AND T1.PDV_EM_USO=0 AND '+
            ' T1.CLI_CODIGO=T2.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND (T1.PDV_NOTA_FISCAL>0) '+
            ' ORDER BY T2.CLI_RZ_SOCIAL '
      else if fMxNotaFiscal.DBLookupComboBox2.KeyValue = 363 then //Correção de Dados
        Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
            ' T1.PDV_SITUACAO = 4 AND T1.PDV_EM_USO=0 AND '+
            ' T1.CLI_CODIGO=T2.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND (T1.PDV_NOTA_FISCAL>0) '+
            ' ORDER BY T2.CLI_RZ_SOCIAL '
      else
        Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
            ' T1.PDV_SITUACAO = 4 AND T1.PDV_EM_USO=0 AND '+
            ' T1.CLI_CODIGO=T2.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND (T1.PDV_NOTA_FISCAL>0) '+
            ' ORDER BY T2.CLI_RZ_SOCIAL ';
      Pedido_de_Venda1.Open;
    end;
  end;
  Edit11.SetFocus;
end;

procedure TfMxLocalizaTroca.SB_LocClick(Sender: TObject);
begin
  Pedido_de_Venda1.Localizar;
end;

procedure TfMxLocalizaTroca.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked then
  Begin
    Pedido_de_Venda1.Close;
    Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,'+
      ' CLIENTE T2,TROCA T3 '+
      ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
      ' T1.PDV_SITUACAO = 4 AND T1.PDV_CODIGO=T3.PDV_CODIGO AND '+
      ' T1.CNC_CODIGO=T3.CNC_CODIGO AND T1.CLI_CODIGO=T2.CLI_CODIGO AND '+
      ' T2.CNC_CODIGO=T1.CNC_CLIENTE AND T1.PDV_NOTA_FISCAL > 0 AND '+
      ' T3.TRO_SITUACAO = 1 '+
      ' ORDER BY T3.TRO_DATA DESC ';
    Pedido_de_Venda1.Open;
    Edit11.SetFocus;
  end
  else
  Begin
    Pedido_de_Venda1.Close;
    // Pedido Rápido
    If Tag IN [2,3,5] then
    Begin
      Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          'WHERE T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
          'T1.PDV_SITUACAO < 4 AND '+
          'T2.CLI_CODIGO=T1.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
          'AND T1.PDV_EM_USO=0 AND (T1.PDV_DIAS_RESERV = 0 OR T1.PDV_DIAS_RESERV IS NULL)'+
          'ORDER BY T1.PDV_CODIGO ';
    end
    Else If Tag = 4 then
    Begin
      CheckBox1.Visible := False;
      CheckBox2.Visible := False;
      Titulo_receber1.Close;
      Titulo_receber1.SQL.Text:='SELECT SUM(TRC_VALOR) as TotalPedido '+
        'FROM TITULO_A_RECEBER WHERE CNC_CODIGO=:CNC_CODIGO AND PDV_CODIGO=:PDV_CODIGO ';
      if fMxNotaFiscal.DBLookupComboBox2.KeyValue = 361 then //VENDA
        Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
            ' T1.PDV_SITUACAO = 4 AND '+
            ' T1.CLI_CODIGO=T2.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND (T1.PDV_NOTA_FISCAL=0 OR T1.PDV_NOTA_FISCAL IS NULL) '+
            ' AND T1.PDV_EM_USO=0 '+
            ' ORDER BY T2.CLI_RZ_SOCIAL '
      else if fMxNotaFiscal.DBLookupComboBox2.KeyValue = 362 then //DEVOLUÇÃO
        Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
            ' T1.PDV_EM_USO=0 AND T1.CLI_CODIGO=T2.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND (T1.PDV_NOTA_FISCAL>0) AND T1.PDV_SITUACAO = 8 '+
            ' ORDER BY T2.CLI_RZ_SOCIAL '
      else if fMxNotaFiscal.DBLookupComboBox2.KeyValue = 364 then //SIMPLES REMESSA
        Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
            ' T1.PDV_SITUACAO = 4 AND T1.PDV_EM_USO=0 AND '+
            ' T1.CLI_CODIGO=T2.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND (T1.PDV_NOTA_FISCAL>0) '+
            ' ORDER BY T2.CLI_RZ_SOCIAL '
      else if fMxNotaFiscal.DBLookupComboBox2.KeyValue = 363 then //Correção de Dados
        Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
            ' T1.PDV_SITUACAO = 4 AND T1.PDV_EM_USO=0 AND '+
            ' T1.CLI_CODIGO=T2.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND (T1.PDV_NOTA_FISCAL>0) '+
            ' ORDER BY T2.CLI_RZ_SOCIAL '
      else
        Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+' AND '+
            ' T1.PDV_SITUACAO = 4 AND T1.PDV_EM_USO=0 AND '+
            ' T1.CLI_CODIGO=T2.CLI_CODIGO AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND (T1.PDV_NOTA_FISCAL>0) '+
            ' ORDER BY T2.CLI_RZ_SOCIAL ';
      Pedido_de_Venda1.Open;
    end;
  end;
  Edit11.SetFocus;
end;

end.

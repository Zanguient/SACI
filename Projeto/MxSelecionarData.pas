unit MxSelecionarData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TfMxSelecionarData = class(TForm)
    Panel2: TPanel;
    bitFechar: TBitBtn;
    bitOK: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    ckbSintetico: TCheckBox;
    ckbTodos: TCheckBox;
    procedure bitOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelecionarData: TfMxSelecionarData;

implementation

uses UFluxoCaixaDia, UDM, Funcoes, MxSPediLocImpPromis, MxSPediLocLibPed,
  UFluxoCaixaDiaLBM;

{$R *.DFM}


procedure TfMxSelecionarData.bitOKClick(Sender: TObject);
var
  sFiltros: string;
begin
  sFiltros := '';
  if tag = 2 then // Liberar Pedido
  Begin
    Application.CreateForm(TfMxSPedLocLibPed, fMxSPedLocLibPed);
    fMxSPedLocLibPed.Pedido_de_Venda1.Close;
    if ckbTodos.Checked then
      if DM.Configuracao1.Empresa <> empLBM then
        fMxSPedLocLibPed.Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL,T2.CLI_CGC_CPF '+
          ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          ' WHERE T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND T1.PDV_EM_USO=1 '+
          ' AND T1.CNC_CLIENTE*=T2.CNC_CODIGO '+
          ' AND T1.CLI_CODIGO*=T2.CLI_CODIGO '+
          ' AND T1.PDV_SERVICO=0 '+
          ' ORDER BY T1.PDV_DATA_HORA DESC '
      else
        fMxSPedLocLibPed.Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL,T2.CLI_CGC_CPF '+
          ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          ' WHERE T1.PDV_EM_USO=1 '+
          ' AND T1.CNC_CLIENTE*=T2.CNC_CODIGO AND T1.CLI_CODIGO*=T2.CLI_CODIGO '+
          ' AND T1.PDV_SERVICO=0 '+
          ' ORDER BY T1.PDV_DATA_HORA DESC '
    else
    Begin
      if DM.Configuracao1.Empresa = empLBM then
        fMxSPedLocLibPed.Pedido_de_Venda1.SQL.Text := ' SELECT T1.*,T2.CLI_RZ_SOCIAL '+
          ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          ' WHERE T1.PDV_EM_USO=1 '+
          ' AND T2.CNC_CODIGO=*T1.CNC_CLIENTE '+
          ' AND T2.CLI_CODIGO=*T1.CLI_CODIGO '+
          ' AND T1.PDV_DT_ALTERADO>=:DATAINI AND T1.PDV_DT_ALTERADO<:DATAFIM '+
          ' AND T1.PDV_SERVICO=0 '+
          ' ORDER BY T1.PDV_DATA_HORA DESC '
      else
        fMxSPedLocLibPed.Pedido_de_Venda1.SQL.Text := ' SELECT T1.*,T2.CLI_RZ_SOCIAL '+
          ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          ' WHERE T1.PDV_EM_USO=1 '+
          ' AND T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND T2.CNC_CODIGO=*T1.CNC_CLIENTE '+
          ' AND T2.CLI_CODIGO=*T1.CLI_CODIGO '+
          ' AND T1.PDV_DT_ALTERADO>=:DATAINI AND T1.PDV_DT_ALTERADO<:DATAFIM '+
          ' AND T1.PDV_SERVICO=0 '+
          ' ORDER BY T1.PDV_DATA_HORA DESC ';
      try
        fMxSPedLocLibPed.Pedido_de_Venda1.ParamByName('CNC_CODIGO').AsInteger:=DM.Configuracao1.CodigoCNC;
      except
      end;
      fMxSPedLocLibPed.Pedido_de_Venda1.ParamByName('DATAINI').AsDate:=DateTimePicker1.Date;
      fMxSPedLocLibPed.Pedido_de_Venda1.ParamByName('DATAFIM').AsDate:=DateTimePicker1.Date+1;
    end;
    fMxSPedLocLibPed.ShowModal;
  end
  else if tag = 3 then // Liberar Serviço
  Begin
    Application.CreateForm(TfMxSPedLocLibPed, fMxSPedLocLibPed);
    fMxSPedLocLibPed.Pedido_de_Venda1.Close;
    if ckbTodos.Checked then
      if DM.Configuracao1.Empresa <> empLBM then
        fMxSPedLocLibPed.Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL,T2.CLI_CGC_CPF '+
          ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          ' WHERE T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND T1.PDV_EM_USO=1 '+
          ' AND T1.CNC_CLIENTE*=T2.CNC_CODIGO '+
          ' AND T1.CLI_CODIGO*=T2.CLI_CODIGO '+
          ' AND T1.PDV_SERVICO=1 '+
          ' ORDER BY T1.PDV_DATA_HORA DESC '
      else
        fMxSPedLocLibPed.Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL,T2.CLI_CGC_CPF '+
          ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          ' WHERE T1.PDV_EM_USO=1 '+
          ' AND T1.CNC_CLIENTE*=T2.CNC_CODIGO AND T1.CLI_CODIGO*=T2.CLI_CODIGO '+
          ' AND T1.PDV_SERVICO=1 '+
          ' ORDER BY T1.PDV_DATA_HORA DESC '
    else
    Begin
      if DM.Configuracao1.Empresa = empLBM then
        fMxSPedLocLibPed.Pedido_de_Venda1.SQL.Text := ' SELECT T1.*,T2.CLI_RZ_SOCIAL '+
          ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          ' WHERE T1.PDV_EM_USO=1 '+
          ' AND T2.CNC_CODIGO=*T1.CNC_CLIENTE '+
          ' AND T2.CLI_CODIGO=*T1.CLI_CODIGO '+
          ' AND T1.PDV_DATA_HORA>=:DATAINI AND T1.PDV_DATA_HORA<:DATAFIM '+
          ' AND T1.PDV_SERVICO=1 '+
          ' ORDER BY T1.PDV_DATA_HORA DESC '
      else
        fMxSPedLocLibPed.Pedido_de_Venda1.SQL.Text := ' SELECT T1.*,T2.CLI_RZ_SOCIAL '+
          ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          ' WHERE T1.PDV_EM_USO=1 '+
          ' AND T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND T2.CNC_CODIGO=*T1.CNC_CLIENTE '+
          ' AND T2.CLI_CODIGO=*T1.CLI_CODIGO '+
          ' AND T1.PDV_DATA_HORA>=:DATAINI AND T1.PDV_DATA_HORA<:DATAFIM '+
          ' AND T1.PDV_SERVICO=1 '+
          ' ORDER BY T1.PDV_DATA_HORA DESC ';
      try
        fMxSPedLocLibPed.Pedido_de_Venda1.ParamByName('CNC_CODIGO').AsInteger:=DM.Configuracao1.CodigoCNC;
      except
      end;
      fMxSPedLocLibPed.Pedido_de_Venda1.ParamByName('DATAINI').AsDate:=DateTimePicker1.Date;
      fMxSPedLocLibPed.Pedido_de_Venda1.ParamByName('DATAFIM').AsDate:=DateTimePicker1.Date+1;
    end;
    fMxSPedLocLibPed.ShowModal;
  end
  else if tag = 4 then // Liberar Pacote
  Begin
    Application.CreateForm(TfMxSPedLocLibPed, fMxSPedLocLibPed);
    fMxSPedLocLibPed.Tag := 2;
    fMxSPedLocLibPed.Pedido_de_Venda1.Close;
    if ckbTodos.Checked then
      fMxSPedLocLibPed.Pedido_de_Venda1.SQL.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL,T2.CLI_CGC_CPF '+
        ' FROM PACOTE_DE_VENDA T1,CLIENTE T2 '+
        ' WHERE T1.PCT_EM_USO=1 '+
        ' AND T1.CNC_CLIENTE*=T2.CNC_CODIGO '+
        ' AND T1.CLI_CODIGO*=T2.CLI_CODIGO '+
        ' ORDER BY T1.PCT_DT_CADASTRO DESC '
    else
    Begin
      fMxSPedLocLibPed.Pedido_de_Venda1.SQL.Text := ' SELECT T1.*,T2.CLI_RZ_SOCIAL '+
        ' FROM PACOTE_DE_VENDA T1,CLIENTE T2 '+
        ' WHERE T1.PCT_EM_USO=1 '+
        ' AND T2.CNC_CODIGO=*T1.CNC_CLIENTE '+
        ' AND T2.CLI_CODIGO=*T1.CLI_CODIGO '+
        ' AND T1.PCT_DT_CADASTRO>=:DATAINI '+
        ' AND T1.PCT_DT_CADASTRO<:DATAFIM '+
        ' ORDER BY T1.PCT_DT_CADASTRO DESC ';
      try
        fMxSPedLocLibPed.Pedido_de_Venda1.ParamByName('CNC_CODIGO').AsInteger:=DM.Configuracao1.CodigoCNC;
      except
      end;
      fMxSPedLocLibPed.Pedido_de_Venda1.ParamByName('DATAINI').AsDate:=DateTimePicker1.Date;
      fMxSPedLocLibPed.Pedido_de_Venda1.ParamByName('DATAFIM').AsDate:=DateTimePicker1.Date+1;
    end;
    fMxSPedLocLibPed.ShowModal;
  end;
  Close;
end;

procedure TfMxSelecionarData.FormCreate(Sender: TObject);
begin
  DateTimePicker1.Date := DM.Configuracao1.Data;
end;

procedure TfMxSelecionarData.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if tag in [2,3,4] then
    ckbTodos.Checked := True;
end;

end.

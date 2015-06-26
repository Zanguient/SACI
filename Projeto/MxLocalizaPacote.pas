unit MxLocalizaPacote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  Cliente, Titulo_receber, Menus, Pacote_de_venda;

type
  TfMxLocalizaPacote = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    bitConfirmar: TBitBtn;
    BitBtn2: TBitBtn;
    DSPacote_de_venda1: TDataSource;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    SB_Loc: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    Edit11: TEdit;
    ComboBox2: TComboBox;
    MainMenu1: TMainMenu;
    PedidodeVenda1: TMenuItem;
    Localizar1: TMenuItem;
    N1: TMenuItem;
    Confirmar1: TMenuItem;
    Fechar1: TMenuItem;
    Cliente1: TCliente;
    ckbMaquina: TCheckBox;
    edtMaquina: TEdit;
    Pacote_de_venda1: TPacote_de_venda;
    Pacote_de_venda1CNC_CODIGO: TIntegerField;
    Pacote_de_venda1PDV_CODIGO: TIntegerField;
    Pacote_de_venda1USU_CODIGO: TIntegerField;
    Pacote_de_venda1PCT_DT_CADASTRO: TDateTimeField;
    Pacote_de_venda1PCT_DT_ALTERADO: TDateTimeField;
    Pacote_de_venda1PCT_DT_MELHOR_DATA: TDateTimeField;
    Pacote_de_venda1PCT_DT_EMISSAO_VENDA: TDateTimeField;
    Pacote_de_venda1CNC_CLIENTE: TIntegerField;
    Pacote_de_venda1CLI_CODIGO: TIntegerField;
    Pacote_de_venda1FUN_CODIGO: TIntegerField;
    Pacote_de_venda1PCT_ENTRADA: TFloatField;
    Pacote_de_venda1PCT_ACRESCIMO: TFloatField;
    Pacote_de_venda1PCT_TOTAL: TFloatField;
    Pacote_de_venda1PCT_NOTA_FISCAL: TIntegerField;
    Pacote_de_venda1PCT_NOTA_CUPOM: TIntegerField;
    Pacote_de_venda1AGF_CODIGO: TIntegerField;
    Pacote_de_venda1FPG_CODIGO: TIntegerField;
    Pacote_de_venda1PCT_TIPO_PAG: TIntegerField;
    Pacote_de_venda1PCT_MAQUINA: TIntegerField;
    Pacote_de_venda1PCT_EM_USO: TIntegerField;
    Pacote_de_venda1PCT_VENCIMENTOS: TStringField;
    Pacote_de_venda1PCT_SITUACAO: TIntegerField;
    Pacote_de_venda1PCT_OBSERVACAO: TStringField;
    Pacote_de_venda1Cliente: TStringField;
    Pacote_de_venda1Total: TStringField;
    Pacote_de_venda1Nota: TStringField;
    Pacote_de_venda1Fone: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure bitConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure edtMaquinaExit(Sender: TObject);
    procedure ckbMaquinaClick(Sender: TObject);
    procedure Pacote_de_venda1CalcFields(DataSet: TDataSet);
    procedure Pacote_de_venda1BeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    FiltroMaquina:string;
  public
    Entidade: TPacote_de_venda;
    iCodigoCLICNC, iCodigoCLI: integer;
  end;

var
  fMxLocalizaPacote: TfMxLocalizaPacote;

implementation
uses UDM, Funcoes, MxPacoteVenda, MxFinalizaPedido, UPacotesCliente,
  MxNotaFiscal;

{$R *.DFM}

procedure TfMxLocalizaPacote.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfMxLocalizaPacote.BitBtn2Click(Sender: TObject);
begin
  If Tag=0 then //Pacote de Venda
    fMxPacoteVenda.CancelarLoc:=True
//  else If Tag=1 then //Finaliza Pedido Motical
//    fMxFinalizaPedido.CancelarLoc:=True
  else If Tag=2 then //Nota Fiscal
    fMxNotaFiscal.CancelarLoc:=True;
  Close;
end;

procedure TfMxLocalizaPacote.bitConfirmarClick(Sender: TObject);
begin
  If not Entidade.IsEmpty Then
  Begin
    If tag=0 then //Pacote de Venda
    Begin
      fMxPacoteVenda.edtCodigoPDV.text:=Entidade.FieldByName('PDV_CODIGO').AsString;
      fMxPacoteVenda.CancelarLoc:=False;
    end
    else If tag=1 then //Finaliza Pedido MotCal
    Begin
      fMxFinalizaPedido.edtCodigoPDV.text:=Entidade.FieldByName('PDV_CODIGO').AsString;
    end
    else If tag=2 then //Nota
    Begin
      fMxNotaFiscal.edtCodigoPDV.text:=Entidade.FieldByName('PDV_CODIGO').AsString;
      fMxNotaFiscal.CancelarLoc:=False;
    end;
    Close;
  End
  else
    ShowMessage('Escolha um pacote antes de continuar!');
end;

procedure TfMxLocalizaPacote.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Entidade := Pacote_de_venda1;
  FiltroMaquina := '';

  Entidade.Close;
  if self.TAG = 2 THEN
    Entidade.SQL.Text:='SELECT * FROM PACOTE_DE_VENDA '+
        ' WHERE PCT_SITUACAO = 4 '+
        ' AND CLI_CODIGO<>'+IntToStr(DM.Configuracao1.CodigoCliAVista)+
        ' AND (PCT_NOTA_FISCAL=0 OR PCT_NOTA_FISCAL IS NULL) '+
        ' AND PCT_EM_USO=0 AND PCT_DT_ALTERADO>="'+MesDia(DM.Configuracao1.Data)+'" '+
        ' ORDER BY PDV_CODIGO DESC ';
  Entidade.Open;
  ComboBox2.ItemIndex := 0;
  Edit11.SetFocus;
end;

procedure TfMxLocalizaPacote.SB_LocClick(Sender: TObject);
begin
  if edtMaquina.Focused then
    edtMaquinaExit(sender);
  if (Length(Edit11.Text) = 10) and (Edit11.Text[3] = '/') and (Edit11.Text[6] = '/')  and
     (ComboBox2.ItemIndex < 3) then
    ComboBox2.ItemIndex := 3;
  Entidade.Selecionar;
end;

procedure TfMxLocalizaPacote.edtMaquinaExit(Sender: TObject);
begin
  if not VerificaInteiroBranco(edtMaquina.Text) then
    edtMaquina.Text := '0'
  else
    FiltroMaquina := ' AND PDV_MAQUINA=:PDV_MAQUINA ';
  Entidade.Close;
  Entidade.Open;
end;

procedure TfMxLocalizaPacote.ckbMaquinaClick(Sender: TObject);
begin
  edtMaquina.Enabled := ckbMaquina.Checked;
  if ckbMaquina.Checked then
    edtMaquina.SetFocus;
end;

procedure TfMxLocalizaPacote.Pacote_de_venda1CalcFields(DataSet: TDataSet);
begin
  with Cliente1 do
  Begin
    if (Entidade.CodigoCNC <> CodigoCNC) or
       (Entidade.CodigoCLI <> CodigoCLI) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger:=Entidade.ClienteCNC;
      ParamByName('CLI_CODIGO').asInteger:=Entidade.CodigoCLI;
      Open;
    end;
    Entidade.FieldByName('Cliente').asString:=RazaoSocial;
    Entidade.FieldByName('Fone').asString:=Fone;
  end;
end;

procedure TfMxLocalizaPacote.Pacote_de_venda1BeforeOpen(DataSet: TDataSet);
begin
  If Tag = 0 then // Pacote de Venda
  Begin
    Entidade.Selecao.Text := ' AND PCT_SITUACAO < 4 '+
      ' AND PCT_EM_USO=0 '+
      ' AND PCT_SITUACAO < 4 '+
      ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+FiltroMaquina;
    entidade.SQL.Text:='SELECT * FROM PACOTE_DE_VENDA '+
        ' WHERE PDV_CODIGO<>-1 '+
        Entidade.Selecao.Text+
        ' ORDER BY PDV_CODIGO DESC ';
  end
  else If Tag = 1 then // Finaliza Pedido Motcal
  Begin
    Entidade.Selecao.Text := ' AND PCT_SITUACAO = 4 '+
      ' AND PCT_EM_USO=0 '+
      ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND CLI_CODIGO='+IntToStr(iCodigoCLI)+
      ' AND CNC_CLIENTE='+IntToStr(iCodigoCLICNC)+
      ' AND PCT_SITUACAO = 4 '+
      FiltroMaquina;
    Entidade.SQL.Text:='SELECT * FROM PACOTE_DE_VENDA '+
        ' WHERE PDV_CODIGO<>-1 '+
        Entidade.Selecao.Text+
        ' ORDER BY PDV_CODIGO DESC ';
  end;
end;

procedure TfMxLocalizaPacote.FormCreate(Sender: TObject);
begin
  iCodigoCLI    := 0;
  iCodigoCLICNC := 0;
end;

procedure TfMxLocalizaPacote.DBGrid1DblClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o Pacote!');

  Application.CreateForm(Trpt_PacotesCliente, rpt_PacotesCliente);
  with rpt_PacotesCliente do
  Begin
    tag := 4;
    zrbCabecalhoFUN1.Expression := '';
    SZRLabel4.Enabled  := False; //Label do PDV
    SZRDBText3.Left    := 0;     //PDV
    SZRLabel8.Enabled  := False; //Label da Data
    zrlData.Left    := 8;     //Data
    zrlData.Width   := 10;    //Data
    zrlTotalPedido.Left   := 19;    //Valor
    zrlTotalPedido.Enabled:= True;
    SZRLabel56.Enabled := True;  //Vendedor
    SZRLabel56.Left    := 29;    //Vendedor
    zrlRazaoSocial.Top     := 0;     //Cliente
    zrlRazaoSocial.Left    := 36;    //Cliente
    zrlRazaoSocial.Width   := 40;    //Cliente
    szrNota.Enabled := False; //Label Nota
    zrlNotaCupom.Left    := 77;    //TipoNota
    zrlNotaFiscal.Left    := 79;    //Nota
    zrlFone.Top     := 0;     //Telefone
    zrlFone.Left    := 88;    //Telefone
    zrlPaiMae.Top     := 0;     //Contato
    zrlPaiMae.Left    := 104;   //Contato
    zrlPaiMae.Width   := 15;    //Contato
    SZRLabel42.Enabled := False; //Label Situação
    zrlSituacao.Left    := 120;   //Situação
    zrlSituacao.Width   := 16;    //Situação
    zrbCabecalhoPedido.Height := 1;

    //Não Exibir Itens
    zrbParcelas.Height := 2;

    Entidade.Close;
    Entidade.SQL.Text:='SELECT P1.*,I1.* '+
      ' FROM PACOTE_DE_VENDA P1, ITEM_DE_PACOTE_DE_VENDA I1 '+
      ' WHERE P1.CNC_CODIGO='+IntToStr(self.Entidade.CodigoCNC)+
      ' AND P1.PDV_CODIGO='+IntToStr(self.Entidade.CodigoPDV)+
      ' AND (P1.CNC_CODIGO*=I1.CNC_CODIGO) '+
      ' AND (P1.PDV_CODIGO*=I1.PDV_CODIGO) '+
      ' ORDER BY IPV_CODIGO ';
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise Exception.Create('Consulta Vazia!');
    SZRLabel5.Caption := '';
    SZRLabel7.Caption := '';
    report.preview;
    Close;
  end;
end;

end.

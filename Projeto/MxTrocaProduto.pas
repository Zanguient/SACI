unit MxTrocaProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Cliente, Db, DBTables, SQuery,
  Pedido_de_Venda, Grids, DBGrids, Menus, ToolWin, ActnMan, ActnCtrls,
  ActnMenus, ActnList, XPStyleActnCtrls;

type
  TfmxTrocaProduto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    bitAvancar: TBitBtn;
    BitBtn2: TBitBtn;
    SB_Loc: TSpeedButton;
    edtLocalizar: TEdit;
    Label19: TLabel;
    cmbCampo: TComboBox;
    Label20: TLabel;
    DBGrid1: TDBGrid;
    Pedido_de_Venda1: TPedido_de_Venda;
    Cliente1: TCliente;
    DSPedido_de_Venda1: TDataSource;
    Pedido_de_Venda1PDV_CODIGO: TIntegerField;
    Pedido_de_Venda1CNC_CODIGO: TIntegerField;
    Pedido_de_Venda1CLI_CODIGO: TIntegerField;
    Pedido_de_Venda1USU_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_DATA_HORA: TDateTimeField;
    Pedido_de_Venda1PDV_SITUACAO: TIntegerField;
    Pedido_de_Venda1CNC_CLIENTE: TIntegerField;
    Pedido_de_Venda1Cliente: TStringField;
    Pedido_de_Venda1PDV_TOTAL: TFloatField;
    Pedido_de_Venda1PDV_NOTA_FISCAL: TSmallintField;
    Pedido_de_Venda1PDV_ACRESCIMO: TFloatField;
    Pedido_de_Venda1PDV_OBS: TStringField;
    Pedido_de_Venda1PDV_LISTADO: TIntegerField;
    Pedido_de_Venda1PDV_DIAS_RESERV: TIntegerField;
    Pedido_de_Venda1AGF_CODIGO: TIntegerField;
    Pedido_de_Venda1FPG_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_TIPO_PAG: TIntegerField;
    Pedido_de_Venda1PDV_ENTRADA: TFloatField;
    Pedido_de_Venda1PDV_EM_USO: TIntegerField;
    Pedido_de_Venda1PDV_DT_ALTERADO: TDateTimeField;
    Pedido_de_Venda1PDV_MAQUINA: TIntegerField;
    Pedido_de_Venda1PDV_MELHOR_DATA: TDateTimeField;
    Pedido_de_Venda1PDV_VENCIMENTOS: TStringField;
    Pedido_de_Venda1PDV_MEDIA_PAGAMENTO: TIntegerField;
    Pedido_de_Venda1PDV_NOTA_CUPOM: TIntegerField;
    Pedido_de_Venda1PDV_IMPRESSO: TIntegerField;
    Pedido_de_Venda1PDV_DT_EMISSAO_VENDA: TDateTimeField;
    Pedido_de_Venda1PDV_DT_DEVOLUCAO: TDateTimeField;
    Pedido_de_Venda1PDV_CONTATO: TStringField;
    Pedido_de_Venda1PDV_CREDITO: TFloatField;
    Pedido_de_Venda1FUN_ARQUITETO: TIntegerField;
    Pedido_de_Venda1PDV_TITULO_GERADO: TIntegerField;
    Pedido_de_Venda1PDV_TIPO_VENDA: TIntegerField;
    Pedido_de_Venda1PDV_PACOTE: TIntegerField;
    Pedido_de_Venda1PDV_GRUPO_ESPECIAL: TIntegerField;
    Pedido_de_Venda1PDV_DT_PREVISAO: TDateTimeField;
    Pedido_de_Venda1PDV_DT_ENTREGA: TDateTimeField;
    Pedido_de_Venda1PDV_DOCUMENTO: TStringField;
    Pedido_de_Venda1PDV_CAIXA: TStringField;
    Pedido_de_Venda1PDV_SERVICO: TIntegerField;
    Pedido_de_Venda1PDV_FONE_CONTATO: TStringField;
    Pedido_de_Venda1FPE_CODIGO: TIntegerField;
    Pedido_de_Venda1CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Pedido_de_Venda1PDV_DT_FPE: TDateTimeField;
    Pedido_de_Venda1CNT_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_GARANTIA: TIntegerField;
    Pedido_de_Venda1PDV_CODIGO_ORIGEM: TIntegerField;
    Pedido_de_Venda1PDV_FRETE: TFloatField;
    rgTipoDevolucao: TRadioGroup;
    ActionManager1: TActionManager;
    Avanar1: TAction;
    Localizar1: TAction;
    Fechar1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure SB_LocClick(Sender: TObject);
    procedure Pedido_de_Venda1CalcFields(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure bitAvancarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmxTrocaProduto: TfmxTrocaProduto;

implementation
Uses UDM,funcoes, MxTrocaProdutoProc, MxDevolucaoPed;
{$R *.DFM}



procedure TfmxTrocaProduto.SB_LocClick(Sender: TObject);
Var
  Campo,Nome,campoloc :String;
  i :Integer;
begin
  if cmbCampo.ItemIndex IN [0,1] then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
    Begin
      ShowMessage('Código inválido');
      exit;
    end;
  If (cmbCampo.Text<>'') and (edtLocalizar.text<>'') Then
  Begin
    campoloc:=trim(cmbCampo.Text);
    for i:= length(campoloc) downto 1 do
      If campoloc[i]=' ' Then
      Begin
        Campo := Copy(campoloc,i+1,length(campoloc)-i);
        Break;
      End;
    Nome:=Trim(edtLocalizar.text);
  End
  else
    Raise Exception.Create('Campo ou valor de localização faltando!');

{
Código Pedido              PDV_CODIGO
Código Cliente             CLI_CODIGO
Razão Social               CLI_RZ_SOCIAL
Dt Cadastro                PDV_DT_CADASTRO
Dt Alterado                PDV_DT_ALTERADO
Dt Entrega                 PDV_DT_ENTREGA
Número Nota/Cupom          PDV_NOTA_FISCAL
Documento                  PDV_DOCUMENTO
Observação                 PDV_OBS
}
// Entidade.Localizar;
  With Pedido_de_Venda1 do
  Begin
    Close;
    //Inteiro no Pedido de Venda
    If (Campo='PDV_CODIGO') or
       (Campo='PDV_PACOTE') or
       (Campo='CLI_CODIGO') then
    Begin
      if not VerificaInteiroBranco(edtLocalizar.Text) then
        Raise exception.Create('Código inválido!');
      SQL.Text:='SELECT DISTINCT T1.*,T2.CLI_RZ_SOCIAL,T2.CNC_CODIGO,T2.CLI_CODIGO '+
                ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
                ' WHERE PDV_SITUACAO IN (4,5) '+
                ' AND T1.'+Campo+'='+edtLocalizar.Text+
                ' AND T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
                ' AND T1.CLI_CODIGO=T2.CLI_CODIGO '+
                ' AND T1.CNC_CLIENTE=T2.CNC_CODIGO '+
                ' ORDER BY T2.CLI_RZ_SOCIAL ASC, T1.PDV_CODIGO DESC ';
    end
    //Campo String no Pedido de Venda
    Else if (Campo='PDV_OBS') or
            (Campo='PDV_DOCUMENTO') or
            (Campo='PDV_NOTA_FISCAL') then
      SQL.Text:='SELECT DISTINCT T1.*,T2.CLI_RZ_SOCIAL,T2.CNC_CODIGO,T2.CLI_CODIGO '+
                ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
                ' WHERE PDV_SITUACAO IN (4,5) '+
                ' AND T1.'+Campo+' LIKE "%'+edtLocalizar.Text+'%"'+
                ' AND T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
                ' AND T1.CNC_CLIENTE=T2.CNC_CODIGO '+
                ' AND T1.CLI_CODIGO=T2.CLI_CODIGO '+
                ' ORDER BY T2.CLI_RZ_SOCIAL, T1.PDV_CODIGO DESC '
    Else if Campo='CLI_RZ_SOCIAL' then
      SQL.Text:='SELECT DISTINCT T1.*,T2.CLI_RZ_SOCIAL,T2.CNC_CODIGO,T2.CLI_CODIGO '+
                ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
                ' WHERE PDV_SITUACAO IN (4,5) '+
                ' AND T2.CLI_RZ_SOCIAL LIKE "%'+edtLocalizar.Text+'%"'+
                ' AND T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
                ' AND T1.CLI_CODIGO=T2.CLI_CODIGO '+
                ' AND T1.CNC_CLIENTE=T2.CNC_CODIGO '+
                ' ORDER BY T2.CLI_RZ_SOCIAL, T1.PDV_CODIGO DESC '
    //Campo Data no Pedido de Venda
    Else if (Campo='PDV_DATA_HORA') or
            (Campo='PDV_DT_ALTERADO') or
            (Campo='PDV_DT_ENTREGA') or
            (Campo='PDV_DT_EMISSAO_VENDA') then
    Begin
      if VerificaDataBranco(edtLocalizar.Text) then
        Raise exception.Create('Data inválida!');
      SQL.Text:='SELECT DISTINCT T1.*,T2.CLI_RZ_SOCIAL,T2.CNC_CODIGO,T2.CLI_CODIGO '+
                ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
                ' WHERE PDV_SITUACAO IN (4,5) '+
                ' AND T1.'+Campo+'>="'+MesDia(edtLocalizar.Text)+'" '+
                ' AND T1.'+Campo+'<"'+MesDia(StrToDate(edtLocalizar.Text)+1)+'" '+
                ' AND T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
                ' AND T1.CLI_CODIGO=T2.CLI_CODIGO '+
                ' AND T1.CNC_CLIENTE=T2.CNC_CODIGO '+
                ' ORDER BY T2.CLI_RZ_SOCIAL, T1.PDV_CODIGO DESC ';
    end
    else
      ShowMessage('Opção não preparada!');
    Open;
  End;


end;

procedure TfmxTrocaProduto.Pedido_de_Venda1CalcFields(DataSet: TDataSet);
begin
  Cliente1.Close;
  Cliente1.ParamByName('CNC_CODIGO').asInteger:=Pedido_de_Venda1.ClienteCNC;
  Cliente1.ParamByName('CLI_CODIGO').asInteger:=Pedido_de_Venda1.CodigoCLI;
  Cliente1.Open;
  Pedido_de_Venda1.FieldByName('Cliente').asString:=cliente1.RazaoSocial;
end;

procedure TfmxTrocaProduto.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfmxTrocaProduto.bitAvancarClick(Sender: TObject);
var
  PDV: Integer;

  procedure DevolveParcial;
  begin
    Application.CreateForm(TfMxTrocaProdutoProc, fMxTrocaProdutoProc);
    with fMxTrocaProdutoProc do
    Begin
      Tag := 0;
      If (self.Pedido_de_Venda1.TipoDeVenda = 1) and //Pendente
         (self.Pedido_de_Venda1.CodigoFPE = 0) then //Ainda não Faturado
      Begin
        rdbGerarCredito.Enabled := False;
        rdbGerarExtorno.Enabled := False;
        rdbIgnorarValor.Checked := True;
      end;
      Pedido_de_Venda1.Close;
      Pedido_de_Venda1.ParamByName('CNC_CODIGO').asInteger := self.Pedido_de_Venda1.CodigoCNC;
      Pedido_de_Venda1.ParamByName('PDV_CODIGO').asInteger := self.Pedido_de_Venda1.CodigoPDV;
      Pedido_de_Venda1.Open;
      Item_Pedido_Venda1.Open;
      Showmodal;
    end;
  end;

begin
  PDV := Pedido_de_Venda1.FieldByName('PDV_CODIGO').AsInteger;
  if Pedido_de_Venda1.IsEmpty then
    Raise Exception.Create('Selecione o Pedido!');
  if Pedido_de_Venda1.Situacao <> 4 then
    Raise Exception.Create('Pedido não está finalizado!');
  if DM.Configuracao1.Empresa = empLBM then
    if Pedido_de_Venda1.NotaFiscal = 0 then
      Raise Exception.Create('Só é permitido efetuar devolução de Venda Faturada!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir vendas neste centro de custo.')
  else if (DM.Configuracao1.Empresa <> empLBM) and
          (Pedido_de_Venda1.CodigoCNC <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Você não pode inserir vendas neste centro de custo.');


  (*
  if f_Sistema = tsCaixa then
  begin
    if rgTipoDevolucao.ItemIndex = 0 then
    begin
      Application.CreateForm(TfMxDevPed, fMxDevPed);
      with fMxDevPed do
      Begin
        Tag := 0;

        fMxDevPed.pShow;
        fMxDevPed.cmbCampo.ItemIndex := 0;
        fMxDevPed.edtLocalizar.Text := Inttostr(PDV);
        fMxDevPed.SB_LocClick(fMxDevPed.SB_Loc);

        fMxDevPed.Bevel1.Width := 705;
        fMxDevPed.SB_Loc.Visible := false;
        fMxDevPed.edtLocalizar.Visible := false;
        fMxDevPed.cmbCampo.Visible := false;
        fMxDevPed.Label20.Visible := false;
        fMxDevPed.Label19.Visible := false;
        fMxDevPed.Caption := 'Devolução Total de Pedido';

        Showmodal;
      end;
    end
    else
      DevolveParcial;
  end
  else*)
    DevolveParcial;
end;

procedure TfmxTrocaProduto.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  cmbCampo.ItemIndex:=0;

  rgTipoDevolucao.Visible := false;
  Caption := 'Localizar Pedido para Devolução Parcial';

  edtLocalizar.SetFocus;
end;

procedure TfmxTrocaProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    DBGrid1.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_DevParcial_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Action:=Cafree;
end;

procedure TfmxTrocaProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close
  else If key=chr(13) then
  Begin
    if not Pedido_de_Venda1.IsEmpty then
    Begin
      bitAvancar.SetFocus;
      bitAvancarClick(sender);
    end;
  end;
end;

procedure TfmxTrocaProduto.FormCreate(Sender: TObject);
begin
  try
    DBGrid1.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_DevParcial_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

end.

unit MxCobrancaAdiciona;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, checklst, Tabela_de_Precos, Db, DBTables, SQuery, Produto,
  DBCtrls, Buttons, Item_Tabela_de_Precos, ExtCtrls, Menus, Titulo_receber,
  Cliente, Mask, Parametro;

type
  TfMxCobrancaAdiciona = class(TForm)
    Panel1: TPanel;
    CheckListBox1: TCheckListBox;
    Panel2: TPanel;
    SB_Salvar: TSpeedButton;
    SB_Cancelar: TSpeedButton;
    Panel3: TPanel;
    Label20: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Confirmar1: TMenuItem;
    SB_Desmarcar: TBitBtn;
    rdbClienteInadiplentes: TRadioButton;
    rdbTitulosAtrasados: TRadioButton;
    Cliente1: TCliente;
    Cliente1CLI_CODIGO: TIntegerField;
    Cliente1CLI_RZ_SOCIAL: TStringField;
    Cliente1CLI_NOME_FAN: TStringField;
    Cliente1CLI_FONE: TStringField;
    Cliente1CNC_CODIGO: TIntegerField;
    Cliente2: TCliente;
    Panel4: TPanel;
    rdbTodosRegistros: TRadioButton;
    rdbCliente: TRadioButton;
    edtCodigoCLI: TEdit;
    rdbVencimento: TRadioButton;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    Label1: TLabel;
    Label5: TLabel;
    SB_Marcar: TBitBtn;
    Titulo_receber2: TTitulo_receber;
    Titulo_receber3: TTitulo_receber;
    Titulo_receber3TRC_CODIGO: TIntegerField;
    Titulo_receber3CNC_CODIGO: TIntegerField;
    Titulo_receber3PDV_CODIGO: TIntegerField;
    Titulo_receber3AGF_CODIGO: TIntegerField;
    Titulo_receber3CCX_CODIGO: TIntegerField;
    Titulo_receber3TRC_NUMERO: TStringField;
    Titulo_receber3TRC_SEQUENCIA: TStringField;
    Titulo_receber3CLI_CODIGO: TIntegerField;
    Titulo_receber3TRC_VENCIMENTO: TDateTimeField;
    Titulo_receber3TRC_VALOR: TFloatField;
    Titulo_receber3TRC_PAGAMENTO: TDateTimeField;
    Titulo_receber3TRC_VALOR_PAGO: TFloatField;
    Titulo_receber3TRC_SITUACAO: TIntegerField;
    Titulo_receber3TRC_CUSTODIA: TStringField;
    Titulo_receber3TRC_TIPO_DOC: TIntegerField;
    Titulo_receber3TRC_CRED_CLI: TFloatField;
    Titulo_receber3TRC_TIPO_PAG: TIntegerField;
    Titulo_receber3CNC_CLIENTE: TIntegerField;
    Titulo_receber3TRC_TITULOANT: TIntegerField;
    Titulo_receber3BOL_CODIGO: TIntegerField;
    Titulo_receber3TRC_TRCORIGINAL: TIntegerField;
    Titulo_receber3TRC_DTORIGINAL: TDateTimeField;
    Titulo_receber3USU_CODIGO: TIntegerField;
    Titulo_receber3TRC_DT_ALTERADO: TDateTimeField;
    Titulo_receber3TRC_RGB_DT_INICIO: TDateTimeField;
    Titulo_receber3TRC_RGB_DT_SITUACAO: TDateTimeField;
    Titulo_receber3CPC_CODIGO: TIntegerField;
    Titulo_receber3TRC_RGB_SITUACAO: TIntegerField;
    Titulo_receber3TRC_RGB_VISITADO: TSmallintField;
    Titulo_receber3TRC_RGB_DT_PROMESSA: TDateTimeField;
    Titulo_receber3Cliente: TStringField;
    Titulo_receber3TRC_OBSERVACAO: TStringField;
    Titulo_receber3TRC_PROCESSO: TIntegerField;
    Titulo_receber3TRC_RGB_DT_VISITADO: TDateTimeField;
    Titulo_receber3CCX_CODIGO_REC: TIntegerField;
    Titulo_receber3TRC_GEROU_MOVIMENTO: TSmallintField;
    Titulo_receber3TRC_NOTA_SERVICO: TIntegerField;
    Titulo_receber3TRC_DT_CADASTRO: TDateTimeField;
    Titulo_receber3TRC_DESCONTO: TFloatField;
    Titulo_receber3TRC_JUROS: TFloatField;
    Titulo_receber3CNC_ORIGEM: TIntegerField;
    Titulo_receber3TRC_PEDIDO_SERVICO: TIntegerField;
    Titulo_receber3TRC_TIPO_PEDIDO: TIntegerField;
    Titulo_receber3TRC_DT_EMISSAO_BOLETO: TDateTimeField;
    Titulo_receber3TRC_DT_RECEBIMENTO_BOLETO: TDateTimeField;
    Titulo_receber3FPE_CODIGO: TIntegerField;
    Titulo_receber3CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Titulo_receber3TRC_DT_COMPETENCIA: TDateTimeField;
    Titulo_receber3TRC_EQUIFAX: TIntegerField;
    Titulo_receber3TRC_DT_EQUIFAX: TDateTimeField;
    Titulo_receber3TRC_AGENCIA_NUMERO: TStringField;
    Titulo_receber3TRC_DT_CHEQUE: TDateTimeField;
    Titulo_receber3TRC_SIT_CHEQUE: TIntegerField;
    Titulo_receber3TRC_REABERTURA: TIntegerField;
    Titulo_receber3TRC_VERIFICADO: TIntegerField;
    Titulo_receber3TRC_DT_VERIFICADO: TDateTimeField;
    Titulo_receber3CHQ_CODIGO: TIntegerField;
    Titulo_receber3CNC_CHEQUE: TIntegerField;
    Titulo_receber3TRC_CHEQUE_DEVOLVIDO: TIntegerField;
    Titulo_receber3TRC_PAGAMENTO_PARCIAL: TIntegerField;
    Titulo_receber3CNC_MOVIMENTO_CONTA_CORRENTE: TIntegerField;
    Titulo_receber3MCC_CODIGO: TIntegerField;
    Titulo_receber3TRC_CV: TStringField;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ckbSomenteAtrasados: TCheckBox;
    edtTotCLI: TEdit;
    edtTotTRC: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    MaskEdit1: TMaskEdit;
    Label12: TLabel;
    Parametro1: TParametro;
    Label13: TLabel;
    rdbExcetoCartao: TRadioButton;
    Titulo_receber3TRC_LOCAL: TStringField;
    Titulo_receber3TRF_CODIGO: TIntegerField;
    rdbFinalizado: TRadioButton;
    Copy_Cliente1: TCliente;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField2: TIntegerField;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    btnExporta: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_CancelarClick(Sender: TObject);
    procedure SB_SalvarClick(Sender: TObject);
    procedure SB_MarcarClick(Sender: TObject);
    procedure SB_DesmarcarClick(Sender: TObject);
    procedure Cliente1BeforeOpen(DataSet: TDataSet);
    procedure rdbClienteInadiplentesClick(Sender: TObject);
    procedure rdbTitulosAtrasadosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rdbTodosRegistrosClick(Sender: TObject);
    procedure rdbVencimentoClick(Sender: TObject);
    procedure edtCodigoCLIExit(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure rdbClienteClick(Sender: TObject);
    procedure Titulo_receber3CalcFields(DataSet: TDataSet);
    procedure Titulo_receber3BeforeOpen(DataSet: TDataSet);
    procedure ckbSomenteAtrasadosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnExportaClick(Sender: TObject);
  private
    { Private declarations }
  public
    FiltroTitulo: String;
    { Public declarations }
  end;

var
  fMxCobrancaAdiciona: TfMxCobrancaAdiciona;

const
  CONST_TAMANHO_CODIGO = 6;

implementation

uses UDM, funcoes, MxCobCobrador, CdCliente, StrUtils, URelData;

{$R *.DFM}

procedure TfMxCobrancaAdiciona.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Cliente1.Close;
  Action := Cafree;
end;

procedure TfMxCobrancaAdiciona.SB_CancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxCobrancaAdiciona.SB_SalvarClick(Sender: TObject);
Var
  i:Integer;
begin
  for i:=0 to CheckListBox1.Items.Count-1 do
  Begin
    CheckListBox1.ItemIndex:=i;
    If CheckListBox1.checked[i] then
      If rdbClienteInadiplentes.Checked then
      begin
        if DM.Configuracao1.TipoCobranca = 1 then  //Centralizada
        begin
          DM.QR_Consultas.Close;
          DM.QR_Consultas.SQL.Text := 'SELECT * FROM TITULO_A_RECEBER '+
            ' WHERE CLI_CODIGO='+IntToStr(StrToInt(Copy(CheckListBox1.Items[i],1,CONST_TAMANHO_CODIGO)))+
            ' AND CNC_CLIENTE='+IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue)+  //DM.Configuracao1.CodigoCNC
            ' AND (TRC_SITUACAO=0 OR TRC_SITUACAO=1 OR TRC_SITUACAO=8) '+
            ' AND TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data-DM.Configuracao1.QuantDiasSemCobran+1)+'" ';

{
            ' AND CLI_CODIGO IN '+
            ' (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
            ' WHERE CNC_CODIGO='+IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue)+  //DM.Configuracao1.CodigoCNC
            ' AND TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data-DM.Configuracao1.QuantDiasSemCobran+1)+'" '+
            ' AND (TRC_SITUACAO=0 OR TRC_SITUACAO=1))';
}
          DM.QR_Consultas.Open;
          //
          DM.QR_Consultas.First;
          while not DM.QR_Consultas.eof do
          begin
            try
              ExecutaSQL(DM.QR_Comandos,'INSERT INTO ITEM_DE_COBRANCA_COBRADOR VALUES '+
                '( '+IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue)+
                ', '+IntToStr(DM.Configuracao1.ProximoCodigo('ICC_CODIGO'))+
                ', '+IntToStr(fMxCobCobrador.Cobranca_por_Cobrador1.CodigoCPC)+
                ', '+IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue)+
                ', '+IntToStr(DM.QR_Consultas.FieldByName('TRC_CODIGO').asInteger)+
                ',"'+MesDia(DM.Configuracao1.Data)+'" '+
                ', '+IntToStr(DM.Configuracao1.CodigoUSU)+') ');
            except
            end;
            DM.QR_Consultas.Next;
          end;
        end
        else
          ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
            ' TRC_RGB_DT_SITUACAO="'+MesDia(DM.Configuracao1.DataHora)+'" '+
            ',CPC_CODIGO='+IntToStr(fMxCobCobrador.Cobranca_por_Cobrador1.CodigoCPC)+
            ',TRC_RGB_SITUACAO=5 '+
            ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE CLI_CODIGO='+IntToStr(StrToInt(Copy(CheckListBox1.Items[i],1,CONST_TAMANHO_CODIGO)))+
            ' AND CNC_CODIGO='+IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue)+  //DM.Configuracao1.CodigoCNC
            ' AND (TRC_SITUACAO=0 OR TRC_SITUACAO=1) '+
            ' AND TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data-DM.Configuracao1.QuantDiasSemCobran+1)+'" '+
            ' AND CLI_CODIGO IN '+
            ' (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
            ' WHERE CNC_CODIGO='+IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue)+  //DM.Configuracao1.CodigoCNC
            ' AND TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data-DM.Configuracao1.QuantDiasSemCobran+1)+'" '+
            ' AND (TRC_SITUACAO=0 OR TRC_SITUACAO=1))');
      end
      Else if rdbTitulosAtrasados.Checked then
      begin
        if DM.Configuracao1.TipoCobranca = 1 then
        begin
          try
            ExecutaSQL(DM.QR_Comandos,'INSERT INTO ITEM_DE_COBRANCA_COBRADOR VALUES '+
              '( '+IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue)+
              ', '+IntToStr(DM.Configuracao1.ProximoCodigo('ICC_CODIGO'))+
              ', '+IntToStr(fMxCobCobrador.Cobranca_por_Cobrador1.CodigoCPC)+
              ', '+IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue)+
              ', '+IntToStr(StrToInt(Copy(CheckListBox1.Items[i],1,CONST_TAMANHO_CODIGO)))+
              ',"'+MesDia(DM.Configuracao1.Data)+'" '+
              ', '+IntToStr(DM.Configuracao1.CodigoUSU)+')');
          except
          end;
        end
        else
          ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
            ' TRC_RGB_DT_SITUACAO="'+MesDia(DM.Configuracao1.Data)+'" '+
            ',CPC_CODIGO='+IntToStr(fMxCobCobrador.Cobranca_por_Cobrador1.CodigoCPC)+
            ',TRC_RGB_SITUACAO=5 '+
            ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE TRC_CODIGO='+IntToStr(StrToInt(Copy(CheckListBox1.Items[i],1,CONST_TAMANHO_CODIGO)))+
            ' AND CNC_CODIGO='+IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue));  //DM.Configuracao1.CodigoCNC
      end;
  End;
  fMxCobCobrador.Titulo_Receber1.Close;
  fMxCobCobrador.Titulo_Receber1.Open;
  Close;
end;

procedure TfMxCobrancaAdiciona.SB_MarcarClick(Sender: TObject);
Var
  i:Integer;
  Data_VEN :TDate;
begin
  If rdbCliente.Checked then
  Begin
    If edtCodigoCLI.Text = '' then
      Raise Exception.Create('Cliente não selecionado!');
  end
  Else If rdbVencimento.Checked then
  Begin
    If not VerificaDataBranco(mskDataINI.Text) then
      raise Exception.Create('Data inicial inválida!');
    If not VerificaDataBranco(mskDataFIM.Text) then
      raise Exception.Create('Data final inválida!');
    if StrToDate(mskDataFIM.Text) < StrToDate(mskDataINI.Text) then
      raise Exception.Create('Data final tem que ser maior que a data inicial!');
    if StrToDate(mskDataFIM.Text) > DM.Configuracao1.Data  then
      raise Exception.Create('Data final não pode ser maior que a data de hoje!');
  end;
  //
  for i:=0 to CheckListBox1.Items.Count-1 do
  Begin
    CheckListBox1.ItemIndex:=i;
    If rdbTodosRegistros.Checked then
      CheckListBox1.checked[i] := True
    Else If rdbCliente.Checked then
    Begin
      If StrToInt(Copy(CheckListBox1.Items[i],1,CONST_TAMANHO_CODIGO)) = StrToInt(edtCodigoCLI.Text) then
        CheckListBox1.checked[i] := True;
    End
    Else If rdbExcetoCartao.Checked then
    Begin
      If RightStr(CheckListBox1.Items[i],5) <> 'CARTA' then
        CheckListBox1.checked[i] := True;
    End
    Else If rdbVencimento.Checked then
    Begin
      If rdbClienteInadiplentes.Checked then
      Begin
        Titulo_receber2.Close;
        Titulo_Receber2.ParamByName('CNC_CODIGO').AsInteger:=fMxCobCobrador.dblCodigoCNC.KeyValue;  //DM.Configuracao1.CodigoCNC;
        Titulo_receber2.ParamByName('CLI_CODIGO').AsInteger:=StrToInt(Copy(CheckListBox1.Items[i],1,CONST_TAMANHO_CODIGO));
        Titulo_receber2.ParamByName('DT_INI').AsDateTime := STrToDateTime(mskDataINI.Text);
        Titulo_receber2.ParamByName('DT_FIM').AsDateTime := STrToDateTime(mskDataFIM.Text)+1;
        Titulo_receber2.Open;
        if not Titulo_receber2.IsEmpty then
          CheckListBox1.checked[i] := True;
      End
      Else
      Begin
        Data_VEN:=StrToDate(Copy(CheckListBox1.Items[i],70,10));
        If (Data_VEN >= StrToDate(mskDataINI.Text)) and (Data_VEN < StrToDate(mskDataFIM.Text)+1) then
          CheckListBox1.checked[i] := True;
      End;
    End;
  End;
end;


procedure TfMxCobrancaAdiciona.SB_DesmarcarClick(Sender: TObject);
Var
  i:Integer;
begin
  for i:=0 to CheckListBox1.Items.Count-1 do
  Begin
    CheckListBox1.ItemIndex:=i;
    CheckListBox1.checked[i] := False;
  End;
end;

procedure TfMxCobrancaAdiciona.Cliente1BeforeOpen(DataSet: TDataSet);
begin
  if DM.Configuracao1.TipoCobranca = 1 then  //Centralizada
  begin
    Cliente1.ParamByName('CNC_CODIGO').AsInteger     := fMxCobCobrador.dblCodigoCNC.KeyValue;  //DM.Configuracao1.CodigoCNC;
  end;

  Cliente1.ParamByName('TRC_VENCIMENTO').AsDate    := DM.Configuracao1.Data-DM.Configuracao1.QuantDiasSemCobran+1;
end;                                                  

procedure TfMxCobrancaAdiciona.rdbClienteInadiplentesClick(Sender: TObject);
begin
  If rdbClienteInadiplentes.Checked then
  begin
    ckbSomenteAtrasados.Enabled := False;
    //
    Label4.Caption := 'Cod.CLI';
    Label7.Caption := 'Apelido';
    Label8.Visible := False;
    Label13.Visible := False;
    Label9.Caption := 'Telefone';
    //
    rdbCliente.Enabled := True;
    rdbExcetoCartao.Enabled := False;
    CheckListBox1.Clear;
    rdbTodosRegistros.Checked := True;
    mskDataINI.Clear;
    mskDataFIM.Clear;
    With Cliente1 do
    Begin
      Close;
      Open;
      DisableControls;
      first;
      While not EOF do
      Begin
        CheckListBox1.Items.Add(PreencheZero(CONST_TAMANHO_CODIGO,Cliente1.FieldByName('CLI_CODIGO').AsInteger)+' '+PreencheEspaco(40,Cliente1.RazaoSocial)+
                                PreencheEspaco(20,Cliente1.FieldByName('CLI_NOME_FAN').AsString)+' '+PreencheEspaco(15,Cliente1.FieldByName('CLI_FONE').AsString));
        Next;
      End;
      EnableControls;
      First;
    End;
    //
    edtTotCLI.Text := IntToStr(Cliente1.RecordCount);
  end;
  //
  DM.QR_Consultas.Close;
  DM.QR_Consultas.SQL.Text := 'SELECT COUNT(CLI_CODIGO) AS QTDCLI FROM ('+Titulo_receber3.SQL.Text+') AS TABELA';
  DM.QR_Consultas.ParamByName('CNC_CODIGO').asInteger:=fMxCobCobrador.dblCodigoCNC.KeyValue;   //DM.Configuracao1.CodigoCNC;
  DM.QR_Consultas.ParamByName('TRC_VENCIMENTO').asDate:=DM.Configuracao1.Data-DM.Configuracao1.QuantDiasSemCobran+1;
  DM.QR_Consultas.Open;
  edtTotTRC.Text := DM.QR_Consultas.FieldByName('QTDCLI').AsString;
  MaskEdit1.Text := DateToStr(DM.Configuracao1.Data-DM.Configuracao1.QuantDiasSemCobran);
  //
end;

procedure TfMxCobrancaAdiciona.rdbTitulosAtrasadosClick(Sender: TObject);
Var
  ValorComJuros:Double;
begin
  if rdbTitulosAtrasados.Checked then
  begin
    ckbSomenteAtrasados.Enabled := True;
    //
    Label4.Caption := 'Cod.TRC';
    Label7.Caption := 'Valor';
    Label8.Visible := True;
    Label13.Visible := True;
    Label9.Caption := 'Vencimento';
    //
    rdbCliente.Enabled := False;
    rdbExcetoCartao.Enabled := True;
    edtCodigoCLI.Clear;
    rdbTodosRegistros.Checked := True;
    //
    CheckListBox1.Clear;
    With Titulo_receber3 do
    Begin
      Close;
      Open;
      DisableControls;
      first;
      While not EOF Do
      Begin
        //
        Parametro1.Close;
        Parametro1.ParamByName('PAR_CODIGO').asInteger := Titulo_receber3.FieldByName('TRC_TIPO_PAG').asInteger;
        Parametro1.Open;
        //
        ValorComJuros :=  Titulo_receber3.Valor+
                          Titulo_receber3.Valor*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-
                          Titulo_receber3.vencimento)/3000);
        CheckListBox1.Items.Add(PreencheZero(CONST_TAMANHO_CODIGO,CodigoTRC)+' '+PreencheEspaco(40,Titulo_receber3.FieldByName('Cliente').AsString)+
                                PreencheEspaco(10,Format('%.2f',[Valor]))+' '+PreencheEspaco(10,Format('%.2f',[ValorComJuros]))+
                                ' '+PreencheEspaco(10,FieldByName('TRC_VENCIMENTO').AsString)+' '+Copy(Parametro1.FieldByName('PAR_DESCRICAO').asString,1,5));
        Next;
      End;
      EnableControls;
      First;
    End;
    //
    edtTotTRC.Text := IntToStr(Titulo_receber3.RecordCount);
  end;
  //
  DM.QR_Consultas.Close;
  if ckbSomenteAtrasados.Checked then
  begin
    Label10.Visible   := true;
    edtTotCLI.Visible := true;
    Titulo_receber3.SQL.Text := ' SELECT * FROM TITULO_A_RECEBER T1 '+
      ' WHERE T1.CNC_CODIGO=:CNC_CODIGO '+
      ' AND (T1.TRC_SITUACAO IN (0,1,8)) AND T1.CLI_CODIGO>0'+
      FiltroTitulo+
      ' AND T1.TRC_VENCIMENTO<:TRC_VENCIMENTO'+
      ' AND T1.CLI_CODIGO IN (SELECT T2.CLI_CODIGO'+
      ' FROM TITULO_A_RECEBER T2'+
      ' WHERE (T1.TRC_SITUACAO IN (0,1,8))'+
      ' AND T2.TRC_VENCIMENTO<:TRC_VENCIMENTO'+
      ' AND T1.CNC_CLIENTE=T2.CNC_CLIENTE'+
      ' AND T1.CLI_CODIGO=T2.CLI_CODIGO)';

    DM.QR_Consultas.SQL.Text := 'SELECT CLI_CODIGO, SUM(TRC_CODIGO) AS QTDCLI FROM ('+Titulo_receber3.SQL.Text+') AS TABELA GROUP BY CLI_CODIGO';
    DM.QR_Consultas.ParamByName('CNC_CODIGO').asInteger:=fMxCobCobrador.dblCodigoCNC.KeyValue;   //DM.Configuracao1.CodigoCNC;
    DM.QR_Consultas.ParamByName('TRC_VENCIMENTO').asDate:=DM.Configuracao1.Data-DM.Configuracao1.QuantDiasSemCobran+1;
    DM.QR_Consultas.Open;
    edtTotCLI.Text := IntToStr(DM.QR_Consultas.RecordCount);
  end
  else
  begin
    Label10.Visible   := false;
    edtTotCLI.Visible := false;
    edtTotCLI.Text := '';
  end;

  MaskEdit1.Text := DateToStr(DM.Configuracao1.Data-DM.Configuracao1.QuantDiasSemCobran);
  //
end;

procedure TfMxCobrancaAdiciona.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Cliente1.Close;
  if DM.Configuracao1.TipoCobranca = 1 then  //Centralizada
  begin
    FiltroTitulo := ' AND T1.TRC_CODIGO NOT IN (SELECT TC.TRC_CODIGO '+
                    ' FROM ITEM_DE_COBRANCA_COBRADOR TC '+
                    ' WHERE TC.CNC_TITULO=T1.CNC_CODIGO) ';

    Cliente1.SQL.Text := ' SELECT T1.CNC_CODIGO,T1.CLI_CODIGO,T1.CLI_RZ_SOCIAL,T1.CLI_NOME_FAN,T1.CLI_FONE '+
        ' FROM CLIENTE T1 WHERE T1.CNC_CODIGO=:CNC_CODIGO '+
        ' AND T1.CLI_SITUACAO<>4 '+
        ' AND T1.CLI_CODIGO IN '+
        ' (SELECT T2.CLI_CODIGO FROM TITULO_A_RECEBER T2 '+
        '   WHERE T2.TRC_SITUACAO IN (0,1,8) '+
        '   AND T2.TRC_CODIGO NOT IN (SELECT TC.TRC_CODIGO '+
        '     FROM ITEM_DE_COBRANCA_COBRADOR TC '+
        '     WHERE TC.CNC_TITULO=T2.CNC_CODIGO) '+
        '   AND T2.CNC_CLIENTE=T1.CNC_CODIGO '+
        '   AND T2.TRC_VENCIMENTO<:TRC_VENCIMENTO) '+
        ' ORDER BY T1.CLI_RZ_SOCIAL ';
  end
  else
  begin
    FiltroTitulo := ' AND (T1.CPC_CODIGO = 0 OR T1.CPC_CODIGO IS NULL) ';

    Cliente1.SQL.Text := ' SELECT T1.CNC_CODIGO,T1.CLI_CODIGO,T1.CLI_RZ_SOCIAL,T1.CLI_NOME_FAN,T1.CLI_FONE '+
        ' FROM CLIENTE T1 '+
        ' WHERE T1.CLI_SITUACAO<>4 '+
        //' AND T1.CNC_CODIGO=:CNC_CODIGO '+
        ' AND T1.CLI_CODIGO IN '+
        ' (SELECT T2.CLI_CODIGO FROM TITULO_A_RECEBER T2 '+
        ' WHERE T2.TRC_SITUACAO IN (0,1,8) '+ //,2,9
        ' AND (T2.CPC_CODIGO IS NULL OR T2.CPC_CODIGO=0) '+

        //' AND T2.CNC_CLIENTE=T1.CNC_CODIGO '+ //TEMP

        ' AND T2.CNC_CODIGO='+IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue)+  //DM.Configuracao1.CodigoCNC

        //')'+
        ' AND T2.TRC_VENCIMENTO<:TRC_VENCIMENTO) '+
        ' ORDER BY T1.CLI_CODIGO ';
        //' ORDER BY T1.CLI_RZ_SOCIAL ';
  end;

  if DM.Configuracao1.Empresa in TEmpresasOtica then
    ckbSomenteAtrasados.Checked := True;
  rdbClienteInadiplentes.Checked:=True;
end;

procedure TfMxCobrancaAdiciona.rdbTodosRegistrosClick(Sender: TObject);
begin
  mskDataINI.Enabled:=False;
  mskDataINI.Color:=AlteraCorComponentes;
  mskDataFIM.Enabled:=False;
  mskDataFIM.Color:=AlteraCorComponentes;
  mskDataINI.Clear;
  mskDataFIM.Clear;
  edtCodigoCLI.Enabled  :=False;
  edtCodigoCLI.Color    :=AlteraCorComponentes;
  edtCodigoCLI.Clear;
end;

procedure TfMxCobrancaAdiciona.rdbVencimentoClick(Sender: TObject);
begin
  edtCodigoCLI.Enabled     :=False;
  edtCodigoCLI.Color       :=AlteraCorComponentes;
  edtCodigoCLI.Clear;
  mskDataINI.Enabled :=True;
  mskDataINI.Color   :=clWindow;
  mskDataFIM.Enabled :=True;
  mskDataFIM.Color   :=clWindow;
  mskDataINI.SetFocus;
end;

procedure TfMxCobrancaAdiciona.edtCodigoCLIExit(Sender: TObject);
begin
  If edtCodigoCLI.Text<>'' then
  Begin
    with Cliente2 do
    Begin
      if (not Active) or
         (CodigoCNC <> fMxCobCobrador.dblCodigoCNC.KeyValue) or
         (CodigoCLI <> StrToInt(edtCodigoCLI.Text)) then
      Begin
        Close;
        ParamByName('CNC_CODIGO').AsInteger := fMxCobCobrador.dblCodigoCNC.KeyValue;        
        ParamByName('CLI_CODIGO').AsInteger := StrToInt(edtCodigoCLI.Text);
        Open;
      end;
      If IsEmpty then
      Begin
        TEdit(Sender).SetFocus;
        raise Exception.Create('Cliente não cadastrado');
      End;
    end;
  End;
end;

procedure TfMxCobrancaAdiciona.edtCodigoCLIKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Clear;
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=6;
    fCadCli.CentroCusto2.open;
    fCadCli.CentroCusto2.LocalizarCod(fMxCobCobrador.dblCodigoCNC.KeyValue);    //DM.Configuracao1.CodigoCNC;
    fCadCli.dblCentroDeCusto.KeyValue:=fMxCobCobrador.dblCodigoCNC.KeyValue;    //DM.Configuracao1.CodigoCNC;
    fCadCli.Cliente1.Open;
    fCadCli.Showmodal;
  End;
end;

procedure TfMxCobrancaAdiciona.rdbClienteClick(Sender: TObject);
begin
  mskDataINI.Enabled:=False;
  mskDataINI.Color:=AlteraCorComponentes;
  mskDataFIM.Enabled:=False;
  mskDataFIM.Color:=AlteraCorComponentes;
  mskDataINI.Clear;
  mskDataFIM.Clear;
  edtCodigoCLI.Enabled     :=True;
  edtCodigoCLI.Color       :=ClWindow;
  edtCodigoCLI.SetFocus;
end;


procedure TfMxCobrancaAdiciona.Titulo_receber3CalcFields(
  DataSet: TDataSet);
begin
  If Titulo_receber3.CodigoCLI <= 0 then
  Begin
    Titulo_receber3.FieldByName('Cliente').AsString     := '';
    Exit;
  end;

  with Cliente2 do
  Begin
    if (not Active) or
       (CodigoCNC <> Titulo_receber3.ClienteCNC) or
       (CodigoCLI <> Titulo_receber3.CodigoCLI) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').AsInteger := Titulo_receber3.ClienteCNC;
      ParamByName('CLI_CODIGO').AsInteger := Titulo_receber3.CodigoCLI;
      Open;
    end;
    Titulo_receber3.FieldByName('Cliente').AsString := RazaoSocial;
  end;
end;

procedure TfMxCobrancaAdiciona.Titulo_receber3BeforeOpen(
  DataSet: TDataSet);
begin
  if rdbTitulosAtrasados.Checked then
  begin
    if ckbSomenteAtrasados.Checked then
    begin
      Titulo_receber3.SQL.Text := ' SELECT * FROM TITULO_A_RECEBER T1 '+
        ' WHERE T1.CNC_CODIGO='+IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue)+
        ' AND T1.TRC_SITUACAO IN (0,1,8) '+
        ' AND T1.CLI_CODIGO>0 '+
        FiltroTitulo+
        ' AND T1.TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data-DM.Configuracao1.QuantDiasSemCobran+1)+'" ';
//        ' AND T1.CLI_CODIGO IN (SELECT T2.CLI_CODIGO'+
//        ' FROM TITULO_A_RECEBER T2'+
//        ' WHERE (T1.TRC_SITUACAO IN (0,1,8))'+
//        ' AND T2.TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data-DM.Configuracao1.QuantDiasSemCobran+1)+'" '+
//        ' AND T1.CNC_CLIENTE=T2.CNC_CLIENTE'+
//        ' AND T1.CLI_CODIGO=T2.CLI_CODIGO) ';
    end
    else
    begin
      Titulo_receber3.SQL.Text := ' SELECT * FROM TITULO_A_RECEBER T1 '+
        ' WHERE T1.CNC_CLIENTE='+IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue)+
        ' AND T1.TRC_SITUACAO IN (0,1,8) '+
        ' AND T1.CLI_CODIGO>0'+
        FiltroTitulo+
        ' AND T1.CLI_CODIGO IN (SELECT T2.CLI_CODIGO'+
        ' FROM TITULO_A_RECEBER T2 '+
        ' WHERE T1.TRC_SITUACAO IN (0,1,8) '+
        ' AND T2.TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data-DM.Configuracao1.QuantDiasSemCobran+1)+'" '+
        ' AND T1.CNC_CLIENTE=T2.CNC_CLIENTE '+
        ' AND T1.CLI_CODIGO=T2.CLI_CODIGO) ';
    end;
  end;
end;

procedure TfMxCobrancaAdiciona.ckbSomenteAtrasadosClick(Sender: TObject);
begin
  rdbTitulosAtrasadosClick(Sender);
end;

procedure TfMxCobrancaAdiciona.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then
    close;
end;

procedure TfMxCobrancaAdiciona.BitBtn1Click(Sender: TObject);
begin
  //Títulos Atrasados
  Application.CreateForm(Trpt_Data,rpt_Data);
  with rpt_Data do
  Begin
    Tag:=16;
    ShowModal;
  end;
end;

procedure TfMxCobrancaAdiciona.btnExportaClick(Sender: TObject);
var
  arquivo: String;
begin
  arquivo := ExtractFilePath(ParamStr(0)) + 'Clientes_em_atraso.txt';
  CheckListBox1.Items.SaveToFile(arquivo);
  winExec(PChar('notepad ' + arquivo),SW_NORMAL);
end;

end.




unit MxFaturarPendentesCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,Math,
  Menus, Titulo_receber, Forma_de_Pagamento,
  Produto, Classificacao_fiscal, Fornecedor, Pedido_de_Compra,
  Titulo_a_Pagar;

type
  TfMxFaturarPendentesCompra = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    SB_Confirmar: TBitBtn;
    SB_Fechar: TBitBtn;
    DSFornecedor1: TDataSource;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    SB_LocCab: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    MainMenu1: TMainMenu;
    MenuFornecedor: TMenuItem;
    LocalizarCab: TMenuItem;
    N1: TMenuItem;
    ConfirmarCab: TMenuItem;
    SairCab: TMenuItem;
    ckbFaturarTodos: TCheckBox;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    Produto1: TProduto;
    Fechar1: TMenuItem;
    Fornecedor1: TFornecedor;
    Fornecedor1FOR_CODIGO: TIntegerField;
    Fornecedor1CNC_CODIGO: TIntegerField;
    Fornecedor1FOR_RZ_SOCIAL: TStringField;
    Fornecedor1FOR_NOME_FAN: TStringField;
    Fornecedor1FOR_CGC: TStringField;
    Fornecedor1FOR_IE: TStringField;
    Fornecedor1FOR_LOGRADOURO: TIntegerField;
    Fornecedor1FOR_ENDERECO: TStringField;
    Fornecedor1FOR_BAIRRO: TStringField;
    Fornecedor1FOR_CIDADE: TStringField;
    Fornecedor1FOR_UF: TStringField;
    Fornecedor1FOR_CEP: TStringField;
    Fornecedor1FOR_FONE: TStringField;
    Fornecedor1FOR_SITUACAO: TIntegerField;
    Fornecedor1FOR_FAX: TStringField;
    Fornecedor1FOR_SITE: TStringField;
    Fornecedor1FOR_EMAIL: TStringField;
    Fornecedor1USU_CODIGO: TIntegerField;
    Fornecedor1FOR_DT_ALTERADO: TDateTimeField;
    Fornecedor1PCP_CONHECIMENTO: TIntegerField;
    Fornecedor1FOR_DT_CADASTRO: TDateTimeField;
    Fornecedor1CCX_CODIGO: TIntegerField;
    Fornecedor1FOR_MAX_ITENS_NOTA: TIntegerField;
    Fornecedor1FOR_MARCA: TStringField;
    Fornecedor1FOR_REDUCAO_ICMS: TFloatField;
    Fornecedor1FOR_BANCO: TIntegerField;
    Fornecedor1FOR_NUMERO_AGENCIA: TStringField;
    Fornecedor1FOR_NUMERO_CONTA: TStringField;
    Fornecedor1Total: TStringField;
    Pedido_de_Compra1: TPedido_de_Compra;
    Titulo_a_pagar1: TTitulo_a_pagar;
    Fornecedor1FOR_OBSERVACAO1: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Fornecedor1CalcFields(DataSet: TDataSet);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);

  public
    vDataBase: TDateTime;
    Entidade: TFornecedor;
    Cancelar: Boolean;
  end;

var
  fMxFaturarPendentesCompra: TfMxFaturarPendentesCompra;

implementation
uses UDM, Funcoes, UPapeletaDeRecebimento, DigSenha,
  MxSelFaturarPendentesCompra;

{$R *.DFM}

procedure TfMxFaturarPendentesCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid1.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_FatPend_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfMxFaturarPendentesCompra.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxFaturarPendentesCompra.SB_ConfirmarClick(Sender: TObject);
var
  Trans: Boolean;
  iTipoPag, CdFPG, CdCNCFPE, CdFPE: integer;
begin
  If Entidade.IsEmpty Then
    Raise exception.Create('Nenhum Fornecedor para Faturar!');

  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise exception.Create('Não pode Faturar nesse Centro de Custo!');

  if ckbFaturarTodos.Checked then
  Begin
    If MessageDlg('Atenção!!!'+#13+'Deseja Faturar os Pedidos de todos esses fornecedores?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
  end
  else
  Begin
    If MessageDlg('Atenção!!!'+#13+'Deseja Faturar os Pedidos somente do fornecedor selecionado?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
  end;

  if DM.Usuario1.Permissoes.IndexOf(IntToStr(7450)) < 0 then //Processar Faturamento Pendente
  Begin
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      onClose:=nil;
      Tag:=39;
      Cancelar:=False;
      Showmodal;
      If not cancelar Then
      begin
        if usuario1.Permissoes.IndexOf(IntToStr(7450)) < 0 then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão para processar faturamento pendente!');
        end;
      end
      else
      begin
        free;
        exit;
      end;
      free;
    End;
  end;

  AtualizaControles(1, True);

  if ckbFaturarTodos.Checked then
    Entidade.First;

  while not Entidade.Eof do
  Begin
    Trans:=false;
    with DM.Database2 do
    begin
      try
        If DM.Configuracao1.ControleTransacao then
        Begin
          StartTransaction;
          Trans:=True;
        end;

        CdCNCFPE := DM.Usuario1.CentroDeCusto;
        CdFPE := DM.Configuracao1.ProximoCodigo('FPE_CODIGO');
        if CdFPE <= 0 then
        Begin
          ShowMessage('Falha ao gerar Código de Faturamento Pendente!');
          Raise exception.Create('');
        end;

        //----------------------------------------------------------------------
        //Gerar Títulos
        with Pedido_de_Compra1 do
        Begin
          Close;
          SQL.Text := 'SELECT P1.CNC_CODIGO,P1.FPG_CODIGO,P1.TPG_CODIGO '+
            ',MAX(FOR_CODIGO) AS FOR_CODIGO '+
            ',MIN(P1.PCP_CODIGO) AS PCP_CODIGO '+
            ',SUM(ROUND(P1.PCP_TOTAL_FINAL,2)) AS PCP_TOTAL_FINAL '+
            ' FROM PEDIDO_DE_COMPRA P1 '+
            ' WHERE P1.FOR_CODIGO='+IntToStr(Entidade.CodigoFOR)+
            fMxSelFaturarPendentesCompra.CdPCP +
            ' AND P1.CNC_CODIGO='+IntToStr(DM.Configuracao1.codigoCNC)+
            ' AND P1.PCP_DT_ENTREGA<="'+MesDia(vDataBase)+'" '+
            ' AND P1.PCP_SITUACAO=2 '+
            ' AND P1.FPE_CODIGO=-1 '+    //Pedido Pendente
            ' GROUP BY P1.CNC_CODIGO, P1.FPG_CODIGO, P1.TPG_CODIGO ';
          Open;
          CdFPG    := CodigoFPG;
          iTipoPag := CodigoTPG;

          {Pedido_de_Compra1.First;
          while not Pedido_de_Compra1.EoF do
          begin}

            //Localizar Forma de Pagamento
            with Forma_de_Pagamento1 do
            Begin
              if CodigoFPG <> CdFPG then
              Begin
                Close;
                ParamByName('FPG_CODIGO').asInteger := CdFPG;
                Open;
              end;
            end;

            //Gerar Títulos
            if (TotalFinal > 0) then
            Begin
              //Gerar título a pagar
              Titulo_a_pagar1.Close;
              Titulo_a_pagar1.SQL.Text:='SELECT * FROM TITULO_A_PAGAR '+
                                        'WHERE TPG_CODIGO = -1';
              Titulo_a_pagar1.Open;
              if not Pedido_de_Compra1.GerarTitulos(Pedido_de_Compra1.TotalFinal,0(*Frete*),True(*Pendentes*)) then
              Begin
                ShowMessage('Erro ao gerar Títulos a Pagar!');
                Raise Exception.Create('');
              end;
              Titulo_a_pagar1.Close;
            end;
            Close;

            ExecutaSQL(DM.QR_Comandos, 'UPDATE PEDIDO_DE_COMPRA SET '+
              ' FPE_CODIGO='+IntToStr(CdFPE)+   //-1
              ',PCP_DT_FPE="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+ //NULL
              ',PCP_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE FOR_CODIGO='+IntToStr(Entidade.CodigoFOR)+
              ' AND PCP_SITUACAO=2 '+
              fMxSelFaturarPendentesCompra.Update +
              ' AND FPE_CODIGO=-1 '+    //Pedido Pendente
              ' AND FPG_CODIGO='+IntToStr(CdFPG)+
              ' AND TPG_CODIGO='+IntToStr(iTipoPag));

            Entidade.GeraLog(7450, CdCNCFPE, CdFPE, 'FOR:'+IntToStr(Entidade.CodigoFOR)+
              ' DtBase:'+DateToStr(vDataBase)+' FPG:'+IntToStr(CdFPG)+
              ' TipoDoc:'+IntToStr(iTipoPag));

            {Pedido_de_Compra1.Next;
          end;}
        end;



        If DM.Configuracao1.ControleTransacao then
          Commit;

      except
        AtualizaControles(1, False);
        If DM.Configuracao1.ControleTransacao then
          if trans then
          Begin
            RollBack;
            ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
          end;
      end;
    End;
    Entidade.Next;
    if not ckbFaturarTodos.Checked then
      Break;
  end;
  Entidade.Close;
  Entidade.Open;
  AtualizaControles(1, False);
end;

procedure TfMxFaturarPendentesCompra.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  if DM.Configuracao1.Empresa = empMotical then
    ckbFaturarTodos.Checked := True;
  cmbCampo.ItemIndex := 0;
  edtLocalizar.SetFocus;
end;

procedure TfMxFaturarPendentesCompra.SB_LocCabClick(Sender: TObject);
begin
  if (cmbCampo.ItemIndex=0) and
     (not VerificaInteiroBranco(edtLocalizar.Text)) then
    Raise exception.Create('Código inválido!');
  Entidade.Localizar;
end;

procedure TfMxFaturarPendentesCompra.FormCreate(Sender: TObject);
begin
  Entidade := Fornecedor1;
  vDataBase := DM.Configuracao1.Data;
  try
    DBGrid1.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_FatPend_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxFaturarPendentesCompra.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  Fechar1.Enabled       := not Habilitar;
  SairCab.Enabled       := not Habilitar;
  SB_Confirmar.Enabled  := not Habilitar;
  SB_Fechar.Enabled     := not Habilitar;

  edtLocalizar.Enabled  := not Habilitar;
  if Habilitar then
    edtLocalizar.Color  := AlteraCorComponentes
  else
    edtLocalizar.Color  := clWindow;
  cmbCampo.Enabled      := not Habilitar;
  if Habilitar then
    cmbCampo.Color      := AlteraCorComponentes
  else
    cmbCampo.Color      := clWindow;

  DBGrid1.Enabled       := not Habilitar;
end;

procedure TfMxFaturarPendentesCompra.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_Fechar.Enabled then
    Begin
      SB_Fechar.SetFocus;
      SB_FecharClick(sender);
    end
    else
      Close;
  end
  else if Key=#13 then
  Begin
    if SB_Confirmar.Enabled then
    Begin
      SB_Confirmar.SetFocus;
      SB_ConfirmarClick(sender);
    end;
  end;
end;

procedure TfMxFaturarPendentesCompra.Fornecedor1CalcFields(
  DataSet: TDataSet);
var
  vTotal: Double;
begin
  {se dê erro de TAG colocar um IF
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT SUM(ROUND(P1.PCP_TOTAL_FINAL,2)) AS TOTAL '+
      ' FROM PEDIDO_DE_COMPRA P1 '+
      ' WHERE P1.FOR_CODIGO='+IntToStr(Entidade.CodigoFOR)+
      ' AND P1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND P1.PCP_DT_ENTREGA<="'+MesDia(vDataBase)+'" '+
      ' AND P1.PCP_SITUACAO=2 '+
      ' AND P1.FPE_CODIGO=-1 ';   //Pedido Pendente
    Open;
    vTotal := FieldByName('TOTAL').asFloat;
    if vTotal > 0 then
      Entidade.FieldByName('TOTAL').asString := Format('%.2f',[vTotal])
    else
      Entidade.FieldByName('TOTAL').asString := '0,00';
  end;}

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT SUM(ROUND(P1.PCP_TOTAL_FINAL,2)) AS TOTAL '+
      ' FROM PEDIDO_DE_COMPRA P1 '+
      ' WHERE P1.FOR_CODIGO='+IntToStr(Entidade.CodigoFOR)+
      ' AND P1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND P1.PCP_DT_ENTREGA<="'+MesDia(vDataBase)+'" '+
      ' AND P1.PCP_SITUACAO=2 '+
      fMxSelFaturarPendentesCompra.CdPCP +
      ' AND P1.FPE_CODIGO=-1 ';   //Pedido Pendente
    Open;
    vTotal := FieldByName('TOTAL').asFloat;
    if vTotal > 0 then
      Entidade.FieldByName('TOTAL').asString := Format('%.2f',[vTotal])
    else
      Entidade.FieldByName('TOTAL').asString := '0,00';
  end;
end;

end.

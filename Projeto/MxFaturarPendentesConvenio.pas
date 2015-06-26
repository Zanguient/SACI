unit MxFaturarPendentesConvenio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,Math,
  Cliente, Menus, Pedido_de_Venda, Titulo_receber, Forma_de_Pagamento,
  Fatfin, AgenteFin, Item_Pedido_Venda, Produto;

type
  TfMxFaturarPendentesConvenio = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    SB_Confirmar: TBitBtn;
    SB_Fechar: TBitBtn;
    DSCliente1: TDataSource;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    SB_LocCab: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    MainMenu1: TMainMenu;
    MenuCliente: TMenuItem;
    LocalizarCab: TMenuItem;
    N1: TMenuItem;
    ConfirmarCab: TMenuItem;
    SairCab: TMenuItem;
    Cliente1: TCliente;
    ckbFaturarTodos: TCheckBox;
    Pedido_de_Venda1: TPedido_de_Venda;
    Titulo_receber1: TTitulo_receber;
    FatorFinanceira1: TFatorFinanceira;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    AgenteFin1: TAgenteFin;
    Produto1: TProduto;
    Fechar1: TMenuItem;
    Cliente1CLI_CODIGO: TIntegerField;
    Cliente1CNC_CODIGO: TIntegerField;
    Cliente1CLI_PESSOA_FISICA: TSmallintField;
    Cliente1CLI_DT_CADASTRO: TDateTimeField;
    Cliente1CLI_DATA_NASC: TDateTimeField;
    Cliente1CLI_RZ_SOCIAL: TStringField;
    Cliente1CLI_NOME_FAN: TStringField;
    Cliente1CLI_CGC_CPF: TStringField;
    Cliente1CLI_CGF_RG: TStringField;
    Cliente1CLI_LOGRADOURO: TIntegerField;
    Cliente1CLI_ENDERECO: TStringField;
    Cliente1CLI_BAIRRO: TStringField;
    Cliente1CLI_CIDADE: TStringField;
    Cliente1CLI_UF: TStringField;
    Cliente1CLI_CEP: TStringField;
    Cliente1CLI_FONE: TStringField;
    Cliente1CLI_SITUACAO: TIntegerField;
    Cliente1CLI_CREDITO: TFloatField;
    Cliente1CLI_PAI: TStringField;
    Cliente1CLI_MAE: TStringField;
    Cliente1CLI_CONJUGE: TStringField;
    Cliente1CLI_OBS1: TStringField;
    Cliente1CLI_LOCALTRABALHO: TStringField;
    Cliente1CLI_FAX: TStringField;
    Cliente1CLI_SITE: TStringField;
    Cliente1CLI_EMAIL: TStringField;
    Cliente1USU_CODIGO: TIntegerField;
    Cliente1CLI_DT_ALTERADO: TDateTimeField;
    Cliente1CLI_CELULAR: TStringField;
    Cliente1CLI_SPC: TIntegerField;
    Cliente1CLI_VENDA_ATACADO: TIntegerField;
    Cliente1CLI_DESCONTO: TFloatField;
    Cliente1CLI_ORGAO: TIntegerField;
    Cliente1CLI_DT_SPC: TDateTimeField;
    Cliente1CLI_REFERENCIA1: TStringField;
    Cliente1CLI_REFERENCIA2: TStringField;
    Cliente1CLI_REFERENCIA3: TStringField;
    Cliente1CLI_PROFISSAO: TStringField;
    Cliente1CLI_IDENTIFICACAO: TStringField;
    Cliente1CLI_QUINZENAL: TIntegerField;
    Cliente1CLI_MENSAL: TIntegerField;
    Cliente1CLI_NOTA: TIntegerField;
    Cliente1CLI_CLASSIFICACAO: TIntegerField;
    Cliente1CLI_MAQUINA: TIntegerField;
    Cliente1Total: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente1CalcFields(DataSet: TDataSet);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);

  public
    vDataBase: TDateTime;
    Entidade: TCliente;
    Cancelar: Boolean;
  end;

var
  fMxFaturarPendentesConvenio: TfMxFaturarPendentesConvenio;

implementation
uses UDM, Funcoes, UPapeletaDeRecebimento, DigSenha;

{$R *.DFM}

procedure TfMxFaturarPendentesConvenio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid1.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_FatPend_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfMxFaturarPendentesConvenio.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxFaturarPendentesConvenio.SB_ConfirmarClick(Sender: TObject);
var
  Trans, vCartao, TemEntrada, vGerouTit: Boolean;
  CdPDVCNC, CdPDV, iGrupoEspecial, iTipoPag, CdAGF, CdFPG, CdCNCFPE, CdFPE, CdCNCCLI, CdCLI: integer;
  sPedido: string;
  vTotalTitulo, vTotalFrete: Double;
begin
  if DM.Configuracao1.CPD then
    Raise exception.Create('Não pode ser feito no CPD!');

  If Entidade.IsEmpty Then
    Raise exception.Create('Nenhum convênio para Faturar!');

  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise exception.Create('Não pode Faturar nesse Centro de Custo!');

  if ckbFaturarTodos.Checked then
  Begin
    If MessageDlg('Atenção!!!'+#13+'Deseja Faturar os Pedidos de todos esses convênios?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
  end
  else
  Begin
    If MessageDlg('Atenção!!!'+#13+'Deseja Faturar os Pedidos somente do convênio selecionado?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
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

  if not Titulo_receber1.Active then
    Titulo_receber1.Open;

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
        with Pedido_de_Venda1 do
        Begin
          Close;
          SQL.Text := 'SELECT P1.CNC_CODIGO,P1.CNC_CLIENTE,P1.CLI_CODIGO,P1.PDV_GRUPO_ESPECIAL,P1.AGF_CODIGO'+
            ',P1.FPG_CODIGO,P1.PDV_TIPO_PAG '+
            ',MIN(P1.PDV_CODIGO) AS PDV_CODIGO '+
            ',SUM(ROUND((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*ROUND(I1.IPV_PRECO_DESC,2),2)) AS PDV_TOTAL '+
            ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1, CLIENTE C1 '+
            ' WHERE C1.CNC_CONVENIO='+IntToStr(Entidade.CodigoCNC)+
            ' AND C1.CLI_CONVENIO='+IntToStr(Entidade.CodigoCLI)+
            ' AND P1.CNC_CODIGO='+IntToStr(DM.Configuracao1.codigoCNC)+
            ' AND P1.PDV_SITUACAO=4 '+
            ' AND P1.PDV_TIPO_VENDA=1 '+    //Venda Pendente
            ' AND P1.PDV_TITULO_GERADO=0 '+
            ' AND P1.PDV_DT_ENTREGA<="'+MesDia(vDataBase)+'" '+
            ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
            ' AND P1.PDV_CODIGO=I1.PDV_CODIGO '+
            ' AND P1.CNC_CLIENTE=C1.CNC_CODIGO '+
            ' AND P1.CLI_CODIGO=C1.CLI_CODIGO '+
            ' GROUP BY P1.CNC_CODIGO,P1.CNC_CLIENTE,P1.CLI_CODIGO,P1.PDV_GRUPO_ESPECIAL, P1.AGF_CODIGO, P1.FPG_CODIGO, P1.PDV_TIPO_PAG ';
          Open;
          CdPDVCNC := CodigoCNC;
          CdPDV    := CodigoPDV;
          CdCNCCLI := ClienteCNC;
          CdCLI    := CodigoCLI;
          CdAGF    := CodigoAGF;
          CdFPG    := CodigoFPG;
          iTipoPag := TipoPag;

          //Somar o Frete dos Pedidos
          with DM.qr_consultas2 do
          Begin
            Close;
            SQL.Text := 'SELECT P1.CNC_CODIGO,P1.CNC_CLIENTE,P1.CLI_CODIGO,P1.PDV_GRUPO_ESPECIAL,P1.AGF_CODIGO'+
              ',P1.FPG_CODIGO,P1.PDV_TIPO_PAG '+
              ',MIN(P1.PDV_CODIGO) AS PDV_CODIGO '+
              ',SUM(ROUND(P1.PDV_FRETE,2)) AS TOTAL '+
              ' FROM PEDIDO_DE_VENDA P1, CLIENTE C1 '+
              ' WHERE C1.CNC_CONVENIO='+IntToStr(Entidade.CodigoCNC)+
              ' AND C1.CLI_CONVENIO='+IntToStr(Entidade.CodigoCLI)+
              ' AND P1.CNC_CODIGO='+IntToStr(DM.Configuracao1.codigoCNC)+
              ' AND P1.CNC_CLIENTE='+IntToStr(CdCNCCLI)+
              ' AND P1.CLI_CODIGO='+IntToStr(CdCLI)+
              ' AND P1.PDV_SITUACAO=4 '+
              ' AND P1.PDV_TIPO_VENDA=1 '+    //Venda Pendente
              ' AND P1.PDV_TITULO_GERADO=0 '+
              ' AND P1.PDV_DT_ENTREGA<="'+MesDia(vDataBase)+'" '+
              ' AND P1.CNC_CLIENTE=C1.CNC_CODIGO '+
              ' AND P1.CLI_CODIGO=C1.CLI_CODIGO '+
              ' GROUP BY P1.CNC_CODIGO,P1.CNC_CLIENTE,P1.CLI_CODIGO,P1.PDV_GRUPO_ESPECIAL, P1.AGF_CODIGO, P1.FPG_CODIGO, P1.PDV_TIPO_PAG ';
            Open;
            vTotalFrete := Arredonda(FieldByName('TOTAL').asFloat);
          end;

          if GrupoEspecial then
            iGrupoEspecial := 1
          else
            iGrupoEspecial := 0;

          //Localizar Agente Financeiro
          with AgenteFin1 do
          Begin
            if CodigoAGF <> CdAGF then
            Begin
              Close;
              ParamByName('AGF_CODIGO').asInteger := CdAGF;
              Open;
            end;
            if DiaPagamento > 0 then
              vCartao := True
            else
              vCartao := False;
          end;

          //Localizar Forma de Pagamento
          with Forma_de_Pagamento1 do
          Begin
            if CodigoFPG <> CdFPG then
            Begin
              Close;
              ParamByName('FPG_CODIGO').asInteger := CdFPG;
              Open;
            end;
            if (Prazo[1] = '0') and
               (Prazo <> '0') then //Não é A Vista
              TemEntrada := True
            else
              TemEntrada := False;
          end;

          //Localizar Fator de Financeira
          With FatorFinanceira1 do
          Begin
            Close;
            ParamByName('AGF_CODIGO').AsInteger := CdAGF;
            If (Forma_de_Pagamento1.Prazo[1]='0') and (not AgenteFin1.JurosEntrada) then
              ParamByName('FAF_NPARC').AsInteger:=Titulo_receber1.QtdeTitulos(Forma_de_Pagamento1.Prazo)-1
            Else
              ParamByName('FAF_NPARC').AsInteger:=Titulo_receber1.QtdeTitulos(Forma_de_Pagamento1.Prazo);
            Open;
          End;

          vGerouTit := False;
          //Gerar Títulos
          if (Total+vTotalFrete > 0) then
          Begin
            vTotalTitulo := Total+vTotalFrete;
            if not Titulo_receber1.GerarTitAvulso(CdPDV, Entidade.codigoCNC,
                Entidade.CodigoCLI,CdAGF, iTipoPag, 0(*CdTRF*), vTotalTitulo, FatorFinanceira1.Fator,
                vCartao, TemEntrada,AgenteFin1.JurosEntrada, Forma_de_Pagamento1.Prazo,
                'Faturamento Pendente',''(*CartãoCV*),vDataBase,CdCNCFPE, CdFPE) then //Tag = 0 Venda;
              Raise exception.Create('')
            else
              vGerouTit := True;
          end
          else
            vTotalTitulo := 0;
          Close;
        end;

        if vGerouTit then
          ExecutaSQL(DM.QR_Comandos, 'UPDATE PEDIDO_DE_VENDA SET '+
            ' PDV_TITULO_GERADO=1 '+
            ',CNC_FATURAMENTO_PENDENTE='+IntToStr(CdCNCFPE)+
            ',FPE_CODIGO='+IntToStr(CdFPE)+
            ',PDV_DT_FPE="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE EXISTS (SELECT C1.CLI_CODIGO '+
            ' FROM CLIENTE C1 '+
            ' WHERE C1.CNC_CONVENIO='+IntToStr(Entidade.CodigoCNC)+
            ' AND C1.CLI_CONVENIO='+IntToStr(Entidade.CodigoCLI)+
            ' AND PEDIDO_DE_VENDA.CNC_CLIENTE='+IntToStr(CdCNCCLI)+
            ' AND PEDIDO_DE_VENDA.CLI_CODIGO='+IntToStr(CdCLI)+
            ' AND PEDIDO_DE_VENDA.CNC_CLIENTE=C1.CNC_CODIGO '+
            ' AND PEDIDO_DE_VENDA.CLI_CODIGO=C1.CLI_CODIGO) '+
            ' AND PDV_SITUACAO=4 '+
            ' AND PDV_TIPO_VENDA=1 '+    //Venda Pendente
            ' AND PDV_TITULO_GERADO=0 '+
            ' AND PDV_GRUPO_ESPECIAL='+IntToStr(iGrupoEspecial)+
            ' AND AGF_CODIGO='+IntToStr(CdAGF)+
            ' AND FPG_CODIGO='+IntToStr(CdFPG)+
            ' AND PDV_TIPO_PAG='+IntToStr(iTipoPag)+
            ' AND PDV_DT_ENTREGA<="'+MesDia(vDataBase)+'" ');

        Entidade.GeraLog(7450, CdCNCFPE, CdFPE, 'Convenio:'+PreencheZero(2,Entidade.CodigoCNC)+'-'+IntToStr(Entidade.CodigoCLI)+
          ' DtBase:'+DateToStr(vDataBase)+' AGF:'+IntToStr(CdAGF)+' FPG:'+IntToStr(CdFPG)+
          ' TipoPag:'+IntToStr(iTipoPag)+' Esp:'+IntToStr(iGrupoEspecial));

        If DM.Configuracao1.ControleTransacao then
          Commit;

        //Imprimir Papeleta de Recebimento
        Application.CreateForm(Trpt_PapeletaDeRecebimento, rpt_PapeletaDeRecebimento);
        with rpt_PapeletaDeRecebimento do
        Begin
          Tag := 0;
          zrlTotalPedido.Caption := format('%.2f',[vTotalTitulo]);
          with DM.QR_Consultas do
          Begin
            Close;
            SQL.Text := 'SELECT PDV_CODIGO, PDV_DOCUMENTO '+
              ' FROM PEDIDO_DE_VENDA '+
              ' WHERE CNC_FATURAMENTO_PENDENTE='+IntToStr(CdCNCFPE)+
              ' AND FPE_CODIGO='+IntToStr(CdFPE);
            Open;
            sPedido := '';
            while not Eof do
            Begin
              if sPedido <> '' then
                sPedido := sPedido + ';';
              if Trim(FieldByName('PDV_DOCUMENTO').asString) <> '' then
                sPedido := sPedido + FieldByName('PDV_DOCUMENTO').asString
              else
                sPedido := sPedido + FieldByName('PDV_CODIGO').asString;
              Next;
            end;
            zrlPedidos.Caption := sPedido;
          end;
          Entidade.Close;
          Entidade.ParamByName('CNC_CODIGO').asInteger := CdPDVCNC;
          Entidade.ParamByName('PDV_CODIGO').asInteger := CdPDV;
          Entidade.Open;
          report.Preview;
          Close;
        end;

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

procedure TfMxFaturarPendentesConvenio.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  if DM.Configuracao1.Empresa = empMotical then
    ckbFaturarTodos.Checked := True;
  cmbCampo.ItemIndex := 0;
  edtLocalizar.SetFocus;
end;

procedure TfMxFaturarPendentesConvenio.SB_LocCabClick(Sender: TObject);
begin
  if (cmbCampo.ItemIndex=0) and
     (not VerificaInteiroBranco(edtLocalizar.Text)) then
    Raise exception.Create('Código inválido!');
  Entidade.Localizar;
end;

procedure TfMxFaturarPendentesConvenio.FormCreate(Sender: TObject);
begin
  Entidade := Cliente1;
  vDataBase := DM.Configuracao1.Data;
  try
    DBGrid1.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_FatPend_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxFaturarPendentesConvenio.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
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

procedure TfMxFaturarPendentesConvenio.FormKeyPress(Sender: TObject;
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

procedure TfMxFaturarPendentesConvenio.Cliente1CalcFields(DataSet: TDataSet);
var
  vTotal: Double;
begin
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT SUM(ROUND((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*ROUND(I1.IPV_PRECO_DESC,2),2)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1, CLIENTE C1 '+
      ' WHERE C1.CNC_CONVENIO='+IntToStr(Entidade.CodigoCNC)+
      ' AND C1.CLI_CONVENIO='+IntToStr(Entidade.CodigoCLI)+
      ' AND P1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND P1.PDV_SITUACAO=4 '+
      ' AND P1.PDV_TIPO_VENDA=1 '+    //Venda Pendente
      ' AND P1.PDV_TITULO_GERADO=0 '+
      ' AND P1.PDV_DT_ENTREGA<="'+MesDia(vDataBase)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO '+
      ' AND P1.CNC_CLIENTE=C1.CNC_CODIGO '+
      ' AND P1.CLI_CODIGO=C1.CLI_CODIGO ';
    Open;
    vTotal := FieldByName('TOTAL').asFloat;
    Close;
    SQL.Text := 'SELECT SUM(ROUND(P1.PDV_FRETE,2)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, CLIENTE C1 '+
      ' WHERE C1.CNC_CONVENIO='+IntToStr(Entidade.CodigoCNC)+
      ' AND C1.CLI_CONVENIO='+IntToStr(Entidade.CodigoCLI)+
      ' AND P1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND P1.PDV_SITUACAO=4 '+
      ' AND P1.PDV_TIPO_VENDA=1 '+    //Venda Pendente
      ' AND P1.PDV_TITULO_GERADO=0 '+
      ' AND P1.PDV_DT_ENTREGA<="'+MesDia(vDataBase)+'" '+
      ' AND P1.CNC_CLIENTE=C1.CNC_CODIGO '+
      ' AND P1.CLI_CODIGO=C1.CLI_CODIGO ';
    Open;
    vTotal := vTotal + FieldByName('TOTAL').asFloat;

    if vTotal > 0 then
      Cliente1.FieldByName('TOTAL').asString := Format('%.2f',[vTotal])
    else
      Cliente1.FieldByName('TOTAL').asString := '0,00';
  end;
end;

end.

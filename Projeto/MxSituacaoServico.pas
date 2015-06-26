unit MxSituacaoServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  DBCtrls, Menus, Cliente, Variants,
  Item_de_Estoque, Usuario, Pedido_de_Venda, Item_Pedido_Venda, dbcgrids,
  ADODB;

type
  TfMxSituacaoServico = class(TForm)
    Panel3: TPanel;
    Label27: TLabel;
    Label23: TLabel;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Label1: TLabel;
    edtCodigoPDV: TEdit;
    Label10: TLabel;
    edtRazaoSocial: TEdit;
    Cliente1: TCliente;
    DSItem_Pedido_Venda1: TDataSource;
    DSPedido_de_Venda1: TDataSource;
    Label32: TLabel;
    edtDocumento: TEdit;
    Label33: TLabel;
    edtCaixa: TEdit;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    SB_Loc: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Situacao1: TMenuItem;
    Localizar1: TMenuItem;
    Label2: TLabel;
    cmbSituacao: TComboBox;
    SB_FinalizarPedido: TSpeedButton;
    Pedido_de_Venda1: TPedido_de_Venda;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Item_Pedido_Venda1CNC_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_CODIGO: TIntegerField;
    Item_Pedido_Venda1FUN_CODIGO: TIntegerField;
    Item_Pedido_Venda1IEB_CODIGO: TIntegerField;
    Item_Pedido_Venda1PDV_CODIGO: TIntegerField;
    Item_Pedido_Venda1SEC_CODIGO: TIntegerField;
    Item_Pedido_Venda1PRD_CODIGO: TIntegerField;
    Item_Pedido_Venda1TBP_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_ENTREGA: TSmallintField;
    Item_Pedido_Venda1IPV_AVISTA: TSmallintField;
    Item_Pedido_Venda1IPV_QUANTIDADE: TFloatField;
    Item_Pedido_Venda1IPV_DESCONTO: TFloatField;
    Item_Pedido_Venda1IPV_BONIFICACAO: TFloatField;
    Item_Pedido_Venda1CNC_LOCAL_ESTOQUE: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO: TFloatField;
    Item_Pedido_Venda1IPV_SITUACAO: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO_DESC: TFloatField;
    Item_Pedido_Venda1IPV_NOTA: TIntegerField;
    Item_Pedido_Venda1IPV_ITEMNOTA: TIntegerField;
    Item_Pedido_Venda1IPV_PRECO_NOTA: TFloatField;
    Item_Pedido_Venda1IPV_PENDENCIA: TIntegerField;
    Item_Pedido_Venda1IPV_ESTOQUE_LOCAL: TFloatField;
    Item_Pedido_Venda1IPV_ESTOQUE_EXTERNO: TFloatField;
    Item_Pedido_Venda1IPV_PRECO_SUGERIDO: TFloatField;
    Item_Pedido_Venda1IPV_DIAS_ENTREGA: TIntegerField;
    Item_Pedido_Venda1SERVICO: TStringField;
    Item_Pedido_Venda1Situacao: TStringField;
    Item_Pedido_Venda1DtEntrada: TStringField;
    Item_Pedido_Venda1DtSaida: TStringField;
    Item_Pedido_Venda1IPV_DT_ENTRADA: TDateTimeField;
    Item_Pedido_Venda1IPV_DT_SAIDA: TDateTimeField;
    memObservacao: TMemo;
    Item_Pedido_Venda1IPV_SERVICO: TIntegerField;
    Item_Pedido_Venda1USU_CODIGO: TIntegerField;
    Item_Pedido_Venda1IPV_OBSERVACAO: TStringField;
    Item_Pedido_Venda1IPV_DT_ALTERADO: TDateTimeField;
    Item_Pedido_Venda1IPV_DT_CADASTRO: TDateTimeField;
    DBCtrlGrid1: TDBCtrlGrid;
    Label3: TLabel;
    DBText1: TDBText;
    DSItem_Pedido_Venda2: TDataSource;
    DBText2: TDBText;
    DBText3: TDBText;
    Item_Pedido_Venda2: TQuery;
    Item_Pedido_Venda2PRD_CODIGO: TIntegerField;
    Item_Pedido_Venda2SERVICO: TStringField;
    Item_Pedido_Venda2IPV_QUANTIDADE: TFloatField;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_LocClick(Sender: TObject);
    procedure Localizar1Click(Sender: TObject);
    procedure Cliente1BeforeOpen(DataSet: TDataSet);
    procedure SB_FinalizarPedidoClick(Sender: TObject);
    procedure Pedido_de_Venda1AfterOpen(DataSet: TDataSet);
    procedure Item_Pedido_Venda1BeforeOpen(DataSet: TDataSet);
    procedure Item_Pedido_Venda1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade:TPedido_de_Venda;
    Flag: integer;
  end;

var
  fMxSituacaoServico: TfMxSituacaoServico;

implementation
Uses
  UDM, funcoes, CdCliente, MxSPediProd, DigSenha
;
{$R *.DFM}

procedure TfMxSituacaoServico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfMxSituacaoServico.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  if (DM.Configuracao1.Empresa = empMotical) then //Motical
    cmbCampo.ItemIndex := 1 //Caixa
  else
    cmbCampo.ItemIndex := 0; //Código do Pedido
  edtLocalizar.SetFocus;
end;

procedure TfMxSituacaoServico.FormCreate(Sender: TObject);
begin
  Entidade := Pedido_de_Venda1;
  if DM.Configuracao1.Empresa = empLBM then
  Begin
    Item_Pedido_Venda1.SQL.Text := 'SELECT I1.* , P1.PRD_DESCRICAO AS SERVICO '+
      ' FROM ITEM_DE_PEDIDO_DE_VENDA I1, PRODUTO P1 '+
      ' WHERE I1.CNC_CODIGO=:CNC_CODIGO '+
      ' AND I1.PDV_CODIGO=:PDV_CODIGO '+
      ' AND I1.PRD_CODIGO=P1.PRD_CODIGO '+
      ' ORDER BY P1.PRD_NIVEL, I1.IPV_CODIGO ';
  end;

  Flag := 0;
end;

procedure TfMxSituacaoServico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    Close;
  end;
end;

procedure TfMxSituacaoServico.SB_LocClick(Sender: TObject);
var
  CdCNC, CdPDV, CdIPV, CdPRD: integer;
  Trans:Boolean;
begin
  if not VerificaInteiroBranco(edtLocalizar.text) then
    Raise exception.Create('Número inválido!');

  //Seleciona o pedido
  with Entidade do
  Begin
    Close;
    case cmbCampo.ItemIndex of
      0:Begin //PDV_CODIGO
          SQL.Text := ' SELECT * FROM PEDIDO_DE_VENDA '+
            ' WHERE PDV_CODIGO='+edtLocalizar.Text+
            ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' AND PDV_SITUACAO BETWEEN 0 and 2 '+ //Fora os Prontos e Entregues
            ' AND PDV_SITUACAO<>1 ';              //Fora os Cancelados
        end;
      1:Begin //PDV_CAIXA
          SQL.Text := ' SELECT * FROM PEDIDO_DE_VENDA '+
            ' WHERE PDV_CAIXA="'+edtLocalizar.Text+'" '+
            ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' AND PDV_SITUACAO BETWEEN 0 and 2 '+ //Fora os Prontos e os Entregues
            ' AND PDV_SITUACAO<>1 ';              //Fora os Cancelados
        end;
    end;
    Open;
  end;

  if (DM.Configuracao1.CodigoCNC = 3) and (Flag = 0) then
  begin
    with Item_Pedido_Venda2 do
    begin
      Close;
      ParamByName('PDV_CODIGO').AsInteger := strtoint(edtLocalizar.Text);
      ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
      Open;
    end;

    Flag := 1;

    Exit;
  end;

  CdCNC := Entidade.CodigoCNC;
  CdPDV := Entidade.CodigoPDV;

  if DM.Configuracao1.Empresa = empLBM then
  Begin
    //Serviços Finalizados. Não tem Qualidade
    if (Entidade.Situacao = 2) then //Laboratório
    Begin
      if MessageDlg('Deseja dar saída da Oficina?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        Trans:=false;
        with DM.Database2 do
        begin
          try
            StartTransaction;
            Trans:=True;

            ExecutaSQL(DM.QR_Comandos, 'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
              ' IPV_SITUACAO=3 '+
              ',IPV_DT_SAIDA="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND PDV_CODIGO='+IntToStr(CdPDV));

            ExecutaSQL(DM.QR_Comandos, 'UPDATE PEDIDO_DE_VENDA SET '+
              ' PDV_SITUACAO = 3 '+ //Serviço Pronto
              ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND PDV_CODIGO='+IntToStr(CdPDV));

            if not Entidade.GeraLog(6520,CdCNC,CdPDV,'Saida da Oficina') then
            Begin
              ShowMessage('Falha ao gerar LOG!');
              Raise exception.Create('');
            end;

            Commit;
            ShowMessage('Serviço pronto para entrega!');
          except
            if trans then
            Begin
              RollBack;
              ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
            end;
          end;
        end;
      end
    end
    else if (Entidade.Situacao <= 1) then //Laboratório
    Begin
      if MessageDlg('Deseja dar entrada na Oficina?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        Trans:=false;
        with DM.Database2 do
        begin
          try
            StartTransaction;
            Trans:=True;

            ExecutaSQL(DM.QR_Comandos, 'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
              ' IPV_SITUACAO = 2 '+
              ',IPV_DT_ENTRADA ="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND PDV_CODIGO='+IntToStr(CdPDV));

            ExecutaSQL(DM.QR_Comandos, 'UPDATE PEDIDO_DE_VENDA SET '+
              ' PDV_SITUACAO = 2 '+ //Laboratório
              ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND PDV_CODIGO='+IntToStr(CdPDV));

            if not Entidade.GeraLog(6520,CdCNC,CdPDV,'Entrada na Oficina') then
            Begin
              ShowMessage('Falha ao gerar LOG!');
              Raise exception.Create('');
            end;

            Commit;
          except
            if trans then
            Begin
              RollBack;
              ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
            end;
          end;
        end;
      end
    end;
    Entidade.Close;
    Entidade.Open;
  end
  else //Diferente de Motical
  Begin
    with DM.QR_Consultas do
    begin
      close;
      sql.Text:='SELECT * FROM ITEM_DE_PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND PDV_CODIGO='+IntToStr(CdPDV)+
        ' AND IPV_SITUACAO<>3'+ //Itens Finalizados
        ' AND PRD_CODIGO IN '+
        ' (SELECT PRD_CODIGO FROM PRODUTO WHERE PRD_SERVICO=1) ';
      open;
    end;

    if (Entidade.Situacao = 2) and //Laboratório
       (DM.QR_Consultas.IsEmpty) then
    Begin
      If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6530)) < 0) then
        Raise exception.Create('Usuário não tem permissão para Controle de Qualidade!');
      if MessageDlg('Serviço foi aprovado pelo Controle de Qualidade?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Begin
        Trans:=false;
        with DM.Database2 do
        begin
          try
            StartTransaction;
            Trans:=True;

            Flag := 0;

            ExecutaSQL(DM.QR_Comandos, 'UPDATE PEDIDO_DE_VENDA SET '+
              ' PDV_SITUACAO = 3 '+ //Serviço Pronto
              ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND PDV_CODIGO='+IntToStr(CdPDV));
            Entidade.Close;
            Entidade.Open;
            Entidade.LocalizarCod(CdPDV, CdCNC);
            cmbSituacao.ItemIndex := 3;

            if not Entidade.GeraLog(6530,CdCNC,CdPDV,'Aprovado pelo Controle de Qualidade') then
            Begin
              ShowMessage('Falha ao gerar LOG!');
              Raise exception.Create('');
            end;

            Commit;
          except
            if trans then
            Begin
              RollBack;
              ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
            end;
          end;
        end;
      end;
    end
    else
    Begin
      while not Item_Pedido_Venda1.Eof do
      begin
        CdIPV := Item_Pedido_Venda1.CodigoIPV;
        CdPRD := Item_Pedido_Venda1.CodigoPRD;
        if Item_Pedido_Venda1.Situacao=0 then
        begin
          If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6520)) < 0) then
            Raise exception.Create('Usuário não tem permissão para Entrada/Saída de Serviço!');
          if MessageDlg('Deseja iniciar o serviço '+Item_Pedido_Venda1.FieldByName('Servico').asString,mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            Trans:=false;
            with DM.Database2 do
            begin
              try
                StartTransaction;
                Trans:=True;

                ExecutaSQL(DM.QR_Comandos, 'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
                  ' IPV_SITUACAO = 2 '+
                  ',IPV_DT_ENTRADA ="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
                  ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
                  ' AND IPV_CODIGO='+IntToStr(CdIPV));
                Item_Pedido_Venda1.Close;
                Item_Pedido_Venda1.Open;

                if Entidade.Situacao = 0 then
                Begin
                  ExecutaSQL(DM.QR_Comandos, 'UPDATE PEDIDO_DE_VENDA SET '+
                    ' PDV_SITUACAO = 2 '+ //Laboratório
                    ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                    ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
                    ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
                    ' AND PDV_CODIGO='+IntToStr(CdPDV));
                  cmbSituacao.ItemIndex := 2;
                end;

                if not Entidade.GeraLog(6520,CdCNC,CdPDV,'Entrada no servico '+IntToStr(CdPRD)) then
                Begin
                  ShowMessage('Falha ao gerar LOG!');
                  Raise exception.Create('');
                end;

                Commit;
                Break;
              except
                if trans then
                Begin
                  RollBack;
                  ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
                end;
              end;
            end;
          end
          else
            Break;
        End
        else
        if Item_Pedido_Venda1.Situacao=2 then
        Begin
          If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6520)) < 0) then
            Raise exception.Create('Usuário não tem permissão para Controle de Qualidade!');
          if MessageDlg('Deseja finalizar o serviço '+Item_Pedido_Venda1.FieldByName('Servico').asString,mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            Trans:=false;
            with DM.Database2 do
            begin
              try
                StartTransaction;
                Trans:=True;

                ExecutaSQL(DM.QR_Comandos, 'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
                  ' IPV_SITUACAO=3 '+
                  ',IPV_DT_SAIDA="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
                  ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
                  ' AND IPV_CODIGO='+IntToStr(CdIPV));
                Item_Pedido_Venda1.Close;
                Item_Pedido_Venda1.Open;

                if not Entidade.GeraLog(6520,CdCNC,CdPDV,'Saida no servico '+IntToStr(CdPRD)) then
                Begin
                  ShowMessage('Falha ao gerar LOG!');
                  Raise exception.Create('');
                end;

                Commit;

                with DM.QR_Consultas do
                begin
                  close;
                  sql.Text:='SELECT * FROM ITEM_DE_PEDIDO_DE_VENDA '+
                    ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
                    ' AND PDV_CODIGO='+IntToStr(CdPDV)+
                    ' AND IPV_SITUACAO<>3'+
                    ' AND PRD_CODIGO IN '+
                    ' (SELECT PRD_CODIGO FROM PRODUTO WHERE PRD_SERVICO=1) ';
                  open;
                  if IsEmpty then
                    showmessage('Os serviços do pedido forão finalizados!');
                end;
                Break;
              except
                if trans then
                Begin
                  RollBack;
                  ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
                end;
              end;
            end;
          end
          else
            Break;
        end;
        Item_Pedido_Venda1.Next;
      end;
    end;
  end;
  Item_Pedido_Venda1.Close;
  Item_Pedido_Venda1.Open;

  Item_Pedido_Venda2.Close;
  Item_Pedido_Venda2.Open;

  edtLocalizar.SetFocus;
end;

procedure TfMxSituacaoServico.Localizar1Click(Sender: TObject);
begin
  SB_LocClick(sender);
end;

procedure TfMxSituacaoServico.Cliente1BeforeOpen(DataSet: TDataSet);
begin
  Cliente1.ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
  Cliente1.ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
end;

procedure TfMxSituacaoServico.SB_FinalizarPedidoClick(Sender: TObject);
var
  CdCNC, CdPDV, CdIPV, CdPRD: integer;
  Trans: Boolean;
  sMotivo: string;
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o Serviço!');
  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6540)) < 0) then
    Raise exception.Create('Usuário não tem permissão para voltar situação!');

  sMotivo := '';
  CdCNC := Entidade.CodigoCNC;
  CdPDV := Entidade.CodigoPDV;

  sMotivo := UpperCase(InputBox('Voltar Situação', 'Motivo:', ''));

  if Length(Trim(sMotivo)) < 3 then
    Raise exception.Create('É obrigatório justificar!');

  if Entidade.Situacao = 3 then //Pronto para ser Entregue
    Raise exception.Create('Não é permitido voltar essa situação!');

  if DM.Configuracao1.Empresa = empLBM then
  Begin
    if Entidade.Situacao = 3 then //
    Begin
      if MessageDlg('Deseja voltar para a Oficina?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        Trans:=false;
        with DM.Database2 do
        begin
          try
            StartTransaction;
            Trans:=True;

            ExecutaSQL(DM.QR_Comandos, 'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
              ' IPV_SITUACAO = 2 '+
              ',IPV_DT_SAIDA=NULL '+
              ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND PDV_CODIGO='+IntToStr(CdPDV));

            ExecutaSQL(DM.QR_Comandos, 'UPDATE PEDIDO_DE_VENDA '+
              ' SET PDV_SITUACAO = 2 '+ //Oficina
              ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND PDV_CODIGO='+IntToStr(CdPDV));

            if not Entidade.GeraLog(6540,CdCNC,CdPDV,'VOLTAR OFICINA -'+sMotivo) then
            Begin
              ShowMessage('Falha ao gerar LOG!');
              Raise exception.Create('');
            end;

            Commit;
          except
            if trans then
            Begin
              RollBack;
              ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
            end;
          end;
        end;
      end;
    end
    else if Entidade.Situacao = 2 then
    Begin
      if MessageDlg('Deseja voltar para a recepção?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        Trans:=false;
        with DM.Database2 do
        begin
          try
            StartTransaction;
            Trans:=True;

            ExecutaSQL(DM.QR_Comandos, 'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
              ' IPV_SITUACAO = 2 '+
              ',IPV_DT_ENTRADA=NULL '+
              ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND PDV_CODIGO='+IntToStr(CdPDV));

            ExecutaSQL(DM.QR_Comandos, 'UPDATE PEDIDO_DE_VENDA '+
              ' SET PDV_SITUACAO = 0 '+ //Recepção
              ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND PDV_CODIGO='+IntToStr(CdPDV));

            if not Entidade.GeraLog(6540,CdCNC,CdPDV,'VOLTAR RECEPCAO -'+sMotivo) then
            Begin
              ShowMessage('Falha ao gerar LOG!');
              Raise exception.Create('');
            end;

            Commit;
          except
            if trans then
            Begin
              RollBack;
              ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
            end;
          end;
        end;
      end;
    end;
    Entidade.Close;
    Entidade.Open;
  end
  else
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT I1.*, P1.PRD_DESCRICAO AS SERVICO '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA I1, PRODUTO P1 '+
        ' WHERE I1.CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND I1.PDV_CODIGO='+IntToStr(CdPDV)+
        ' AND P1.PRD_SERVICO=1 '+
        ' AND I1.PRD_CODIGO=P1.PRD_CODIGO '+
        ' ORDER BY P1.PRD_NIVEL DESC, I1.IPV_CODIGO DESC';
      Open;
    end;
    while not DM.QR_Consultas.Eof do
    Begin
      CdIPV := DM.QR_Consultas.FieldByName('IPV_CODIGO').asInteger;
      CdPRD := DM.QR_Consultas.FieldByName('PRD_CODIGO').asInteger;
      if DM.QR_Consultas.FieldByName('IPV_SITUACAO').asInteger=3 then
      begin
        if MessageDlg('Deseja cancelar a finalização do serviço '+DM.QR_Consultas.FieldByName('Servico').asString,mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          Trans:=false;
          with DM.Database2 do
          begin
            try
              StartTransaction;
              Trans:=True;

              ExecutaSQL(DM.QR_Comandos, 'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
                ' IPV_SITUACAO = 2 '+
                ',IPV_DT_SAIDA=NULL '+
                ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
                ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
                ' AND IPV_CODIGO='+IntToStr(CdIPV));
              Item_Pedido_Venda1.Close;
              Item_Pedido_Venda1.Open;

              if not Entidade.GeraLog(6540,CdCNC,CdPDV,'FINAL SER:'+IntToStr(CdPRD)+' -'+sMotivo) then
              Begin
                ShowMessage('Falha ao gerar LOG!');
                Raise exception.Create('');
              end;

              Commit;
              Break;
            except
              if trans then
              Begin
                RollBack;
                ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
              end;
            end;
          end;
        end
        else
          Break;
      End
      else if DM.QR_Consultas.FieldByName('IPV_SITUACAO').asInteger=2 then
      Begin
        if MessageDlg('Deseja cancelar o início do serviço '+DM.QR_Consultas.FieldByName('Servico').asString,mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          Trans:=false;
          with DM.Database2 do
          begin
            try
              StartTransaction;
              Trans:=True;

              ExecutaSQL(DM.QR_Comandos, 'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
                ' IPV_SITUACAO=0 '+
                ',IPV_DT_ENTRADA=NULL '+
                ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
                ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
                ' AND IPV_CODIGO='+IntToStr(CdIPV));
              with DM.QR_Consultas do
              begin
                close;
                sql.Text:='SELECT * FROM ITEM_DE_PEDIDO_DE_VENDA '+
                  ' WHERE CNC_CODIGO ='+IntToStr(CdCNC)+
                  ' AND PDV_CODIGO='+IntToStr(CdPDV)+
                  ' AND (IPV_SITUACAO=2 OR IPV_SITUACAO=3) ';
                open;
                if IsEmpty then
                begin
                  ExecutaSQL(DM.QR_Comandos, 'UPDATE PEDIDO_DE_VENDA '+
                    ' SET PDV_SITUACAO = 0 '+ //Recepção
                    ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                    ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
                    ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
                    ' AND PDV_CODIGO='+IntToStr(CdPDV));
                  Entidade.Close;
                  Entidade.Open;
                  cmbSituacao.ItemIndex := 0;
                end;
              end;
              Item_Pedido_Venda1.Close;
              Item_Pedido_Venda1.Open;

              if not Entidade.GeraLog(6540,CdCNC,CdPDV,'INICIO SER:'+IntToStr(CdPRD)+' -'+sMotivo) then
              Begin
                ShowMessage('Falha ao gerar LOG!');
                Raise exception.Create('');
              end;

              Commit;
              Break;
            except
              if trans then
              Begin
                RollBack;
                ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
              end;
            end;
          end;
        end
        else
          Break;
      end;
      DM.QR_Consultas.Next;
    end;
  end;
  Item_Pedido_Venda1.Close;
  Item_Pedido_Venda1.Open;
  edtLocalizar.SetFocus;
end;

procedure TfMxSituacaoServico.Pedido_de_Venda1AfterOpen(DataSet: TDataSet);
begin
  if Entidade.IsEmpty then
    Entidade.LimpaCampos
  else
    Entidade.CarregaDados;
  with Cliente1 do
  Begin
    if (CodigoCNC <> Entidade.ClienteCNC) or
       (CodigoCLI <> Entidade.CodigoCLI) then
    Begin
      Close;
      Open;
    end;
    edtRazaoSocial.Text:=RazaoSocial;
  end;
  with Item_Pedido_Venda1 do
  Begin
    Close;
    Open;
  end;
end;

procedure TfMxSituacaoServico.Item_Pedido_Venda1BeforeOpen(
  DataSet: TDataSet);
begin
  Item_Pedido_Venda1.ParamByName('CNC_CODIGO').AsInteger := Entidade.CodigoCNC;
  Item_Pedido_Venda1.ParamByName('PDV_CODIGO').AsInteger := Entidade.CodigoPDV;
end;

procedure TfMxSituacaoServico.Item_Pedido_Venda1CalcFields(
  DataSet: TDataSet);
begin
  with Item_Pedido_Venda1 do
  Begin
    if DataEntrada > 0 then
      FieldByName('DtEntrada').AsString := formatDateTime('dd/mm/yyyy hh:mm',DataEntrada)
    else
      FieldByName('DtEntrada').AsString := '';

    if DataSaida > 0 then
      FieldByName('DtSaida').AsString := formatDateTime('dd/mm/yyyy hh:mm',DataSaida)
    else
      FieldByName('DtSaida').AsString := '';
  end;
end;

end.

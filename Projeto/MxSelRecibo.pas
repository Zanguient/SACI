unit MxSelRecibo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Mask, SQuery, DateUtils,
  Forma_de_Pagamento, Pedido_de_Venda, Titulo_receber;

type
  TfmxSelRecibo = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    bitConfirmar: TBitBtn;
    bitCancelar: TBitBtn;
    rdgReciboSimples: TRadioButton;
    rdgReciboTotal: TRadioButton;
    rdgReciboAvulso: TRadioButton;
    edtValorRecibo: TEdit;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    Pedido_de_Venda1: TPedido_de_Venda;
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
    Pedido_de_Venda1PDV_NOTA_FISCAL: TIntegerField;
    Pedido_de_Venda1AGF_CODIGO: TIntegerField;
    Pedido_de_Venda1FPG_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_TIPO_PAG: TIntegerField;
    Pedido_de_Venda1PDV_ENTRADA: TFloatField;
    Pedido_de_Venda1CNC_CLIENTE: TIntegerField;
    Pedido_de_Venda1PDV_EM_USO: TIntegerField;
    Pedido_de_Venda1PDV_ACRESCIMO: TFloatField;
    Pedido_de_Venda1PDV_DT_ALTERADO: TDateTimeField;
    Pedido_de_Venda1PDV_MAQUINA: TIntegerField;
    Pedido_de_Venda1PDV_MELHOR_DATA: TDateTimeField;
    Pedido_de_Venda1PDV_VENCIMENTOS: TStringField;
    Pedido_de_Venda1PDV_MEDIA_PAGAMENTO: TIntegerField;
    Pedido_de_Venda1PDV_NOTA_CUPOM: TIntegerField;
    Pedido_de_Venda1PDV_IMPRESSO: TIntegerField;
    Pedido_de_Venda1Cliente: TStringField;
    Pedido_de_Venda1CNPJ_CPF: TStringField;
    Pedido_de_Venda1CGF_RG: TStringField;
    Pedido_de_Venda1SPC: TStringField;
    Pedido_de_Venda1OK: TStringField;
    Pedido_de_Venda1CupomFiscal: TStringField;
    Pedido_de_Venda1PDV_DT_EMISSAO_VENDA: TDateTimeField;
    Pedido_de_Venda1PDV_DT_DEVOLUCAO: TDateTimeField;
    Titulo_receber1: TTitulo_receber;
    ckbModoGrafico: TCheckBox;
    Bevel1: TBevel;
    Label1: TLabel;
    Edit1: TEdit;
    procedure bitConfirmarClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure rdgReciboAvulsoClick(Sender: TObject);
    procedure rdgReciboSimplesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    CdCNC, CdPDV, CdTRC, CdCLI: integer;
  end;

var
  fmxSelRecibo: TfmxSelRecibo;

implementation

uses UDM, funcoes, MxPedidoRapido, MxSPediLocImpPromis,
  URecibo, UReciboLBM, UReciboTotalLBM, UReciboGrafico;

{$R *.DFM}

procedure TfmxSelRecibo.bitConfirmarClick(Sender: TObject);
const
  mes : array [1..12] of string = ('janeiro','fevereiro','marco','abril','maio','junho','julho','agosto','setembro','outubro','novembro','dezembro');
var
  SomenteEntrada, vPrazo, CH: Boolean;
  TotPedido : double;
  sMesReferencia: string;
begin
  SomenteEntrada := False;
  vPrazo := True;
  TotPedido := 0;
  CH := False;

  if rdgReciboAvulso.Checked then
    if not VerificaFloatBranco(edtValorRecibo.Text) then
      Raise exception.Create('Valor inválido!');

  if CdPDV > 0 then
  Begin
    with Pedido_de_Venda1 do
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := CdCNC;
      ParamByName('PDV_CODIGO').asInteger := CdPDV;
      Open;

      with Titulo_receber1 do
      Begin
        Close;
        SQL.Text := 'SELECT MAX(TRC_CODIGO) AS TRC '+
          ',SUM(TRC_VALOR) AS TOTAL FROM TITULO_A_RECEBER '+
          ' WHERE PDV_CODIGO='+IntToStr(CdPDV)+
          ' AND TRC_SITUACAO<>5 '+
          ' AND CNC_CODIGO='+IntToStr(CdCNC);
        Open;
        TotPedido := FieldByName('TOTAL').asFloat;
        CdTRC := FieldByName('TRC').asInteger;

        Close;
        SQL.Text := 'SELECT TRC_CODIGO FROM TITULO_A_RECEBER '+
          ' WHERE PDV_CODIGO='+IntToStr(CdPDV)+
          ' AND TRC_SITUACAO<>5 '+
          ' AND CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND TRC_TIPO_PAG=6 ';
        Open;
        if not IsEmpty then
          CH := True;
      end;
    end;

    with Forma_de_Pagamento1 do
    Begin
      Close;
      ParamByName('FPG_CODIGO').asInteger := Pedido_de_Venda1.CodigoFPG;
      Open;
    end;

    if (Forma_de_Pagamento1.Prazo <> '') then
      if (Forma_de_Pagamento1.Prazo[1] <> '0') then
      Begin
        if DM.Configuracao1.Empresa = empLBM then
        Begin
          if Pedido_de_Venda1.TipoPag = 412 then //Boleto Bancário
            Raise Exception.Create('Pagamento através de Boleto!');
          if Pedido_de_Venda1.TipoPag = 13 then // Cartão
            Raise Exception.Create('Pagamento através de Cartão!');
        end;
      end
      else
      Begin
        if Forma_de_Pagamento1.Prazo = '0' then
          vPrazo := False;
        if (Pedido_de_Venda1.TipoPag = 412) or
           (Pedido_de_Venda1.TipoPag = 13) then
          SomenteEntrada := True;
      end;
  end
  else
  Begin
    with Titulo_receber1 do
    Begin
      Close;
      SQL.Text := 'SELECT TRC_CODIGO FROM TITULO_A_RECEBER '+
        ' WHERE TRC_CODIGO='+IntToStr(CdTRC)+
        ' AND TRC_SITUACAO<>5 '+
        ' AND CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND TRC_TIPO_PAG=6 ';
      Open;
      if not IsEmpty then
        CH := True;
    end;
  end;

  if ckbModoGrafico.Checked then
  Begin
    Application.CreateForm(Trpt_ReciboGrafico,rpt_ReciboGrafico);
    with rpt_ReciboGrafico do
    Begin
      if (DM.Configuracao1.Empresa = empLBM) and
         (DM.Configuracao1.CodigoCNC = 3) then
        zrlAVistaPrazo.Caption := 'Proveniente de serviço a '
      else
        zrlAVistaPrazo.Caption := 'Proveniente de venda a ';

      if rdgReciboSimples.Checked then //Por Título
      Begin

      end
      else if rdgReciboTotal.Checked then //Total
      Begin
        vTotalRecibo := TotPedido;
        vReciboTotal := True;
      end
      else //Avulso
      Begin
        if (DM.Configuracao1.Empresa = empLBM) and
           (DM.Configuracao1.CodigoCNC = 3) then
          zrlAVistaPrazo.Caption := 'Proveniente de parte do servico a '
        else
          zrlAVistaPrazo.Caption := 'Proveniente de parte da venda a ';
        vTotalRecibo := StrToFloat(edtValorRecibo.Text);
        vReciboTotal := True;
      end;
      Tag := 1;
      SomenteEntra := SomenteEntrada;
      VendaPz := vPrazo;
      Entidade. Close;
      if (CdPDV > 0) and (rdgReciboSimples.Checked) then
        Entidade.SQL.Text := 'SELECT * FROM TITULO_A_RECEBER '+
          ' WHERE PDV_CODIGO='+IntToStr(CdPDV)+
          ' AND CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND TRC_SITUACAO<>5 '
      else
        Entidade.SQL.Text := 'SELECT * FROM TITULO_A_RECEBER '+
          ' WHERE TRC_CODIGO='+IntToStr(CdTRC)+
          ' AND CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND TRC_SITUACAO<>5 ';
      Entidade.Open;

      //Dados do Título
      if Entidade.CodigoPDV <= 0 then
      Begin
        if (DM.Configuracao1.Empresa = empLBM) and
           ((Entidade.CodigoCCX = 177) or    //Condomínio
            (Entidade.CodigoCCX = 280) or    //Cond. Água/Luz
            (Entidade.CodigoCCX = 281) or    //Cond. Seguro
            (Entidade.CodigoCCX = 282)) then //Cond. IPTU
        Begin
          if DayOf(Entidade.Vencimento) < 15 then
          Begin
            if MonthOf(Entidade.Vencimento) = 1 then
              sMesReferencia := Mes[12]+'/'+IntToStr(YearOf(Entidade.Vencimento)-1)
            else
              sMesReferencia := Mes[MonthOf(Entidade.Vencimento)-1]+'/'+IntToStr(YearOf(Entidade.Vencimento));
          end
          else
            sMesReferencia := Mes[MonthOf(Entidade.Vencimento)]+'/'+IntToStr(YearOf(Entidade.Vencimento));

          if (Entidade.CodigoCCX = 177) then    //Condomínio
            zrlAVistaPrazo.Caption := 'Aluguel/Condomínio referente ao mês '+sMesReferencia
          else if (Entidade.CodigoCCX = 280) then    //Cond. Água/Luz
            zrlAVistaPrazo.Caption := 'Taxa de Água/Luz do Condomínio referente ao mês '+sMesReferencia
          else if (Entidade.CodigoCCX = 281) then    //Cond. Seguro
            zrlAVistaPrazo.Caption := 'Renovação do Seguro referente ao ano '+formatDateTime('YYYY',DM.Configuracao1.Data)
          else if (Entidade.CodigoCCX = 282) then //Cond. IPTU
            zrlAVistaPrazo.Caption := 'Taxa do IPTU referente ao ao ano '+formatDateTime('YYYY',DM.Configuracao1.Data);
        end
        else
          zrlAVistaPrazo.Enabled := False;
      end
      else
      Begin
        //Verificar se é Venda A Vista ou A Prazo
        if VendaPz then
          zrlAVistaPrazo.Caption := zrlAVistaPrazo.Caption + ' prazo'
        else
          zrlAVistaPrazo.Caption := zrlAVistaPrazo.Caption + ' vista';
        zrlAVistaPrazo.Caption := zrlAVistaPrazo.Caption + ' conforme pedido '+IntToStr(Entidade.CodigoPDV);
      end;
      report.Preview;
      Close;
    end;
  end
  else //Não Gráfico
  Begin
    if rdgReciboSimples.Checked then
    begin
      Application.CreateForm(Trpt_ReciboLBM,rpt_ReciboLBM);
      with rpt_ReciboLBM do
      Begin
        Tag := 1;
        if (DM.Configuracao1.Empresa <> empLBM) or
           (DM.Configuracao1.CodigoCNC = 3) then
        Begin
          report.Height      := 32;
          zrbDetalhe.Height  := 32;
          zrlAssinatura.Caption := PreencheEspaco(zrlAssinatura.Width,'','_');
          zrlInicioCompactaLinha.FontStyle := [];
          zrlInicioCompactaLinha.Enabled := False;
          zrlFinalCompactaLinha.FontStyle := [];
          zrlFinalCompactaLinha.Enabled := False;
        end;
        SomenteEntra := SomenteEntrada;
        VendaPz := vPrazo;
        Titulo_receber1.Close;
        if CdPDV>0 then
          Titulo_receber1.SQL.Text := 'SELECT * FROM TITULO_A_RECEBER '+
            ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
            ' AND PDV_CODIGO='+IntToStr(CdPDV)+
            ' AND TRC_SITUACAO<>5 '
        else
          Titulo_receber1.SQL.Text := 'SELECT * FROM TITULO_A_RECEBER '+
            ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
            ' AND TRC_CODIGO='+IntToStr(CdTRC)+
            ' AND TRC_SITUACAO<>5 ';
        Titulo_receber1.Open;
        report.Preview;
        Close;
      end;
    end
    else //Não Grafico
    Begin
      if rdgReciboTotal.Checked then
      Begin
        if (Pedido_de_Venda1.TipoPag <> 6) and //Cheque
           (Pedido_de_Venda1.CodigoFPG <> 1) and
           (DM.Configuracao1.Empresa = empLBM) then //A Vista
          Raise Exception.Create('Recibo completo somente para Venda em Cheque ou A Vista!');
      end
      else if rdgReciboAvulso.Checked and
        (not VerificaFloatBranco(edtValorRecibo.Text)) then
        Raise Exception.Create('Valor inválido!');
      Application.CreateForm(Trpt_ReciboTotalLBM,rpt_ReciboTotalLBM);
      with rpt_ReciboTotalLBM do
      Begin
        Tag := 1;
        if (DM.Configuracao1.Empresa = empLBM) and
           (DM.Configuracao1.CodigoCNC = 3) then
          zrlDescricao1.Caption := 'Proveniente de servico a '
        else
          zrlDescricao1.Caption := 'Proveniente de venda a ';
        if (DM.Configuracao1.Empresa <> empLBM) or
           (DM.Configuracao1.CodigoCNC = 3) then
        Begin
          report.Height := 22;
          zrlDetalhe.Height := 22;
          zrlLinhaRodape.Top := zrlDetalhe.Height - 1;
        end;
        VendaPz := vPrazo;
        vCheque := CH;
        if rdgReciboAvulso.Checked then
        Begin
          if (DM.Configuracao1.Empresa = empLBM) and
             (DM.Configuracao1.CodigoCNC = 3) then
            zrlDescricao1.Caption := 'Proveniente de parte do servico a '
          else
            zrlDescricao1.Caption := 'Proveniente de parte da venda a';
          vTotalPedido := StrToFloat(edtValorRecibo.Text);
        end
        else
          vTotalPedido := TotPedido;
        CdPDV := self.Pedido_de_Venda1.CodigoPDV;
        Cliente1.Close;
        Cliente1.ParamByName('CNC_CODIGO').asInteger := self.Pedido_de_Venda1.ClienteCNC;
        Cliente1.ParamByName('CLI_CODIGO').asInteger := self.Pedido_de_Venda1.CodigoCLI;
        Cliente1.Open;
        report.Preview;
        Close;
      end;
    end;
  end;
end;

procedure TfmxSelRecibo.bitCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfmxSelRecibo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TfmxSelRecibo.FormCreate(Sender: TObject);
begin
  CdCNC := 0;
  CdPDV := 0;
  CdTRC := 0;
end;

procedure TfmxSelRecibo.rdgReciboAvulsoClick(Sender: TObject);
begin
  if rdgReciboAvulso.Checked then
  Begin
    edtValorRecibo.Color := clWindow;
    edtValorRecibo.Enabled := True;
    try
      edtValorRecibo.SetFocus;
    except
    end;
  end;
end;

procedure TfmxSelRecibo.rdgReciboSimplesClick(Sender: TObject);
begin
  if not rdgReciboAvulso.Checked then
  Begin
    edtValorRecibo.Color := AlteraCorComponentes;
    edtValorRecibo.Enabled := False;
    edtValorRecibo.Clear;
  end;
end;

procedure TfmxSelRecibo.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  try
    with DM do
    begin
      QR_Consultas.Close;
      QR_Consultas.SQL.Text := 'SELECT T1.CLI_RZ_SOCIAL FROM CLIENTE T1 '+
                               ' INNER JOIN PEDIDO_DE_VENDA T2 ON ' +
                               ' T1.CLI_CODIGO = T2.CLI_CODIGO '+
                               ' WHERE T2.PDV_CODIGO='+IntToStr(CdPDV)+
                               ' AND T2.CNC_CODIGO='+IntToStr(CdCNC);
      QR_Consultas.Open;

      Edit1.Text := QR_Consultas.FieldByName('CLI_RZ_SOCIAL').AsString;
    end;                                                   
  except
  end;
end;

end.

unit MxSelResumo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Mask, SQuery,
  Forma_de_Pagamento, Pedido_de_Venda, Titulo_receber;

type
  TfmxSelResumo = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    bitConfirmar: TBitBtn;
    bitCancelar: TBitBtn;
    rdgHistoricoCompras: TRadioButton;
    rdgResumoTitulo: TRadioButton;
    rdgExtratoCliente: TRadioButton;
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
    rdgEmbarque: TRadioButton;
    rdgResumoCompras: TRadioButton;
    Bevel1: TBevel;
    Edit1: TEdit;
    Label1: TLabel;
    procedure bitConfirmarClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    CdCNC, CdCLI: integer;
    sRazaoSocial: string;
    vCredito: Double;
    vDataINI: TDateTime;
  end;

var
  fmxSelResumo: TfmxSelResumo;

implementation

uses UDM, funcoes, UHistCli, MxSaldoDev, MxSelTitulos, UHistCliEmbarque,
  MxVirarData, UHistCliResumo;

{$R *.DFM}

procedure TfmxSelResumo.bitConfirmarClick(Sender: TObject);
Var
  ValorJuros, Soma, SomaSJuros, SomaComJuros, SomaPago, Valor:Double;
  sDataINI, CNC, sCredito, Situacao: string;
  CdPDV, CdPDVAnterior: integer;
begin
  sDataINI := '';
  if rdgHistoricoCompras.Checked or
     rdgResumoTitulo.Checked then
  Begin
    vDataINI := 0;
    Application.CreateForm(TfMxVirarData, fMxVirarData);
    with fMxVirarData do
    Begin
      Tag := 2;
      lblDescData.Caption := 'Data Inicial';
      ShowModal;
    end;
    if vDataINI > 0 then
    Begin
      if rdgHistoricoCompras.Checked then
        sDataINI := ' AND T1.PDV_DT_ENTREGA>="'+MesDia(vDataINI)+'" '
      else if rdgResumoTitulo.Checked then
        sDataINI := ' AND TRC_PAGAMENTO>="'+MesDia(vDataINI)+'" '
    end;
  end;

  if rdgHistoricoCompras.Checked then
  begin
    Application.CreateForm(Trpt_HistCli, rpt_HistCli);
    with rpt_HistCli do
    Begin
      Entidade.close;
      if DM.Configuracao1.Empresa = empLBM then
        Pedido_de_venda1.SQL.Text:='SELECT * '+
           ' FROM PEDIDO_DE_VENDA T1, ITEM_DE_PEDIDO_DE_VENDA T3'+
           ' WHERE T1.CLI_CODIGO='+IntToStr(CdCLI)+
           ' AND T1.CNC_CLIENTE='+IntToStr(CdCNC)+
           ' AND T1.PDV_SITUACAO=4 '+
           ' AND (T1.PDV_NOTA_FISCAL>0 OR T1.PDV_NOTA_FISCAL=-1 OR T1.PDV_NOTA_FISCAL=-2)'+
           ' AND T1.PDV_CODIGO=T3.PDV_CODIGO '+
           ' AND T1.CNC_CODIGO=T3.CNC_CODIGO '+
           ' ORDER BY T1.PDV_CODIGO'
      else
        Pedido_de_venda1.SQL.Text:='SELECT * '+
           ' FROM PEDIDO_DE_VENDA T1, ITEM_DE_PEDIDO_DE_VENDA T3 '+
           ' WHERE T1.CLI_CODIGO='+IntToStr(CdCLI)+
           ' AND T1.CNC_CLIENTE='+IntToStr(CdCNC)+
           ' AND T1.PDV_SITUACAO=4 '+
           sDataINI+
           ' AND T1.CNC_CODIGO=T3.CNC_CODIGO '+
           ' AND T1.PDV_CODIGO=T3.PDV_CODIGO '+
           ' ORDER BY T1.PDV_CODIGO';
      Pedido_de_venda1.open;
      total:=0;
      report.preview;
    end;
  end
  else if rdgResumoCompras.Checked then
  Begin
    Application.CreateForm(Trpt_HistCliResumo, rpt_HistCliResumo);
    with rpt_HistCliResumo do
    Begin
      Pedido_de_venda1.close;
      if DM.Configuracao1.Empresa = empLBM then
      Begin
        Pedido_de_venda1.Close;
        Pedido_de_venda1.SQL.Text:='SELECT T1.PDV_CODIGO '+
           ' FROM PEDIDO_DE_VENDA T1 '+
           ' WHERE T1.CLI_CODIGO='+IntToStr(CdCLI)+
           ' AND T1.CNC_CLIENTE='+IntToStr(CdCNC)+
           ' AND T1.PDV_SITUACAO=4 '+
           ' AND T1.PDV_NOTA_FISCAL>0 '+
           ' ORDER BY T1.PDV_TOTAL DESC ';
        Pedido_de_venda1.open;
        if Pedido_de_venda1.IsEmpty then
          Raise Exception.Create('Conulta vazia!');
        CdDPVMaior := Pedido_de_venda1.CodigoPDV;

        Pedido_de_venda1.Close;
        Pedido_de_venda1.SQL.Text:='SELECT T1.* '+
           ' FROM PEDIDO_DE_VENDA T1 '+
           ' WHERE T1.CLI_CODIGO='+IntToStr(CdCLI)+
           ' AND T1.CNC_CLIENTE='+IntToStr(CdCNC)+
           ' AND T1.PDV_SITUACAO=4 '+
           ' AND T1.PDV_NOTA_FISCAL>0 '+
           ' ORDER BY T1.PDV_DATA_HORA ';
      end
      else
      Begin
        Pedido_de_venda1.Close;
        Pedido_de_venda1.SQL.Text:='SELECT T1.PDV_CODIGO '+
           ' FROM PEDIDO_DE_VENDA T1 '+
           ' WHERE T1.CLI_CODIGO='+IntToStr(CdCLI)+
           ' AND T1.CNC_CLIENTE='+IntToStr(CdCNC)+
           ' AND T1.PDV_SITUACAO=4 '+
           ' ORDER BY T1.PDV_TOTAL DESC ';
        Pedido_de_venda1.open;
        if Pedido_de_venda1.IsEmpty then
          Raise Exception.Create('Conulta vazia!');
        CdDPVMaior := Pedido_de_venda1.CodigoPDV;

        Pedido_de_venda1.Close;
        Pedido_de_venda1.SQL.Text:='SELECT T1.* '+
           ' FROM PEDIDO_DE_VENDA T1 '+
           ' WHERE T1.CLI_CODIGO='+IntToStr(CdCLI)+
           ' AND T1.CNC_CLIENTE='+IntToStr(CdCNC)+
           ' AND T1.PDV_SITUACAO=4 '+
           ' ORDER BY T1.PDV_DATA_HORA ';
      end;
      Pedido_de_venda1.open;
      report.preview;
      Close;
    end;
  end
  else if rdgResumoTitulo.Checked then
  Begin
    if DM.Configuracao1.Empresa = empLuciano then
    Begin
      SomaPago:=0;
      SomaComJuros:=0;
      Application.CreateForm(TfMxSaldoDev, fMxSaldoDev);

      fMxSaldoDev.Memo1.Clear;

      With DM.QR_Consultas do
      Begin
        Close;
        SQL.Text:='SELECT * '+
          ' FROM TITULO_A_RECEBER T1 '+
          ' WHERE T1.TRC_SITUACAO=2 '+
          ' AND T1.CLI_CODIGO='+IntToStr(CdCLI)+
          ' AND T1.CNC_CLIENTE='+IntToStr(CdCNC)+
          ' ORDER BY T1.PDV_CODIGO, T1.TRC_PAGAMENTO ASC';
        Open;

        fMxSaldoDev.Memo1.Lines.Add('');
        fMxSaldoDev.Memo1.Lines.Add('CLIENTE: '+sRazaoSocial+' ('+IntToStr(CdCLI)+')');
        fMxSaldoDev.Memo1.Lines.Add('TITULOS RECEBIDOS');
        fMxSaldoDev.Memo1.Lines.Add('');
        fMxSaldoDev.Memo1.Lines.Add('Pedido    Vencimento  Pagamento    Valor          Juros     Valor Pago');
        fMxSaldoDev.Memo1.Lines.Add('______________________________________________________________________');

        if FieldByName('CNC_CODIGO').Asinteger > 9 then
          CNC:=FieldByName('CNC_CODIGO').AsString+'-'
        else
          CNC:='0'+FieldByName('CNC_CODIGO').AsString+'-';

        First;
        CdPDVAnterior := 0;
        Valor := 0;
        While not EOF do
        Begin
          CdPDV := FieldByName('PDV_CODIGO').asInteger;
          if CdPDVAnterior <> CdPDV then
          Begin
            //Verifica se houve pagamento antecipado
            DM.qr_consultas2.Close;
            DM.qr_consultas2.SQL.Text := 'SELECT PDV_CODIGO, PDV_ENTRADA, PDV_DATA_HORA,' +
                //Alan - Acrescentei o campo PDV_SITUACAO e PDV_CREDITO
                //' PDV_TOTAL, PDV_ANTECIPADO '+
                ' PDV_TOTAL, PDV_ANTECIPADO, PDV_SITUACAO, PDV_CREDITO, PDV_DT_ANTECIPADO '+
                ' FROM PEDIDO_DE_VENDA' +
                ' WHERE CLI_CODIGO='+IntToStr(CdCLI)+
                ' AND CNC_CLIENTE='+IntToStr(CdCNC)+
                ' AND PDV_CODIGO='+FieldByName('PDV_CODIGO').asString;
            DM.qr_consultas2.Open;

            //Comentado dia 20-12-2005
            {if DM.qr_consultas2.FieldByName('PDV_ANTECIPADO').AsFloat > 0 then
            Begin
              {fMxSaldoDev.Memo1.Lines.Add(CNC+PreencheEspaco(17,FieldByName('PDV_CODIGO').AsString)+
                PreencheEspacoEsq(11,FormatDateTime('dd/mm/yyyy', DM.qr_consultas2.FieldByName('PDV_DATA_HORA').AsDateTime))+
                PreencheEspacoEsq(9,Format('%.2f', [DM.qr_consultas2.FieldByName('PDV_TOTAL').AsFloat]))+
                PreencheEspacoEsq(30,Format('%.2f', [DM.qr_consultas2.FieldByName('PDV_ANTECIPADO').AsFloat])));}

              {Valor := DM.qr_consultas2.FieldByName('PDV_TOTAL').AsFloat;// - DM.qr_consultas2.FieldByName('PDV_ANTECIPADO').AsFloat;
  //            SomaPago := SomaPago + DM.qr_consultas2.FieldByName('PDV_ANTECIPADO').AsFloat;
            end
            else if DM.qr_consultas2.FieldByName('PDV_TOTAL').AsFloat > 0 then
              Valor := DM.qr_consultas2.FieldByName('PDV_TOTAL').AsFloat
            else
              Valor := FieldByName('TRC_VALOR').asFloat;}

            if DM.qr_consultas2.FieldByName('PDV_ANTECIPADO').AsFloat > 0 then
              Valor := DM.qr_consultas2.FieldByName('PDV_TOTAL').AsFloat
            else
              if DM.qr_consultas2.FieldByName('PDV_TOTAL').AsFloat > 0 then
                Valor := DM.qr_consultas2.FieldByName('PDV_TOTAL').AsFloat
              else
                Valor := FieldByName('TRC_VALOR').asFloat;
          end;

          //Comentado - 20-12-2005
          //SomaPago := SomaPago + FieldByName('TRC_VALOR_PAGO').AsFloat + FieldByName('TRC_CRED_CLI').AsFloat;

          //Devolucao Total n soma ao valor pago
          if (DM.qr_consultas2.FieldByName('PDV_SITUACAO').AsInteger = 8) then
            Situacao := ' DT'
          else
            if (DM.qr_consultas2.FieldByName('PDV_SITUACAO').AsInteger = 4) and
            (DM.qr_consultas2.FieldByName('PDV_CREDITO').AsFloat > 0) then
            begin
              Situacao := ' DP';
              SomaPago := SomaPago + (DM.qr_consultas2.FieldByName('PDV_TOTAL').AsFloat -
                DM.qr_consultas2.FieldByName('PDV_CREDITO').AsFloat);
            end
            else
            begin
              Situacao := '';
              SomaPago := SomaPago + FieldByName('TRC_VALOR_PAGO').AsFloat + FieldByName('TRC_CRED_CLI').AsFloat;
            end;

          //sabendo a data do credito (Anderson)
          {Antes
          DM.QuerySelect.Close;
          DM.QuerySelect.SQL.Text:='SELECT MVC_DATA FROM MOVIMENTO_DE_CAIXA T1 '+
                                   ' INNER JOIN TITULO_A_RECEBER T2 ON T1.TIT_CODIGO=T2.TRC_CODIGO '+
                                   ' WHERE T2.PDV_CODIGO='''+FieldByName('PDV_CODIGO').AsString+''' '+
                                   ' AND T2.CNC_CODIGO='''+FieldByName('CNC_CODIGO').AsString+''' ';
          DM.QuerySelect.Open;}

          DM.QuerySelect.Close;
          DM.QuerySelect.SQL.Text:='SELECT PDV_DT_ANTECIPADO FROM PEDIDO_DE_VENDA T1 '+
                                   ' WHERE T1.PDV_CODIGO='''+DM.QR_Consultas2.FieldByName('PDV_CODIGO').AsString+''' '+
                                   ' AND T1.CNC_CODIGO='''+FieldByName('CNC_CODIGO').AsString+''' ';
          DM.QuerySelect.Open;
          // // //

          if FieldByName('TRC_CRED_CLI').AsFloat > 0 then
            //sCredito := '('+Format('%.2f',[FieldByName('TRC_CRED_CLI').AsFloat])+')'
            //sCredito := '('+Format('%.2f',[FieldByName('TRC_CRED_CLI').AsFloat])+' - ' +formatdatetime('dd/MM/yyyy',DM.QuerySelect.Fieldbyname('MVC_DATA').Value) + ')'
          begin
            try
              sCredito := '('+Format('%.2f',[FieldByName('TRC_CRED_CLI').AsFloat])+' - ' +formatdatetime('dd/MM/yyyy',DM.QuerySelect.Fieldbyname('PDV_DT_ANTECIPADO').Value) + ')'
            except
              sCredito := '('+Format('%.2f',[FieldByName('TRC_CRED_CLI').AsFloat])+')'
            end;
          end
          else
            sCredito := '';

          //calcular os juros, se tiver em atraso
          If (Trunc(FieldByName('TRC_PAGAMENTO').AsFloat) > Trunc(FieldByName('TRC_VENCIMENTO').AsFloat)+DM.Configuracao1.QuantDiasSemJuros) then
          Begin
            ValorJuros:=FieldByName('TRC_VALOR').AsFloat*(DM.Configuracao1.TaxaJuros*(FieldByName('TRC_PAGAMENTO').AsFloat-FieldByName('TRC_VENCIMENTO').AsFloat)/3000);

            fMxSaldoDev.Memo1.Lines.Add(CNC+PreencheEspaco(6,FieldByName('PDV_CODIGO').AsString)+
            PreencheEspacoEsq(11,FormatDateTime('dd/mm/yyyy', FieldByName('TRC_VENCIMENTO').AsDateTime))+
            PreencheEspacoEsq(11,FormatDateTime('dd/mm/yyyy', FieldByName('TRC_PAGAMENTO').AsDateTime))+
            PreencheEspacoEsq(9,Format('%.2f', [Valor]))+
            PreencheEspacoEsq(15,Format('%.2f', [ValorJuros]))+
            PreencheEspacoEsq(15,Format('%.2f', [FieldByName('TRC_VALOR_PAGO').AsFloat]))+sCredito);

            Valor :=  Valor - FieldByName('TRC_VALOR_PAGO').AsFloat
                            - FieldByName('TRC_CRED_CLI').AsFloat
                            + FieldByName('TRC_JUROS').AsFloat
                            - FieldByName('TRC_DESCONTO').AsFloat;

            SomaComJuros := SomaComJuros + ValorJuros;
          end
          Else
          begin
            //Comentado - 20-12-2005 e acrescentado em baixo Situacao do Pedido
            {fMxSaldoDev.Memo1.Lines.Add(CNC+PreencheEspaco(6,FieldByName('PDV_CODIGO').AsString)+
              PreencheEspacoEsq(11,FormatDateTime('dd/mm/yyyy', FieldByName('TRC_VENCIMENTO').AsDateTime))+
              PreencheEspacoEsq(11,FormatDateTime('dd/mm/yyyy', FieldByName('TRC_PAGAMENTO').AsDateTime))+
              PreencheEspacoEsq(9,Format('%.2f', [Valor]))+
              PreencheEspacoEsq(30,Format('%.2f', [FieldByName('TRC_VALOR_PAGO').AsFloat]))+sCredito);}

            fMxSaldoDev.Memo1.Lines.Add(CNC+PreencheEspaco(6,FieldByName('PDV_CODIGO').AsString)+
              PreencheEspacoEsq(11,FormatDateTime('dd/mm/yyyy', FieldByName('TRC_VENCIMENTO').AsDateTime))+
              PreencheEspacoEsq(11,FormatDateTime('dd/mm/yyyy', FieldByName('TRC_PAGAMENTO').AsDateTime))+
              PreencheEspacoEsq(9,Format('%.2f', [Valor]))+
              PreencheEspacoEsq(30,Format('%.2f', [FieldByName('TRC_VALOR_PAGO').AsFloat]))+sCredito+Situacao);

            Valor := Valor - (FieldByName('TRC_VALOR_PAGO').AsFloat+FieldByName('TRC_CRED_CLI').AsFloat);
          end;

          CdPDVAnterior := FieldByName('PDV_CODIGO').asInteger;
          Next;
        end;

        fMxSaldoDev.Memo1.Lines.Add('______________________________________________________________________');
        fMxSaldoDev.Memo1.Lines.Add('Total: '+PreencheEspacoEsq(33,'')+PreencheEspacoEsq(15,Format('%.2f', [SomaComJuros]))+PreencheEspacoEsq(15,Format('%.2f', [SomaPago])));

        With DM.QR_Consultas do
        Begin
          Close;
          SQL.Text:='SELECT * FROM TITULO_A_RECEBER '+
            ' WHERE TRC_SITUACAO IN (0,8,9) '+
            ' AND CLI_CODIGO='+IntToStr(CdCLI)+
            ' AND CNC_CLIENTE='+IntToStr(CdCNC)+
            ' ORDER BY PDV_CODIGO, TRC_VENCIMENTO ASC';
          Open;
          fMxSaldoDev.Memo1.Lines.Add('');
          fMxSaldoDev.Memo1.Lines.Add('');
          fMxSaldoDev.Memo1.Lines.Add('');
          fMxSaldoDev.Memo1.Lines.Add('TITULOS A RECEBER');
          fMxSaldoDev.Memo1.Lines.Add('');
          fMxSaldoDev.Memo1.Lines.Add('Pedido  Seq.  Vencimento    Valor     C/Juros    Observacao');
          fMxSaldoDev.Memo1.Lines.Add('______________________________________________________________________');
          First;
          Soma:=0;
          While not EOF do
          Begin
            if FieldByName('CNC_CODIGO').Asinteger > 9 then
              CNC:=FieldByName('CNC_CODIGO').AsString+'-'
            else
              CNC:='0'+FieldByName('CNC_CODIGO').AsString+'-';
            //calcular os juros, se tiver em atraso
            If (Trunc(FieldByName('TRC_VENCIMENTO').AsDateTime)<Trunc(DM.Configuracao1.Data)) then
            Begin
               if (DM.Configuracao1.Empresa = empLBM) and
                  (FieldByName('CCX_CODIGO').asInteger = 177) then //DG CONDOMINIO ALUGUEIS SALAS
               Begin
                 //1% ao mês + 10% multa
                 ValorJuros:=FieldByName('TRC_VALOR').AsFloat*
                   (1*(DM.Configuracao1.Data-FieldByName('TRC_VENCIMENTO').AsFloat)/3000)+
                   (FieldByName('TRC_VALOR').AsFloat*0.1);
              end
              else
                ValorJuros:=FieldByName('TRC_VALOR').AsFloat*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-FieldByName('TRC_VENCIMENTO').AsDateTime)/3000);
              fMxSaldoDev.Memo1.Lines.Add(CNC+PreencheEspaco(6,FieldByName('PDV_CODIGO').AsString)+
                PreencheEspaco(4,FieldByName('TRC_SEQUENCIA').AsString)+
                PreencheEspacoEsq(11,FormatDateTime('dd/mm/yyyy', FieldByName('TRC_VENCIMENTO').AsDateTime))+
                PreencheEspacoEsq(9,Format('%.2f', [FieldByName('TRC_VALOR').AsFloat]))+
                PreencheEspacoEsq(11,Format('%.2f', [(FieldByName('TRC_VALOR').AsFloat+ValorJuros)]))+
                PreencheEspaco(30,' '+FieldByName('TRC_OBSERVACAO').AsString));
              SomaSJuros := SomaSJuros + FieldByName('TRC_VALOR').AsFloat;
              Soma := Soma + FieldByName('TRC_VALOR').AsFloat + ValorJuros;
            end
            Else
            Begin
              fMxSaldoDev.Memo1.Lines.Add(CNC+PreencheEspaco(6,FieldByName('PDV_CODIGO').AsString)+
                PreencheEspaco(4,FieldByName('TRC_SEQUENCIA').AsString)+
                PreencheEspacoEsq(11,FormatDateTime('dd/mm/yyyy', FieldByName('TRC_VENCIMENTO').AsDateTime))+
                PreencheEspacoEsq(9,Format('%.2f', [FieldByName('TRC_VALOR').AsFloat]))+
                '           '+
                PreencheEspaco(30,' '+FieldByName('TRC_OBSERVACAO').AsString));
              SomaSJuros := SomaSJuros + FieldByName('TRC_VALOR').AsFloat;
              Soma := Soma + FieldByName('TRC_VALOR').AsFloat;
            End;

            next;
          End;
          fMxSaldoDev.Memo1.Lines.Add('');
          fMxSaldoDev.Memo1.Lines.Add('Crédito do Cliente: '+Format('%.2f', [vCredito]));
          fMxSaldoDev.Memo1.Lines.Add('______________________________________________________________________');
          //fMxSaldoDev.Memo1.Lines.Add('Total:                '+Format('%.2f',[SomaSJuros])+' '+PreencheEspacoEsq(40,Format('%.2f', [Soma])));
          fMxSaldoDev.Memo1.Lines.Add('Total:                      '+Format('%.2f',[SomaSJuros])+'     '+Format('%.2f', [Soma]));
        end;
      end;
      fMxSaldoDev.ShowModal;
    end
    else //Diferente de Luciano
    Begin
      SomaPago:=0;
      SomaComJuros:=0;
      Application.CreateForm(TfMxSaldoDev, fMxSaldoDev);
      With DM.QR_Consultas do
      Begin
        Soma:=0;
        Close;
        SQL.Text:='SELECT * FROM TITULO_A_RECEBER '+
          ' WHERE TRC_SITUACAO=2 '+
          ' AND CLI_CODIGO='+IntToStr(CdCLI)+
          ' AND CNC_CLIENTE='+IntToStr(CdCNC)+
          ' ORDER BY TRC_VENCIMENTO ASC';
        Open;
        fMxSaldoDev.Memo1.Lines.Add('');
        fMxSaldoDev.Memo1.Lines.Add('CLIENTE: '+sRazaoSocial+' ('+IntToStr(CdCLI)+')');
        fMxSaldoDev.Memo1.Lines.Add('TITULOS RECEBIDOS');
        fMxSaldoDev.Memo1.Lines.Add('');
        fMxSaldoDev.Memo1.Lines.Add('Pedido-Titulo      Vencimento  Pagamento    Valor   ValorC/Juros     Valor Pago');
        fMxSaldoDev.Memo1.Lines.Add('_______________________________________________________________________________');
        First;
        While not EOF do
        Begin
          if FieldByName('CNC_CODIGO').Asinteger > 9 then
            CNC:=FieldByName('CNC_CODIGO').AsString+'-'
          else
            CNC:='0'+FieldByName('CNC_CODIGO').AsString+'-';
          Soma := Soma + FieldByName('TRC_VALOR').AsFloat;
          SomaPago := SomaPago + FieldByName('TRC_VALOR_PAGO').AsFloat;
          //calcular os juros, se tiver em atraso
          If (Trunc(FieldByName('TRC_PAGAMENTO').AsFloat)>Trunc(FieldByName('TRC_VENCIMENTO').AsFloat)+DM.Configuracao1.QuantDiasSemJuros) then
          Begin
            if (DM.Configuracao1.Empresa = empLBM) and //LBM
               (FieldByName('CCX_CODIGO').asInteger = 177) then //DG CONDOMINIO ALUGUEIS SALAS
            Begin
              //1% ao mês + 10% multa
              ValorJuros:=FieldByName('TRC_VALOR').AsFloat*
                (1*(FieldByName('TRC_PAGAMENTO').AsFloat-FieldByName('TRC_VENCIMENTO').AsFloat)/3000)+
                (FieldByName('TRC_VALOR').AsFloat*0.1);
            end
            else
              ValorJuros:=FieldByName('TRC_VALOR').AsFloat*(DM.Configuracao1.TaxaJuros*(FieldByName('TRC_PAGAMENTO').AsFloat-FieldByName('TRC_VENCIMENTO').AsFloat)/3000);
            fMxSaldoDev.Memo1.Lines.Add(CNC+PreencheZero(6,FieldByName('PDV_CODIGO').AsInteger)+'-'+
              PreencheZero(8,FieldByName('TRC_CODIGO').AsInteger)+
              PreencheEspacoEsq(11,FormatDateTime('dd/mm/yyyy', FieldByName('TRC_VENCIMENTO').AsDateTime))+
              PreencheEspacoEsq(11,FormatDateTime('dd/mm/yyyy', FieldByName('TRC_PAGAMENTO').AsDateTime))+
              PreencheEspacoEsq(9,Format('%.2f', [FieldByName('TRC_VALOR').AsFloat]))+
              PreencheEspacoEsq(15,Format('%.2f', [FieldByName('TRC_VALOR').AsFloat+ValorJuros]))+
              PreencheEspacoEsq(15,Format('%.2f', [FieldByName('TRC_VALOR_PAGO').AsFloat])));
              SomaComJuros := SomaComJuros + FieldByName('TRC_VALOR').AsFloat + ValorJuros;
          end
          Else
          Begin
            fMxSaldoDev.Memo1.Lines.Add(CNC+PreencheZero(6,FieldByName('PDV_CODIGO').AsInteger)+'-'+
              PreencheZero(8,FieldByName('TRC_CODIGO').AsInteger)+
              PreencheEspacoEsq(11,FormatDateTime('dd/mm/yyyy', FieldByName('TRC_VENCIMENTO').AsDateTime))+
              PreencheEspacoEsq(11,FormatDateTime('dd/mm/yyyy', FieldByName('TRC_PAGAMENTO').AsDateTime))+
              PreencheEspacoEsq(9,Format('%.2f', [FieldByName('TRC_VALOR').AsFloat]))+
              PreencheEspacoEsq(30,Format('%.2f', [FieldByName('TRC_VALOR_PAGO').AsFloat])));
          End;

          next;
        End;
        fMxSaldoDev.Memo1.Lines.Add('_______________________________________________________________________________');
        if DM.Configuracao1.Empresa = empLuciano then
          fMxSaldoDev.Memo1.Lines.Add('Total: '+PreencheEspacoEsq(42,'')+PreencheEspacoEsq(15,Format('%.2f', [SomaComJuros]))+PreencheEspacoEsq(15,Format('%.2f', [SomaPago])))
        else
          fMxSaldoDev.Memo1.Lines.Add('Total: '+PreencheEspacoEsq(42,Format('%.2f', [Soma]))+PreencheEspacoEsq(15,Format('%.2f', [SomaComJuros]))+PreencheEspacoEsq(15,Format('%.2f', [SomaPago])));
      End;

      With DM.QR_Consultas do
      Begin
        Close;
        SQL.Text:='SELECT * FROM TITULO_A_RECEBER '+
          ' WHERE TRC_SITUACAO IN (0,8,9) '+
          ' AND CLI_CODIGO='+IntToStr(CdCLI)+
          ' AND CNC_CLIENTE='+IntToStr(CdCNC)+
          ' ORDER BY TRC_VENCIMENTO ASC';
        Open;
        fMxSaldoDev.Memo1.Lines.Add('');
        fMxSaldoDev.Memo1.Lines.Add('');
        fMxSaldoDev.Memo1.Lines.Add('');
        fMxSaldoDev.Memo1.Lines.Add('TITULOS A RECEBER');
        fMxSaldoDev.Memo1.Lines.Add('');
        fMxSaldoDev.Memo1.Lines.Add('Pedido-Titulo      Vencimento    Valor     C/Juros Observacao');
        fMxSaldoDev.Memo1.Lines.Add('_______________________________________________________________________________');
        First;
        Soma:=0;
        While not EOF do
        Begin
          if FieldByName('CNC_CODIGO').Asinteger > 9 then
            CNC:=FieldByName('CNC_CODIGO').AsString+'-'
          else
            CNC:='0'+FieldByName('CNC_CODIGO').AsString+'-';
          //calcular os juros, se tiver em atraso
          If (Trunc(FieldByName('TRC_VENCIMENTO').AsDateTime)<Trunc(DM.Configuracao1.Data)) then
          Begin
             if (DM.Configuracao1.Empresa = empLBM) and
                (FieldByName('CCX_CODIGO').asInteger = 177) then //DG CONDOMINIO ALUGUEIS SALAS
             Begin
               //1% ao mês + 10% multa
               ValorJuros:=FieldByName('TRC_VALOR').AsFloat*
                 (1*(DM.Configuracao1.Data-FieldByName('TRC_VENCIMENTO').AsFloat)/3000)+
                 (FieldByName('TRC_VALOR').AsFloat*0.1);
            end
            else
              ValorJuros:=FieldByName('TRC_VALOR').AsFloat*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-FieldByName('TRC_VENCIMENTO').AsDateTime)/3000);
            fMxSaldoDev.Memo1.Lines.Add(CNC+PreencheZero(6,FieldByName('PDV_CODIGO').AsInteger)+'-'+
              PreencheZero(8,FieldByName('TRC_CODIGO').AsInteger)+
              PreencheEspacoEsq(11,FormatDateTime('dd/mm/yyyy', FieldByName('TRC_VENCIMENTO').AsDateTime))+
              PreencheEspacoEsq(9,Format('%.2f', [FieldByName('TRC_VALOR').AsFloat]))+
              PreencheEspacoEsq(12,Format('%.2f', [(FieldByName('TRC_VALOR').AsFloat+ValorJuros)]))+
              PreencheEspaco(28,' '+FieldByName('TRC_OBSERVACAO').AsString));
            Soma := Soma + FieldByName('TRC_VALOR').AsFloat + ValorJuros;
          end
          Else
          Begin
            fMxSaldoDev.Memo1.Lines.Add(CNC+PreencheZero(6,FieldByName('PDV_CODIGO').AsInteger)+'-'+
              PreencheZero(8,FieldByName('TRC_CODIGO').AsInteger)+
              PreencheEspacoEsq(11,FormatDateTime('dd/mm/yyyy', FieldByName('TRC_VENCIMENTO').AsDateTime))+
              PreencheEspacoEsq(9,Format('%.2f', [FieldByName('TRC_VALOR').AsFloat]))+
              '            '+
              PreencheEspaco(28,' '+FieldByName('TRC_OBSERVACAO').AsString));
            Soma := Soma + FieldByName('TRC_VALOR').AsFloat;
          End;

          next;
        End;
        fMxSaldoDev.Memo1.Lines.Add('Crédito do Cliente: '+Format('%.2f', [vCredito]));
        fMxSaldoDev.Memo1.Lines.Add('_______________________________________________________________________________');
        fMxSaldoDev.Memo1.Lines.Add('Total:                                 '+PreencheEspacoEsq(40,Format('%.2f', [Soma-vCredito])));
      End;
      fMxSaldoDev.ShowModal;
    end;

{
    SomaPago:=0;
    SomaComJuros:=0;
    Application.CreateForm(TfMxSaldoDev, fMxSaldoDev);
    With DM.QR_Consultas do
    Begin
      Soma:=0;
      Close;
      SQL.Text:='SELECT * FROM TITULO_A_RECEBER '+
        ' WHERE TRC_SITUACAO=2 '+
        ' AND CLI_CODIGO='+IntToStr(CdCLI)+
        ' AND CNC_CLIENTE='+IntToStr(CdCNC)+
        sDataINI+
        ' ORDER BY TRC_VENCIMENTO ASC';
      Open;
      fMxSaldoDev.Memo1.Lines.Add('');
      fMxSaldoDev.Memo1.Lines.Add('CLIENTE: '+sRazaoSocial+' ('+IntToStr(CdCLI)+')');
      fMxSaldoDev.Memo1.Lines.Add('TITULOS PAGOS');
      fMxSaldoDev.Memo1.Lines.Add('');
      fMxSaldoDev.Memo1.Lines.Add('Pedido    Vencimento  Pagamento    Valor   ValorC/Juros     Valor Pago');
      fMxSaldoDev.Memo1.Lines.Add('______________________________________________________________________');
      First;
      While not EOF do
      Begin
        if FieldByName('CNC_CODIGO').Asinteger > 9 then
          CNC:=FieldByName('CNC_CODIGO').AsString+'-'
        else
          CNC:='0'+FieldByName('CNC_CODIGO').AsString+'-';
        Soma := Soma + FieldByName('TRC_VALOR').AsFloat;
        SomaPago := SomaPago + FieldByName('TRC_VALOR_PAGO').AsFloat;
        //calcular os juros, se tiver em atraso
        If (Trunc(FieldByName('TRC_PAGAMENTO').AsFloat)>Trunc(FieldByName('TRC_VENCIMENTO').AsFloat)+DM.Configuracao1.QuantDiasSemJuros) then
        Begin
          ValorJuros:=FieldByName('TRC_VALOR').AsFloat*(DM.Configuracao1.TaxaJuros*(FieldByName('TRC_PAGAMENTO').AsFloat-FieldByName('TRC_VENCIMENTO').AsFloat)/3000);
          fMxSaldoDev.Memo1.Lines.Add(CNC+PreencheEspaco(6,FieldByName('PDV_CODIGO').AsString)+
            PreencheEspacoEsq(11,FormatDateTime('dd/mm/yyyy', FieldByName('TRC_VENCIMENTO').AsDateTime))+
            PreencheEspacoEsq(11,FormatDateTime('dd/mm/yyyy', FieldByName('TRC_PAGAMENTO').AsDateTime))+
            PreencheEspacoEsq(9,Format('%.2f', [FieldByName('TRC_VALOR').AsFloat]))+
            PreencheEspacoEsq(15,Format('%.2f', [FieldByName('TRC_VALOR').AsFloat+ValorJuros]))+
            PreencheEspacoEsq(15,Format('%.2f', [FieldByName('TRC_VALOR_PAGO').AsFloat])));
            SomaComJuros := SomaComJuros + FieldByName('TRC_VALOR').AsFloat + ValorJuros;
        end
        Else
        Begin
          fMxSaldoDev.Memo1.Lines.Add(CNC+PreencheEspaco(6,FieldByName('PDV_CODIGO').AsString)+
            PreencheEspacoEsq(11,FormatDateTime('dd/mm/yyyy', FieldByName('TRC_VENCIMENTO').AsDateTime))+
            PreencheEspacoEsq(11,FormatDateTime('dd/mm/yyyy', FieldByName('TRC_PAGAMENTO').AsDateTime))+
            PreencheEspacoEsq(9,Format('%.2f', [FieldByName('TRC_VALOR').AsFloat]))+
            PreencheEspacoEsq(30,Format('%.2f', [FieldByName('TRC_VALOR_PAGO').AsFloat])));
        End;

        next;
      End;
      fMxSaldoDev.Memo1.Lines.Add('______________________________________________________________________');
      fMxSaldoDev.Memo1.Lines.Add('Total: '+PreencheEspacoEsq(33,Format('%.2f', [Soma]))+PreencheEspacoEsq(15,Format('%.2f', [SomaComJuros]))+PreencheEspacoEsq(15,Format('%.2f', [SomaPago])));
    End;

    With DM.QR_Consultas do
    Begin
      Close;
      SQL.Text:='SELECT * FROM TITULO_A_RECEBER '+
        ' WHERE TRC_SITUACAO IN (0,8,9) '+
        ' AND CLI_CODIGO='+IntToStr(CdCLI)+
        ' AND CNC_CLIENTE='+IntToStr(CdCNC)+
        ' ORDER BY TRC_VENCIMENTO ASC';
      Open;
      fMxSaldoDev.Memo1.Lines.Add('');
      fMxSaldoDev.Memo1.Lines.Add('');
      fMxSaldoDev.Memo1.Lines.Add('');
      fMxSaldoDev.Memo1.Lines.Add('TITULOS A PAGAR');
      fMxSaldoDev.Memo1.Lines.Add('');
      fMxSaldoDev.Memo1.Lines.Add('Pedido    Vencimento    Valor     C/Juros Observacao');
      fMxSaldoDev.Memo1.Lines.Add('______________________________________________________________________');
      First;
      Soma:=0;
      While not EOF do
      Begin
        if FieldByName('CNC_CODIGO').Asinteger > 9 then
          CNC:=FieldByName('CNC_CODIGO').AsString+'-'
        else
          CNC:='0'+FieldByName('CNC_CODIGO').AsString+'-';
        //calcular os juros, se tiver em atraso
        If (Trunc(FieldByName('TRC_VENCIMENTO').AsDateTime)<Trunc(DM.Configuracao1.Data)) then
        Begin
          ValorJuros:=FieldByName('TRC_VALOR').AsFloat*(DM.Configuracao1.TaxaJuros*(DM.Configuracao1.Data-FieldByName('TRC_VENCIMENTO').AsDateTime)/3000);
          fMxSaldoDev.Memo1.Lines.Add(CNC+PreencheEspaco(6,FieldByName('PDV_CODIGO').AsString)+
            PreencheEspacoEsq(11,FormatDateTime('dd/mm/yyyy', FieldByName('TRC_VENCIMENTO').AsDateTime))+
            PreencheEspacoEsq(9,Format('%.2f', [FieldByName('TRC_VALOR').AsFloat]))+
            PreencheEspacoEsq(12,Format('%.2f', [(FieldByName('TRC_VALOR').AsFloat+ValorJuros)]))+
            PreencheEspaco(28,' '+FieldByName('TRC_OBSERVACAO').AsString));
          Soma := Soma + FieldByName('TRC_VALOR').AsFloat + ValorJuros;
        end
        Else
        Begin
          fMxSaldoDev.Memo1.Lines.Add(CNC+PreencheEspaco(6,FieldByName('PDV_CODIGO').AsString)+
            PreencheEspacoEsq(11,FormatDateTime('dd/mm/yyyy', FieldByName('TRC_VENCIMENTO').AsDateTime))+
            PreencheEspacoEsq(9,Format('%.2f', [FieldByName('TRC_VALOR').AsFloat]))+
            '            '+
            PreencheEspaco(28,' '+FieldByName('TRC_OBSERVACAO').AsString));
          Soma := Soma + FieldByName('TRC_VALOR').AsFloat;
        End;

        next;
      End;
      fMxSaldoDev.Memo1.Lines.Add('Crédito do Cliente: '+Format('%.2f', [vCredito]));
      fMxSaldoDev.Memo1.Lines.Add('______________________________________________________________________');
      fMxSaldoDev.Memo1.Lines.Add('Total:'+PreencheEspacoEsq(35,Format('%.2f', [Soma-vCredito])));
    End;
    fMxSaldoDev.ShowModal;
}
  end
  else if rdgExtratoCliente.Checked then
  Begin
    Application.CreateForm(TfMxSelTitulos,fMxSelTitulos);
    with fMxSelTitulos do
    Begin
      Caption := 'Extrato de Cliente';
      Tag:=7;
      ckbCodigoCLI.Checked := True;
      edtCodigoCLI.Text := IntToStr(CdCLI);
      ckbCentroDeCusto.Checked := True;
      dblCOdigoCNC.KeyValue := CdCNC;
      ShowModal;
    end;
  end
  else if rdgEmbarque.Checked then
  Begin
    Application.CreateForm(Trpt_HistCliEmbarque, rpt_HistCliEmbarque);
    with rpt_HistCliEmbarque do
    Begin
      Entidade.close;
      Entidade.ParamByName('CNC_CODIGO').asInteger := CdCNC;
      Entidade.ParamByName('CLI_CODIGO').asInteger := CdCLI;
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfmxSelResumo.bitCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfmxSelResumo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TfmxSelResumo.FormCreate(Sender: TObject);
begin
  CdCNC := 0;
  CdCLI := 0;
  vCredito := 0;
  sRazaoSocial := '';
end;

procedure TfmxSelResumo.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  try
    with DM do
    begin
      QR_Consultas.Close;
      QR_Consultas.SQL.Text := 'SELECT CLI_RZ_SOCIAL FROM CLIENTE '+
                               ' WHERE CLI_CODIGO='+IntToStr(CdCLI)+
                               ' AND CNC_CODIGO='+IntToStr(CdCNC);
      QR_Consultas.Open;

      Edit1.Text := QR_Consultas.FieldByName('CLI_RZ_SOCIAL').AsString;
    end;                                                   
  except
  end;

  rdgEmbarque.Visible := true;
end;

end.

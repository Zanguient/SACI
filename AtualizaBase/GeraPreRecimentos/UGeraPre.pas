unit UGeraPre;

interface
                            
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Item_Pre_Recebimento, Pre_Recebimento, Item_de_Transferencia,
  DBTables, SQuery, Transferencia, CentroCusto, StdCtrls, ExtCtrls,
  ComCtrls, Item_Pedido_Compra, Pedido_de_Compra, Titulo_receber,
  Forma_de_Pagamento, Titulo_a_Pagar, Item_Pedido_Venda, WinSkinData;

type
  TfMxGeraPre = class(TForm)
    Pre_Recebimento1: TPre_Recebimento;
    Item_Pre_Recebimento1: TItem_Pre_Recebimento;
    DSTransferencia1: TDataSource;
    DSPre_Recebimento1: TDataSource;
    CentroCusto1: TCentroCusto;
    Label1: TLabel;
    Timer1: TTimer;
    Animate1: TAnimate;
    Transferencia1: TQuery;
    Item_de_Transferencia1: TQuery;
    Titulo_receber1: TTitulo_receber;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    Titulo_a_pagar1: TTitulo_a_pagar;
    Query1: TQuery;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    SkinData1: TSkinData;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure txtgravar;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxGeraPre: TfMxGeraPre;
  Tempo:integer;

implementation
Uses UDM, Funcoes, Configuracao;
{$R *.DFM}

procedure TfMxGeraPre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Item_de_Transferencia1.Close;
  Item_Pre_Recebimento1.Close;
  Titulo_receber1.Close;
  Pre_Recebimento1.Close;
  Transferencia1.Close;
  CentroCusto1.Close;
  try
    DM.Database2.Connected := False;
  except
  end;
  Action := caFree;
end;

procedure TfMxGeraPre.FormShow(Sender: TObject);
begin
  Animate1.Active:=True;
  Tempo:=0;
  Timer1.Enabled := True;
end;

procedure TfMxGeraPre.Timer1Timer(Sender: TObject);
Type
  TVetor=Array [1..100] of string;
const
  Letra : array [1..26] of string = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
Var
  iC,Qtd,CdTRF,CNCDest,CNCOrig,CdPDV,vTipoDoc : Integer;
  vValorTotal : Double;
  Trans,TemEntrada: Boolean;
  sNumeroParcel: String;
  //
  Vetor: TVetor;
  dia, Seq:String;
  QtdTit,i,j,pos, CdCCX:Integer;
  Aux:TDataSetNotifyEvent;
  vDataBase: TDateTime;
begin
  Tempo:=Tempo+1;
  If Tempo = 5 then
  Begin
    Timer1.Enabled := False;
    DM.Configuracao1.Open;
    DM.Configuracao1.First;
    CentroCusto1.Open;
    CentroCusto1.Last;
    Qtd:=CentroCusto1.CodigoCNC;

    //Criar Pre Recebimento de Transferencia
    For iC:=0 to Qtd do
    Begin
      Transferencia1.Close;
      Transferencia1.ParamByName('TRF_CNC_DESTINO').AsInteger:=iC;
      Transferencia1.Open;
      With Transferencia1 do
      Begin
        First;
        While not Eof do
        Begin
          Trans:=false;
          with DM.Database2 do
          begin
            {try
              StartTransaction;
              Trans:=True;}

              vValorTotal := 0;
              Item_Pre_Recebimento1.Close;
              Pre_Recebimento1.Close;
              Pre_Recebimento1.ParamByName('CNC_CODIGO').asInteger:=iC;
              Pre_Recebimento1.ParamByName('PRC_TIPO').asInteger:=0;
              Pre_Recebimento1.ParamByName('PRC_CNC_ORIGEM').asInteger:=FieldByName('CNC_CODIGO').AsInteger;
              Pre_Recebimento1.ParamByName('PRC_COD_ORIGEM').asInteger:=FieldByName('TRF_CODIGO').AsInteger;
              Pre_Recebimento1.Open;
              If Pre_Recebimento1.IsEmpty then
              begin
                Item_de_Transferencia1.Close;
                Item_de_Transferencia1.ParamByName('TRF_CODIGO').asInteger := FieldByName('TRF_CODIGO').asInteger;
                Item_de_Transferencia1.ParamByName('CNC_CODIGO').asInteger := FieldByName('CNC_CODIGO').asInteger;
                Item_de_Transferencia1.Open;
                if not Pre_Recebimento1.Inserir(0,iC,0,Item_de_Transferencia1.RecordCount,0,
                        FieldByName('CNC_CODIGO').AsInteger,FieldByName('TRF_CODIGO').AsInteger,
                        FieldByName('TRF_NOTA_FISCAL').AsInteger,FieldByName('TRF_OBSERVACAO').AsString,
                        0,FieldByName('TRF_DATA').AsDateTime,FieldByName('TRF_DATA').AsDateTime,
                        FieldByName('TRF_DATA').AsDateTime,FieldByName('TRF_CODIGO').AsString) then
                  Raise exception.Create('');
                Item_de_Transferencia1.First;
                While not Item_de_Transferencia1.EOF do
                Begin
                  if not Item_Pre_Recebimento1.Active then
                    Item_Pre_Recebimento1.Open;
                  if not Item_Pre_Recebimento1.Inserir(iC,0,Pre_Recebimento1.SCodigo,Item_de_Transferencia1.FieldByName('PRD_CODIGO').asInteger,
                     Item_de_Transferencia1.FieldByName('ITR_QUANTIDADE').asFloat,0,0) then
                    Raise exception.Create('');
                  vValorTotal := vValorTotal + (Item_de_Transferencia1.FieldByName('ITR_QUANTIDADE').asFloat*Item_de_Transferencia1.FieldByName('ITR_PRECO').asFloat);
                  Item_de_Transferencia1.Next;
                End;
                //
                // Gerando Titulo a Pagar na Loja
                if (DM.Configuracao1.Empresa = empLuciano) and
                   (vValorTotal > 0) then //Apenas Luciano Otica
                begin
                  Forma_de_Pagamento1.Close;
                  Forma_de_Pagamento1.ParamByName('FPG_CODIGO').AsInteger := Transferencia1.FieldByName('FPG_CODIGO').AsInteger;
                  Forma_de_Pagamento1.Open;
                  if not Forma_de_Pagamento1.IsEmpty then
                    sNumeroParcel := Forma_de_Pagamento1.FieldByName('FPG_PRAZO').asstring
                  else
                    sNumeroParcel := '0';
                  TemEntrada := True;  //False
                  //
                  CdTRF := Transferencia1.FieldByName('TRF_CODIGO').AsInteger;
                  CNCDest := Transferencia1.FieldByName('TRF_CNC_DESTINO').AsInteger;
                  CNCOrig := Transferencia1.FieldByName('TRF_CNC_ORIGEM').AsInteger;
                  //
                  Titulo_a_Pagar1.Close;
                  Titulo_a_Pagar1.ParamByName('CNC_CODIGO').asInteger := iC;
                  Titulo_a_Pagar1.Open;
                  //
                  with DM.Configuracao1.QueryConsultas do
                  Begin
                    Close;
                    SQL.Text := 'SELECT CCX_CODIGO AS CONTA '+
                      ' FROM FORNECEDOR '+
                      ' WHERE FOR_CODIGO='+IntToStr(2);
                    Open;
                    CdCCX := FieldByName('CONTA').asInteger;
                  end;

                  QtdTit := Titulo_a_Pagar1.QtdeTitulos(sNumeroParcel);

                  For i:=1 to 100 do
                    Vetor[i]:='';

                  i:=1;
                  pos:=1;
                  j:=1;

                  While i<Length(sNumeroParcel)+2 do
                  Begin
                    if (sNumeroParcel[i]=';') or (sNumeroParcel[i]='')then
                    Begin
                      dia:=Copy(sNumeroParcel,pos,i-pos);
                      Vetor[j]:=dia;
                      j:=j+1;
                      pos:=i+1;
                    End;

                    i:=i+1;
                  End;

                  vDataBase := DM.Configuracao1.Data;
                  if FieldByName('PCP_CODIGO').asInteger > 0 then
                  Begin
                    with DM.QR_Consultas do
                    Begin
                      Close;
                      SQL.Text := 'SELECT * '+
                        ' FROM PEDIDO_DE_COMPRA '+
                        ' WHERE PCP_CODIGO='+Transferencia1.FieldByName('PCP_CODIGO').asString;
                      Open;
                      if FieldByName('PCP_DT_ENTREGA').asDateTime > 0 then
                        vDataBase := FieldByName('PCP_DT_ENTREGA').asDateTime;
                    end;
                  end;

                  for i:=1 to QtdTit do
                  Begin
                    If i<=9 then
                      Seq := '0'+IntToStr(i)
                    Else
                      Seq := IntToStr(i);

                    if not Titulo_a_pagar1.Inserir(CNCDest,0,CdTRF,0,CdCCX,0,
                        2,0,DM.Configuracao1.TipoDocumento,0,'Transferencia entre Lojas.  Forn.:'+Transferencia1.FieldByName('TRF_OBSERVACAO').AsString(*OBS*),'',IntToStr(CdTRF)+Letra[i],
                        vDataBase+StrToInt(Vetor[i]),0(*DtPag*),0(*DtOri*),DM.Configuracao1.Data(*Competencia*),
                        vValorTotal/QtdTit,0,sNumeroParcel,Seq,5(*TipoPagamento Cheque*),
                        0(*TitAnt*),0(*TitOri*), False) then

                       Raise exception.Create('');
                  end;
                end;
                //
                // Gerando Titulo a Receber na Luciano somente no CPD
                if not DM.Configuracao1.Active then
                   DM.Configuracao1.Open;
                DM.Configuracao1.First;
                if (DM.Configuracao1.Empresa = empLuciano) and //Apenas Luciano Otica
                   (vValorTotal > 0) then
                begin
                  Forma_de_Pagamento1.Close;
                  Forma_de_Pagamento1.ParamByName('FPG_CODIGO').AsInteger := Transferencia1.FieldByName('FPG_CODIGO').AsInteger;
                  Forma_de_Pagamento1.Open;
                  sNumeroParcel := Forma_de_Pagamento1.FieldByName('FPG_PRAZO').asstring;
                  TemEntrada := True;  //False
                  //
                  CdTRF := Transferencia1.FieldByName('TRF_CODIGO').AsInteger;
                  CNCDest := Transferencia1.FieldByName('TRF_CNC_DESTINO').AsInteger;
                  CNCOrig := Transferencia1.FieldByName('TRF_CNC_ORIGEM').AsInteger;

                  Titulo_receber1.Close;
                  Titulo_receber1.ParamByName('CNC_CODIGO').asInteger := iC;
                  Titulo_receber1.Open;
                  if Transferencia1.FieldByName('TRF_TIPO_DOCUMENTO').AsInteger > 0 then
                    vTipoDoc := Transferencia1.FieldByName('TRF_TIPO_DOCUMENTO').AsInteger
                  else
                    vTipoDoc := DM.Configuracao1.TipoDocumento;

                  with DM.QR_Consultas do
                  Begin
                    //if Transferencia1.FieldByName('CPC_CODIGO').AsInteger > 0 then (Antes)
                    if Transferencia1.FieldByName('PCP_CODIGO').AsInteger > 0 then
                    Begin
                      Close;
                      SQL.Text := 'SELECT * FROM PEDIDO_DE_COMPRA '+
                        ' WHERE PCP_CODIGO='+Transferencia1.FieldByName('PCP_CODIGO').AsString;
                      Open;
                      if Transferencia1.FieldByName('TRF_TIPO_DOCUMENTO').asInteger = 81 then //Cheque
                        vValorTotal := vValorTotal + vValorTotal*DM.Configuracao1.AliquotaCPMF/100;
                    end;
                  end;

                  vDataBase := Transferencia1.FieldByName('TRF_DATA').AsDateTime;
                  if FieldByName('PCP_CODIGO').asInteger > 0 then
                  Begin
                    with DM.QR_Consultas do
                    Begin
                      Close;
                      SQL.Text := 'SELECT * '+
                        ' FROM PEDIDO_DE_COMPRA '+
                        ' WHERE PCP_CODIGO='+Transferencia1.FieldByName('PCP_CODIGO').asString;
                      Open;
                      if FieldByName('PCP_DT_ENTREGA').asDateTime > 0 then
                        vDataBase := FieldByName('PCP_DT_ENTREGA').asDateTime;
                    end;
                  end;

                  if not Titulo_receber1.GerarTitAvulso(CdTRF,CNCDest,CNCDest,
                      Transferencia1.FieldByName('FPG_CODIGO').AsInteger,
                      vTipoDoc,CdTRF,vValorTotal ,
                      //+ (vValorTotal*(DM.Configuracao1.CustoOperacional/100))
                      1,False,TemEntrada,False,sNumeroParcel,
                      'Gerado pela Tranferencia No.: '+IntToStr(CdTRF),'',
                      vDataBase) then
                     Raise exception.Create('');
                end;

              end;

              {If DM.Configuracao1.ControleTransacao then
                Commit;
            except
              If DM.Configuracao1.ControleTransacao then
                if trans then
                Begin
                  RollBack;
                  ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para LANTECH');
                end;
            end;}
          end;
          Next;
        end;
      End;
    End;


    //Gerar Pedido Auxiliar
    if DM.Configuracao1.Empresa = empLuciano then
    Begin
      //Mudar a situação dos pedidos auxiliares para o qual foram gerados serviços
      ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_AUXILIAR SET '+
        ' PDV_SITUACAO=1 '+
        ' WHERE PDV_SITUACAO=0 '+
        ' AND EXISTS (SELECT PDV_CODIGO '+
        ' FROM PEDIDO_DE_VENDA P1 '+
        ' WHERE P1.CNC_CODIGO=PEDIDO_AUXILIAR.CNC_CODIGO '+
        ' AND P1.PDV_DOCUMENTO=PEDIDO_AUXILIAR.PDV_DOCUMENTO)');

      with Query1 do
      Begin
        Close;
        SQL.Text := 'SELECT P1.*, D1.* '+
          ' FROM PEDIDO_DE_VENDA P1, DETALHE_DE_PEDIDO_DE_VENDA D1 '+
          ' WHERE P1.PDV_SITUACAO<4 '+
          ' AND (P1.PDV_SERVICO=0 OR P1.PDV_SERVICO IS NULL) '+
          ' AND P1.PDV_DATA_HORA>="'+MesDia('15/07/2004')+'" '+  //Now-5
          ' AND (D1.DPV_OD_ESF<>0 '+
          '   OR D1.DPV_OE_ESF<>0 '+
          '   OR D1.DPV_OD_CIL<>0 '+
          '   OR D1.DPV_OE_CIL<>0 '+
          '   OR D1.DPV_OD_EIXO<>0 '+
          '   OR D1.DPV_OE_EIXO<>0 '+
          '   OR D1.DPV_OD_DNP<>0 '+
          '   OR D1.DPV_OE_DNP<>0 '+
          '   OR D1.DPV_OD_ALT<>0 '+
          '   OR D1.DPV_OE_ALT<>0 '+
          '   OR D1.DPV_OD_ADICAO<>0 '+
          '   OR D1.DPV_OE_ADICAO<>0) '+


          ' AND (NOT D1.DPV_OD_ESF IS NULL '+
          '   OR NOT D1.DPV_OE_ESF IS NULL '+
          '   OR NOT D1.DPV_OD_CIL IS NULL '+
          '   OR NOT D1.DPV_OE_CIL IS NULL '+
          '   OR NOT D1.DPV_OD_EIXO IS NULL '+
          '   OR NOT D1.DPV_OE_EIXO IS NULL '+
          '   OR NOT D1.DPV_OD_DNP IS NULL '+
          '   OR NOT D1.DPV_OE_DNP IS NULL '+
          '   OR NOT D1.DPV_OD_ALT IS NULL '+
          '   OR NOT D1.DPV_OE_ALT IS NULL '+
          '   OR NOT D1.DPV_OD_ADICAO IS NULL '+
          '   OR NOT D1.DPV_OE_ADICAO IS NULL) '+


          ' AND P1.CNC_CODIGO=D1.CNC_CODIGO '+
          ' AND P1.PDV_CODIGO=D1.PDV_CODIGO ';
        Open;
        while not Eof do
        Begin
          DM.QR_Consultas.Close;
          DM.QR_Consultas.SQL.Text := 'SELECT PDV_CODIGO '+
            ' FROM PEDIDO_AUXILIAR '+
            ' WHERE CNC_ORIGEM='+FieldByName('CNC_CODIGO').asString+
            ' AND PDV_PASCIENTE="'+FieldByName('DPV_PASCIENTE').asString+'"'+
            ' AND PDV_DOCUMENTO="'+PreencheZero(2,FieldByName('CNC_CODIGO').asInteger)+'-'+
                                   PreencheZero(8,FieldByName('PDV_CODIGO').asInteger)+'" ';
          DM.QR_Consultas.Open;
          //
          if DM.QR_Consultas.IsEmpty then
          Begin
            CdPDV := FieldByName('PDV_CODIGO').asInteger; //DM.Configuracao1.ProximoCodigo('PDV_CODIGO');
            DM.Cliente1.Close;
            DM.Cliente1.ParamByName('CNC_CODIGO').asInteger := FieldByName('CNC_CLIENTE').asInteger;
            DM.Cliente1.ParamByName('CLI_CODIGO').asInteger := FieldByName('CLI_CODIGO').asInteger;
            DM.Cliente1.Open;
            //
            Item_Pedido_Venda1.Close;
            Item_Pedido_Venda1.ParamByName('CNC_CODIGO').asInteger := FieldByName('CNC_CODIGO').asInteger;
            Item_Pedido_Venda1.ParamByName('PDV_CODIGO').asInteger := FieldByName('PDV_CODIGO').asInteger;
            Item_Pedido_Venda1.Open;

            try

              ExecutaSQL(DM.QR_Comandos,'INSERT PEDIDO_AUXILIAR '+
                '(CNC_ORIGEM,CNC_CODIGO,PDV_CODIGO,USU_CODIGO '+
                ',PDV_MAQUINA,PDV_DT_CADASTRO,PDV_DT_PEDIDO,PDV_DT_PREVISAO '+
                ',CNC_CLIENTE,CLI_CODIGO,PDV_DOCUMENTO,PDV_TIPO_ARMACAO '+
                ',PDV_OBS_ARMACAO,PDV_TIPO_LENTES,PDV_OBS_LENTES,PDV_MEDICO_CRM '+
                ',PDV_MEDICO_NOME,PDV_MEDICO_FONE '+
                ',PDV_OD_ESF,PDV_OE_ESF,PDV_OD_CIL,PDV_OE_CIL '+
                ',PDV_OD_EIXO,PDV_OE_EIXO,PDV_OD_DNP,PDV_OE_DNP '+
                ',PDV_OD_ALT,PDV_OE_ALT,PDV_OD_ADICAO,PDV_OE_ADICAO '+
                ',PDV_SITUACAO,FUN_CODIGO,PDV_OBSERVACAO,PDV_PASCIENTE) '+
                ' VALUES '+
                '( '+IntToStr(FieldByName('CNC_CODIGO').asInteger)+   //Dado Antigo: Pre_Recebimento1.CentroDeCusto
                ', '+IntToStr(DM.Configuracao1.Deposito)+        //Gerar para o depósito (Laboratório)
                ', '+IntToStr(CdPDV)+
                ',1'+ //Usuário
                ', '+IntToStr(Pre_Recebimento1.Maquina)+
                ',"'+MesDiaHora(Now)+'" '+
                ',"'+MesDiaHora(FieldByName('PDV_DATA_HORA').asDateTime)+'" '+
                ',"'+MesDiaHora(FieldByName('PDV_DATA_HORA').asDateTime+8)+'" '+ //Data de Previsão
                ', '+IntToStr(DM.Configuracao1.Deposito)+        //Usar Cliente do depósito (Laboratório)
                ', '+FieldByName('CNC_CODIGO').asString+        //O cliente é a própria loja
                ',"'+PreencheZero(2,FieldByName('CNC_CODIGO').asInteger)+'-'+
                     PreencheZero(8,FieldByName('PDV_CODIGO').asInteger)+'" '+
                ',"'+FieldByName('DPV_TIPO_ARMACAO').asString+'" '+
                ',"'+FieldByName('DPV_OBS_ARMACAO').asString+'" '+
                ',"'+FieldByName('DPV_TIPO_LENTES').asString+'" '+
                ',"'+FieldByName('DPV_OBS_LENTES').asString+'" '+
                ', '+FieldByName('DPV_MEDICO_CRM').asString+
                ',"'+FieldByName('DPV_MEDICO_NOME').asString+'" '+
                ',"'+FieldByName('DPV_MEDICO_FONE').asString+'" '+
                ', '+VirgPonto(FieldByName('DPV_OD_ESF').asFloat)+
                ', '+VirgPonto(FieldByName('DPV_OE_ESF').asFloat)+
                ', '+VirgPonto(FieldByName('DPV_OD_CIL').asFloat)+
                ', '+VirgPonto(FieldByName('DPV_OE_CIL').asFloat)+
                ', '+VirgPonto(FieldByName('DPV_OD_EIXO').asFloat)+
                ', '+VirgPonto(FieldByName('DPV_OE_EIXO').asFloat)+
                ', '+VirgPonto(FieldByName('DPV_OD_DNP').asFloat)+
                ', '+VirgPonto(FieldByName('DPV_OE_DNP').asFloat)+
                ', '+VirgPonto(FieldByName('DPV_OD_ALT').asFloat)+
                ', '+VirgPonto(FieldByName('DPV_OE_ALT').asFloat)+
                ', '+VirgPonto(FieldByName('DPV_OD_ADICAO').asFloat)+
                ', '+VirgPonto(FieldByName('DPV_OE_ADICAO').asFloat)+
                ',0'+ //Situacao
                ', '+Item_Pedido_Venda1.FieldByName('FUN_CODIGO').asString+
                ',"'+DM.Cliente1.RazaoSocial+' '+Trim('('+IntToStr(DM.Cliente1.CodigoCLI)+') '+
                     FieldByName('PDV_OBS').asString)+'" ,"'+FieldByName('DPV_PASCIENTE').asString+'") ');
              except
                txtgravar;
              end;
          end;
          Next;
        end;
      end;
    end;
    Close;
  end;
End;

procedure TfMxGeraPre.txtgravar;
var
  arq: TextFile;
begin
  AssignFile(arq,extractfilepath(application.ExeName)+'ERROR.TXT');
  Rewrite(arq);
  Writeln(arq,Query1.FieldByName('PDV_CODIGO').asstring);
  CloseFile(arq);
end;

end.

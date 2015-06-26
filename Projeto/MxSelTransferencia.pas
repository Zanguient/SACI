unit MxSelTransferencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Mask,
  SQuery, Grids, DBGrids, Transferencia, Menus, Item_Recebimento,
  Item_de_Transferencia;

type
  TfmxSelTransferencia = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    DSTransferencia: TDataSource;
    Transferencia1: TTransferencia;
    Panel1: TPanel;
    SB_Loc: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    Edit11: TEdit;
    ComboBox2: TComboBox;
    rdbLocalizar: TRadioButton;
    RadioButton2: TRadioButton;
    Transferencia1TRF_CODIGO: TIntegerField;
    Transferencia1CNC_CODIGO: TIntegerField;
    Transferencia1TRF_DATA: TDateTimeField;
    Transferencia1TRF_SITUACAO: TIntegerField;
    Transferencia1TRF_OBSERVACAO: TStringField;
    Transferencia1TRF_TOT_ITENS: TIntegerField;
    Transferencia1TRF_CNC_ORIGEM: TIntegerField;
    Transferencia1TRF_CNC_DESTINO: TIntegerField;
    Transferencia1USU_CODIGO: TIntegerField;
    Transferencia1TRF_DT_ALTERADO: TDateTimeField;
    Transferencia1TRF_NOTA_FISCAL: TIntegerField;
    Transferencia1TRF_AUTOMATICA: TIntegerField;
    Transferencia1FPG_CODIGO: TIntegerField;
    Transferencia1PCP_CODIGO: TIntegerField;
    Transferencia1FUN_ORIGEM: TIntegerField;
    Transferencia1FUN_DESTINO: TIntegerField;
    Transferencia1TRF_TIPO_DOCUMENTO: TIntegerField;
    Transferencia1Origem: TStringField;
    Transferencia1Destino: TStringField;
    Transferencia1Situacao: TStringField;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Transferencia2: TMenuItem;
    Confirmar1: TMenuItem;
    N1: TMenuItem;
    Localizar1: TMenuItem;
    Item_de_Transferencia1: TItem_de_Transferencia;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Transferencia1BeforeOpen(DataSet: TDataSet);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Transferencia1CalcFields(DataSet: TDataSet);
    procedure SB_LocClick(Sender: TObject);
    procedure rdbLocalizarClick(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmxSelTransferencia: TfmxSelTransferencia;

implementation

uses UDM, funcoes, MxTransferencia, MxRecebimento;

{$R *.DFM}

procedure TfmxSelTransferencia.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfmxSelTransferencia.BitBtn1Click(Sender: TObject);
begin
  If not Transferencia1.IsEmpty then
  Begin
    if tag = 0 then
    begin
      fMxTransfer.DateTimePicker1.Date := Transferencia1.FieldByName('TRF_DATA').asdateTime;
      fMxTransfer.DateTimePicker1Change(sender);
      fMxTransfer.Entidade.LocalizarCod(Transferencia1.CodigoTRF,Transferencia1.CodigoCNC);
      //fMxTransfer.Transferencia1.CarregaDados;
    end
    else if tag = 1 then //para recebimento
    begin
      Item_de_Transferencia1.Close;
      Item_de_Transferencia1.SQL.Text := 'SELECT * FROM ITEM_DE_TRANSFERENCIA'+
                                         ' WHERE CNC_CODIGO = '+IntToStr(Transferencia1.CodigoCNC)+
                                         ' AND TRF_CODIGO = '+IntToStr(Transferencia1.CodigoTRF);
      Item_de_Transferencia1.Open;
      Item_de_Transferencia1.First;
      while not Item_de_Transferencia1.Eof do
      begin

        with Item_de_Transferencia1 do
        begin
          fMxRecebim.Item_Recebimento1.Inserir(DM.Configuracao1.CodigoCNC,
                                               ProximoCodigo('IRC_CODIGO'),
                                               fMxRecebim.Recebimento1.CodigoREC,
                                               FieldByName('PRD_CODIGO').AsInteger,
                                               FieldByName('ITR_QUANTIDADE').AsFloat,
                                               0);
          Next;
        end;

      end;

    end;
  end
  Else
    raise Exception.Create('Registro não selecionado!');
end;

procedure TfmxSelTransferencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Transferencia1.Close;
end;

procedure TfmxSelTransferencia.Transferencia1BeforeOpen(DataSet: TDataSet);
begin
  try
    Transferencia1.ParamByName('CNC_CODIGO').AsInteger:=DM.Configuracao1.CodigoCNC;
  except
  end;
end;

procedure TfmxSelTransferencia.DBGrid1TitleClick(Column: TColumn);
begin
  if Transferencia1.FieldByName(Column.FieldName).FieldKind <> fkData then
    Exit;
  if Column.Index = 3 then
    Transferencia1.SOrdemdoGrid(Transferencia1.EDbgrid,Column,'C1')
  else if Column.Index = 4 then
    Transferencia1.SOrdemdoGrid(Transferencia1.EDbgrid,Column,'C2')
  else
    Transferencia1.SOrdemdoGrid(Transferencia1.EDbgrid,Column,'T');
end;

procedure TfmxSelTransferencia.Transferencia1CalcFields(DataSet: TDataSet);
begin
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT CNC_RZ_SOCIAL '+
      ' FROM CENTRO_DE_CUSTO '+
      ' WHERE CNC_CODIGO='+IntToStr(Transferencia1.CNCOrigem);
    Open;
    Transferencia1.FieldByName('Origem').asString := FieldByName('CNC_RZ_SOCIAL').asString;

    Close;
    SQL.Text := 'SELECT CNC_RZ_SOCIAL '+
      ' FROM CENTRO_DE_CUSTO '+
      ' WHERE CNC_CODIGO='+IntToStr(Transferencia1.CNCDest);
    Open;
    Transferencia1.FieldByName('Destino').asString := FieldByName('CNC_RZ_SOCIAL').asString;
  end;

  Case Transferencia1.Situacao of
    0: Transferencia1.FieldByName('Situacao').asString:='Solicitada';
    1: Transferencia1.FieldByName('Situacao').asString:='Processada';
    2: Transferencia1.FieldByName('Situacao').asString:='Embarcada';
    3: Transferencia1.FieldByName('Situacao').asString:='Recebida';
    4: Transferencia1.FieldByName('Situacao').asString:='Cancelada';
  end;
end;

procedure TfmxSelTransferencia.SB_LocClick(Sender: TObject);
begin
  if tag = 1 then
  begin
    Transferencia1.Selecao.Clear;
    Transferencia1.Selecao.Add('AND TRF_CNC_DESTINO='+IntToStr(DM.Configuracao1.CodigoCNC));
    Transferencia1.Selecao.Add('AND TRF_SITUACAO = 1');
  end;

  if rdbLocalizar.Checked then
    Transferencia1.Localizar
  else
    Transferencia1.Selecionar;
end;

procedure TfmxSelTransferencia.rdbLocalizarClick(Sender: TObject);
begin
  Transferencia1.Close;

  if tag = 0 then //se estiver selecionado a transferencia da tela de transferencia
    Transferencia1.SQL.Text:='SELECT * '+
       ' FROM TRANSFERENCIA '+
       ' WHERE CNC_CODIGO=:CNC_CODIGO '+
       ' ORDER BY TRF_CODIGO '
  else if tag = 1 then //se estiver selecionado a transferencia da tela de recebimento
    Transferencia1.SQL.Text:='SELECT * '+
       ' FROM TRANSFERENCIA '+
       ' WHERE TRF_CNC_DESTINO=:CNC_CODIGO '+
       ' AND TRF_SITUACAO = 1 ' +
       ' ORDER BY TRF_CODIGO ';

  Transferencia1.Open;
  Edit11.Setfocus;
end;

procedure TfmxSelTransferencia.RadioButton2Click(Sender: TObject);
begin
  Edit11.Setfocus;
end;

procedure TfmxSelTransferencia.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Transferencia1.Open;
  ComboBox2.ItemIndex := 0;
  edit11.SetFocus;
end;

end.

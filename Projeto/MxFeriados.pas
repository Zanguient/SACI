unit MxFeriados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Aligrid, ExtCtrls;

type
  TfMxFeriados = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Lbl_Mes: TLabel;
    Label1: TLabel;
    Grid: TStringAlignGrid;
    Btn_MesAnt: TBitBtn;
    BtnMesProx: TBitBtn;
    bitSalvar: TBitBtn;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    procedure Btn_MesAntClick(Sender: TObject);
    procedure BtnMesProxClick(Sender: TObject);
    procedure GridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure bitSalvarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Label1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    DatFim: TDateTime;
    DiaFim, MesRef, AnoRef : Word;
    DiaMarcado : integer;
    CelulaMarcada: array[0..1] of integer;
    procedure LimparGrid;
    procedure MontarGrid(Data:TDateTime);
  public
    DataInicio   : TDateTime;
    DatFer       : array[1..100] of String;
    HntFer       : array[1..100] of String;
    { Public declarations }
  end;

var
  fMxFeriados: TfMxFeriados;

implementation
uses
  UDM, Funcoes, MxAdicionaFeriado;
  
{$R *.dfm}

procedure TfMxFeriados.Btn_MesAntClick(Sender: TObject);
begin
  Dec(MesRef);
  if MesRef < 1 then
  Begin
    MesRef := 12;
    Dec(AnoRef);
  end;
  MontarGrid(EncodeDate(AnoRef, MesRef, 1));
end;

procedure TfMxFeriados.BtnMesProxClick(Sender: TObject);
begin
  Inc(MesRef);
  if MesRef > 12 then
  Begin
    MesRef := 1;
    Inc(AnoRef);
  end;
  MontarGrid(EncodeDate(AnoRef, MesRef, 1));
end;

procedure TfMxFeriados.LimparGrid;
var
  Lin, Col:integer;
Begin
  Memo1.Clear;
  for Lin := 1 to 6 do
    for Col := 0 to 6 do
    Begin
      grid.Cells[Col,Lin] := '';
      Grid.CellFont[Col,Lin].Style := [ ];
      Grid.CellFont[Col,Lin].color := clBlack;
      grid.ColorCell[Col,Lin] := clWindow; //clBtnFace
      grid.HintCell[Col,Lin] := '';
    end;
end;

procedure TfMxFeriados.MontarGrid(Data:TDateTime);
var
  Dia, Mes, Ano: Word;
  Lin, Ind, DiaSem, DiaOld: integer;
Begin
  //Limpar o Grid
  LimparGrid;

  //Coloca a primeira linha em negrito
  Grid.FixedRowFont[0].Style := [ fsBold ];

  //Seta o texto da primeira linha
  Grid.Cells[0,0] := 'DOM';
  Grid.Cells[1,0] := 'SEG';
  Grid.Cells[2,0] := 'TER';
  Grid.Cells[3,0] := 'QUA';
  Grid.Cells[4,0] := 'QUI';
  Grid.Cells[5,0] := 'SEX';
  Grid.Cells[6,0] := 'SAB';

  //Obter mês para setar Label
  // no alto do Calendário
  DecodeDate(Data, Ano, Mes, Dia);

  Case Mes of
    01: Lbl_Mes.Caption := 'Janeiro - ';
    02: Lbl_Mes.Caption := 'Fevereiro - ';
    03: Lbl_Mes.Caption := 'Março - ';
    04: Lbl_Mes.Caption := 'Abril - ';
    05: Lbl_Mes.Caption := 'Maio - ';
    06: Lbl_Mes.Caption := 'Junho - ';
    07: Lbl_Mes.Caption := 'Julho - ';
    08: Lbl_Mes.Caption := 'Agosto - ';
    09: Lbl_Mes.Caption := 'Setembro - ';
    10: Lbl_Mes.Caption := 'Outubro - ';
    11: Lbl_Mes.Caption := 'Novembro - ';
    12: Lbl_Mes.Caption := 'Dezembro - ';
  end;

  Lbl_Mes.Caption := Lbl_Mes.Caption+IntToStr(Ano);

  if Mes = 12 then
  Begin
    Mes := 1;
    Inc(Ano);
  end
  else
    Inc(Mes);

  DatFim := EncodeDate(Ano, Mes, 1);
  DatFim := DatFim - 1;
  DecodeDate(DatFim, Ano, Mes, DiaFim);

  //Apontar para último dia caso o DiaMarcadofor mairo que o existente ou -1
  if (DiaMarcado > DiaFim) or (DiaMarcado=-1) then
    DiaMarcado := DiaFim;
  //Loop do dia 1 até o último dia do mês
  Lin    := 0;
  DiaOld := 9;
  for Dia := 1 to DiaFim do
  Begin
    //Transformar ano, mês e dia para TDateTime e obter o dia da semana
    Data := EncodeDate(Ano, Mes, Dia);
    DiaSem := DayOfWeek(Data)-1;

    //Se dia da semana for menor que o dia da semana
    // anterior mudar de linha
    if DiaSem <= DiaOld then
    Begin
      DiaOld := DiaSem;
      Inc(Lin);
    end;

    //Escrever dia na célula
    Grid.Cells[DiaSem, Lin] := formatFloat('00;00',Dia);

    //Se for dia de hoje, colocar em negrito
    if Data = Date then
      grid.CellFont[DiaSem, Lin].Style := [ fsBold ];

    //Verificar se dia é feriado
    for Ind := 1 to High(DatFer) do
    Begin
      if FormatDateTime('dd/mm/yyyy', Data) = DatFer[Ind] then
      Begin
        Memo1.Lines.Add(copy(DatFer[ind],1,2)+' - '+HntFer[ind]);
        Grid.ColorCell[DiaSem, Lin] := clRed;
        Grid.CellFont[DiaSem, Lin].Color := clWhite;
        Grid.HintCell[DiaSem, Lin] := HntFer[Ind];
        Break;
      end
      else if FormatDateTime('dd/mm', Data) = DatFer[Ind] then
      Begin
        Memo1.Lines.Add(copy(DatFer[ind],1,2)+' - '+HntFer[ind]);
        Grid.ColorCell[DiaSem, Lin] := clRed;
        Grid.CellFont[DiaSem, Lin].Color := clWhite;
        Grid.HintCell[DiaSem, Lin] := HntFer[Ind];
        Break;
      end;
    end;

    if DiaMarcado = Dia then
    Begin
      CelulaMarcada[0] := DiaSem;
      CelulaMarcada[1] := Lin;
    end;
  end;

  //Marcar dia selecionado
  Grid.Col := CelulaMarcada[0];//DiaSem;
  Grid.Row := CelulaMarcada[1];//Lin;
end;

procedure TfMxFeriados.GridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
Begin
  try
    DiaMarcado := StrToInt(Grid.Cells[ACol, ARow]);
  except
    CanSelect := True;
{    if ARow > 1 then
    Begin
      DiaMarcado := -1;
    end
    else
      DiaMarcado := 1;
}
  end;
end;

procedure TfMxFeriados.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxFeriados.bitSalvarClick(Sender: TObject);
var
  i, j, ind : integer;
  Arquivo  : TextFile;
  Aux : array[1..2] of string;
  NomeArquivo : string;
begin
  for i := 1 to High(DatFer) - 1 do
  Begin
    for j := i + 1 to High(DatFer) do
    Begin
      if (DatFer[i] <> '') and (DatFer[j] <> '') then
      Begin
        if ((StrToInt(Copy(DatFer[i],4,2))=StrToInt(Copy(DatFer[j],4,2))) AND
            (StrToInt(Copy(DatFer[i],1,2))>StrToInt(Copy(DatFer[j],1,2)))) OR
            (StrToInt(Copy(DatFer[i],4,2))>StrToInt(Copy(DatFer[j],4,2))) then
        Begin
          Aux[1] := DatFer[i];
          Aux[2] := HntFer[i];
          DatFer[i] := DatFer[j];
          HntFer[i] := HntFer[j];
          DatFer[j] := Aux[1];
          HntFer[j] := Aux[2];
        end;
      end;
    end;
  end;
  NomeArquivo := cPastaSistema+'\Feriados.inf';
  AssignFile(Arquivo,NomeArquivo);
  Rewrite(Arquivo);
  try
    for Ind := 1 to High(DatFer) do
      if DatFer[ind] <> '' then
        Writeln(Arquivo, DatFer[ind]+';'+HntFer[ind]);
  finally
    CloseFile(Arquivo);
  end;
  Close;
end;

procedure TfMxFeriados.GridDblClick(Sender: TObject);
var
  VerAno : string;
  ind : integer;
begin
  VerAno := '';
  //Permissão para Cad/Alt/Exc Feriados
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(4680)) < 0 then
    exit;

  Application.CreateForm(TfMxAdicionaFeriado, fMxAdicionaFeriado);
  fMxAdicionaFeriado.tag := 0;
  fMxAdicionaFeriado.Posicao := 0;
  for Ind := 1 to High(DatFer) do
  Begin
    if (DatFer[Ind] = '') and (fMxAdicionaFeriado.Posicao = 0) then
      fMxAdicionaFeriado.Posicao := ind
    else if DatFer[Ind] <> '' then
      if (Copy(DatFer[Ind],1,5) = PreencheZero(2,DiaMarcado)+'/'+formatDateTime('mm',DatFim)) then
      Begin
        fMxAdicionaFeriado.Posicao := ind;
        if Length(DatFer[Ind]) > 5 then
          VerAno := Copy(DatFer[Ind],7,4);
      end
  end;
  fMxAdicionaFeriado.Edit1.Text := PreencheZero(2,DiaMarcado)+'/'+formatDateTime('mm',DatFim);
  fMxAdicionaFeriado.Edit2.Text := VerAno;
  fMxAdicionaFeriado.ShowModal;
  MontarGrid(StrToDate(PreencheZero(2,DiaMarcado)+'/'+formatDateTime('mm/yyyy',DatFim)));
end;

procedure TfMxFeriados.FormShow(Sender: TObject);
begin
  if DataInicio <> 0 then
    MontarGrid(DataInicio);
  DM.Usuario1.configuraTela(self);
end;

procedure TfMxFeriados.FormCreate(Sender: TObject);
var
  Tmp: Word;
  Feriados : array[1..200,1..2] of string;
  Linha    : string;
  Arquivo  : TextFile;
  i, j, k  : integer;
  NomeArquivo: string;
begin
  NomeArquivo := cPastaSistema+'\Feriados.inf';
  DataInicio  := 0;
  DecodeDate(Date, AnoRef, MesRef, Tmp);
  DiaMarcado  := Tmp;

  //Carrega Feriados
  if FileExists(NomeArquivo) then
  Begin
    try
      AssignFile(Arquivo,NomeArquivo);
      Reset(Arquivo);
      i := 1;
      j := 1;
      while not EOF(Arquivo) do
      Begin
        Readln(Arquivo, Linha);
        for k := 1 to Length(Linha) do
        Begin
          if Linha[k] <> ';' then
            Feriados[i,j] := Feriados[i,j] + Linha[k]
          else
            inc(j);
        end;
        j := 1;
        inc(i);
      end;
      CloseFile(Arquivo);
      for k := 1 to i do
      Begin
        DatFer[k] := Feriados[k,1];
        HntFer[k] := Feriados[k,2];
      end;
    except
    end;
  end
  else
  Begin
    //Alguns Feriados Fixos
    DatFer[1] := '01/01';
    DatFer[2] := '01/05';
    DatFer[3] := '07/09';
    DatFer[4] := '12/10';
    DatFer[5] := '02/11';
    DatFer[6] := '15/11';
    DatFer[7] := '25/12';

    //Descrição dos feriados
    HntFer[1] := 'Confraternização Universal';
    HntFer[2] := 'Dia do Trabalho';
    HntFer[3] := 'Dia da Independência';
    HntFer[4] := 'Feriado Religioso';
    HntFer[5] := 'Dia de Finados';
    HntFer[6] := 'Proclamação da República';
    HntFer[7] := 'Natal';
  end;

  MontarGrid(Date);
end;

procedure TfMxFeriados.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    bitSalvarClick(bitSalvar);
end;

procedure TfMxFeriados.Label1Click(Sender: TObject);
var
  Tmp: Word;
begin
  DecodeDate(Date, AnoRef, MesRef, Tmp);
  DiaMarcado := Tmp;
  MontarGrid(Date);
end;

procedure TfMxFeriados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.

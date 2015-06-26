////////////////////////////////////////////////////////////////////////////////
//============================================================================//
// NOME DO PROJETO.....: PSACI                                                //
//============================================================================//
// REVISÃO.............: 2.0                                                  //
// MÓDULO..............: PSACI                                                //
// UNIT................: Cadastro de Bancos                                   //
// ANALISTA............: Anderson Gonçalves                                   //
// DESENVOLVEDOR.......: Anderson Gonçalves                                   //
// DATA DAS ALTERAÇÕES.: 02/10/2010                                           //
//============================================================================//
// COMENTÁRIOS..:                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//============================================================================//
////////////////////////////////////////////////////////////////////////////////
unit ImpCheque;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Stdctrls, Registry, Windows, Dialogs, Funcoes, 
     ImpressoraCheque, Configuracao;

{ Unit-wide declarations }
type
  TItem = class(TObject)
    ICodigo         :Integer;
    IDescricao      :String;
    IUnidade        :String;
    ITributacao     :String;
    IQuantidade     :real;
    IValorUnitario  :real;
    IValorDesconto  :real;
  end;
{ var }
     { . . . }

type
  TImpCheque = class(TComponent)
    private
      { Private fields of TImpCheque }
        { Storage for property CConfiguracao }
        FCConfiguracao : TConfiguracao;

      { Private methods of TImpCheque }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;

    protected
      { Protected fields of TImpCheque }
        FIniFile : TRegistry;

      { Protected methods of TImpCheque }

    public
      { Public fields and properties of TImpCheque }
        IRetorno : Integer;

      { Public methods of TImpCheque }
        function AbrirPorta:Boolean;
        procedure AlterarBanco(pBanco: integer; linValor, linExtenso1, linExtenso2, linFavorecido, linCidade, colValor, colExtenso1, colExtenso2, colFavorecido, colCidade, colDia, colMes, colAno: integer);
        function Analisa_iRetorno:Boolean;
        procedure CancelarRelatorio(TodosCheques: Boolean);
        procedure ConfigurarImpressora(pCaracter, pVelocidade, pNBits: integer; pParidade, pCentavos: Boolean; pChancela: integer=2);
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        procedure EnviarComando;
        procedure ExcluirBanco(pCodigo: integer);
        procedure ExcluirFavorecido(pCodigo: integer);
        procedure FecharPorta;
        procedure ImprimirCheque(pBanco:integer; pFavorecido, pCidade: string; pData:TDateTime; pValor:Double);
        procedure ImprimirChequeTransferencia(pBanco:integer; pCidade, pAgencia, pConta, pMensagem: string; pData:TDateTime; pValor:Double);
        procedure ImprimirCopiaDeCheque;
        procedure ImprimirTexto(Texto:String; pLinha, PColuna: integer);
        procedure ImprimirTextoFormatado(Texto: String; pLinha, PColuna: integer; pTipo: integer=1; pNegrito: Boolean=False; pItalico: Boolean=False; pExpandido: Boolean=False);
        procedure IncluirBanco(pBanco: integer; linValor, linExtenso1, linExtenso2, linFavorecido, linCidade, colValor, colExtenso1, colExtenso2, colFavorecido, colCidade, colDia, colMes, colAno: integer);
        procedure IncluirFavorecido(pCodigo: integer; pFavorecido: string);
        procedure IncluirFavorecidoINI(pFavorecido, pCidade: string);
        procedure ProgramarMoeda(pSingular, pPlural: string);
        procedure ReiniciarConfiguracao;
        procedure SelecionarModelo(ComTeclado: Boolean);
        function TravarDocumento(Travar: integer):Boolean;

    published
      { Published properties of TImpCheque }
        property CConfiguracao : TConfiguracao
             read FCConfiguracao write FCConfiguracao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TImpCheque with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TImpCheque]);
end;

{ Method to set variable and property values and create objects }
procedure TImpCheque.AutoInitialize;
begin
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TImpCheque.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

function TImpCheque.AbrirPorta:Boolean;
var
  sPorta: string;
begin
  case CConfiguracao.ImpCheque of
    1: sPorta := 'COM1';
    2: sPorta := 'COM2';
    3: sPorta := 'COM3';
    4: sPorta := 'COM4';
    else
      sPorta := 'COM2';
  end;
  iRetorno := Bematech_DP_IniciaPorta(sPorta);
  Result := (iRetorno = 1);
end;

procedure TImpCheque.AlterarBanco(pBanco: integer; linValor, linExtenso1, linExtenso2, linFavorecido, linCidade, colValor, colExtenso1, colExtenso2, colFavorecido, colCidade, colDia, colMes, colAno: integer);
var
  Banco, Coordenadas : string;
begin
  Banco := PreencheZero(3, pBanco);
  Coordenadas := IntToStr(linValor) + ',' + IntToStr(linExtenso1) + ',' +
     IntToStr(linExtenso2)   + ',' + IntToStr(linFavorecido) + ',' +
     IntToStr(linCidade)     + ',' + IntToStr(colValor)      + ',' +
     IntToStr(colExtenso1)   + ',' + IntToStr(colExtenso2)   + ',' +
     IntToStr(colFavorecido) + ',' + IntToStr(colCidade)     + ',' +
     IntToStr(colDia)        + ',' + IntToStr(colMes)        + ',' +
     IntToStr(colAno);
  iretorno := Bematech_DP_IncluiAlteraBanco(Banco, Coordenadas);
  Analisa_iRetorno();
end;

function TImpCheque.Analisa_iRetorno:Boolean;
begin
  case iRetorno of
      0: ShowMessage('Erro de Comunicação. Verifique!');
//      1: ShowMessage('Comando Enviado com Sucesso!');
     -1: ShowMessage('Erro de Execução na Função. Verifique!');
     -2: ShowMessage('Parâmetro de Comando Inválido. Verifique!');
     -3: ShowMessage('Banco não encontrado no arquivo de bancos. Verifique!');
     -4: ShowMessage('Arquivo BEMAFI32.INI não encontrado. Verifique!');
     -5: ShowMessage('Erro ao abrir a porta de comunicação. Verifique!');
     -6: ShowMessage('Impressora desligada ou cabo de comunicação desconectado. Verifique!');
     -7: ShowMessage('Banco não encontrado no arquivo BemaFI32.ini. Verifique!');
     -8: ShowMessage('Erro ao criar ou gravar no arquivo status.txt ou retorno.txt. Verifique!');
    -18: ShowMessage('Não foi possível abrir arquivo .001 ou .sts!');
    -19: ShowMessage('Parâmetro do arquivo .001 diferentes!');
    -20: ShowMessage('Operação finalizada pelo operador!');
    -21: ShowMessage('Transação Não Ok!');
    -22: ShowMessage('Não foi possível terminar a impressão!');
    -23: ShowMessage('Não foi possível terminar a operação!');
  end;

  If iRetorno = 1 then
    Result := True
  else
    Result := False;
end;

procedure TImpCheque.CancelarRelatorio(TodosCheques: Boolean);
var
  Tipo: string;
begin
  if TodosCheques then
    Tipo := '*'
  else
    Tipo := 'U';

  iRetorno := Bematech_DP_CancelaRelatorio(Tipo);
  Analisa_iRetorno();
end;

procedure TImpCheque.ConfigurarImpressora(pCaracter, pVelocidade, pNBits: integer; pParidade, pCentavos: Boolean; pChancela: integer=2);
VAR
  Caracter, Velocidade, NBits, Paridade, Centavo, Chancela: Integer;
BEGIN
  // Verificando Caracter de Preenchimento.
  case pCaracter of
    0: Caracter := 0; //   Espaço em Branco
    1: Caracter := 1; //   *
    2: Caracter := 2; //   X
    3: Caracter := 3; //   #
    4: Caracter := 4; //   $
    5: Caracter := 5; //   %
    6: Caracter := 6; //   &
    7: Caracter := 7; //   '
    8: Caracter := 8; //   -
    9: Caracter := 9; //   /
    else
      Caracter := 0;
  end;

  // Verificando Velocidade.
  case pVelocidade of
    1: Velocidade := 1; // 1200
    2: Velocidade := 2; // 2400
    4: Velocidade := 4; // 4800
    9: Velocidade := 9; // 9600
    else
      Velocidade := 9;
  end;

  // Verificando o número de bits.
  case pNBits of
    7: NBits := 7;
    8: NBits := 8;
    else
      NBits := 8;
  end;

  // Verificando a Paridade.
  if pParidade then
    Paridade := 1  //Com Paridade
  else
    Paridade := 0;  //Sem Paridade

  // Verificando o Centavo.
  if pCentavos then
    Centavo := 1
  else
    Centavo := 0;

  Chancela := pChancela;

  iRetorno := Bematech_DP_ConfiguraImpressora(Chancela, Caracter,
    Velocidade, NBits, Paridade, Centavo);
  Analisa_iRetorno();
end;

constructor TImpCheque.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     FIniFile:=TRegistry.Create;
     FIniFile.RootKey:=HKEY_LOCAL_MACHINE;
     { Code to perform other tasks when the component is created }

end;

destructor TImpCheque.Destroy;
begin
     { AutoDestroy, which is generated by Component Create, frees any   }
     { objects created by AutoInitialize.                               }
     AutoDestroy;

     { Here, free any other dynamic objects that the component methods  }
     { created but have not yet freed.  Also perform any other clean-up }
     { operations needed before the component is destroyed.             }

     { Last, free the component by calling the Destroy method of the    }
     { parent class.                                                    }
     inherited Destroy;
end;

procedure TImpCheque.EnviarComando;
var
  Comando : string;
begin
  // Comando baixar o rolo pressor da impressora ( travar documento )
  Comando := #27 + #119 + #1;
  iRetorno := Bematech_DP_EnviaComando( Comando );

  if iRetorno = 1 then // não deu erro no comando para travar o documento
  Begin
    // Comando destravar documento
    Comando := #27 + #119 + #0;
    iRetorno := Bematech_DP_EnviaComando( Comando );
  End;
  Analisa_iRetorno();
end;

procedure TImpCheque.ExcluirBanco(pCodigo: integer);
var
  Codigo: string;
begin
  Codigo := PreencheZero(2, pCodigo);

  iRetorno := Bematech_DP_ExcluiBanco(Codigo);
  Analisa_iRetorno();
end;

procedure TImpCheque.ExcluirFavorecido(pCodigo: integer);
var
  Codigo: string;
begin
  Codigo := PreencheZero(2, pCodigo);

  iRetorno := Bematech_DP_DesprogramaFavorecido(Codigo);
  Analisa_iRetorno();
end;

procedure TImpCheque.FecharPorta;
Begin
  iRetorno := Bematech_DP_FechaPorta();
  Analisa_iRetorno();
end;


procedure TImpCheque.ImprimirCheque(pBanco:integer; pFavorecido, pCidade: string; pData:TDateTime; pValor:Double);
var
  Banco, Valor, Favorecido, Cidade, Data: string;
begin
  Banco      := PreencheZero(3, pBanco);
  Valor      := format('%.2f',[pValor]);
  Favorecido := PreencheEspaco(47,pFavorecido);
  Cidade     := PreencheEspaco(23,pCidade);
  Data       := DateToStr(pData);

  AbrirPorta;
  if iRetorno = 1 then
  Begin
    iRetorno := Bematech_DP_ImprimeCheque( Banco, Valor, Favorecido, Cidade, Data, Pchar('') );
    Analisa_iRetorno();
    FecharPorta;
  end;
end;

procedure TImpCheque.ImprimirChequeTransferencia(pBanco:integer; pCidade, pAgencia, pConta, pMensagem: string; pData:TDateTime; pValor:Double);
var
  Banco, Valor, Cidade, Data, Agencia, Conta, Mensagem: string;
begin
  Banco    := PreencheZero(3,pBanco);
  Valor    := format('%.2f',[pValor]);
  Cidade   := PreencheEspaco(12 ,pCidade);
  Data     := DateToStr(pData);
  Agencia  := PreencheEspaco(10 ,pAgencia);
  Conta    := PreencheEspaco(10 ,pConta);
  Mensagem := PreencheEspaco(25 ,pMensagem);

  AbrirPorta;
  if iRetorno = 1 then
  Begin
    iRetorno := Bematech_DP_ImprimeChequeTransferencia( Banco, Valor, Cidade, Data, Agencia, Conta, Mensagem );
    Analisa_iRetorno();
    FecharPorta;
  end;
end;

procedure TImpCheque.ImprimirCopiaDeCheque;
begin
  AbrirPorta;
  if iRetorno = 1 then
  Begin
    iRetorno := Bematech_DP_ImprimeCopiaCheque();
    Analisa_iRetorno();
    FecharPorta;
  end;
end;

procedure TImpCheque.ImprimirTexto(Texto:String; pLinha, PColuna: integer);
var
  i : integer;
  Mensagem : TStringList;
  Linha, Coluna : string;
begin
  if Texto = '' then
    Exit;
  Mensagem := TStringList.Create;
  try
    Mensagem.Text := Texto;

    Linha := '';
    for i:=1 to pLinha do
      Linha := Linha + #13 + #10;

    Coluna := '';
    for i:=1 to pColuna do
      Coluna := Coluna + ' ';

    if AbrirPorta then
    Begin
      if TravarDocumento(1) then
      Begin
        for i := 0 to Mensagem.Count - 1 do
        Begin
          if Mensagem[i] <> '' then
          Begin
            iRetorno := Bematech_DP_ImprimeTexto(Linha + Coluna + Mensagem[i], 1);
            Linha := '';
          end;
          sleep(500);
        end;
        TravarDocumento(0);
      end;
      Analisa_iRetorno();
      FecharPorta;
    end;
  finally
    Mensagem.Free;
  end;
end;


procedure TImpCheque.ImprimirTextoFormatado(Texto: String; pLinha, PColuna: integer; pTipo: integer=1; pNegrito: Boolean=False; pItalico: Boolean=False; pExpandido: Boolean=False);
var
  i, Negrito, Italico, Expandido : integer;
  Modo, Linha, Coluna : string;
  Mensagem : TStringList;
begin
  if Texto = '' then
    Exit;
  Mensagem := TStringList.Create;
  try
    Mensagem.Text := Texto;
    // Verifica modo NORMAL, ELITE ou CONDENSADO.
    case pTipo of
      0: Modo := 'C'; //Condensado
      1: Modo := 'N'; //Normal
      2: Modo := 'E'; //Elite
     else
       Modo := 'N';
    end;

    if pNegrito then
      Negrito   := 1
    else
      Negrito   := 0;

    if pItalico then
      Italico   := 1
    else
      Italico   := 0;

    if pExpandido then
      Expandido := 1
    else
      Expandido := 0;

    Linha := '';
    for i:=1 to pLinha do
      Linha := Linha + #13 + #10;

    Coluna := '';
    for i:=1 to pColuna do
      Coluna := Coluna + ' ';

    if AbrirPorta then
    Begin
      if TravarDocumento(1) then
      Begin
        for i := 0 to Mensagem.Count - 1 do
        Begin
          if Mensagem[i] <> '' then
          Begin
            iRetorno := Bematech_DP_FormataTexto(Linha + Coluna + Mensagem[i] + #13 + #10, modo, italico, expandido, negrito);
            Linha := '';
          end;
          sleep(500);
        end;
        TravarDocumento(0);
      end;
      Analisa_iRetorno();
      FecharPorta;
    end;
  finally
    Mensagem.Free;
  end;
end;

procedure TImpCheque.IncluirBanco(pBanco: integer; linValor, linExtenso1, linExtenso2, linFavorecido, linCidade, colValor, colExtenso1, colExtenso2, colFavorecido, colCidade, colDia, colMes, colAno: integer);
var
  Banco, Coordenadas : string;
begin
  Banco := PreencheZero(3, pBanco);
  Coordenadas := IntToStr(linValor) + ',' + IntToStr(linExtenso1) + ',' +
     IntToStr(linExtenso2)   + ',' + IntToStr(linFavorecido) + ',' +
     IntToStr(linCidade)     + ',' + IntToStr(colValor)      + ',' +
     IntToStr(colExtenso1)   + ',' + IntToStr(colExtenso2)   + ',' +
     IntToStr(colFavorecido) + ',' + IntToStr(colCidade)     + ',' +
     IntToStr(colDia)        + ',' + IntToStr(colMes)        + ',' +
     IntToStr(colAno);
  iretorno := Bematech_DP_ProgramaBanco(Banco, Coordenadas);
  Analisa_iRetorno();
end;

procedure TImpCheque.IncluirFavorecido(pCodigo: integer; pFavorecido: string);
var
  Codigo, Favorecido: string;
begin
  Codigo     := PreencheZero(2, Codigo);
  Favorecido := PreencheEspaco(47, pFavorecido);

  iRetorno := Bematech_DP_ProgramaFavorecido(Codigo, Favorecido);
  Analisa_iRetorno();
end;

procedure TImpCheque.IncluirFavorecidoINI(pFavorecido, pCidade: string);
var
  Favorecido, Cidade: string;
begin
  Favorecido := PreencheEspaco(46, pFavorecido) + #0;
  Cidade     := PreencheEspaco(30, pCidade) + #0;

  iRetorno := Bematech_DP_IncluiCidadeFavorecido( Cidade, Favorecido );
  Analisa_iRetorno();
end;

procedure TImpCheque.ProgramarMoeda(pSingular, pPlural: string);
var
  Singular, Plural: string;
begin
  Singular := Trim(PreencheEspaco(10, pSingular));
  Plural   := Trim(PreencheEspaco(10, pPlural));

  iRetorno := Bematech_DP_ProgramaMoeda(Singular, Plural);
  Analisa_iRetorno();
end;

procedure TImpCheque.ReiniciarConfiguracao;
begin
  iRetorno := Bematech_DP_ReinicializaConfiguracao();
  Analisa_iRetorno();
end;

procedure TImpCheque.SelecionarModelo(ComTeclado: Boolean);
var
  ModeloImpressora: integer;
Begin
   if ComTeclado then
      ModeloImpressora := 1
   else
      ModeloImpressora := 0;

  iRetorno := Bematech_DP_ConfiguraModeloImpressora (ModeloImpressora);
  Analisa_iRetorno();
end;

function TImpCheque.TravarDocumento(Travar: integer):Boolean;
begin
  iRetorno := Bematech_DP_TravaDocumento(Travar);
  Result := (iRetorno = 1);
end;


end.

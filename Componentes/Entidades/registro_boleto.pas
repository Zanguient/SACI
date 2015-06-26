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
unit Registro_Boleto;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Windows, Funcoes, 
     Variants;

type
  TRegistro_Boleto = class(TSQuery)
    private
      { Private fields of TRegistro_Boleto }
        { Storage for property Agencia }
        FAgencia : String;
        { Storage for property CodigoRBO }
        FCodigoRBO : Integer;
        { Storage for property Conta }
        FConta : String;
        { Storage for property DadosTitulo }
        FDadosTitulo : String;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property DataGeracaoArquivo }
        FDataGeracaoArquivo : TDateTime;
        { Storage for property NomeArquivo }
        FNomeArquivo : String;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property SegmentoP }
        FSegmentoP : String;
        { Storage for property SegmentoQ }
        FSegmentoQ : String;
        { Storage for property SegmentoR }
        FSegmentoR : String;
        { Storage for property SegmentoS }
        FSegmentoS : String;
        { Storage for property SegmentoT }
        FSegmentoT : String;
        { Storage for property SegmentoU }
        FSegmentoU : String;
        { Storage for property SegmentoW }
        FSegmentoW : String;
        { Storage for property SequencialArquivo }
        FSequencialArquivo : Integer;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Tipo }
        FTipo : Integer;
        { Storage for property VersaoLayout }
        FVersaoLayout : Integer;

      { Private methods of TRegistro_Boleto }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Agencia }
        function GetAgencia : String;
        { Read method for property CodigoRBO }
        function GetCodigoRBO : Integer;
        { Read method for property Conta }
        function GetConta : String;
        { Read method for property DadosTitulo }
        function GetDadosTitulo : String;
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Read method for property DataGeracaoArquivo }
        function GetDataGeracaoArquivo : TDateTime;
        { Read method for property NomeArquivo }
        function GetNomeArquivo : String;
        { Read method for property OBS }
        function GetOBS : String;
        { Read method for property SegmentoP }
        function GetSegmentoP : String;
        { Read method for property SegmentoQ }
        function GetSegmentoQ : String;
        { Read method for property SegmentoR }
        function GetSegmentoR : String;
        { Read method for property SegmentoS }
        function GetSegmentoS : String;
        { Read method for property SegmentoT }
        function GetSegmentoT : String;
        { Read method for property SegmentoU }
        function GetSegmentoU : String;
        { Read method for property SegmentoW }
        function GetSegmentoW : String;
        { Read method for property SequencialArquivo }
        function GetSequencialArquivo : Integer;
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Read method for property Tipo }
        function GetTipo : Integer;
        { Read method for property VersaoLayout }
        function GetVersaoLayout : Integer;

    protected
      { Protected fields of TRegistro_Boleto }

      { Protected methods of TRegistro_Boleto }

    public
      { Public fields and properties of TRegistro_Boleto }

      { Public methods of TRegistro_Boleto }
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        function Inserir(PTipo,PSeqArq,PVersaoLayOut:integer; DtGerArq:TDateTime; PAg,PConta,PSegP,PSegQ,PSegR,PSegS,PSegT,PSegU,PSegW,PDadosTitulo,PNomeArq,PObs:string):Boolean;
        { Localiza um Grau }
        function LocalizarCod(CdRBO:Integer):Boolean;

    published
      { Published properties of TRegistro_Boleto }
        property Agencia : String read GetAgencia write FAgencia;
        property CodigoRBO : Integer read GetCodigoRBO write FCodigoRBO;
        property Conta : String read GetConta write FConta;
        property DadosTitulo : String read GetDadosTitulo write FDadosTitulo;
        property DataAlterado : TDateTime
             read GetDataAlterado write FDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write FDataCadastro;
        property DataGeracaoArquivo : TDateTime
             read GetDataGeracaoArquivo write FDataGeracaoArquivo;
        property NomeArquivo : String read GetNomeArquivo write FNomeArquivo;
        property OBS : String read GetOBS write FOBS;
        property SegmentoP : String read GetSegmentoP write FSegmentoP;
        property SegmentoQ : String read GetSegmentoQ write FSegmentoQ;
        property SegmentoR : String read GetSegmentoR write FSegmentoR;
        property SegmentoS : String read GetSegmentoS write FSegmentoS;
        property SegmentoT : String read GetSegmentoT write FSegmentoT;
        property SegmentoU : String read GetSegmentoU write FSegmentoU;
        property SegmentoW : String read GetSegmentoW write FSegmentoW;
        property SequencialArquivo : Integer
             read GetSequencialArquivo write FSequencialArquivo;
        property Situacao : Integer read GetSituacao write FSituacao;
        property Tipo : Integer read GetTipo write FTipo;
        property VersaoLayout : Integer
             read GetVersaoLayout write FVersaoLayout;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TRegistro_Boleto with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TRegistro_Boleto]);
end;

{ Method to set variable and property values and create objects }
procedure TRegistro_Boleto.AutoInitialize;
begin
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TRegistro_Boleto.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Agencia }
function TRegistro_Boleto.GetAgencia : String;
begin
  try
    Result := Self.fieldByName('RBO_AGENCIA').asString;
  except
    result:= '';
  end;
end;

{ Read method for property CodigoRBO }
function TRegistro_Boleto.GetCodigoRBO : Integer;
begin
  try
    Result := Self.fieldByName('RBO_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Conta }
function TRegistro_Boleto.GetConta : String;
begin
  try
    Result := Self.fieldByName('RBO_CONTA').asString;
  except
    result:= '';
  end;
end;

{ Read method for property DadosTitulo }
function TRegistro_Boleto.GetDadosTitulo : String;
begin
  try
    Result := Self.fieldByName('RBO_DADOS_TITULO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property DataAlterado }
function TRegistro_Boleto.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('RBO_DT_ALTERADO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property DataCadastro }
function TRegistro_Boleto.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('RBO_DT_CADASTRO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property DataGeracaoArquivo }
function TRegistro_Boleto.GetDataGeracaoArquivo : TDateTime;
begin
  try
    Result := Self.fieldByName('RBO_DT_GERACAO_ARQUIVO').asDateTime;
  except
    result:= 0
  end;
end;

{ Read method for property NomeArquivo }
function TRegistro_Boleto.GetNomeArquivo : String;
begin
  try
    Result := Self.fieldByName('RBO_NOME_ARQUIVO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property OBS }
function TRegistro_Boleto.GetOBS : String;
begin
  try
    Result := Self.fieldByName('RBO_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property SegmentoP }
function TRegistro_Boleto.GetSegmentoP : String;
begin
  try
    Result := Self.fieldByName('RBO_SEGMENTO_P').asString;
  except
    result:= '';
  end;
end;

{ Read method for property SegmentoQ }
function TRegistro_Boleto.GetSegmentoQ : String;
begin
  try
    Result := Self.fieldByName('RBO_SEGMENTO_Q').asString;
  except
    result:= '';
  end;
end;

{ Read method for property SegmentoR }
function TRegistro_Boleto.GetSegmentoR : String;
begin
  try
    Result := Self.fieldByName('RBO_SEGMENTO_R').asString;
  except
    result:= '';
  end;
end;

{ Read method for property SegmentoS }
function TRegistro_Boleto.GetSegmentoS : String;
begin
  try
    Result := Self.fieldByName('RBO_SEGMENTO_S').asString;
  except
    result:= '';
  end;
end;

{ Read method for property SegmentoT }
function TRegistro_Boleto.GetSegmentoT : String;
begin
  try
    Result := Self.fieldByName('RBO_SEGMENTO_T').asString;
  except
    result:= '';
  end;
end;

{ Read method for property SegmentoU }
function TRegistro_Boleto.GetSegmentoU : String;
begin
  try
    Result := Self.fieldByName('RBO_SEGMENTO_U').asString;
  except
    result:= '';
  end;
end;

{ Read method for property SegmentoW }
function TRegistro_Boleto.GetSegmentoW : String;
begin
  try
    Result := Self.fieldByName('RBO_SEGMENTO_W').asString;
  except
    result:= '';
  end;
end;

{ Read method for property SequencialArquivo }
function TRegistro_Boleto.GetSequencialArquivo : Integer;
begin
  try
    Result := Self.fieldByName('RBO_SEQUENCIAL_ARQUIVO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Situacao }
function TRegistro_Boleto.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('RBO_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Tipo }
function TRegistro_Boleto.GetTipo : Integer;
begin
  try
    Result := Self.fieldByName('RBO_TIPO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property VersaoLayout }
function TRegistro_Boleto.GetVersaoLayout : Integer;
begin
  try
    Result := Self.fieldByName('RBO_VERSAO_LAYOUT').asInteger;
  except
    result:= 0;
  end;
end;

constructor TRegistro_Boleto.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'REGISTRO_BOLETO';

     { Code to perform other tasks when the component is created }

end;

destructor TRegistro_Boleto.Destroy;
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

function TRegistro_Boleto.Inserir(PTipo,PSeqArq,PVersaoLayOut:integer; DtGerArq:TDateTime; PAg,PConta,PSegP,PSegQ,PSegR,PSegS,PSegT,PSegU,PSegW,PDadosTitulo,PNomeArq,PObs:string):Boolean;
var
  Cod: integer;
begin
  Cod := CConfiguracao.ProximoCodigo('RBO_CODIGO');
  result:=False;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT '+Tabela+
      '(CNC_ORIGEM,CNC_CODIGO,RBO_CODIGO,USU_CODIGO '+
      ',RBO_DT_CADASTRO,RBO_DT_GERACAO_ARQUIVO,RBO_TIPO '+
      ',RBO_NOME_ARQUIVO,RBO_SEQUENCIA_ARQUIVO,RBO_VERSAO_LAYOUT '+
      ',RBO_AGENCIA,RBO_CONTA '+
      ',RBO_SEGMENTO_P,RBO_SEGMENTO_Q,RBO_SEGMENTO_R,RBO_SEGMENTO_S '+
      ',RBO_SEGMENTO_T,RBO_SEGMENTO_U,RBO_SEGMENTO_W '+
      ',RBO_DADOS_TITULO '+ //CBR454
      ',RBO_SITUACAO,RBO_OBSERVACAO) VALUES '+
      '( '+IntToStr(CentroDeCusto)+
      ', '+IntToStr(CConfiguracao.CodigoCNC)+
      ', '+IntToStr(Cod)+
      ', '+IntToStr(CConfiguracao.CodigoUSU)+
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',"'+MesDiaHora(DtGerArq)+'" '+
      ', '+IntToStr(PTipo)+ //0 - Saida; 1 - Entrada
      ',"'+PNomeArq+'" '+
      ', '+IntToStr(PSeqArq)+
      ', '+IntToStr(PVersaoLayOut)+
      ',"'+PAg+'" '+
      ',"'+PConta+'" '+
      ',"'+PSegP+'" '+
      ',"'+PSegQ+'" '+
      ',"'+PSegR+'" '+
      ',"'+PSegS+'" '+
      ',"'+PSegT+'" '+
      ',"'+PSegU+'" '+
      ',"'+PSegW+'" '+
      ',"'+PDadosTitulo+'" '+
      ',0'+ //Situacao
      ',"'+PObs+'") ');
    result:=True;
  except
    ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

{ Localiza um Grau }
function TRegistro_Boleto.LocalizarCod(CdRBO:Integer):Boolean;
begin
  If (CdRBO<>CodigoRBO) Then
    If locate('RBO_CODIGO', CdRBO, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;


end.

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
unit Movimento_de_Cheque;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Produto, Variants, Funcoes;

type
  TMovimento_de_Cheque = class(TSQuery)
    private
      { Private fields of TMovimento_de_Cheque }
        { Storage for property ChequeCNC }
        FChequeCNC : Integer;
        { Storage for property CodigoCHQ }
        FCodigoCHQ : Integer;
        { Storage for property CodigoEntrada }
        FCodigoEntrada : Integer;
        { Storage for property CodigoMCH }
        FCodigoMCH : Integer;
        { Storage for property DataCadastro }
        FDataCadastro : Tdatetime;
        { Storage for property EntradaCNC }
        FEntradaCNC : Integer;
        { Storage for property MaquinaMCH }
        FMaquinaMCH : Integer;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Tipo }
        FTipo : Integer;
        { Storage for property Valor }
        FValor : Double;

      { Private methods of TMovimento_de_Cheque }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property ChequeCNC }
        function GetChequeCNC : Integer;
        { Read method for property CodigoCHQ }
        function GetCodigoCHQ : Integer;
        { Read method for property CodigoEntrada }
        function GetCodigoEntrada : Integer;
        { Read method for property CodigoMCH }
        function GetCodigoMCH : Integer;
        { Read method for property DataCadastro }
        function GetDataCadastro : Tdatetime;
        { Read method for property EntradaCNC }
        function GetEntradaCNC : Integer;
        { Read method for property MaquinaMCH }
        function GetMaquinaMCH : Integer;
        { Read method for property Observacao }
        function GetObservacao : String;
        { Read method for property Tipo }
        function GetTipo : Integer;
        { Read method for property Valor }
        function GetValor : Double;

    protected
      { Protected fields of TMovimento_de_Cheque }

      { Protected methods of TMovimento_de_Cheque }

    public
      { Public fields and properties of TMovimento_de_Cheque }

      { Public methods of TMovimento_de_Cheque }
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        { Insere um Movimento de Cheque }
        function Inserir(CdCNC, CdCHQCNC, CdCHQ, CdEntradaCNC, CdEntrada, CdTipo: integer; PValor:Double; POBS:string=''):boolean;
        function LocalizarCod(CdMCH,CdCNC:Integer):Boolean;

    published
      { Published properties of TMovimento_de_Cheque }
        property ChequeCNC : Integer read GetChequeCNC write FChequeCNC;
        property CodigoCHQ : Integer read GetCodigoCHQ write FCodigoCHQ;
        property CodigoEntrada : Integer
             read GetCodigoEntrada write FCodigoEntrada;
        { Código do Produto }
        property CodigoMCH : Integer read GetCodigoMCH write FCodigoMCH;
        property DataCadastro : Tdatetime
             read GetDataCadastro write FDataCadastro;
        property EntradaCNC : Integer read GetEntradaCNC write FEntradaCNC;
        property MaquinaMCH : Integer read GetMaquinaMCH write FMaquinaMCH;
        property Observacao : String read GetObservacao write FObservacao;
        property Tipo : Integer read GetTipo write FTipo;
        property Valor : Double read GetValor write FValor;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TMovimento_de_Cheque with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TMovimento_de_Cheque]);
end;

{ Method to set variable and property values and create objects }
procedure TMovimento_de_Cheque.AutoInitialize;
begin
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TMovimento_de_Cheque.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property ChequeCNC }
function TMovimento_de_Cheque.GetChequeCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CHEQUE').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoCHQ }
function TMovimento_de_Cheque.GetCodigoCHQ : Integer;
begin
  try
    Result := Self.fieldByName('CHQ_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;


{ Read method for property CodigoEntrada }
function TMovimento_de_Cheque.GetCodigoEntrada : Integer;
begin
  try
    Result := Self.fieldByName('MCH_COD_ENTRADA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoMCH }
function TMovimento_de_Cheque.GetCodigoMCH : Integer;
begin
  try
    Result := Self.fieldByName('MCH_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property DataCadastro }
function TMovimento_de_Cheque.GetDataCadastro : Tdatetime;
begin
  try
    Result := Self.fieldByName('MCH_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property EntradaCNC }
function TMovimento_de_Cheque.GetEntradaCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_COD_ENTRADA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property MaquinaMCH }
function TMovimento_de_Cheque.GetMaquinaMCH : Integer;
begin
  try
    Result := Self.fieldByName('MCH_MAQUINA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Observacao }
function TMovimento_de_Cheque.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('MCH_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Tipo }
function TMovimento_de_Cheque.GetTipo : Integer;
begin
  try
    //1060 - Baixa Título;
    //1070 - Excluído/Devolvido ao cliente;
    //1080 - Envio para outro CNC;
    //1090 - Factoring;
    //1100 - Depositado;
    //1110 - Devolvido 1a;
    //1120 - Devolvido 2a;
    //1130 - Cancelar Troca CNC;
    //4010 - Rec. Avulso
    Result := Self.fieldByName('MCH_TIPO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Valor }
function TMovimento_de_Cheque.GetValor : Double;
begin
  try
    Result := Self.fieldByName('MCH_VALOR').asFloat;
  except
    result:= 0;
  end;
end;

constructor TMovimento_de_Cheque.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'MOVIMENTO_DE_CHEQUE';

     { Code to perform other tasks when the component is created }

end;

destructor TMovimento_de_Cheque.Destroy;
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

{ Insere um Movimento de Cheque }
function TMovimento_de_Cheque.Inserir(CdCNC, CdCHQCNC, CdCHQ, CdEntradaCNC, CdEntrada, CdTipo: integer; PValor:Double; POBS:string=''):boolean;
Var
  Cod:Integer;
begin
  Result := False;
  Cod    := ProximoCodigo('MCH_CODIGO');
  if CConfiguracao.Data <= 0 then
  Begin
    ShowMessage('Problema com a Data!');
    Exit;
  end;
  If VerificaRegistroExiste('CNC_CODIGO='+IntToStr(CdCNC)+' AND MCH_CODIGO='+IntToStr(Cod)) Then
    ShowMessage('Não foi possível inserir o registro da tabela '+Tabela+'. Já existe!')
  Else
  begin
    try
      ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO '+Tabela+
        '(CNC_CODIGO,MCH_CODIGO,CNC_ORIGEM,USU_CODIGO,MCH_DT_CADASTRO '+
        ',MCH_MAQUINA,CNC_CHEQUE,CHQ_CODIGO,MCH_TIPO '+
        ',CNC_COD_ENTRADA,MCH_COD_ENTRADA '+
        ',MCH_VALOR,MCH_SITUACAO '+
        ',MCH_OBSERVACAO) VALUES '+
        '( '+IntToStr(CdCNC)+
        ', '+IntToStr(Cod)+
        ', '+IntToStr(CentroDeCusto)+
        ', '+IntToStr(CConfiguracao.CodigoUSU)+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ', '+IntToStr(Maquina)+
        ', '+IntToStr(CdCHQCNC)+
        ', '+IntToStr(CdCHQ)+
        ', '+IntToStr(CdTipo)+
        ', '+IntToStr(CdEntradaCNC)+
        ', '+IntToStr(CdEntrada)+
        ', '+VirgPonto(PValor)+
        ',0'+ //Situacao
        ',"'+PObs+'") ');
      Result := True;
    except
      ShowMessage('Não foi possível incluir o registro corrente!');
    End;
  end;
end;

function TMovimento_de_Cheque.LocalizarCod(CdMCH,CdCNC:Integer):Boolean;
begin
  If (CdMCH<>CodigoMCH) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;MCH_CODIGO', vararrayof([CdCNC, CdMCH]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;


end.

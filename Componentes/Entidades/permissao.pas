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
unit Permissao;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Operacao_do_Sistema, Configuracao, Variants, 
     Funcoes;

type
  TPermissao = class(TSQuery)
    private
      { Private fields of TPermissao }
        { Storage for property COperacao_do_Sistema }
        FCOperacao_do_Sistema : TOperacao_do_Sistema;
        { Storage for property CodigoOPS }
        FCodigoOPS : Integer;
        { Storage for property CodigoPRM }
        FCodigoPRM : Integer;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Perfil }
        FPerfil : Integer;

      { Private methods of TPermissao }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoOPS }
        function GetCodigoOPS : Integer;
        { Read method for property CodigoPRM }
        function GetCodigoPRM : Integer;
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Read method for property Perfil }
        function GetPerfil : Integer;

    protected
      { Protected fields of TPermissao }

      { Protected methods of TPermissao }

    public
      { Public fields and properties of TPermissao }

      { Public methods of TPermissao }
        constructor Create(AOwner: TComponent); override;
        function DeletaForcado(Query: TQuery; CdCNC, CdOPS, CdUSU:Integer; PerguntarAntes:Boolean=True):Boolean;
        procedure Deletar(CdCNC, CdOPS:Integer);
        destructor Destroy; override;
        { Insere uma Permissão }
        function Inserir(CdPRM, CdCNC,CdOPS, CdUSU, PPerfil: Integer):boolean;
        function Localizar(CdUSU,CdOPS: Integer): Boolean;
        { Localiza uma Permissão }
        function LocalizarCod(CdPRM, CdCNC: Integer): Boolean;
        procedure del(CdOPS, CdUSU:Integer);
        function deletarauto:Boolean;

    published
      { Published properties of TPermissao }
        property COperacao_do_Sistema : TOperacao_do_Sistema
             read FCOperacao_do_Sistema write FCOperacao_do_Sistema;
        { Código da Operação do Sistema }
        property CodigoOPS : Integer read GetCodigoOPS write FCodigoOPS;
        { Código da Permissão }
        property CodigoPRM : Integer read GetCodigoPRM write FCodigoPRM;
        property DataCadastro : TDateTime
             read GetDataCadastro write FDataCadastro;
        property Perfil : Integer read GetPerfil write FPerfil;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TPermissao with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TPermissao]);
end;

{ Method to set variable and property values and create objects }
procedure TPermissao.AutoInitialize;
begin
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TPermissao.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoOPS }
function TPermissao.GetCodigoOPS : Integer;
begin
  try
    Result := Self.fieldByName('OPS_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property CodigoPRM }
function TPermissao.GetCodigoPRM : Integer;
begin
  try
    result := Self.fieldByName('PRM_CODIGO').asInteger;
  except
    Result := 0;
  end;
end;

{ Read method for property DataCadastro }
function TPermissao.GetDataCadastro : TDateTime;
begin
  try
    result := Self.fieldByName('PRM_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property Perfil }
function TPermissao.GetPerfil : Integer;
begin
  try
    result := Self.fieldByName('PRM_PERFIL').asInteger;
  except
    Result := 0;
  end;
end;

constructor TPermissao.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'PERMISSAO';

     { Code to perform other tasks when the component is created }

end;

function TPermissao.DeletaForcado(Query: TQuery; CdCNC, CdOPS, CdUSU:Integer; PerguntarAntes:Boolean=True):Boolean;
var
  sCNC: string;
begin
  sCNC := '';
  if CdCNC >= 0 then
    sCNC := ' AND (CNC_CODIGO='+IntToStr(CdCNC)+') ';
  Result := False;
  if PerguntarAntes then
    if MessageDlg('Deseja remover a permissão?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
  try
    ExecutaSQL(Query, 'DELETE FROM PERMISSAO '+
      ' WHERE OPS_CODIGO='+IntToStr(CdOPS)+
      ' AND USU_CODIGO='+IntToStr(CdUSU)+
      sCNC);
    Result := True;
  except
  end;
end;

procedure TPermissao.Deletar(CdCNC, CdOPS:Integer);
begin
  If not(localizarCod(CdOPS, CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      Delete;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TPermissao.Destroy;
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

{ Insere uma Permissão }
function TPermissao.Inserir(CdPRM, CdCNC,CdOPS, CdUSU, PPerfil: Integer):boolean;
Var
  Cod:Integer;
begin
  Result := False;
  if CdPRM=0 then
    Cod    := ProximoCodigo('PRM_CODIGO')
  else
    Cod    := CdPRM;
  if CConfiguracao.Data <= 0 then
  Begin
    ShowMessage('Problema com a Data!');
    Exit;
  end;
  If VerificaRegistroExiste('CNC_CODIGO='+IntToStr(CdCNC)+' AND PRM_CODIGO='+IntToStr(Cod)) Then
    ShowMessage('Não foi possível inserir o registro da tabela '+Tabela+'. Já existe!')
  Else
  begin
    try
      ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO '+Tabela+
        '(CNC_CODIGO,PRM_CODIGO,USU_CODIGO,PRM_DT_CADASTRO'+
        ',OPS_CODIGO,PRM_PERFIL) VALUES '+
        '( '+IntToStr(CdCNC)+
        ', '+IntToStr(Cod)+
        ', '+IntToStr(CdUSU)+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ', '+IntToStr(CdOPS)+
        ', '+IntToStr(PPerfil)+') ');
      Result := True;
    except
      ShowMessage('Não foi possível incluir o registro corrente!');
    End;
  end;
end;

function TPermissao.Localizar(CdUSU,CdOPS: Integer): Boolean;
begin
  If (CdUSU<>CodigoUSU) or (CdOPS<>CodigoOPS) Then
    If locate('USU_CODIGO; OPS_CODIGO', vararrayof([CdUSU, CdOPS]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

{ Localiza uma Permissão }
function TPermissao.LocalizarCod(CdPRM, CdCNC: Integer): Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdPRM<>CodigoPRM) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO; PRM_CODIGO', vararrayof([CdCNC, CdPRM]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TPermissao.del(CdOPS, CdUSU:Integer);
begin
  If not(localizar(CdUSU, CdOPS)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      Delete;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

function TPermissao.deletarauto:Boolean;
begin
  try
    Result := Delete;
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.

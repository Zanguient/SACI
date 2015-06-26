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
unit Cota;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TCota = class(TSQuery)
    private
      { Private fields of TCota }
        { Storage for property Ano }
        FAno : Integer;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoCOT }
        FCodigoCOT : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property DiasNUteis }
        FDiasNUteis : Integer;
        { Storage for property DiasUteis }
        FDiasUteis : Integer;
        { Storage for property EAno }
        FEAno : TEdit;
        { Storage for property ECodigoCOT }
        FECodigoCOT : TEdit;
        { Storage for property ECodigoUSU }
        FECodigoUSU : TDBLookupComboBox;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EDiasNUteis }
        FEDiasNUteis : TEdit;
        { Storage for property EDiasUteis }
        FEDiasUteis : TEdit;
        { Storage for property EMes }
        FEMes : TEdit;
        { Storage for property Mes }
        FMes : Integer;

      { Private methods of TCota }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Ano }
        function GetAno : Integer;
        { Write method for property Ano }
        procedure SetAno(Value : Integer);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoCOT }
        function GetCodigoCOT : Integer;
        { Write method for property CodigoCOT }
        procedure SetCodigoCOT(Value : Integer);
        { Read method for property CodigoUSU }
        function GetCodigoUSU : Integer;
        { Write method for property CodigoUSU }
        procedure SetCodigoUSU(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property DiasNUteis }
        function GetDiasNUteis : Integer;
        { Write method for property DiasNUteis }
        procedure SetDiasNUteis(Value : Integer);
        { Read method for property DiasUteis }
        function GetDiasUteis : Integer;
        { Write method for property DiasUteis }
        procedure SetDiasUteis(Value : Integer);
        { Read method for property Mes }
        function GetMes : Integer;
        { Write method for property Mes }
        procedure SetMes(Value : Integer);

    protected
      { Protected fields of TCota }

      { Protected methods of TCota }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TCota }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TCota }
        { Altera uma Desconto }
        function Alterar(CdCNC,CdCOT,PMes,PAno,PDiasU,PDiasNU: integer):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdCOT:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function Inserir(CdCNC,CdCOT,PMes,PAno,PDiasU,PDiasNU: integer):boolean;
        function InserirAuto:Boolean;
        { Localiza um grupo de consórcio }
        function LocalizarCod(CdCOT,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TCota }
        property Ano : Integer read GetAno write SetAno;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoCOT : Integer read GetCodigoCOT write SetCodigoCOT;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property DiasNUteis : Integer read GetDiasNUteis write SetDiasNUteis;
        property DiasUteis : Integer read GetDiasUteis write SetDiasUteis;
        property EAno : TEdit read FEAno write FEAno;
        property ECodigoCOT : TEdit read FECodigoCOT write FECodigoCOT;
        property ECodigoUSU : TDBLookupComboBox
             read FECodigoUSU write FECodigoUSU;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EDiasNUteis : TEdit read FEDiasNUteis write FEDiasNUteis;
        property EDiasUteis : TEdit read FEDiasUteis write FEDiasUteis;
        property EMes : TEdit read FEMes write FEMes;
        property Mes : Integer read GetMes write SetMes;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TCota with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TCota]);
end;

{ Method to set variable and property values and create objects }
procedure TCota.AutoInitialize;
begin
     Estado := 0;
     FEAno := nil;
     FECodigoCOT := nil;
     FECodigoUSU := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDbgrid := nil;
     FEDiasNUteis := nil;
     FEDiasUteis := nil;
     FEMes := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TCota.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEAno then
        FEAno := nil;
     if AComponent = FECodigoCOT then
        FECodigoCOT := nil;
     if AComponent = FECodigoUSU then
        FECodigoUSU := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEDiasNUteis then
        FEDiasNUteis := nil;
     if AComponent = FEDiasUteis then
        FEDiasUteis := nil;
     if AComponent = FEMes then
        FEMes := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TCota.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Ano }
function TCota.GetAno : Integer;
begin
  try
    Result := Self.fieldByName('COT_ANO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Ano }
procedure TCota.SetAno(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('COT_ANO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "COT_ANO"!');
    end;
end;

{ Read method for property CodigoCNC }
function TCota.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TCota.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoCOT }
function TCota.GetCodigoCOT : Integer;
begin
  try
    Result := Self.fieldByName('COT_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCOT }
procedure TCota.SetCodigoCOT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('COT_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "COT_CODIGO"!');
    end;
end;

{ Read method for property CodigoUSU }
function TCota.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoUSU }
procedure TCota.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('USU_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "USU_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TCota.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('COT_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TCota.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('COT_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "COT_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TCota.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('COT_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TCota.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('COT_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "COT_DT_CADASTRO"!');
  end;
end;

{ Read method for property DiasNUteis }
function TCota.GetDiasNUteis : Integer;
begin
  try
    Result := Self.fieldByName('COT_DIAS_NAO_UTEIS').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property DiasNUteis }
procedure TCota.SetDiasNUteis(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('COT_DIAS_NAO_UTEIS').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "COT_DIAS_NAO_UTEIS"!');
    end;
end;

{ Read method for property DiasUteis }
function TCota.GetDiasUteis : Integer;
begin
  try
    Result := Self.fieldByName('COT_DIAS_UTEIS').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property DiasUteis }
procedure TCota.SetDiasUteis(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('COT_DIAS_UTEIS').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "COT_DIAS_UTEIS"!');
    end;
end;

{ Read method for property Mes }
function TCota.GetMes : Integer;
begin
  try
    Result := Self.fieldByName('COT_MES').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Mes }
procedure TCota.SetMes(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('COT_MES').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "COT_MES"!');
    end;
end;

{ Altera uma Desconto }
function TCota.Alterar(CdCNC,CdCOT,PMes,PAno,PDiasU,PDiasNU: integer):boolean;
begin
  result := false;
  If not(localizarCod(CdCOT,CdCNC)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      edit;
      Mes            := PMes;
      Ano            := PAno;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      DataAlterado   := CConfiguracao.DataHora;
      DiasUteis      := PDiasU;
      DiasNUteis     := PDiasNU;

      try
        Post;
        result := true;

      except
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

function TCota.AlterarAuto:Boolean;
var
  COT:integer;
begin
  result := false;
  COT:=StrToInt(ECodigoCOT.Text);
  try
    edit;
    try
      Mes := StrToInt(EMes.Text);
    except
    end;
    try
      Ano := StrToInt(EAno.Text);
    except
    end;
    try
      CodigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DiasUteis := StrToInt(EDiasUteis.Text);
    except
    end;
    try
      DiasNUteis := StrToInt(EDiasNUteis.Text);
    except
    end;
    try
      DataAlterado := StrToDateTime(EDataAlterado.Text);
    except
    end;
    try
      Post;
      Result:=True;
      GeraLog(3870,CConfiguracao.CodigoCNC,COT);
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TCota.AtualizaControles(Habilitar:Boolean);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
    EDbgrid.Enabled          :=not Habilitar;
  except
  end;
  try
    EMes.Enabled       :=Habilitar;
  except
  end;
  try
    EAno.Enabled       :=Habilitar;
  except
  end;
  try
    EDiasUteis.Enabled      :=Habilitar;
  except
  end;
  try
    EDiasNUteis.Enabled :=Habilitar;
  except
  end;
end;

procedure TCota.CancelaEdicao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(False);
  Estado:=0;
  CarregaDados;
end;

procedure TCota.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 try
   ECodigoCOT.Text           :=IntToStr(CodigoCOT);
 except
 end;
 try
   if Mes < 10 then
     EMes.Text      :='0'+IntTostr(Mes)
   else
     EMes.Text      :=IntToStr(Mes);
 except
 end;
 try
   EAno.Text        :=IntToStr(Ano);
 except
 end;
 try
   ECodigoUSU.KeyValue        :=CodigoUSU;
 except
 end;
 try
   if DataCadastro=0 then
     EDataCadastro.Clear
   else
     EDataCadastro.Text          :=FormatDateTime('dd/mm/yyyy hh:mm', DataCadastro);
   except
 end;
 try
   if DataAlterado=0 then
     EDataAlterado.Clear
   else
     EDataAlterado.Text          :=FormatDateTime('dd/mm/yyyy hh:mm', DataAlterado);
 except
 end;
 try
   EDiasUteis.Text :=IntToStr(DiasUteis);
 except
 end;
 try
   EDiasNUteis.Text :=IntToStr(DiasNUteis);
 except
 end;
end;

constructor TCota.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;

     { Code to perform other tasks when the component is created }

end;

function TCota.Deletar(CdCNC,CdCOT:Integer):Boolean;
begin
  result := false;
  If not(localizarCod(CdCOT,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        if TQuery(Self).isEmpty then
        begin
          try
            ECodigoCOT.Clear;
          except
          end;
          try
            EMes.Clear;
          except
          end;
          try
            EAno.Clear;
          except
          end;
          try
            ECodigoUSU.KeyValue := 0;
          except
          end;
          try
            EDiasUteis.Clear;
          except
          end;
          try
            EDiasNUteis.Clear;
          except
          end;
          try
            EDataCadastro.Clear;
          except
          end;
          try
            EDataAlterado.Clear;
          except
          end;
        end;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TCota.Destroy;
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

function TCota.FinalizaEdicao:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
var
  cod:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  mensagem:='';
  if not VerificaInteiroBranco(EMes.Text) then
    mensagem:=mensagem+'Mês incorreto!'+#13;
  if (not VerificaInteiroBranco(EAno.Text)) OR
     (Length(EAno.Text)<>4) then
    mensagem:=mensagem+'Ano incorreto!'+#13;
  if not VerificaInteiroBranco(EDiasUteis.Text) then
    mensagem:=mensagem+'Dias Úteis incorreto!'+#13;
  if not VerificaInteiroBranco(EDiasNUteis.Text) then
    mensagem:=mensagem+'Dias não Úteis incorreto!'+#13;
  If mensagem <>'' Then
  Begin
    Result := False;
    ShowMessage(mensagem);
  end
  else
  Begin
    try
      if Length(EMes.Text) = 1 then
        EMes.Text:='0'+EMes.Text;
      StrToDate(IntToStr(StrToInt(EDiasUteis.Text)+StrToInt(EDiasNUteis.Text))+
        '/'+EMes.Text+'/'+EAno.Text);
    except
      Result := False;
      ShowMessage('Total de dias do mês inválido!');
      Exit;
    end;
    try
      StrToDate(IntToStr(StrToInt(EDiasUteis.Text)+StrToInt(EDiasNUteis.Text)+1)+
        '/'+EMes.Text+'/'+EAno.Text);
      Result := False;
      ShowMessage('Faltando dias para completar o mês!');
      Exit;
    except
    end;
    Aux:=AfterScroll;
    AfterScroll:=Nil;
    If Estado=1 then
    Begin
      if Inserirauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(SCodigo,CConfiguracao.CodigoCNC);
        CarregaDados;
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoCOT;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod,CConfiguracao.CodigoCNC);
        CarregaDados;
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    else
      Result := False;
    AfterScroll:=aux;
  end;
end;

function TCota.Inserir(CdCNC,CdCOT,PMes,PAno,PDiasU,PDiasNU: integer):boolean;
Var
  Cod: Integer;
begin
  result := false;
  if CdCOT=0 then
    Cod    := ProximoCodigo('COT_CODIGO')
  else
    Cod      := CdCOT;
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
     if Estado=3 then
     begin
       result:=true;
       exit;
     end;
     Insert;
     try
       CodigoCOT      := Cod;
       CodigoCNC      := CConfiguracao.CodigoCNC;
       CodigoUSU      := CConfiguracao.CodigoUSU;
       Mes            := PMes;
       Ano            := PAno;
       DiasUteis      := PDiasU;
       DiasNUteis      := PDiasNU;
       DataCadastro   := CConfiguracao.DataHora;

       try
         Post;
         result := true;

       except
         Cancel;
         ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
       end;
     except
       ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
     end;
  end;
end;

function TCota.InserirAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
begin
    try
      append;
      try
        CodigoCOT   := SCodigo;
      except
      end;
      try
        codigoCNC   := CConfiguracao.CodigoCNC;
      except
      end;
      try
        codigoUSU   := CConfiguracao.CodigoUSU;
      except
      end;
      try
        Mes         := StrToInt(EMes.Text);
      except
      end;
      try
        Ano         := StrToInt(EAno.Text);
      except
      end;
      try
        DiasUteis   := StrToInt(EDiasUteis.Text);
      except
      end;
      try
        DiasNUteis  := StrToInt(EDiasNUteis.Text);
      except
      end;
      try
        DataCadastro := StrToDateTime(EDataCadastro.Text);
      except
      end;
      try
        Post;
        result:=True;

      except
        result:=False;
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      result:=false;
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
end;

{ Localiza um grupo de consórcio }
function TCota.LocalizarCod(CdCOT,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdCOT<>CodigoCOT) or (CdCNC<>CodigoCNC)  Then
    If locate('CNC_CODIGO;COT_CODIGO', vararrayof([CdCNC, CdCOT]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TCota.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  try
    EDataAlterado.Text:=formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  Estado:=2;
end;

procedure TCota.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  ProximoCodigo('COT_CODIGO');
  try
    EMes.Text := formatDateTime('mm',CConfiguracao.Data);
  except
  end;
  try
    EAno.Text := formatDateTime('yyyy',CConfiguracao.Data);
  except
  end;
  try
    ECodigoUSU.KeyValue := CConfiguracao.CodigoUSU;
  except
  end;
  try
    EDataCadastro.Text:=formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  try
    EDataAlterado.Clear;
  except
  end;
  try
    EDiasUteis.Clear;
  except
  end;
  try
    EDiasNUteis.Clear;
  except
  end;
  AtualizaControles(True);
  Estado:=1;
end;

function TCota.deletarauto:Boolean;
var
  COT:integer;
begin
  result := false;
  try
    COT:=CodigoCOT;
    if Delete then
    Begin
      result:=true;
      GeraLog(3870,CConfiguracao.CodigoCNC,COT);
    end
    else
      Result := False;
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.

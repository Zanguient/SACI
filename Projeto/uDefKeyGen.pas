unit uDefKeyGen;

interface

const
  CONST_UNIT = 'Chave.dll';
  
  function GetDataLimite: ShortString; stdcall; External CONST_UNIT;

implementation

end.

object DMComunicacao: TDMComunicacao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 464
  Top = 211
  Height = 210
  Width = 204
  object Connection: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 26
  end
  object QSelect: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  COUNT(*) AS TOT'
      'FROM'
      '  PARAMETRO'
      'WHERE 1=1'
      '  AND (PAR_DT_CADASTRO >= 2000/05/14'
      '  OR PAR_DT_ALTERADO >= 2000/05/14)')
    Left = 43
    Top = 74
  end
  object QSelectItem: TADOQuery
    Connection = Connection
    Parameters = <>
    Left = 111
    Top = 77
  end
  object qCNC: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CNC_CODIGO'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CNC_CODIGO, CNC_RZ_SOCIAL FROM CENTRO_DE_CUSTO'
      'WHERE CNC_CODIGO = :CNC_CODIGO')
    Left = 108
    Top = 26
  end
  object QExec: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  COUNT(*) AS TOT'
      'FROM'
      '  PARAMETRO'
      'WHERE 1=1'
      '  AND (PAR_DT_CADASTRO >= 2000/05/14'
      '  OR PAR_DT_ALTERADO >= 2000/05/14)')
    Left = 43
    Top = 124
  end
end

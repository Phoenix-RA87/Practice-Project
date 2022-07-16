object FDM: TFDM
  OldCreateOrder = False
  Height = 282
  Width = 576
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=PP_Roman_Andrey;Data Source=127.0.0.1'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 24
  end
  object ADOStoredProcGrupp: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'VvodGrupp;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@NazvGrupp'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = Null
      end>
    Left = 424
    Top = 24
  end
  object ADOStoredProcUsar: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'VvodUsar;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@FIO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = '@Status'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = '@Password'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@KodGrupp'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 424
    Top = 80
  end
  object ADOStoredProcDiscipl: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'VvodDiscipl;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@NazvDiscipl'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end>
    Left = 424
    Top = 144
  end
  object ADOQueryGrupp: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Gruppa')
    Left = 192
    Top = 24
  end
  object ADOQueryUsar: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Polzovatel')
    Left = 192
    Top = 80
  end
  object ADOQueryDiscipl: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Discipl')
    Left = 192
    Top = 144
  end
  object DataSourceGrupp: TDataSource
    DataSet = ADOQueryGrupp
    Left = 304
    Top = 24
  end
  object DataSourceUsar: TDataSource
    DataSet = ADOQueryUsar
    Left = 304
    Top = 80
  end
  object DataSourceDiscipl: TDataSource
    DataSet = ADOQueryDiscipl
    Left = 304
    Top = 144
  end
end

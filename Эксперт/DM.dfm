object DMSN: TDMSN
  OldCreateOrder = False
  Height = 435
  Width = 643
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=PP_Roman_Andrey;Data Source=127.0.0.1'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object ADOStoredProcVvodOcenka: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'VvodOcen;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@KodDoc'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Ocenka'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Data'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
        Value = Null
      end
      item
        Name = '@Komment'
        Attributes = [paNullable]
        DataType = ftString
        Size = 70
        Value = Null
      end
      item
        Name = '@KodUsar'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 368
    Top = 152
  end
  object ADOQueryGruppa: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Gruppa')
    Left = 136
    Top = 24
  end
  object ADOQueryUsar: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Polzovatel')
    Left = 240
    Top = 24
  end
  object ADOQueryDisciplina: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Discipl')
    Left = 360
    Top = 24
  end
  object ADOQueryOtch: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select Ocenki.KodDoc, SamoOcen, Ocenki.Data, Komment, Polzovatel' +
        '.KodUsar from Ocenki, Doc, Polzovatel where Doc.KodDoc=Ocenki.Ko' +
        'dDoc and Polzovatel.KodUsar=Ocenki.KodUsar')
    Left = 472
    Top = 24
  end
  object DataSourceGruppa: TDataSource
    DataSet = ADOQueryGruppa
    Left = 136
    Top = 80
  end
  object DataSourceUsar: TDataSource
    DataSet = ADOQueryUsar
    Left = 248
    Top = 80
  end
  object DataSourceDisciplina: TDataSource
    DataSet = ADOQueryDisciplina
    Left = 368
    Top = 88
  end
  object DataSourceOtch: TDataSource
    DataSet = ADOQueryOtch
    Left = 480
    Top = 88
  end
  object DataSourceOcenka: TDataSource
    DataSet = ADOQueryOcenka
    Left = 240
    Top = 152
  end
  object ADOQueryOcenka: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from Ocenki')
    Left = 128
    Top = 152
  end
  object ADOQueryDocum: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Doc')
    Left = 568
    Top = 24
  end
  object DataSourceDocum: TDataSource
    DataSet = ADOQueryDocum
    Left = 568
    Top = 88
  end
end

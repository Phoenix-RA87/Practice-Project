object DM: TDM
  OldCreateOrder = False
  Height = 333
  Width = 629
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=PP_Roman_Andrey;Data Source=127.0.0.1;U' +
      'se Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;' +
      'Workstation ID=DESKTOP-9VBOF0G;Use Encryption for Data=False;Tag' +
      ' with column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object ADOQueryStud: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Polzovatel')
    Left = 176
    Top = 16
  end
  object ADOQueryDiscipl: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Discipl')
    Left = 176
    Top = 80
  end
  object DataSourceStud: TDataSource
    DataSet = ADOQueryStud
    Left = 272
    Top = 16
  end
  object DataSourceDiscipl: TDataSource
    DataSet = ADOQueryDiscipl
    Left = 272
    Top = 80
  end
  object DataSourceZapros: TDataSource
    DataSet = ADOQueryZapros
    Left = 272
    Top = 144
  end
  object DataSourcePortf: TDataSource
    DataSet = ADOQueryPortf
    Left = 280
    Top = 197
  end
  object ADOQueryPortf: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select KodDoc, FIO, NazvDiscipl, NazvDoc, Doc.Data, DocFile, Sam' +
        'oOcen '
      'from Doc, Polzovatel, Discipl'
      
        'where Doc.KodUsar=Polzovatel.KodUsar and Discipl.KodDiscipl=Doc.' +
        'KodDiscipl')
    Left = 176
    Top = 200
  end
  object ADOStoredProcVPortf: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'VvodDoc;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@NazvDoc'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = Null
      end
      item
        Name = '@Data'
        Attributes = [paNullable]
        DataType = ftDateTime
        Size = 10
        Value = Null
      end
      item
        Name = '@SamoOcen'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@DocFile'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1073741823
        Value = Null
      end
      item
        Name = '@KodUsar'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = '@KodDiscipl'
        DataType = ftInteger
        Value = Null
      end>
    Left = 392
    Top = 200
  end
  object ADOQuery2: TADOQuery
    Parameters = <>
    Left = 400
    Top = 16
  end
  object ADOQueryZapros: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 176
    Top = 144
  end
  object DataSourceGrupp: TDataSource
    DataSet = ADOQueryGrupp
    Left = 280
    Top = 256
  end
  object ADOQueryGrupp: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from Gruppa')
    Left = 168
    Top = 256
  end
end

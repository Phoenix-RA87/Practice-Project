unit DM;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TDMSN = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQueryStudent: TADOQuery;
    ADOQueryDisciplina: TADOQuery;
    DataSourceStudent: TDataSource;
    DataSourceDisciplina: TDataSource;
    DataSourceZapros: TDataSource;
    DataSourceDocum: TDataSource;
    ADOQueryDocum: TADOQuery;
    ADOStoredProcVvodDocum: TADOStoredProc;
    ADOQuery2: TADOQuery;
    ADOQueryZapros: TADOQuery;
    DataSourceGruppa: TDataSource;
    ADOQueryGruppa: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMSN: TDMSN;

implementation

uses Menu, Otch, VvodDoc;

{$R *.dfm}

end.

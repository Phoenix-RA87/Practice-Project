unit Unit2;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQueryStud: TADOQuery;
    ADOQueryDiscipl: TADOQuery;
    DataSourceStud: TDataSource;
    DataSourceDiscipl: TDataSource;
    DataSourceZapros: TDataSource;
    DataSourcePortf: TDataSource;
    ADOQueryPortf: TADOQuery;
    ADOStoredProcVPortf: TADOStoredProc;
    ADOQuery2: TADOQuery;
    ADOQueryZapros: TADOQuery;
    DataSourceGrupp: TDataSource;
    ADOQueryGrupp: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.

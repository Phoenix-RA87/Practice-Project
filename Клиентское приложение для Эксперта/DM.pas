unit DM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMExpert = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOStoredProcVvodOcen: TADOStoredProc;
    ADOQueryGrupp: TADOQuery;
    ADOQueryUsar: TADOQuery;
    ADOQueryDiscipl: TADOQuery;
    ADOQueryOtch: TADOQuery;
    DataSourceGrupp: TDataSource;
    DataSourceUsar: TDataSource;
    DataSourceDiscipl: TDataSource;
    DataSourceOtch: TDataSource;
    DataSourceOcen: TDataSource;
    ADOQueryOcen: TADOQuery;
    ADOQueryDoc: TADOQuery;
    DataSourceDoc: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMExpert: TDMExpert;

implementation

uses Avtorizacia, OcenkaExpert, OtchExpert;

{$R *.dfm}

end.

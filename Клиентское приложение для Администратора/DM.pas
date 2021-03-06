unit DM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TFDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOStoredProcGrupp: TADOStoredProc;
    ADOStoredProcUsar: TADOStoredProc;
    ADOStoredProcDiscipl: TADOStoredProc;
    ADOQueryGrupp: TADOQuery;
    ADOQueryUsar: TADOQuery;
    ADOQueryDiscipl: TADOQuery;
    DataSourceGrupp: TDataSource;
    DataSourceUsar: TDataSource;
    DataSourceDiscipl: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDM: TFDM;

implementation

uses VGrupp, VvodExpert;

{$R *.dfm}

end.

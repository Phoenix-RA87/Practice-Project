unit DM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TFDMSN = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOStoredProcGruppa: TADOStoredProc;
    ADOStoredProcUsar: TADOStoredProc;
    ADOStoredProcDisciplina: TADOStoredProc;
    ADOQueryGruppa: TADOQuery;
    ADOQueryUsar: TADOQuery;
    ADOQueryDisciplina: TADOQuery;
    DataSourceGruppa: TDataSource;
    DataSourceUsar: TDataSource;
    DataSourceDisciplina: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDMSN: TFDMSN;

implementation

uses Avtor_Menu, VvodDiscipl, VvodExpert, VvodGrupp, VvodStud;

{$R *.dfm}

end.

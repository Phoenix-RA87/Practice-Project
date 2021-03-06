unit DM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMSN = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOStoredProcVvodOcenka: TADOStoredProc;
    ADOQueryGruppa: TADOQuery;
    ADOQueryUsar: TADOQuery;
    ADOQueryDisciplina: TADOQuery;
    ADOQueryOtch: TADOQuery;
    DataSourceGruppa: TDataSource;
    DataSourceUsar: TDataSource;
    DataSourceDisciplina: TDataSource;
    DataSourceOtch: TDataSource;
    DataSourceOcenka: TDataSource;
    ADOQueryOcenka: TADOQuery;
    ADOQueryDocum: TADOQuery;
    DataSourceDocum: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMSN: TDMSN;

implementation

uses Avtor_Expert, Ocenka, Otch;

{$R *.dfm}

end.

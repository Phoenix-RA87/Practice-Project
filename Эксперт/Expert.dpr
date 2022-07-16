program Expert;

uses
  Forms,
  Avtor_Expert in 'Avtor_Expert.pas' {FSNAVTOR_EXPERT},
  Ocenka in 'Ocenka.pas' {FSNOcenka},
  Otch in 'Otch.pas' {FSNOtch},
  DM in 'DM.pas' {DMSN: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFSNAVTOR_EXPERT, FSNAVTOR_EXPERT);
  Application.CreateForm(TFSNOcenka, FSNOcenka);
  Application.CreateForm(TFSNOtch, FSNOtch);
  Application.CreateForm(TDMSN, DMSN);
  Application.Run;
end.

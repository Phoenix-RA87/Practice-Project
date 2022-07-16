program Student;

uses
  Forms,
  Menu in 'Menu.pas' {FSNMenu},
  VvodDoc in 'VvodDoc.pas' {FSNVvodDoc},
  Otch in 'Otch.pas' {FSNOtch},
  DM in 'DM.pas' {DMSN: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFSNMenu, FSNMenu);
  Application.CreateForm(TFSNVvodDoc, FSNVvodDoc);
  Application.CreateForm(TFSNOtch, FSNOtch);
  Application.CreateForm(TDMSN, DMSN);
  Application.Run;
end.

program Adninistrator;

uses
  Forms,
  Avtor_Menu in 'Avtor_Menu.pas' {FSNAvtor_Menu},
  VvodExpert in 'VvodExpert.pas' {FSNVvodExpert},
  VvodGrupp in 'VvodGrupp.pas' {FSNVvodGrupp},
  VvodStud in 'VvodStud.pas' {FSNVvodStud},
  VvodDiscipl in 'VvodDiscipl.pas' {FSNVvodDiscipl},
  DM in 'DM.pas' {FDMSN: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFSNAvtor_Menu, FSNAvtor_Menu);
  Application.CreateForm(TFSNVvodExpert, FSNVvodExpert);
  Application.CreateForm(TFSNVvodGrupp, FSNVvodGrupp);
  Application.CreateForm(TFSNVvodStud, FSNVvodStud);
  Application.CreateForm(TFSNVvodDiscipl, FSNVvodDiscipl);
  Application.CreateForm(TFDMSN, FDMSN);
  Application.Run;
end.

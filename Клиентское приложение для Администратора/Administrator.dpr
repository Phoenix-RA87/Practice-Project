program Administrator;

uses
  Forms,
  Avtor_Menu in 'Avtor_Menu.pas' {FAvtor_Menu},
  DM in 'DM.pas' {FDM: TDataModule},
  VUsar in 'VUsar.pas' {FVUsar},
  VGrupp in 'VGrupp.pas' {FGrupp},
  VDiscipl in 'VDiscipl.pas' {FDiscipl},
  VvodExpert in 'VvodExpert.pas' {FVvodExpert};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFAvtor_Menu, FAvtor_Menu);
  Application.CreateForm(TFDM, FDM);
  Application.CreateForm(TFVUsar, FVUsar);
  Application.CreateForm(TFGrupp, FGrupp);
  Application.CreateForm(TFDiscipl, FDiscipl);
  Application.CreateForm(TFVvodExpert, FVvodExpert);
  Application.Run;
end.

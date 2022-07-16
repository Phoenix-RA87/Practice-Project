program Expert;

uses
  Forms,
  Avtorizacia in 'Avtorizacia.pas' {AvtorizExpert},
  DM in 'DM.pas' {DMExpert: TDataModule},
  OcenkaExpert in 'OcenkaExpert.pas' {OcekanExpert},
  OtchExpert in 'OtchExpert.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TAvtorizExpert, AvtorizExpert);
  Application.CreateForm(TDMExpert, DMExpert);
  Application.CreateForm(TOcekanExpert, OcekanExpert);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

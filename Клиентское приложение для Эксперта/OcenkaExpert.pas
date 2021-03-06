unit OcenkaExpert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ExtCtrls, ComCtrls, jpeg, Grids,
  ShellAPI,IniFiles, DBGrids;

type
  TOcekanExpert = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Image1: TImage;
    Label6: TLabel;
    DateTimePicker1: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Label4: TLabel;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox2: TCheckBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure Otbor(Sender: TObject);
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OcekanExpert: TOcekanExpert;
  ??d?oc: Integer;
  DocFile, ExtDo?,NameOfFile : String;
  Ini: TIniFile;
  Ini_Name: String;
implementation

uses DM, Avtorizacia;

{$R *.dfm}

procedure TOcekanExpert.BitBtn1Click(Sender: TObject);
begin
  if Length(Trim(Memo1.Text)) = 0 then
  begin
    MessageDlg('?? ?? ???????????? ???? ???????????.',mtError,[mbOk],0);
    Exit     //?????
  end;

begin
DMExpert.ADOStoredProcVvodOcen.Parameters.ParamByName('@KodUsar').Value:=DMExpert.ADOQueryUsar.FieldByName('KodUsar').Value;
DMExpert.ADOStoredProcVvodOcen.Parameters.ParamByName('@KodDoc').Value:=DMExpert.ADOQueryUsar.FieldByName('KodDoc').Value;
DMExpert.ADOStoredProcVvodOcen.Parameters.ParamByName('@Data').Value:=DateToStr(DateTimePicker1.Date);
DMExpert.ADOStoredProcVvodOcen.Parameters.ParamByName('@Ocenka').Value:=RadioGroup1.Items.Text;
DMExpert.ADOStoredProcVvodOcen.Parameters.ParamByName('@Komment').Value:=Memo1.Text;
DMExpert.ADOStoredProcVvodOcen.ExecProc;
end;
end;

procedure TOcekanExpert.Otbor(Sender: TObject);
begin
DMExpert.ADOQueryOtch.Close;
DMExpert.ADOQueryOtch.SQL.Text:='select KodDo?,FIO,NazvDis?ipl,NazvDo?,Do?File,SamoOcen FROM Doc, Usar, Discipl where Doc.KodUsar=Polzovatel.KodUsar and Discipl.KodDiscipl=Doc.KodDiscipl';

if CheckBox1.Checked then DMExpert.ADOQueryOtch.SQL.Add(' and Discipl.KodDiscipl='+DMExpert.ADOQueryDiscipl.FieldByName('KodDiscipl').AsString);
if CheckBox2.Checked then DMExpert.ADOQueryOtch.SQL.Add(' and Usar.KodGrupp='+DMExpert.ADOQueryGrupp.FieldByName('KodGrupp').AsString);
if CheckBox1.Checked then DMExpert.ADOQueryOtch.SQL.Add(' and Usar.KodUsar='+DMExpert.ADOQueryUsar.FieldByName('KodUsar').AsString);
DMExpert.ADOQueryOtch.Open;

end;


procedure TOcekanExpert.DBGrid1EditButtonClick(Sender: TObject);
begin
//???????????? ???? ? ?????
NameOfFile:=DocFile+'\Doc' + DMExpert.ADOQueryDoc.FieldByName('KodDoc').AsString +
DMExpert.ADOQueryDoc.FieldByName('DocFile').AsString;
ShellExecute(Handle,nil,PChar(NameOfFile),nil,nil,SW_RESTORE);
end;

procedure TOcekanExpert.DBLookupComboBox1Click(Sender: TObject);
begin
DMExpert.ADOQueryUsar.Close;
DMExpert.ADOQueryUsar.SQL.Text:='select * from Polzovatel where KodGrupp='+DMExpert.ADOQueryGrupp.FieldByName('KodGrupp').AsString;
DMExpert.ADOQueryUsar.Open;
Otbor(Self);
end;

procedure TOcekanExpert.DBLookupComboBox2Click(Sender: TObject);
begin
Otbor(Self);
end;

procedure TOcekanExpert.DBLookupComboBox3Click(Sender: TObject);
begin
Otbor(Self);
end;

procedure TOcekanExpert.FormActivate(Sender: TObject);
begin
DateTimePicker1.Date:=now;

DMExpert.ADOQueryDiscipl.Open;
DMExpert.ADOQueryGrupp.Open;
DMExpert.ADOQueryDoc.Open;
DMExpert.ADOQueryUsar.Open;
DMExpert.ADOQueryUsar.Open;
Otbor(Self);
Ini_Name:=ChangeFileExt(Application.ExeName,'.ini');
Ini := TIniFile.Create(Ini_Name);
DocFile:=Ini.ReadString('PATH_DOCUMENT', 'PATH', '?:');
end;

end.

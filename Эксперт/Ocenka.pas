unit Ocenka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ShellAPI,IniFiles, StdCtrls, ExtCtrls, ComCtrls,
  Buttons, DBCtrls, jpeg;

type
  TFSNOcenka = class(TForm)
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DBLookupComboBox2: TDBLookupComboBox;
    CheckBox1: TCheckBox;
    Panel3: TPanel;
    Label4: TLabel;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    CheckBox3: TCheckBox;
    CheckBox2: TCheckBox;
    Label6: TLabel;
    RadioGroup1: TRadioGroup;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure Otbor1(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSNOcenka: TFSNOcenka;
  lic�oc: Integer;
  DocFile1, ExtDo�,NameOfFile : String;
  Ini: TIniFile;
  Ini_Name: String;
implementation

uses Avtor_Expert, DM, Otch;

{$R *.dfm}

procedure TFSNOcenka.BitBtn1Click(Sender: TObject);
begin
if Length(Trim(Memo1.Text)) = 0 then
  begin
    MessageDlg('�� �� ������������ ���� �����������.',mtError,[mbOk],0);
    Exit     //�����
  end;

begin
DMSN.ADOStoredProcVvodOcenka.Parameters.ParamByName('@KodDoc').Value:=DMSN.ADOQueryDocum.FieldByName('KodDoc').Value;
DMSN.ADOStoredProcVvodOcenka.Parameters.ParamByName('@Ocenka').Value:=RadioGroup1.Items.Text;
DMSN.ADOStoredProcVvodOcenka.Parameters.ParamByName('@Data').Value:=DateToStr(DateTimePicker1.Date);
DMSN.ADOStoredProcVvodOcenka.Parameters.ParamByName('@Komemnt').Value:=Memo1.Text;
DMSN.ADOStoredProcVvodOcenka.Parameters.ParamByName('@KodUsar').Value:=DMSN.ADOQueryUsar.FieldByName('KodUsar').Value;
DMSN.ADOStoredProcVvodOcenka.ExecProc;
end;
end;

procedure TFSNOcenka.Otbor1(Sender: TObject);
begin
DMSN.ADOQueryOtch.Open;
DMSN.ADOQueryOtch.SQL.Text:='select Ocenki.KodDoc, Ocenka, Ocenki.Data, Komment, Polzovatel.KodUsar from Ocenki, Doc, Polzovatel where Doc.KodDoc=Ocenki.KodDoc and Polzovatel.KodUsar=Ocenki.KodUsar';
//
if CheckBox1.Checked then DMSN.ADOQueryOtch.SQL.Add(' and Discipl.KodDiscipl='+DMSN.ADOQueryDisciplina.FieldByName('KodDiscipl').AsString);
if CheckBox2.Checked then DMSN.ADOQueryOtch.SQL.Add(' and Usar.KodGrupp='+DMSN.ADOQueryGruppa.FieldByName('KodGrupp').AsString);
if CheckBox3.Checked then DMSN.ADOQueryOtch.SQL.Add(' and Usar.KodUsar='+DMSN.ADOQueryUsar.FieldByName('KodUsar').AsString);
DMSN.ADOQueryOtch.Open;

end;

procedure TFSNOcenka.BitBtn2Click(Sender: TObject);
begin
if MessageDlg('��������� � ������� ���� ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
FSNOcenka.Close;
end;
end;

procedure TFSNOcenka.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('��������� ������ ��������� ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
  Close;
  Application.Terminate;
end;
end;

procedure TFSNOcenka.DBGrid1CellClick(Column: TColumn);
begin
//������������ ���� � �����
NameOfFile:=DocFile1+'\Doc' + DMSN.ADOQueryDocum.FieldByName('KodDoc').AsString +
DMSN.ADOQueryDocum.FieldByName('DocFile').AsString;
ShellExecute(Handle,nil,PChar(NameOfFile),nil,nil,SW_RESTORE);
end;

procedure TFSNOcenka.DBLookupComboBox1Click(Sender: TObject);
begin
//Otbor1(Self);
end;

procedure TFSNOcenka.DBLookupComboBox2Click(Sender: TObject);
begin
//Otbor1(Self);
end;

procedure TFSNOcenka.DBLookupComboBox3Click(Sender: TObject);
begin
//Otbor1(Self);
end;

procedure TFSNOcenka.FormActivate(Sender: TObject);
begin
DateTimePicker1.Date:=now;

DMSN.ADOQueryOcenka.Open;
DMSN.ADOQueryDocum.Open;
DMSN.ADOQueryUsar.Open;
Otbor1(Self);
Ini_Name:=ChangeFileExt(Application.ExeName,'.ini');
Ini := TIniFile.Create(Ini_Name);
DocFile1:=Ini.ReadString('PATH_DOCUMENT', 'PATH', 'D:');
end;


end.

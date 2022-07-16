unit Otch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DBCtrls, ExtCtrls, Grids, DBGrids, jpeg;

type
  TFSNOtch = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RadioGroup1: TRadioGroup;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DateTimePicker1: TDateTimePicker;
    BitBtn1: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSNOtch: TFSNOtch;

implementation

uses Avtor_Expert, DM, Ocenka;

{$R *.dfm}


procedure TFSNOtch.BitBtn2Click(Sender: TObject);
begin
if MessageDlg('��������� � ������� ���� ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
FSNOtch.Close;
end;
end;

procedure TFSNOtch.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('��������� ������ ��������� ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
  Close;
  Application.Terminate;
end;
end;

procedure TFSNOtch.DBLookupComboBox1Click(Sender: TObject);
begin
DMSN.ADOQueryUsar.SQL.Text:='select * from Polzovatel where KodGrupp='+DMSN.ADOQueryGruppa.FieldByName('KodGrupp').AsString;
DMSN.ADOQueryUsar.Open;
end;

procedure TFSNOtch.FormActivate(Sender: TObject);
begin
DateTimePicker1.Date:=now;

DMSN.ADOQueryDisciplina.Open;
DMSN.ADOQueryGruppa.Open;
DBLookupComboBox1Click(Self);
end;

procedure TFSNOtch.RadioGroup1Click(Sender: TObject);
begin
if RadioGroup1.ItemIndex=0 then
Begin
DMSN.ADOQueryOtch.Close;
DMSN.ADOQueryOtch.SQL.Text:='EXEC SV '+DMSN.ADOQueryUsar.FieldByName('KodUsar').AsString;
DMSN.ADOQueryOtch.Open;

//  DBGrid1.Columns.Items[0].Title.Caption :='�������� ����������';
//  DBGrid1.Columns.Items[1].Title.Caption :='�������� ���������';
//  DBGrid1.Columns.Items[2].Title.Caption :='����������';
//  DBGrid1.Columns.Items[3].Title.Caption :='���������� ����������';
//  DBGrid1.Columns.Items[4].Title.Caption :='������� ������';
End;

if RadioGroup1.ItemIndex=1 then
Begin
DMSN.ADOQueryOtch.Close;
DMSN.ADOQueryOtch.SQL.Text:='EXEC RabotStudOtch3 '+DMSN.ADOQueryGruppa.FieldByName('KodGrupp').AsString+', '+DMSN.ADOQueryDisciplina.FieldByName('KodDiscipl').AsString;
DMSN.ADOQueryOtch.Open;

//  DBGrid1.Columns.Items[0].Title.Caption :='��� ��������';
//  DBGrid1.Columns.Items[1].Title.Caption :='��� ����������';
//  DBGrid1.Columns.Items[2].Title.Caption :='��� ������������';
//  DBGrid1.Columns.Items[3].Title.Caption :='�������� ���������';
//  DBGrid1.Columns.Items[4].Title.Caption :='����';
//  DBGrid1.Columns.Items[5].Title.Caption :='����������';
//  DBGrid1.Columns.Items[6].Title.Caption :='����������';
end;

if RadioGroup1.ItemIndex=2 then
Begin
DMSN.ADOQueryOtch.Close;
DMSN.ADOQueryOtch.SQL.Text:='EXEC Otch5 '+DMSN.ADOQueryGruppa.FieldByName('KodGrupp').AsString;
DMSN.ADOQueryOtch.Open;

//  DBGrid1.Columns.Items[0].Title.Caption :='��� ���������';
//  DBGrid1.Columns.Items[1].Title.Caption :='��� ����������';
//  DBGrid1.Columns.Items[2].Title.Caption :='��� ������������';
//  DBGrid1.Columns.Items[3].Title.Caption :='�������� ���������';
//  DBGrid1.Columns.Items[4].Title.Caption :='����';
//  DBGrid1.Columns.Items[5].Title.Caption :='����������';
//  DBGrid1.Columns.Items[6].Title.Caption :='����������';
end;
end;

end.

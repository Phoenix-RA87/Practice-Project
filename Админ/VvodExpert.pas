unit VvodExpert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, jpeg, DBCtrls;

type
  TFSNVvodExpert = class(TForm)
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    Panel1: TPanel;
    Image1: TImage;
    Image3: TImage;
    Image2: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    ComboBox1: TComboBox;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSNVvodExpert: TFSNVvodExpert;

implementation

uses Avtor_Menu, DM, VvodDiscipl,  VvodGrupp, VvodStud;

{$R *.dfm}

procedure TFSNVvodExpert.BitBtn1Click(Sender: TObject);
begin
 if Length(Trim(LabeledEdit2.Text)) = 0 then
   begin
     MessageDlg('�� �� ������� ���!',mtError,[mbOk],0); // ���������� ����.
     Exit     //�����
  end;

  if Length(Trim(LabeledEdit3.Text)) = 0 then
   begin
     MessageDlg('�� �� ������� ������!',mtError,[mbOk],0); // ���������� ����.
     Exit     //�����
  end;


// �������� ���, � �������   RadioGroup1.Items
// ����� ���� �������� �� ���������� ���������� � �������� Status DBGrid


FDMSN.ADOStoredProcUsar.Parameters.ParamByName('@FIO').Value:=LabeledEdit2.Text;
FDMSN.ADOStoredProcUsar.Parameters.ParamByName('@Status').Value:=ComboBox1.Text;
FDMSN.ADOStoredProcUsar.Parameters.ParamByName('@Password').Value:=LabeledEdit3.Text;
FDMSN.ADOStoredProcUsar.Parameters.ParamByName('@KodGrupp').Value:=FDMSN.ADOQueryGruppa.FieldByName('KodGrupp').AsString;
FDMSN.ADOStoredProcUsar.ExecProc;

MessageDlg('����� ������� ������� ��������.',mtInformation,[mbOK],0);  // ���������� ����.

FDMSN.ADOQueryUsar.Close;
FDMSN.ADOQueryUsar.Open;

DBGrid2.Columns.Items[0].Title.Caption :='���������������';
 DBGrid2.Columns.Items[1].Title.Caption :='���';
  DBGrid2.Columns.Items[2].Title.Caption :='���������';
   DBGrid2.Columns.Items[3].Title.Caption :='������';
    DBGrid2.Columns.Items[4].Title.Caption :='���������';
end;                              

procedure TFSNVvodExpert.BitBtn2Click(Sender: TObject);
begin
if MessageDlg('��������� � ������� ����?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then   // ���������� ����
begin
FSNVvodExpert.Close;
end;
end;

procedure TFSNVvodExpert.BitBtn3Click(Sender: TObject);
begin
if MessageDlg('��������� ������ ���������?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then    // ���������� ����
begin
Close;
Application.Terminate;
end;
end;

procedure TFSNVvodExpert.FormActivate(Sender: TObject);
begin
FDMSN.ADOQueryUsar.Active:=True;
FDMSN.ADOQueryUsar.Open;
DBGrid2.Columns.Items[0].Title.Caption :='���������������';
 DBGrid2.Columns.Items[1].Title.Caption :='���';
  DBGrid2.Columns.Items[2].Title.Caption :='���������';
   DBGrid2.Columns.Items[3].Title.Caption :='������';
    DBGrid2.Columns.Items[4].Title.Caption :='���������';
end;
end.





unit VvodStud;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids, jpeg;

type
  TFSNVvodStud = class(TForm)
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    LabeledEdit1: TLabeledEdit;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel5: TPanel;
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image9: TImage;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Image8: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSNVvodStud: TFSNVvodStud;

implementation

uses Avtor_Menu, DM, VvodDiscipl, VvodExpert, VvodGrupp;

{$R *.dfm}

procedure TFSNVvodStud.BitBtn1Click(Sender: TObject);
begin
 if Length(Trim(LabeledEdit1.Text)) = 0 then
  begin
    MessageDlg('�� �� ����� ���  ��������!',mtError,[mbOk],0);
    Exit     //�����
  end;

    if Length(Trim(DBLookupComboBox1.Text)) = 0 then
  begin
    MessageDlg('�� �� ������� ������!',mtError,[mbOk],0);
    Exit     //�����
  end;

  if Length(Trim(MaskEdit1.Text)) = 0 then
  begin
    MessageDlg('�� �� ����� ������!',mtError,[mbOk],0);
    Exit     //�����
  end;

 if Length(Trim(ComboBox1.Text)) = 0 then
  begin
    MessageDlg('�� �� ������� ���������!',mtError,[mbOk],0);
    Exit     //�����
  end;


FDMSN.ADOStoredProcUsar.Parameters.ParamByName('@FIO').Value:=LabeledEdit1.Text;
FDMSN.ADOStoredProcUsar.Parameters.ParamByName('@Status').Value:=ComboBox1.Text;
FDMSN.ADOStoredProcUsar.Parameters.ParamByName('@Password').Value:=MaskEdit1.Text;
FDMSN.ADOStoredProcUsar.Parameters.ParamByName('@KodGrupp').Value:=FDMSN.ADOQueryGruppa.FieldByName('KodGrupp').AsString;
FDMSN.ADOStoredProcUsar.ExecProc;

MessageDlg('����� ������� ������� ��������.',mtInformation,[mbOK],0);  // ���������� ����.

FDMSN.ADOQueryUsar.Close;
FDMSN.ADOQueryUsar.Open;

DBGrid1.Columns.Items[0].Title.Caption :='��� ��������';
 DBGrid1.Columns.Items[1].Title.Caption :='���';
  DBGrid1.Columns.Items[2].Title.Caption :='���������';
   DBGrid1.Columns.Items[3].Title.Caption :='������';
    DBGrid1.Columns.Items[4].Title.Caption :='��� ������';
end;

procedure TFSNVvodStud.BitBtn2Click(Sender: TObject);
begin
if MessageDlg('��������� � ������� ����?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
FSNVvodStud.Close;
end;
end;

procedure TFSNVvodStud.BitBtn3Click(Sender: TObject);
begin
if MessageDlg('��������� ������ ���������?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
Close;
Application.Terminate;
end;
end;

procedure TFSNVvodStud.FormActivate(Sender: TObject);
begin
FDMSN.ADOQueryUsar.Active:=True;
FDMSN.ADOQueryUsar.Open;

DBGrid1.Columns.Items[0].Title.Caption :='��� ��������';
 DBGrid1.Columns.Items[1].Title.Caption :='���';
  DBGrid1.Columns.Items[2].Title.Caption :='���������';
   DBGrid1.Columns.Items[3].Title.Caption :='������';
    DBGrid1.Columns.Items[4].Title.Caption :='��� ������';
end;


end.

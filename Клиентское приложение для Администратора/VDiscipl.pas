unit VDiscipl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, jpeg;

type
  TFDiscipl = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    DBGrid1: TDBGrid;
    Image1: TImage;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Image5: TImage;
    BitBtn3: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDiscipl: TFDiscipl;

implementation

uses DM, Avtor_Menu;

{$R *.dfm}

procedure TFDiscipl.BitBtn1Click(Sender: TObject);
begin
if MessageDlg('��������� ������ ��������� ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
Close;
Application.Terminate;
end;
end;

procedure TFDiscipl.BitBtn2Click(Sender: TObject);
begin
if MessageDlg('��������� � ������� ���� ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
FDiscipl.Close;
end;
end;

procedure TFDiscipl.BitBtn3Click(Sender: TObject);
begin
FDM.ADOQueryDiscipl.Close;
FDM.ADOStoredProcDiscipl.Parameters.ParamByName('@NazvDiscipl').Value:=LabeledEdit1.Text;
FDM.ADOStoredProcDiscipl.ExecProc;
FDM.ADOQueryDiscipl.Open;
end;

procedure TFDiscipl.FormActivate(Sender: TObject);
begin
FDM.ADOQueryDiscipl.Open;
FDM.ADOQueryDiscipl.Active:=True;
FDiscipl.DBGrid1.Columns.Items[0].Title.Caption :='��� ����������';
FDiscipl.DBGrid1.Columns.Items[1].Title.Caption :='�������� ����������';
end;

end.

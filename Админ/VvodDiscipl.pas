unit VvodDiscipl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, jpeg;

type
  TFSNVvodDiscipl = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image5: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSNVvodDiscipl: TFSNVvodDiscipl;

implementation

uses Avtor_Menu, DM, VvodExpert, VvodGrupp, VvodStud;

{$R *.dfm}

procedure TFSNVvodDiscipl.BitBtn1Click(Sender: TObject);
begin
if MessageDlg('????????? ?????? ??????????', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then  // ?????????? ????.
begin
Close;
Application.Terminate;
end;
end;

procedure TFSNVvodDiscipl.BitBtn2Click(Sender: TObject);
begin
if MessageDlg('????????? ? ??????? ?????', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then  // ?????????? ????.
begin
FSNVvodDiscipl.Close;
end;
end;


procedure TFSNVvodDiscipl.BitBtn3Click(Sender: TObject);
begin
 if Length(Trim(LabeledEdit1.Text)) = 0 then
   begin
     MessageDlg('?? ?? ??????? ???????????!',mtError,[mbOk],0); // ?????????? ????.
     Exit     //?????
  end;

FDMSN.ADOStoredProcDisciplina.Parameters.ParamByName('@NazvDiscipl').Value:=LabeledEdit1.Text;
FDMSN.ADOStoredProcDisciplina.ExecProc;

MessageDlg('????? ?????????? ??????? ?????????.',mtInformation,[mbOK],0);  // ?????????? ????.

FDMSN.ADOQueryDisciplina.Close;
FDMSN.ADOQueryDisciplina.Open;
DBGrid1.Columns.Items[0].Title.Caption :='??????????';
 DBGrid1.Columns.Items[1].Title.Caption :='???????????';
end;

procedure TFSNVvodDiscipl.FormActivate(Sender: TObject);
begin
FDMSN.ADOQueryDisciplina.Active:=True;
FDMSN.ADOQueryDisciplina.Open;
DBGrid1.Columns.Items[0].Title.Caption :='??????????';
  DBGrid1.Columns.Items[1].Title.Caption :='???????????';
end;

end.

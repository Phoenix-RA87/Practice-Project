unit VvodGrupp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, jpeg;

type
  TFSNVvodGrupp = class(TForm)
    Panel1: TPanel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Image1: TImage;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
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
  FSNVvodGrupp: TFSNVvodGrupp;

implementation

uses Avtor_Menu, DM, VvodDiscipl, VvodExpert, VvodStud;

{$R *.dfm}

procedure TFSNVvodGrupp.BitBtn1Click(Sender: TObject);
begin
if MessageDlg('????????? ? ??????? ???? ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
FSNVvodGrupp.Close;
end;
end;


procedure TFSNVvodGrupp.BitBtn2Click(Sender: TObject);
begin
if MessageDlg('????????? ?????? ????????? ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
Close;
Application.Terminate;
end;
end;

procedure TFSNVvodGrupp.BitBtn3Click(Sender: TObject);
begin
 if Length(Trim(LabeledEdit1.Text)) = 0 then
  begin
    MessageDlg('?? ?? ????? ?????????!',mtError,[mbOk],0);
    Exit     //?????
  end;

FDMSN.ADOStoredProcGruppa.Parameters.ParamByName('@NazvGrupp').Value:=LabeledEdit1.Text;
FDMSN.ADOStoredProcGruppa.ExecProc;

MessageDlg('????? ?????? ??????? ?????????.',mtInformation,[mbOK],0);  // ?????????? ????.

FDMSN.ADOQueryGruppa.Close;
FDMSN.ADOQueryGruppa.Open;

DBGrid1.Columns.Items[0].Title.Caption :='??? ??????';
 DBGrid1.Columns.Items[1].Title.Caption :='?????????';
end;

procedure TFSNVvodGrupp.FormActivate(Sender: TObject);
begin
FDMSN.ADOQueryGruppa.Active:=True;
FDMSN.ADOQueryGruppa.Open;

DBGrid1.Columns.Items[0].Title.Caption :='??? ??????';
 DBGrid1.Columns.Items[1].Title.Caption :='?????????';

end;

end.

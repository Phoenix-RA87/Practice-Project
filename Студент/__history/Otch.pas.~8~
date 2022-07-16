unit Otch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, DBCtrls, Grids, DBGrids;

type
  TFSNOtch = class(TForm)
    Panel3: TPanel;
    Label3: TLabel;
    Label6: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    DateTimePicker1: TDateTimePicker;
    BitBtn4: TBitBtn;
    RadioGroup1: TRadioGroup;
    DBGrid2: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn5: TBitBtn;
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSNOtch: TFSNOtch;

implementation

uses DM, Menu, VvodDoc;

{$R *.dfm}

procedure TFSNOtch.BitBtn1Click(Sender: TObject);
begin
if MessageDlg('Вернуться в Главное меню ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
FSNOtch.Close;
end;
end;

procedure TFSNOtch.BitBtn5Click(Sender: TObject);
begin
  if MessageDlg('Закончить работу программы ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
  Close;
  Application.Terminate;
end;
end;

procedure TFSNOtch.FormActivate(Sender: TObject);
begin
DateTimePicker1.Date:=now;
end;

procedure TFSNOtch.RadioGroup1Click(Sender: TObject);

begin
if RadioGroup1.ItemIndex=0 then
Begin
DMSN.ADOQueryZapros.Close;
DMSN.ADOQueryZapros.SQL.Text:='EXEC SvedRabotStud '+DMSN.ADOQueryDocum.FieldByName('KodDoc').AsString;
DMSN.ADOQueryZapros.Open;
End;
if RadioGroup1.ItemIndex=1 then
Begin
DMSN.ADOQueryZapros.Close;
DMSN.ADOQueryZapros.SQL.Text:='EXEC OtchSvedOtdDoc '+DMSN.ADOQueryStudent.FieldByName('KodUsar').AsString;
DMSN.ADOQueryZapros.Open;
End;
end;


end.

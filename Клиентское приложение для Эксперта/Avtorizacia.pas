unit Avtorizacia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, DBCtrls, jpeg, Buttons;

type
  TAvtorizExpert = class(TForm)
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Image1: TImage;
    BitBtn2: TBitBtn;
    Image2: TImage;
    BitBtn3: TBitBtn;
    Image3: TImage;
    Image4: TImage;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    BitBtn4: TBitBtn;
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AvtorizExpert: TAvtorizExpert;

implementation

uses DM, OcenkaExpert, OtchExpert;

{$R *.dfm}

procedure TAvtorizExpert.BitBtn1Click(Sender: TObject);
begin
  if MessageDlg('????????? ?????? ????????? ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
  Close;
  Application.Terminate;
end;
end;

procedure TAvtorizExpert.BitBtn2Click(Sender: TObject);
begin
OcekanExpert.ShowModal();
end;

procedure TAvtorizExpert.BitBtn3Click(Sender: TObject);
begin
Form1.ShowModal();
end;

procedure TAvtorizExpert.BitBtn4Click(Sender: TObject);
begin
if Length(Trim(MaskEdit1.Text)) = 0 then
  begin
    MessageDlg('?? ?? ????? ??????.',mtError,[mbOk],0);
    Exit     //?????
  end;

if (MaskEdit1.Text='123') then

//begin
//if StrToInt(MaskEdit1.Text) = DMExpert.ADOQueryUsar.FieldByName('Password').Value then
begin
BitBtn2.Enabled:=True;
BitBtn3.Enabled:=True;
//end;
end;
end;

procedure TAvtorizExpert.RadioGroup1Click(Sender: TObject);
begin
//if RadioGroup1.ItemIndex=0 then
//Begin
//DMExpert.ADOQueryUsar.Close;
//DMExpert.ADOQueryUsar.SQL.Text:='select * from Polzovatel where Status='+'?????????????';
//DMExpert.ADOQueryUsar.Open;
//End;
//if RadioGroup1.ItemIndex=1 then
//Begin
//DMExpert.ADOQueryUsar.Close;
//DMExpert.ADOQueryUsar.SQL.Text:='select * from Polzovatel where Status='+'???????';
//DMExpert.ADOQueryUsar.Open;
//end;
end;

end.

unit Avtor_Expert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, jpeg, Buttons;

type
  TFSNAVTOR_EXPERT = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Image1: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    Image2: TImage;
    BitBtn2: TBitBtn;
    Image4: TImage;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
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
  FSNAVTOR_EXPERT: TFSNAVTOR_EXPERT;

implementation

uses DM, Ocenka, Otch;

{$R *.dfm}

procedure TFSNAVTOR_EXPERT.BitBtn1Click(Sender: TObject);
begin
if Length(Trim(MaskEdit1.Text)) = 0 then
  begin
    MessageDlg('�� �� ����� ������.',mtError,[mbOk],0);
    Exit     //�����
  end;

if (MaskEdit1.Text='123') then


BitBtn3.Enabled:=True;
BitBtn4.Enabled:=True;
end;

procedure TFSNAVTOR_EXPERT.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('��������� ������ ��������� ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
  Close;
  Application.Terminate;
end;
end;

procedure TFSNAVTOR_EXPERT.BitBtn3Click(Sender: TObject);
begin
FSNOcenka.ShowModal();
end;

procedure TFSNAVTOR_EXPERT.BitBtn4Click(Sender: TObject);
begin
FSNOtch.ShowModal();
end;

end.

unit Avtor_Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Mask, dblookup, DBCtrls;

type
  TFAvtor_Menu = class(TForm)
    Panel2: TPanel;
    Image3: TImage;
    Panel1: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    Image2: TImage;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    Panel5: TPanel;
    Image4: TImage;
    Panel6: TPanel;
    Image7: TImage;
    Image8: TImage;
    BitBtn2: TBitBtn;
    Image5: TImage;
    Image6: TImage;
    Image10: TImage;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Image9: TImage;
    MaskEdit1: TMaskEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAvtor_Menu: TFAvtor_Menu;

implementation

uses DM, VUsar, VGrupp, VDiscipl, VvodExpert;

{$R *.dfm}

procedure TFAvtor_Menu.BitBtn1Click(Sender: TObject);
begin
FVUsar.ShowModal();
end;

procedure TFAvtor_Menu.BitBtn2Click(Sender: TObject);
begin
if MessageDlg('��������� ������ ���������?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
Close;
Application.Terminate;
end;
end;

procedure TFAvtor_Menu.BitBtn3Click(Sender: TObject);    // ����� �����������

begin

//begin
//if Length(Trim(DBComboBox1.Text)) = 0 then
//  begin
//    MessageDlg('�� �� ����� ������!',mtError,[mbOk],0);
//    Exit     //�����
// end;
//
//if (DBComboBox1.ItemIndex=-1) then
//begin
//  MessageDlg('�� �� ������� ������������!',mtError,[mbOk],0);
//end;
//
//if (DBComboBox1.ItemIndex=0)  and (MaskEdit1.Text='111') then


BitBtn1.Enabled:=true;
BitBtn4.Enabled:=true;
BitBtn5.Enabled:=true;
BitBtn6.Enabled:=true;


MessageDlg('����������� �������� �������',mtInformation,[mbOK],0);
//end;
end;

procedure TFAvtor_Menu.BitBtn4Click(Sender: TObject);
begin
FGrupp.ShowModal();
end;

procedure TFAvtor_Menu.BitBtn5Click(Sender: TObject);
begin
FDiscipl.ShowModal();
end;


procedure TFAvtor_Menu.BitBtn6Click(Sender: TObject);
begin
FVvodExpert.ShowModal();
end;

end.

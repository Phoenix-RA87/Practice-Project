unit Avtor_Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Menus, Mask;

type
  TFSNAvtor_Menu = class(TForm)
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    Image2: TImage;
    Panel5: TPanel;
    Image3: TImage;
    Panel7: TPanel;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    BitBtn1: TBitBtn;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSNAvtor_Menu: TFSNAvtor_Menu;

implementation

uses DM, VvodDiscipl, VvodExpert, VvodGrupp, VvodStud;

{$R *.dfm}

procedure TFSNAvtor_Menu.BitBtn1Click(Sender: TObject);
begin
if MessageDlg('????????? ?????? ??????????', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
Close;
Application.Terminate;
end;
end;

procedure TFSNAvtor_Menu.BitBtn3Click(Sender: TObject);
begin
if Length(Trim(MaskEdit1.Text)) = 0 then
  begin
    MessageDlg('?? ?? ????? ??????.',mtError,[mbOk],0);
    Exit     //?????
  end;

if (MaskEdit1.Text='123') then

  MessageDlg('?? ??????? ??????????????!',mtInformation,[mbOK],0);
end;

procedure TFSNAvtor_Menu.N2Click(Sender: TObject);
begin
FSNVvodExpert.ShowModal();
end;

procedure TFSNAvtor_Menu.N3Click(Sender: TObject);
begin
FSNVvodGrupp.ShowModal();
end;

procedure TFSNAvtor_Menu.N4Click(Sender: TObject);
begin
FSNVvodStud.ShowModal();
end;

procedure TFSNAvtor_Menu.N5Click(Sender: TObject);
begin
FSNVvodDiscipl.ShowModal();
end;

end.

unit Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons, Mask, jpeg;

type
  TFSNMenu = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    GroupBox1: TGroupBox;
    Image2: TImage;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    Image3: TImage;
    Image4: TImage;
    MaskEdit1: TMaskEdit;
    Label4: TLabel;
    Image5: TImage;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSNMenu: TFSNMenu;

implementation

uses DM, Otch, VvodDoc;

{$R *.dfm}

procedure TFSNMenu.BitBtn1Click(Sender: TObject);
begin

if Length(Trim(MaskEdit1.Text)) = 0 then
  begin
    MessageDlg('Вы не ввели пароль.',mtError,[mbOk],0);
    Exit     //Выход
  end;

if (MaskEdit1.Text='000') then

  begin
    FSNVvodDoc.ShowModal();
  end;
  end;


procedure TFSNMenu.BitBtn2Click(Sender: TObject);
begin
Close();
end;

end.

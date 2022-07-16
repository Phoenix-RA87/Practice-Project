unit VGrupp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, jpeg;

type
  TFGrupp = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image1: TImage;
    GroupBox1: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    BitBtn3: TBitBtn;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGrupp: TFGrupp;

implementation

uses DM, Avtor_Menu;

{$R *.dfm}

procedure TFGrupp.BitBtn1Click(Sender: TObject);
begin
if MessageDlg('Закончить работу программы ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
Close;
Application.Terminate;
end;
end;

procedure TFGrupp.BitBtn2Click(Sender: TObject);
begin
if MessageDlg('Вернуться в Главное меню ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
FGrupp.Close;
end;
end;



procedure TFGrupp.BitBtn3Click(Sender: TObject);
begin
FDM.ADOQueryGrupp.Close;
FDM.ADOStoredProcGrupp.Parameters.ParamByName('@NazvGrupp').Value:=LabeledEdit1.Text;
FDM.ADOStoredProcGrupp.ExecProc;
FDM.ADOQueryGrupp.Open;
end;

procedure TFGrupp.FormActivate(Sender: TObject);
begin
FDM.ADOQueryGrupp.Open;
FDM.ADOQueryGrupp.Active:=True;
FGrupp.DBGrid1.Columns.Items[0].Title.Caption :='Код Группы';
FGrupp.DBGrid1.Columns.Items[1].Title.Caption :='Название Группы';
end;

end.

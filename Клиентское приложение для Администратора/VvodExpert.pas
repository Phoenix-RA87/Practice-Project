unit VvodExpert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons, jpeg, DBCtrls;

type
  TFVvodExpert = class(TForm)
    Panel2: TPanel;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    DBGrid2: TDBGrid;
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Image1: TImage;
    Image3: TImage;
    Image2: TImage;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVvodExpert: TFVvodExpert;

implementation

uses Avtor_Menu, DM;

{$R *.dfm}

procedure TFVvodExpert.BitBtn1Click(Sender: TObject);
begin
FDM.ADOQueryUsar.Close;
FDM.ADOStoredProcUsar.Parameters.ParamByName('@FIO').Value:=LabeledEdit2.Text;
FDM.ADOStoredProcUsar.Parameters.ParamByName('@Status').Value:=RadioGroup1.Items.CommaText;
FDM.ADOStoredProcUsar.Parameters.ParamByName('@Password').Value:=LabeledEdit3.Text;
FDM.ADOStoredProcUsar.ExecProc;
FDM.ADOQueryUsar.Open;
end;


procedure TFVvodExpert.FormActivate(Sender: TObject);
begin
FDM.ADOQueryUsar.Active:=True;
FDM.ADOQueryUsar.Open;

FVvodExpert.DBGrid2.Columns.Items[0].Title.Caption :='??? ????????';
FVvodExpert.DBGrid2.Columns.Items[1].Title.Caption :='???';

FVvodExpert.DBGrid2.Columns.Items[3].Title.Caption :='??????';
FVvodExpert.DBGrid2.Columns.Items[4].Title.Caption :='??? ??????';
end;

end.

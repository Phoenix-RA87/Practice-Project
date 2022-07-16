unit OtchExpert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, DBCtrls, ExtCtrls, jpeg;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RadioGroup1: TRadioGroup;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DateTimePicker1: TDateTimePicker;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DM, Avtorizacia;

{$R *.dfm}

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
if MessageDlg('Вернуться в Главное меню ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
Form1.Close;
end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Закончить работу программы ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
  Close;
  Application.Terminate;
end;
end;

procedure TForm1.DBLookupComboBox1Click(Sender: TObject);
begin
DMExpert.ADOQueryUsar.SQL.Text:='select * from Polzovatel where KodGrupp='+DMExpert.ADOQueryGrupp.FieldByName('KodGrupp').AsString;
DMExpert.ADOQueryUsar.Open;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
DateTimePicker1.Date:=now;

DMExpert.ADOQueryDiscipl.Open;
DMExpert.ADOQueryGrupp.Open;
DBLookupComboBox1Click(Self);
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
if RadioGroup1.ItemIndex=0 then
Begin
DMExpert.ADOQueryOtch.Close;
DMExpert.ADOQueryOtch.SQL.Text:='EXEC SV '+DMExpert.ADOQueryUsar.FieldByName('KodUsar').AsString;
DMExpert.ADOQueryOtch.Open;

//  DBGrid1.Columns.Items[0].Title.Caption :='Название дисциплины';
//  DBGrid1.Columns.Items[1].Title.Caption :='Название документа';
//  DBGrid1.Columns.Items[2].Title.Caption :='Самооценка';
//  DBGrid1.Columns.Items[3].Title.Caption :='Количество просмотров';
//  DBGrid1.Columns.Items[4].Title.Caption :='Средняя оценка';
End;

if RadioGroup1.ItemIndex=1 then
Begin
DMExpert.ADOQueryOtch.Close;
DMExpert.ADOQueryOtch.SQL.Text:='EXEC RabotStudOtch3 '+DMExpert.ADOQueryGrupp.FieldByName('KodGrupp').AsString+', '+DMExpert.ADOQueryDiscipl.FieldByName('KodDiscipl').AsString;
DMExpert.ADOQueryOtch.Open;

//  DBGrid1.Columns.Items[0].Title.Caption :='ФИО студента';
//  DBGrid1.Columns.Items[1].Title.Caption :='Код дисциплины';
//  DBGrid1.Columns.Items[2].Title.Caption :='Код пользователя';
//  DBGrid1.Columns.Items[3].Title.Caption :='Название документа';
//  DBGrid1.Columns.Items[4].Title.Caption :='Дата';
//  DBGrid1.Columns.Items[5].Title.Caption :='Самооценка';
//  DBGrid1.Columns.Items[6].Title.Caption :='Расширение';
end;

if RadioGroup1.ItemIndex=2 then
Begin
DMExpert.ADOQueryOtch.Close;
DMExpert.ADOQueryOtch.SQL.Text:='EXEC Otch5 '+DMExpert.ADOQueryGrupp.FieldByName('KodGrupp').AsString;
DMExpert.ADOQueryOtch.Open;

//  DBGrid1.Columns.Items[0].Title.Caption :='Код документа';
//  DBGrid1.Columns.Items[1].Title.Caption :='Код дисциплины';
//  DBGrid1.Columns.Items[2].Title.Caption :='Код пользователя';
//  DBGrid1.Columns.Items[3].Title.Caption :='Название документа';
//  DBGrid1.Columns.Items[4].Title.Caption :='Дата';
//  DBGrid1.Columns.Items[5].Title.Caption :='Самооценка';
//  DBGrid1.Columns.Items[6].Title.Caption :='Расширение';
end;
end;

end.

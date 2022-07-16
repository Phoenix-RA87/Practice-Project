unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, DBCtrls, Buttons, ComCtrls, dblookup,
  Grids, DBGrids, Mask, IniFiles;

type
  TAvtorizacia = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Image1: TImage;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Image2: TImage;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    MaskEdit1: TMaskEdit;
    Label4: TLabel;
    OpenDialog1: TOpenDialog;
    TabSheet3: TTabSheet;
    Panel3: TPanel;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    DBLookupComboBox4: TDBLookupComboBox;
    DateTimePicker1: TDateTimePicker;
    BitBtn4: TBitBtn;
    DBGrid2: TDBGrid;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    Label8: TLabel;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    LabeledEdit2: TLabeledEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DateTimePicker2: TDateTimePicker;
    RadioGroup2: TRadioGroup;
    DBGrid1: TDBGrid;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Avtorizacia: TAvtorizacia;
  KodDoc: Integer;
  DocFile, ExtDok,NameOfFile : String;
  Ini: TIniFile;
  Ini_Name: String;

implementation

uses Unit2;

{$R *.dfm}

procedure TAvtorizacia.BitBtn1Click(Sender: TObject);
begin

if Length(Trim(MaskEdit1.Text)) = 0 then
  begin
    MessageDlg('Вы не ввели пароль.',mtError,[mbOk],0);
    Exit     //Выход
  end;

if (MaskEdit1.Text='000') then
begin
  TabSheet2.Visible:=False;
end;

TabSheet2.Show();

end;

procedure TAvtorizacia.BitBtn2Click(Sender: TObject);
begin
if Length(Trim(LabeledEdit2.Text)) = 0 then
  begin
    MessageDlg('Вы не ввели Название Документа.',mtError,[mbOk],0);
    Exit     //Выход
  end;
//

DM.ADOStoredProcVPortf.Parameters.ParamByName('@NazvDoc').Value:=LabeledEdit2.Text;
DM.ADOStoredProcVPortf.Parameters.ParamByName('@Data').Value:=DateToStr(DateTimePicker1.Date);
DM.ADOStoredProcVPortf.Parameters.ParamByName('@SamoOcen').Value:=RadioGroup1.Items.Text;
DM.ADOStoredProcVPortf.Parameters.ParamByName('@KodUsar').Value:=DM.ADOQueryStud.FieldByName('KodUsar').Value;
DM.ADOStoredProcVPortf.Parameters.ParamByName('@KodDiscipl').Value:=DM.ADOQueryDiscipl.FieldByName('KodDiscipl').Value;
 if OpenDialog1.Execute then
 ExtDok:=ExtractFileExt(OpenDialog1.FileName);
DM.ADOStoredProcVPortf.Parameters.ParamByName('@DocFile').Value:=ExtDok;
DM.ADOStoredProcVPortf.ExecProc;
 KodDoc:=DM.ADOStoredProcVPortf.Parameters.ParamByName('@KodDoc').Value;
LabeledEdit2.text:='Документ с № KodDoc='+intToStr(KodDoc);
//создать имя файла при записи на сервер(путь+номДок+разш)
    NameOfFile:=DocFile+'\Doc'+IntToStr(KodDoc)+ExtDok;
// скопировать на сервер
     if not CopyFile(PChar(OpenDialog1.FileName),Pchar(NameOfFile),true) then
        begin
        //если не получилось-удалить запись
          MessageDlg('Копирование не выполнено',mtError,[mbOk],0);
          DM.ADOQuery2.SQL.Text:='delete from Doc where KodDoc='+IntToStr(KodDoc);
          DM.ADOQuery2.ExecSQL;
          end
  else
   MessageDlg('Копирование  выполнено!!!',mtInformation,[mbOk],0);
   DM.ADOQueryPortf.Close;
   DM.ADOQueryPortf.Open;
end;

procedure TAvtorizacia.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Закончить работу программы ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
  Close;
  Application.Terminate;
end;
end;

procedure TAvtorizacia.BitBtn5Click(Sender: TObject);
begin
if MessageDlg('Вернуться в Главное меню ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
Avtorizacia.Close;
end;
end;

procedure TAvtorizacia.BitBtn6Click(Sender: TObject);
begin
  if MessageDlg('Закончить работу программы ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
  Close;
  Application.Terminate;
end;
end;

procedure TAvtorizacia.FormActivate(Sender: TObject);
begin
begin
DateTimePicker1.Date:=now;
DateTimePicker2.Date:=now;

DM.ADOQueryDiscipl.Open;
DM.ADOQueryPortf.Open;
    Ini_Name:=ChangeFileExt(Application.ExeName,'.ini');
    Ini := TIniFile.Create(Ini_Name);
    DocFile:=Ini.ReadString('PATH_DOCUMENT', 'PATH', 'C:');
end;
begin
 DM.ADOQueryPortf.SQL.Text:='select * from Doc where KodUsar='+DM.ADOQueryStud.FieldByName('KodUsar').AsString;
 DM.ADOQueryPortf.Open;
 DM.ADOQueryStud.Open;
end;
end;

procedure TAvtorizacia.RadioGroup1Click(Sender: TObject);
begin
if RadioGroup1.ItemIndex=0 then
Begin
DM.ADOQueryZapros.Close;
DM.ADOQueryZapros.SQL.Text:='EXEC SvedRabotStud '+DM.ADOQueryPortf.FieldByName('KodDoc').AsString;
DM.ADOQueryZapros.Open;
End;
if RadioGroup1.ItemIndex=1 then
Begin
DM.ADOQueryZapros.Close;
DM.ADOQueryZapros.SQL.Text:='EXEC OtchSvedOtdDoc '+DM.ADOQueryStud.FieldByName('KodUsar').AsString;
DM.ADOQueryZapros.Open;
End;
end;

end.

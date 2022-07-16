unit VvodDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, ComCtrls, DBCtrls,IniFiles,
  jpeg;

type
  TFSNVvodDoc = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    LabeledEdit2: TLabeledEdit;
    DateTimePicker2: TDateTimePicker;
    Label7: TLabel;
    RadioGroup2: TRadioGroup;
    BitBtn2: TBitBtn;
    OpenDialog1: TOpenDialog;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    BitBtn3: TBitBtn;
    Image9: TImage;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSNVvodDoc: TFSNVvodDoc;
  KodDoc: Integer;
  DocFile, ExtDok,NameOfFile : String;
  Ini: TIniFile;
  Ini_Name: String;

implementation

uses DM, Menu, Otch;

{$R *.dfm}

procedure TFSNVvodDoc.BitBtn1Click(Sender: TObject);
begin
FSNOtch.ShowModal();
end;

procedure TFSNVvodDoc.BitBtn2Click(Sender: TObject);
begin
if Length(Trim(LabeledEdit2.Text)) = 0 then
  begin
    MessageDlg('Вы не ввели Название Документа.',mtError,[mbOk],0); // Диалоговое окно, проверка заполняемость полей.
    Exit     //Выход
  end;
//

DMSN.ADOStoredProcVvodDocum.Parameters.ParamByName('@NazvDoc').Value:=LabeledEdit2.Text;
DMSN.ADOStoredProcVvodDocum.Parameters.ParamByName('@Data').Value:=DateToStr(DateTimePicker2.Date);
DMSN.ADOStoredProcVvodDocum.Parameters.ParamByName('@SamoOcen').Value:=RadioGroup2.Items.Text;
DMSN.ADOStoredProcVvodDocum.Parameters.ParamByName('@KodUsar').Value:=DMSN.ADOQueryStudent.FieldByName('KodUsar').Value;
DMSN.ADOStoredProcVvodDocum.Parameters.ParamByName('@KodDiscipl').Value:=DMSN.ADOQueryDisciplina.FieldByName('KodDiscipl').Value;
 if OpenDialog1.Execute then
 ExtDok:=ExtractFileExt(OpenDialog1.FileName);
DMSN.ADOStoredProcVvodDocum.Parameters.ParamByName('@DocFile').Value:=ExtDok;
DMSN.ADOStoredProcVvodDocum.ExecProc;
 KodDoc:=DMSN.ADOStoredProcVvodDocum.Parameters.ParamByName('@KodDoc').Value;
LabeledEdit2.text:='Документ с № KodDoc='+intToStr(KodDoc);
//создать имя файла при записи на сервер(путь+номДок+разш)
    NameOfFile:=DocFile+'\Doc'+IntToStr(KodDoc)+ExtDok;
// скопировать на сервер
     if not CopyFile(PChar(OpenDialog1.FileName),Pchar(NameOfFile),true) then
        begin
        //если не получилось-удалить запись
          MessageDlg('Копирование не выполнено',mtError,[mbOk],0);
          DMSN.ADOQuery2.SQL.Text:='delete from Doc where KodDoc='+IntToStr(KodDoc);
          DMSN.ADOQuery2.ExecSQL;
          end
  else
   MessageDlg('Копирование  выполнено!!!',mtInformation,[mbOk],0);
   DMSN.ADOQueryDocum.Close;
   DMSN.ADOQueryDocum.Open;

// DBGrid1.Columns.Items[0].Title.Caption :='КодДок';
//  DBGrid1.Columns.Items[1].Title.Caption :='НазвДок';
//   DBGrid1.Columns.Items[2].Title.Caption :='Дата';
//    DBGrid1.Columns.Items[3].Title.Caption :='СамоОцен';
//     DBGrid1.Columns.Items[4].Title.Caption :='Файл';
//      DBGrid1.Columns.Items[5].Title.Caption :='КодПользователя'
//       DBGrid1.Columns.Items[6].Title.Caption :='КодДисципл'
end;


procedure TFSNVvodDoc.BitBtn4Click(Sender: TObject);
begin
if MessageDlg('Вернуться в Главное меню ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then    // Диалоговое окно, возврат в Главное меню.
begin
FSNVvodDoc.Close;
end;
end;

procedure TFSNVvodDoc.BitBtn5Click(Sender: TObject);
begin
  if MessageDlg('Закончить работу программы ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then  // Диалоговое окно, прекращение работы программы.
begin
  Close;
  Application.Terminate;
end;
end;

procedure TFSNVvodDoc.FormActivate(Sender: TObject);
begin
begin
DateTimePicker2.Date:=now;
DMSN.ADOQueryDisciplina.Open;
DMSN.ADOQueryDocum.Open;
    Ini_Name:=ChangeFileExt(Application.ExeName,'.ini');
    Ini := TIniFile.Create(Ini_Name);
    DocFile:=Ini.ReadString('PATH_DOCUMENT', 'PATH', 'C:');
end;
begin
 DMSN.ADOQueryDocum.SQL.Text:='select * from Doc where KodUsar='+DMSN.ADOQueryStudent.FieldByName('KodUsar').AsString;
 DMSN.ADOQueryDocum.Open;
 DMSN.ADOQueryStudent.Open;

// DBGrid1.Columns.Items[0].Title.Caption :='КодДок';
//  DBGrid1.Columns.Items[1].Title.Caption :='НазвДок';
//   DBGrid1.Columns.Items[2].Title.Caption :='Дата';
//    DBGrid1.Columns.Items[3].Title.Caption :='СамоОцен';
//     DBGrid1.Columns.Items[4].Title.Caption :='Файл';
//      DBGrid1.Columns.Items[5].Title.Caption :='КодПользователя'
//       DBGrid1.Columns.Items[6].Title.Caption :='КодДисципл'
end;
end;

end.

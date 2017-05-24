unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  mysql50conn, sqldb, db, DBGrids, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Datasource1: TDatasource;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MySQL50Connection1: TMySQL50Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Datasource1DataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MySQL50Connection1AfterConnect(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1: TForm1; 

implementation
uses Unit2;

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
 Unit2.Form2.Show();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  try
   SQLQuery1.Active:=false;
   SQLQuery1.ExecSQL;
   SQLQuery1.SQL.Clear;
   SQLQuery1.sql.add('SELECT nomer_reysa,  vrem_otptavl, vrem_naznach, punkt_otpravl, punkt_naznach, mesta FROM marshruty;');
   SQLQuery1.Open;
  except
   ShowMessage('SQL-запрос: ОШИБКА!');
   exit;
 end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var query:string;
begin
  try

  SQLQuery1.Active:=false;
  SQLQuery1.ExecSQL;
  SQLQuery1.SQL.Clear;
  query := 'SELECT nomer_reysa,  vrem_otptavl, vrem_naznach, punkt_otpravl, punkt_naznach, mesta FROM marshruty WHERE punkt_otpravl = "'+ ComboBox1.Text + '" and punkt_naznach = "' + ComboBox2.text + '" order by nomer_reysa ASC;';
  SQLQuery1.sql.add(query);
  SQLQuery1.Open;
  except
  SQLQuery1.Close;
  end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin

end;

procedure TForm1.Datasource1DataChange(Sender: TObject; Field: TField);
begin

end;

procedure TForm1.FormActivate(Sender: TObject);
var str_sql : string;
begin
  SQLQuery1.Active := false;
  SQLQuery1.SQL.Clear;
  str_sql := 'SET character_set_client='+#39+'utf8'+#39+',character_set_connection='+#39+'cp1251'+#39+',character_set_results='+#39+'utf8'+#39+';';
  SQLQuery1.sql.add(str_sql);
  SQLQuery1.ExecSQL;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  try
   MySQL50Connection1.Connected:=true;
 except
   ShowMessage('Подключение к БД: ОШИБКА!');
   exit;
 end;
  try
   SQLTransaction1.Active:=true;
 except
   ShowMessage('Транзакция: ОШИБКА!');
   exit;
   end;
end;

procedure TForm1.MySQL50Connection1AfterConnect(Sender: TObject);
begin

end;

// D i s c o n n e c t e d
procedure Button4Click(Sender: TObject);
begin
 //SQLQuery1.Active:=false;
 //SQLTransaction1.Commit;
   //MySQL50Connection1.Connected:=false;
end;

initialization
  {$I unit1.lrs}

end.


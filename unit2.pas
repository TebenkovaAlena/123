unit Unit2;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, DBGrids;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button2: TButton;
    Button3: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;

implementation

{ TForm2 }



procedure TForm2.Button2Click(Sender: TObject);
begin
  ShowMessage('Билен возвращен');
  Form2.Close;
end;

procedure TForm2.Button3Click(Sender: TObject);
var x: integer;
  query, x1:string;
  check:Boolean;
begin
  Randomize;
  x := random(1000);
  x1:=IntToStr(x);
  check := false;
  query := 'Билет куплен' + #13;
  if (Edit1.Text > '') then
    query := query + 'На имя: ' + Edit1.Text + ' ' + Edit2.Text;
  if((ComboBox1.Text > '') and (ComboBox2.Text > '')) then begin
    query := query + #13 + 'От:' + ComboBox1.Text  + #13 + 'До:' + ComboBox2.Text+ #13 + 'Ваш номер:' + x1;
  check := false;
  end
  else begin
    query := 'Заполните все формы';
    check:=true;
    end;
   ShowMessage(query);
  if(check = false)  then
    begin
    Edit1.Text:='';
    Edit2.Text:='';
    ComboBox1.Text:='';
    ComboBox2.Text:='';
     Form2.Close;
    end;

end;

procedure TForm2.FormCreate(Sender: TObject);
begin

end;



initialization
  {$I unit2.lrs}

end.


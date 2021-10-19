unit jobs_input;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.StdCtrls,
  FMX.SearchBox, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
  TForm4 = class(TForm)
    ListBox1: TListBox;
    SearchBox1: TSearchBox;
    Rectangle1: TRectangle;
    para_SpL: TComboBox;
    para_gpsL: TComboBox;
    para_gps: TComboBox;
    para_level: TComboBox;
    para_contract: TComboBox;
    para_Sp: TComboBox;
    procedure ListBox1ItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure SearchBox1Validate(Sender: TObject; var Text: string);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}
uses jobs_main;
procedure TForm4.FormShow(Sender: TObject);
begin
searchbox1.SetFocus;
end;

procedure TForm4.ListBox1ItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
  var
  i:integer;
begin
 case tag of
 1: begin
     i:= para_SpL.Items.IndexOf(ListBox1.Selected.Text);
     form1.para_sp.Hint:=para_Sp.Items.Strings[i];
     form1.para_sp.text :=ListBox1.Selected.Text;
    end;

 2: begin
     i:=para_gpsL.Items.IndexOf(ListBox1.Selected.Text);
     form1.para_gps.hint:=para_gps.Items.Strings[i];
     form1.para_gps.text:=ListBox1.Selected.Text;
    end;
 end;
 close;
end;

procedure TForm4.SearchBox1Validate(Sender: TObject; var Text: string);
var
s:string;
begin
s:=trim(searchbox1.Text);
searchbox1.Text:=' ';
  if tag=0 then
   begin
    if length(s)>0 then
    begin
    if  length(trim(form1.para_keyw.text))=0 then
     form1.para_keyw.text:=s else
      form1.para_keyw.text:=form1.para_keyw.text+'+'+s;
    end;
   close;
   end;
end;
end.

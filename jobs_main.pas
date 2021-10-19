unit jobs_main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Advertising, FMX.Objects, System.ImageList, FMX.ImgList, FMX.WebBrowser,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, Web.HTTPApp,
  Web.HTTPProd, FMX.Edit, System.IOUtils, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, Data.Bind.GenData, Data.Bind.ObjectScope, Data.Bind.DBScope,
  Data.Bind.DBXScope, Data.Bind.Components, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  System.Rtti, System.Bindings.Outputs, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  FMX.ListBox, FMX.Gestures, FMX.EditBox, FMX.SpinBox, FMX.SearchBox,
  RTL.Controls, FMX.MultiView, FMX.ComboEdit, FMX.ExtCtrls;

type
  TForm1 = class(TForm)
    BannerAd1: TBannerAd;
    TabControl1: TTabControl;
    Tab1Home: TTabItem;
    Tab5fp: TTabItem;
    bookmList: TTabItem;
    GMang: TGestureManager;
    StyleB: TStyleBook;
    RTLFixer1: TRTLFixer;
    Tab2search: TTabItem;
    VertScrollBox1: TVertScrollBox;
    blak: TImageList;
    green: TImageList;
    Layout1: TLayout;
    Label1: TLabel;
    Rectangle3: TRectangle;
    white: TImageList;
    Tab3pro: TTabItem;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    MultiView1: TMultiView;
    Rectangle4: TRectangle;
    Label2: TLabel;
    Circle1: TCircle;
    para_SP: TEdit;
    ClearEditButton5: TClearEditButton;
    Glyph9: TGlyph;
    para_keyw: TEdit;
    ClearEditButton1: TClearEditButton;
    Glyph5: TGlyph;
    Rectangle1: TRectangle;
    paralevel: TComboBox;
    Glyph6: TGlyph;
    para_contract: TComboBox;
    Glyph8: TGlyph;
    con1: TRadioButton;
    con2: TRadioButton;
    con3: TRadioButton;
    para_exp: TEdit;
    Glyph1: TGlyph;
    para_lsal: TEdit;
    Glyph2: TGlyph;
    para_gps: TEdit;
    ClearEditButton3: TClearEditButton;
    Glyph7: TGlyph;
    Timer1: TTimer;
    Memo1: TMemo;
    GridPanelLayout2: TGridPanelLayout;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    SpeedButton2: TSpeedButton;
    SpeedButton6: TSpeedButton;
    ProfList: TListBox;
    ProName: TEdit;
    Glyph3: TGlyph;
    ClearEditButton2: TClearEditButton;
    bookmarkslist: TListBox;
    Rectangle2: TRectangle;
    GridPanelLayout1: TGridPanelLayout;
    Rectangle5: TRectangle;
    SpeedButton5: TSpeedButton;
    Rectangle8: TRectangle;
    SpeedButton3: TSpeedButton;
    Rectangle9: TRectangle;
    GridPanelLayout3: TGridPanelLayout;
    Rectangle10: TRectangle;
    SpeedButton7: TSpeedButton;
    Rectangle11: TRectangle;
    SpeedButton8: TSpeedButton;
    Rectangle12: TRectangle;
    GridPanelLayout4: TGridPanelLayout;
    Rectangle13: TRectangle;
    SpeedButton9: TSpeedButton;
    Rectangle14: TRectangle;
    SpeedButton10: TSpeedButton;
    Rectangle15: TRectangle;
    SpeedButton11: TSpeedButton;
    Rectangle16: TRectangle;
    SpeedButton12: TSpeedButton;
    procedure TabControl1Gesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure SpeedButton4Click(Sender: TObject);
    procedure para_SPClick(Sender: TObject);
    procedure para_gpsClick(Sender: TObject);
    procedure con1Change(Sender: TObject);
    procedure con2Change(Sender: TObject);
    procedure con3Change(Sender: TObject);
    procedure para_keywClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure paralevelChange(Sender: TObject);
    procedure para_contractChange(Sender: TObject);
    procedure Rectangle7Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Rectangle6Click(Sender: TObject);
  private
  procedure showinput(i:byte);
    { Private declarations }
  public
  
    { Public declarations }
  end;
 type
// para=(pkey,pgps,plevel,pcont,psal,pexp);
 StrAry= array[0..6] of string;
var
  Form1: TForm1;
     apianem: string;
  apitime:integer;
  //qstring:TstringStream;
  qstring:TStringlist;
  arrsms:StrAry;
implementation

{$R *.fmx}

uses jobs_apikey, jobs_apireq,jobs_brow, jobs_input;

Function StoSlist(const s: string):TStringlist;
begin
qstring.Clear;
qstring.Add(s);
  Result :=qstring;
  // TStringStream.Create(Utf8Encode(s));
end;

procedure reflists();
var
SrPro, Srbook : TSearchRec;
s:string;
begin
form1.ProfList.items.Clear;
s:=TPath.GetDocumentsPath() + TPath.DirectorySeparatorChar+'proflist'
       + TPath.DirectorySeparatorChar+ '*.*';

   if FindFirst(s, faArchive, SrPro) = 0 then
          begin
            repeat
             form1.ProfList.items.Add(StringReplace(ExtractFilename(SrPro.Name),
             '.pro','',[]));

            until FindNext(SrPro) <> 0;
            FindClose(SrPro);
          end;

form1.bookmarkslist.items.Clear;
s:=TPath.GetDocumentsPath() + TPath.DirectorySeparatorChar+'bookmarks'
       + TPath.DirectorySeparatorChar+ '*.*';
    if FindFirst(s, faArchive, Srbook) = 0 then
          begin
            repeat
             form1.bookmarkslist.items.Add(StringReplace(ExtractFilename(Srbook.Name),
             '.boo','',[]));

            until FindNext(Srbook) <> 0;
            FindClose(Srbook);
          end;
end;

procedure MakeSms();
var
s:string;
i:integer;
begin

arrsms[0]:=''; arrsms[1]:=''; arrsms[2]:=''; arrsms[3]:='';
arrsms[4]:=''; arrsms[5]:=''; arrsms[6]:=''; s:='';

  try
  {0}
  s:= trim(form1.para_keyw.Text);
  if trim(s)<>'' then
    s:='"'+stringreplace(s, '+', '","',[rfReplaceAll, rfIgnoreCase])+'"';
    arrsms[0]:='"keyWords":['+s+']';
  {1}
     arrsms[1]:= '"contractTypeId":['+form1.para_contract.hint+']';
  {2}
    if form1.paralevel.hint<>'' then s:= form1.paralevel.hint else s:='';
     arrsms[2]:='"instructionLevelId":['+s+']';
  {3}
    if length(form1.para_sp.text)>1 then s:=form1.para_sp.hint else s:='';
     arrsms[3]:='"domaineId":['+s+']';
  {4}
    if trim(form1.para_lsal.Text)<>'' then
    arrsms[4]:='"minSalary":'+trim(form1.para_lsal.Text);
  {5}
    if trim(form1.para_exp.Text)<>'' then
    arrsms[5]:='"experience":'+trim(form1.para_exp.Text);
  {6}
    if length(form1.para_gps.text)>1 then arrsms[6]:= '"states":[],townships":['+form1.para_gps.hint+']';

  finally
    s:='';
    for I := 0 to 6 do
       begin
       if arrsms[i]<>'' then
       if i<>0 then s:=s+','+#13 ;
       s:=s+arrsms[i];
      end;
      s:='{"size":40,"from":0,'+s+'}';
    qstring :=StoSlist(s);
    form1.Memo1.Text:=s;
  end;
end;


procedure TForm1.showinput(i: byte);
begin

if form4.Tag<> i then
begin
 form4.SearchBox1.Text:='';
 form4.listbox1.Clear;

      case i of
      1:form4.ListBox1.Items:=form4.para_spl.Items;
      2:form4.ListBox1.Items:=form4.para_gpsl.Items;
      end;
  end;
form4.Tag:=i;
form4.Show;
end;

procedure TForm1.para_SPClick(Sender: TObject);
begin
showinput(1) ;
end;

procedure TForm1.Rectangle6Click(Sender: TObject);
var
s:string;
begin
try
MakeSms();
s:=TPath.GetHomePath() +
      TPath.DirectorySeparatorChar+'proflist'
       + TPath.DirectorySeparatorChar;
finally

 if trim(ProName.Text)<>'' then
 begin
 if  not FileExists(s+ProName.Text+'.pro')  then
  begin
   qstring.SaveToFile(s+ProName.Text+'.pro');
   reflists;
   showmessage('تم حفظ البروفيال بإسم :'+proname.text);
  end
   else showmessage(' يوجد بروفايل بهذا الإسم');
   end else
        begin
         proname.SetFocus;
        end;
end;

end;

procedure TForm1.Rectangle7Click(Sender: TObject);
begin
try
MakeSms();
finally
 with apireq.Create do freeonterminate:=true;
end;

end;

procedure TForm1.para_keywClick(Sender: TObject);
begin
showinput(0) ;
end;

procedure TForm1.paralevelChange(Sender: TObject);
begin
if paralevel.ItemIndex=0 then  paralevel.Hint:='' else
paralevel.Hint:=form4.para_level.Items.Strings[paralevel.ItemIndex+1];
end;


procedure TForm1.para_contractChange(Sender: TObject);
var
i:integer;
begin
i:= para_contract.ItemIndex;
 if i <>-1 then
  begin
    if con1.IsChecked then
       para_contract.Hint:= form4.para_contract.Items.Strings[i]
   else
     if con2.IsChecked then
       para_contract.Hint:= form4.para_contract.Items.Strings[i+4]
     else
       para_contract.Hint:= form4.para_contract.Items.Strings[i+13]
  end;
end;

procedure TForm1.para_gpsClick(Sender: TObject);
begin
showinput(2) ;
end;

procedure TForm1.con1Change(Sender: TObject);
begin
para_contract.Items.Clear;
with para_contract.Items do
begin
Add('CDI');Add('CDD');
Add('FREELANCE');Add('SAISONNIER');
end;
para_contract.ItemIndex:=-1;

with form4.para_contract.Items do
  begin
  para_contract.Hint:=Strings[0]+','+Strings[1]+','+
                      Strings[2]+','+Strings[3];
  end;
end;

procedure TForm1.con2Change(Sender: TObject);
begin

para_contract.Items.Clear;
with para_contract.Items do
begin
Add('CIP (ECONOMIQUE)');Add('CID (ECONOMIQUE)');Add('CFI/ART');
Add('CFI');Add('CID (ADMINISTRATION)');Add('CIP (ADMINISTRATION)');
Add('CFE');Add('CID-TECHNICIEN (ECONOMIQUE)');Add('CID-TECHNICIEN (ADMINISTRATION)');
end;
para_contract.ItemIndex:=-1;

with form4.para_contract.Items do
  begin
  para_contract.Hint:=Strings[4]+','+Strings[5]+','+
                      Strings[6]+','+Strings[7]+','+
                      Strings[8]+','+Strings[9]+','+
                      Strings[10]+','+Strings[11]+','+Strings[12];
  end;
end;

procedure TForm1.con3Change(Sender: TObject);
begin
 para_contract.Items.Clear;
with para_contract.Items do
begin
Add('CID -TECHNICIEN');Add('CID');
Add('CFI');Add('CIP');
end;
para_contract.ItemIndex:=-1;

with form4.para_contract.Items do
  begin
  para_contract.Hint:=Strings[13]+','+Strings[14]+','+
                      Strings[15]+','+Strings[16];
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
qstring.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
apitime:=0;
qstring:= TStringlist.create;
reflists;
//TStringStream.Create(Utf8Encode(''));
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
reflists();
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
MultiView1.Visible:=true;
if MultiView1.Visible=true then MultiView1.HideMaster else
MultiView1.ShowMaster;
end;

procedure TForm1.TabControl1Gesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
Case EventInfo.GestureID of
sgiLeft :if TabControl1.TabIndex<5 then TabControl1.Next();
sgiright: TabControl1.Previous();
End;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
if apitime=0  then
  begin
  with apikey.Create do freeonterminate:=true;
  apitime:=apitime+10;

  end else
    apitime:=apitime-1;
end;

end.

unit jobs_brow;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.WebBrowser,
  FMX.Advertising, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm2 = class(TForm)
    BannerAd1: TBannerAd;
    WebBrowser1: TWebBrowser;
    Rectangle1: TRectangle;
    Circle1: TCircle;
    Circle2: TCircle;
    Label1: TLabel;
    StyleBook1: TStyleBook;
    StyleBook2: TStyleBook;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

end.

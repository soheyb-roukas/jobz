program Jobs;

uses
  System.StartUpCopy,
  FMX.Forms,
  jobs_main in 'jobs_main.pas' {Form1},
  jobs_brow in 'jobs_brow.pas' {Form2},
  jobs_profile in 'jobs_profile.pas' {Form3},
  jobs_input in 'jobs_input.pas' {Form4},
  jobs_apikey in 'jobs_apikey.pas',
  jobs_apireq in 'jobs_apireq.pas';

{$R *.res}
 
begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait, TFormOrientation.InvertedPortrait, TFormOrientation.Landscape, TFormOrientation.InvertedLandscape];
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.

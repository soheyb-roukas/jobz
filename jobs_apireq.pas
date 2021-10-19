unit jobs_apireq;

interface

uses
  System.Classes, idhttp;

type
  apireq = class(TThread)
  private
  protected
    procedure Execute; override;
  end;

implementation

uses jobs_main;
{ Function StoStrm(const AString: string):TstringStream;
begin
  Result := TStringStream.Create(Utf8Encode(AString));
end;    }



procedure apireq.Execute;
var
  HTTP:TIdHTTP;
  rapi:string;
begin
rapi:='';
 HTTP := TIdHTTP.Create(nil);
       HTTP.ProtocolVersion:=pv1_1;                        //
       HTTP.Request.ContentType := 'application/json';   //
       HTTP.Request.Host:='service.anem.dz:88';        //
       HTTP.Request.Connection:='keep-alive';        //
       HTTP.Request.AcceptEncoding:='gzip';        //
       HTTP.Request.UserAgent:='okhttp/3.9.1';   //
       HTTP.HTTPOptions := [hoKeepOrigProtocol]; //
       HTTP.HandleRedirects:=true;              //
       HTTP.Request.CustomHeaders.FoldLines := False; //
       HTTP.Request.CustomHeaders.Add('Authorization:Bearer ' + apianem);

   try
   rapi := HTTP.Post('http://service.anem.dz:88/api/offers',qstring);
   finally
      form1.Memo1.Text:=rapi;
   end;
end;
end.

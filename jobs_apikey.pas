unit jobs_apikey;

interface

uses
  System.Classes, idhttp;

type
  apikey = class(TThread)
  private
  qstring: string;
  protected
    procedure Execute; override;
  end;

implementation

uses jobs_main;
Function StoStrm(const s: string):TstringStream;
begin
  Result := TStringStream.Create(Utf8Encode(s));
end;



procedure apikey.Execute;
var
  HTTP:TIdHTTP;
  rapi:string;
begin
rapi:='';
 HTTP := TIdHTTP.Create(nil);
       HTTP.ProtocolVersion:=pv1_1;
       HTTP.Request.ContentType := 'application/json';
       HTTP.Request.Host:='service.anem.dz:88';
       HTTP.Request.Connection:='keep-alive';
       HTTP.Request.AcceptEncoding:='gzip';
       HTTP.Request.UserAgent:='okhttp/3.9.1';
       HTTP.HTTPOptions := [hoKeepOrigProtocol];
       HTTP.HandleRedirects:=true;

   try
   rapi := HTTP.Post('http://service.anem.dz:88/token',
   StoStrm('{"password":"AnemUser@@","username":"AnemUser"}'));

   finally
   if ( length(rapi)<300) and (length(rapi)>250) then
    begin
      apitime:=900;
      apianem:=rapi;
    end;
   end;
end;

end.

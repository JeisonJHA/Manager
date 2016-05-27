unit Manager.Source.Components.Update;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, IdComponent, Diagnostics,
  pngimage, ExtCtrls, AppEvnts, Manager.Source.Components.Update.HttpDownload;

type
  TUpdater = class(TObject)
  private
    FApplicationName: string;
    FRemoteVersionFile: string;
    FLocalVersion: string;
    FRemoteVersion: string;
    FXmlVersionInfo: string;
    FInstallerFileName: string;
    FUrlInstaller: string;
    FErrorUpdate: boolean;
    FSilent: boolean;
    FApplicationFileName: string;
    function GetUpdateAvailable: boolean;
    procedure ReadInfoUpdater;
    procedure ReadRemoteInfo;
    procedure ReadLocalInfo;
  public
    property UpdateAvailable: boolean read GetUpdateAvailable;
    property LocalVersion: string read FLocalVersion write FLocalVersion;
    property RemoteVersion: string read FRemoteVersion write FRemoteVersion;
    property XmlVersionInfo: string read FXmlVersionInfo write FXmlVersionInfo;
    property InstallerFileName: string read FInstallerFileName
      write FInstallerFileName;
    property UrlInstaller: string read FUrlInstaller write FUrlInstaller;
    property ApplicationName: string read FApplicationName write FApplicationName;
    property ApplicationFileName: string read FApplicationFileName write FApplicationFileName;
    property Silent: boolean read FSilent write FSilent;
  end;

implementation

uses
  IdURI, IdSSLOpenSSL, IdHTTP, System.IOUtils, System.TimeSpan, Winapi.ShellAPI,
  System.UITypes, System.Win.ComObj;

const
  sXPathVersionNumber = '/versioninfo/@versionapp';
  sXPathUrlInstaller = '/versioninfo/@url';
  sXPathInstallerFileName = '/versioninfo/@installerfilename';
  sXPathApplicationName = '/downloadinfo/@ApplicationName';
  sXPathRemoteURL = '/downloadinfo/@url';

function GetFileVersionStr(const FileName: string): string;
var
  FSO  : OleVariant;
begin
  FSO    := CreateOleObject('Scripting.FileSystemObject');
  Result := FSO.GetFileVersion(FileName);
end;

function LHttpGet(const Url: string): string;
var
  Http: TIdHTTP;
  buffer: TStringStream;
  LHandler: TIdSSLIOHandlerSocketOpenSSL;
begin
  Http := TIdHTTP.Create(nil);
  try
    buffer := TStringStream.Create;
    try
      LHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
      try
        Http.IOHandler := LHandler;
        Http.Request.UserAgent := sUserAgent;
        Http.HandleRedirects := True;
        Http.Get(Url, buffer);
        Result := buffer.DataString;
      finally
        LHandler.Free;
      end;
    finally
      buffer.Free;
    end;
  finally
    Http.Free;
  end;
end;

{ TUpdaterCore }

procedure TUpdater.ReadInfoUpdater;
var
  LFile : string;
  Node   : OleVariant;
  XmlDoc : OleVariant;
begin
//  AddLog('Reading info updater');
  LFile := ExtractFilePath(ParamStr(0)) + 'DownloadInfo.xml';
  if not FileExists(LFile) then
   begin
     MessageDlg(Format('File %s not found', [LFile]), mtWarning, [mbOK], 0);
     Halt(0);
   end;

  XmlDoc       := CreateOleObject('Msxml2.DOMDocument.6.0');
  XmlDoc.Async := False;
  try
    XmlDoc.Load(LFile);
    XmlDoc.SetProperty('SelectionLanguage','XPath');
    if (XmlDoc.parseError.errorCode <> 0) then
     raise Exception.CreateFmt('Error in Xml Data Code %s Reason %s',[XmlDoc.parseError.errorCode, XmlDoc.parseError.reason]);

     Node:=XmlDoc.selectSingleNode(sXPathApplicationName);
     if not VarIsClear(Node) then FApplicationName := Node.Text;

     Node:=XmlDoc.selectSingleNode(sXPathRemoteURL);
     if not VarIsClear(Node) then FRemoteVersionFile:=Node.Text;
  finally
   XmlDoc    :=Unassigned;
  end;
end;

procedure TUpdater.ReadLocalInfo;
begin
   if not FileExists(FApplicationFileName) then
    begin
     MessageDlg(Format('File %s not found', [FApplicationFileName]), mtWarning, [mbOK], 0);
      Halt(0);
    end;

//   AddLog(Format('Reading version info from %s', [LBinaryFile]));
   FLocalVersion := GetFileVersionStr(FApplicationFileName);
end;

procedure TUpdater.ReadRemoteInfo;
var
  XmlDoc: OleVariant;
  Node: OleVariant;
begin
  XmlDoc := CreateOleObject('Msxml2.DOMDocument.6.0');
  XmlDoc.Async := False;
  try
    // AddLog('Obtendo informação remota da versão');
    FXmlVersionInfo := LHttpGet(FRemoteVersionFile);
    XmlDoc.LoadXml(XmlVersionInfo);
    XmlDoc.SetProperty('SelectionLanguage', 'XPath');
    if (XmlDoc.parseError.errorCode <> 0) then
      raise Exception.CreateFmt('Error in Xml Data Code %s Reason %s',
        [XmlDoc.parseError.errorCode, XmlDoc.parseError.reason]);

    Node := XmlDoc.selectSingleNode(sXPathVersionNumber);
    if not VarIsClear(Node) then
      FRemoteVersion := Node.Text;
    // AddLog(Format('Versão encontrada %s',[FRemoteVersion]));

    Node := XmlDoc.selectSingleNode(sXPathUrlInstaller);
    if not VarIsClear(Node) then
      FUrlInstaller := Node.Text;
    // EditURI.Text := FUrlInstaller;

    Node := XmlDoc.selectSingleNode(sXPathInstallerFileName);
    if not VarIsClear(Node) then
      FInstallerFileName := Node.Text;
  finally
    XmlDoc := Unassigned;
  end;
end;

{ TUpdaterCore }

function TUpdater.GetUpdateAvailable: boolean;
begin
  Result := False;
  try
    ReadInfoUpdater();
    ReadLocalInfo();
    if RemoteVersion.IsEmpty then
      ReadRemoteInfo;
    Result := (FRemoteVersion > FLocalVersion);
  except
    on E: Exception do
    begin
      FErrorUpdate := True;
      if FSilent then
        Exit;

      MessageDlg(Format('Error checking updates %s', [E.Message]), mtWarning, [mbOK], 0);
    end;
  end;
end;

end.

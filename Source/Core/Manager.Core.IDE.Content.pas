unit Manager.Core.IDE.Content;

interface

uses Classes, SysUtils, Manager.Core.API.Observer, Generics.Collections,
  Manager.Core.IDE.Notify, Manager.Core.Parser.Manager, Manager.Core.IDE.Prepare,
  Manager.Core.PromptCommand, Manager.Core.Configuration;

type
  TIDEContent = class(TObject)
  private
    FIDENotify: TIDENotify;
    FParserManager: TParserManager;
    FIDEPrepare: TIDEPrepare;
    FPromptCommand: TDosCommand;
    FConfiguration: TConfiguration;
    constructor Create;
    destructor Destroy; override;
  public
    class function GetInstance: TIDEContent;
    property Observers: TIDENotify read FIDENotify;
    property ParserManager: TParserManager read FParserManager;
    property Prepare: TIDEPrepare read FIDEPrepare;
    property Configuration: TConfiguration read FConfiguration;
    property PromptCommand: TDosCommand read FPromptCommand;
  end;

implementation

var
  _Singleton: TIDEContent = nil;

{ TIDEContent }

constructor TIDEContent.Create;
begin
  FIDENotify := TIDENotify.Create;
  FParserManager := TParserManager.Create;
  FIDEPrepare := TIDEPrepare.Create;
  FPromptCommand := TDosCommand.Create(nil);
  FConfiguration := TConfiguration.Create(nil);
end;

destructor TIDEContent.Destroy;
begin
  FreeAndNil(FConfiguration);
  FreeAndNil(FPromptCommand);
  FreeAndNil(FIDEPrepare);
  FreeAndNil(FParserManager);
  FreeAndNil(FIDENotify);
  inherited;
end;

class function TIDEContent.GetInstance: TIDEContent;
begin
 if not Assigned(_Singleton) then
  _Singleton := TIDEContent.Create;

 Exit(_Singleton);
end;

initialization

finalization
  _Singleton.Free;

end.

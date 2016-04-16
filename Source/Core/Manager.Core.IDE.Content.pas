unit Manager.Core.IDE.Content;

interface

uses Classes, SysUtils, Manager.Core.API.Observer, Generics.Collections,
  Manager.Core.IDE.Notify, Manager.Core.Parser.Manager, Manager.Core.IDE.Prepare;

type
  TIDEContent = class(TObject)
  private
    FIDENotify: TIDENotify;
    FParserManager: TParserManager;
    FIDEPrepare: TIDEPrepare;
    constructor Create;
    destructor Destroy; override;
  public
    class function GetInstance: TIDEContent;
    property Observers: TIDENotify read FIDENotify;
    property ParserManager: TParserManager read FParserManager;
    property Prepare: TIDEPrepare read FIDEPrepare;
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
end;

destructor TIDEContent.Destroy;
begin
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

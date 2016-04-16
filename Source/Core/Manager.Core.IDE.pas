unit Manager.Core.IDE;

interface

uses
  Forms, Manager.Core.API.Main, Manager.Core.Configuration,
  Manager.Core.IDE.Content, Manager.Core.API.Observer,
  Manager.Core.Parser.Manager, Manager.Core.IDE.Prepare;

type
  IDE = class helper for TApplication
  private
    function GetParserManager: TParserManager;
    function GetPrepare: TIDEPrepare;
  public
    function Main: IMain;
    procedure Register(AObserver: IObserver);
    procedure Remove(AObserver: IObserver);
    procedure Notify;
    property Parser: TParserManager read GetParserManager;
    property Prepare: TIDEPrepare read GetPrepare;
  end;

implementation

{ IDE }

function IDE.GetParserManager: TParserManager;
begin
  Exit(TIDEContent.GetInstance.ParserManager);
end;

function IDE.GetPrepare: TIDEPrepare;
begin
  Exit(TIDEContent.GetInstance.Prepare);
end;

function IDE.Main: IMain;
begin
  Exit(Self.MainForm as IMain);
end;

procedure IDE.Notify;
begin
  TIDEContent.GetInstance.Observers.Notify;
end;

procedure IDE.Register(AObserver: IObserver);
begin
  TIDEContent.GetInstance.Observers.Register(AObserver);
end;

procedure IDE.Remove(AObserver: IObserver);
begin
  TIDEContent.GetInstance.Observers.Remove(AObserver);
end;

end.

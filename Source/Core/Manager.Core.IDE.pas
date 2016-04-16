unit Manager.Core.IDE;

interface

uses
  Forms, Manager.Core.API.Main, Manager.Core.Configuration,
  Manager.Core.Application.Notify, Manager.Core.API.Observer;

type
  IDE = class helper for TApplication
  public
    function Main: IMain;
    procedure Register(AObserver: IObserver);
    procedure Remove(AObserver: IObserver);
    procedure Notify;
  end;

implementation

{ IDE }

function IDE.Main: IMain;
begin
  Exit(Self.MainForm as IMain);
end;

procedure IDE.Notify;
begin
  TApplicationNotify.GetInstance.NotifyObservers;
end;

procedure IDE.Register(AObserver: IObserver);
begin
  TApplicationNotify.GetInstance.RegisterObserver(AObserver);
end;

procedure IDE.Remove(AObserver: IObserver);
begin
  TApplicationNotify.GetInstance.RemoveObserver(AObserver);
end;

end.

unit Manager.Core.Application.Notify;

interface

uses Classes, SysUtils, Manager.Core.API.Observer, Generics.Collections;

type
  TApplicationNotify = class(TInterfacedObject, ISubject)
  private
    FObserverList: TList<IObserver>;
    constructor Create;
  public
    class function GetInstance: TApplicationNotify;
    procedure RegisterObserver(AObserver: IObserver);
    procedure RemoveObserver(AObserver: IObserver);
    procedure NotifyObservers;
  end;

implementation

var
  _Singleton: TApplicationNotify = nil;

{ TIDEApplication }

constructor TApplicationNotify.Create;
begin
  FObserverList := TList<IObserver>.Create;
end;

class function TApplicationNotify.GetInstance: TApplicationNotify;
begin
  if (_Singleton = nil) then
     _Singleton := TApplicationNotify.Create;

   Result := _Singleton;
end;

procedure TApplicationNotify.NotifyObservers;
var
  observer: IObserver;
begin
  for observer in FObserverList do
    observer.Update(Self);
end;

procedure TApplicationNotify.RegisterObserver(AObserver: IObserver);
begin
  FObserverList.Add(AObserver);
end;

procedure TApplicationNotify.RemoveObserver(AObserver: IObserver);
begin
  FObserverList.Remove(AObserver);
end;

initialization

finalization
  _Singleton.Free;

end.

unit Manager.Core.IDE.Notify;

interface

uses Classes, SysUtils, Manager.Core.API.Observer, Generics.Collections;

type
  TIDENotify = class(TInterfacedObject, ISubject)
  private
    FObserverList: TList<IObserver>;
  public
    constructor Create;
    procedure Register(AObserver: IObserver);
    procedure Remove(AObserver: IObserver);
    procedure Notify;
  end;

implementation

{ TIDEApplication }

constructor TIDENotify.Create;
begin
  FObserverList := TList<IObserver>.Create;
end;

procedure TIDENotify.Notify;
var
  observer: IObserver;
begin
  for observer in FObserverList do
    observer.Update(Self);
end;

procedure TIDENotify.Register(AObserver: IObserver);
begin
  FObserverList.Add(AObserver);
end;

procedure TIDENotify.Remove(AObserver: IObserver);
begin
  FObserverList.Remove(AObserver);
end;

end.

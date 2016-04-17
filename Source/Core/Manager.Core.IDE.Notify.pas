unit Manager.Core.IDE.Notify;

interface

uses Classes, SysUtils, Manager.Core.API.Observer, Generics.Collections,
  Manager.Core.IDE.Constants;

type
  TIDENotify = class(TInterfacedObject, ISubject)
  private
    FObserverList: TList<IObserver>;
  public
    constructor Create;
    procedure Register(AObserver: IObserver);
    procedure Remove(AObserver: IObserver);
    procedure Notify(const ATipoAcao: TTipoAcao);
  end;

implementation

{ TIDEApplication }

constructor TIDENotify.Create;
begin
  FObserverList := TList<IObserver>.Create;
end;

procedure TIDENotify.Notify(const ATipoAcao: TTipoAcao);
var
  observer: IObserver;
begin
  for observer in FObserverList do
    observer.Update(Self, ATipoAcao);
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

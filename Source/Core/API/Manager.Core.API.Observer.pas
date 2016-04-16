unit Manager.Core.API.Observer;

interface

type
  IObserver = interface
  ['{69B40B25-B2C8-4F11-B442-39B7DC26FE80}']
    procedure Update(Sender: TObject);
  end;

  ISubject = interface
  ['{A9240295-B0C2-441D-BD43-932AF735832A}']
    procedure RegisterObserver(Observer: IObserver);
    procedure RemoveObserver(Observer: IObserver);
    procedure NotifyObservers;
  end;

implementation

end.

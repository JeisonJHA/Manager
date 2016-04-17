unit Manager.Core.API.Observer;

interface

uses Manager.Core.IDE.Constants;

type
  IObserver = interface
  ['{69B40B25-B2C8-4F11-B442-39B7DC26FE80}']
    procedure Update(Sender: TObject; ATipoAcao: TTipoAcao);
  end;

  ISubject = interface
  ['{A9240295-B0C2-441D-BD43-932AF735832A}']
    procedure Register(Observer: IObserver);
    procedure Remove(Observer: IObserver);
    procedure Notify(const ATipoAcao: TTipoAcao);
  end;

implementation

end.

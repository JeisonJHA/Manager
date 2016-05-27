unit Manager.Source.Core.Intf.Observer;

interface

uses Manager.Source.Core.IDE.Consts;

type
  IManagerObserver = interface
  ['{69B40B25-B2C8-4F11-B442-39B7DC26FE80}']
    procedure Update(Sender: TObject);
  end;

  IManagerSubject = interface
  ['{A9240295-B0C2-441D-BD43-932AF735832A}']
    procedure Register(AObserver: IManagerObserver);
    procedure Remove(AObserver: IManagerObserver);
    procedure Notify;
  end;

implementation

end.

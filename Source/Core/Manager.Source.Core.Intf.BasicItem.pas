unit Manager.Source.Core.Intf.BasicItem;

interface

uses Generics.Collections;

type
  IManagerBasicItem = interface
    ['{9549DD8F-657A-4862-8F10-E7FBF39A5B9B}']
    procedure Execute;
  end;

  TManagerBasicItemList = class(TList<IManagerBasicItem>);

implementation

end.

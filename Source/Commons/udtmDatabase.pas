unit udtmDatabase;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Data.DB,
  InstantPersistence, InstantBrokers, System.ImageList, Vcl.ImgList,
  Vcl.Controls, cxGraphics, IBX.IBDatabase, Workspace.Config, InstantIBX;

type
  TdtmDatabase = class(TDataModule)
    InstantIBXConnector1: TInstantIBXConnector;
    IBTransaction1: TIBTransaction;
    IBDatabase1: TIBDatabase;
    SmallImageList: TcxImageList;
    MediumImageList: TcxImageList;
    LargeImageList: TcxImageList;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure Conectar;
  public
  end;

var
  dtmDatabase: TdtmDatabase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmDatabase.DataModuleCreate(Sender: TObject);
begin
  Conectar;
end;

procedure TdtmDatabase.Conectar;
var
  Config: TWorkspaceConfig;
begin
  {$IFDEF DEBUG}
  IBDatabase1.DatabaseName := ExtractFilePath(Application.ExeName) + 'DATA.FDB';
  {$ELSE}
  Config := TWorkspaceConfig.Create(nil);
  try
    IBDatabase1.DatabaseName := Config.DatabaseName;
  finally
    FreeAndNil(Config);
  end;
  {$ENDIF}
  IBDatabase1.Open;
end;

end.


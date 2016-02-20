unit udtmDatabase;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, ZConnection, ZAbstractConnection,
  Data.DB, ZDataset, ZSqlUpdate, ZAbstractRODataset, ZAbstractDataset,
  InstantPersistence, InstantBrokers, InstantZeosDBO, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  InstantFireDAC, FireDAC.Comp.Client, System.ImageList, Vcl.ImgList,
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
  Config := TWorkspaceConfig.Create(nil);
  try
    IBDatabase1.DatabaseName := Config.DatabaseName;
    IBDatabase1.Open;
  finally
    FreeAndNil(Config);
  end;
end;

end.

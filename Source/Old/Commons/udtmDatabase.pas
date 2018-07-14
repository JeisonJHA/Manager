unit udtmDatabase;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Data.DB,
  InstantPersistence, InstantBrokers, System.ImageList, Vcl.ImgList,
  Vcl.Controls, cxGraphics, IBX.IBDatabase, Manager.Core.Configuration, InstantIBX,
  IBX.IBScript, IBX.IBCustomDataSet, IBX.IBQuery, cxImageList;

type
  TdtmDatabase = class(TDataModule)
    InstantIBXConnector1: TInstantIBXConnector;
    IBTransaction1: TIBTransaction;
    IBDatabase1: TIBDatabase;
    SmallImageList: TcxImageList;
    MediumImageList: TcxImageList;
    LargeImageList: TcxImageList;
    XLargeImageList: TcxImageList;
    IBScript1: TIBScript;
    IBQuery1: TIBQuery;
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
  Config: TConfiguration;
begin
  {$IFDEF DEBUG}
  IBDatabase1.DatabaseName := ExtractFilePath(Application.ExeName) + 'DATA.FDB';
  {$ELSE}
  Config := TConfiguration.Create(nil);
  try
    IBDatabase1.DatabaseName := Config.DatabaseName;
  finally
    FreeAndNil(Config);
  end;
  {$ENDIF}
  IBDatabase1.Open;
end;

end.


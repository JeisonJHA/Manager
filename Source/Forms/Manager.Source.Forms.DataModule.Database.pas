unit Manager.Source.Forms.DataModule.Database;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Data.DB,
  InstantPersistence, InstantBrokers, System.ImageList, Vcl.ImgList,
  Vcl.Controls, cxGraphics, IBX.IBDatabase, InstantIBX,
  IBX.IBScript, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TdtmDatabase = class(TDataModule)
    InstantIBXConnector1: TInstantIBXConnector;
    IBTransaction1: TIBTransaction;
    IBDatabase1: TIBDatabase;
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

uses Manager.Source.Core.AplicationHelper;

{$R *.dfm}

procedure TdtmDatabase.DataModuleCreate(Sender: TObject);
begin
  Conectar;
end;

procedure TdtmDatabase.Conectar;
begin
{$IFDEF DEBUG}
  IBDatabase1.DatabaseName := ExtractFilePath(Application.ExeName) + 'DATA.FDB';
{$ELSE}
  IBDatabase1.DatabaseName := Application.IDE.Config.DatabaseName;
{$ENDIF}
  IBDatabase1.Open;
end;

end.


unit Manager.Source.Forms.DataModule.Database;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Data.DB,
  InstantPersistence, InstantBrokers, System.ImageList, Vcl.ImgList,
  Vcl.Controls, cxGraphics, IBX.IBDatabase, InstantIBX,
  IBX.IBScript, IBX.IBCustomDataSet, IBX.IBQuery,
  Manager.Source.Core.Intf.BasicItem;

type
  TdtmDatabase = class(TDataModule, IManagerBasicItem)
    InstantIBXConnector1: TInstantIBXConnector;
    IBTransaction1: TIBTransaction;
    IBDatabase1: TIBDatabase;
    IBScript1: TIBScript;
    IBQuery1: TIBQuery;
  private
    procedure Conectar;
  public
    procedure Execute;
  end;

var
  dtmDatabase: TdtmDatabase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Manager.Source.Core.AplicationHelper;

{$R *.dfm}

procedure TdtmDatabase.Execute;
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


unit Manager.Source.Forms.Splash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Samples.Gauges;

type
  TfrmSplash = class(TForm)
    imgDeveloper: TImage;
    Label1: TLabel;
    imgTester: TImage;
    Gauge1: TGauge;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

{ TfrmSplash }

procedure TfrmSplash.CreateParams(var Params: TCreateParams);
const
  CS_DROPSHADOW = $00020000;
begin
  inherited;
  Params.WindowClass.Style := Params.WindowClass.Style or CS_DROPSHADOW;
end;

procedure TfrmSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSplash.FormShow(Sender: TObject);
begin
{$IF defined(TESTER)}
  imgTester.Visible := True;
  imgDeveloper.Visible := False;
{$ELSEIF defined(DEVELOPER)}
  imgDeveloper.Visible := True;
  imgTester.Visible := False;
{$ENDIF}
end;

end.

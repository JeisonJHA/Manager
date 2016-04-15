unit Manager.Core.Forms.Modelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, InstantPresentation,
  System.Actions, Vcl.ActnList;

type
  TfrmModelo = class(TForm)
    ioeMestre: TInstantExposer;
    ActionList: TActionList;
    dtsMestre: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FAtribuicaoExterna: Boolean;
    function GetSubject: TObject;
    function GetAtribuicaoExterna: boolean;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; var ASubject: TObject); overload; virtual;
    property Subject: TObject read GetSubject;
    property AtribuicaoExterna: boolean read GetAtribuicaoExterna write FAtribuicaoExterna;
  end;

var
  frmModelo: TfrmModelo;

implementation

{$R *.dfm}

constructor TfrmModelo.Create(AOwner: TComponent; var ASubject: TObject);
begin
  inherited Create(AOwner);
  ioeMestre.Subject := ASubject;
  FAtribuicaoExterna := Assigned(ASubject);
end;

procedure TfrmModelo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TfrmModelo.GetAtribuicaoExterna: boolean;
begin
  Exit(FAtribuicaoExterna);
end;

function TfrmModelo.GetSubject: TObject;
begin
  Exit(ioeMestre.Subject);
end;

end.

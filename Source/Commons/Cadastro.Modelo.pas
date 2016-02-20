unit Cadastro.Modelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Formulario.Modelo, Data.DB,
  InstantPresentation, Vcl.ExtCtrls, Vcl.StdCtrls, System.Actions, Vcl.ActnList;

type
  TfrmCadastroModeloClass = class of TfrmCadastroModelo;

  TfrmCadastroModelo = class(TfrmModelo)
    Panel1: TPanel;
    Panel2: TPanel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    Bevel1: TBevel;
    actCancelar: TAction;
    actConfirmar: TAction;
    procedure actConfirmarUpdate(Sender: TObject);
    procedure actConfirmarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroModelo: TfrmCadastroModelo;

implementation

{$R *.dfm}

procedure TfrmCadastroModelo.actCancelarExecute(Sender: TObject);
begin
  inherited;
  ioeMestre.Cancel;
  Self.Close;
end;

procedure TfrmCadastroModelo.actConfirmarExecute(Sender: TObject);
begin
  inherited;
  if AtribuicaoExterna then
    Exit;

  ioeMestre.Post;
  ioeMestre.PostChanges;
end;

procedure TfrmCadastroModelo.actConfirmarUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := ioeMestre.State in [dsInsert, dsEdit];
end;

end.

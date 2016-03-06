unit Cadastro.Acao.MontarAmbiente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro.Acao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, InstantPresentation,
  System.Actions, Vcl.ActnList, cxMaskEdit, cxDropDownEdit, cxImageComboBox,
  cxDBEdit, cxTextEdit, Vcl.StdCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxPC,
  Vcl.ExtCtrls, JvExControls, JvSpeedButton;

type
  TfrmCadastroAcaoMontarAmbiente = class(TfrmCadastroAcao)
    ioeMestreSelf: TIntegerField;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    JvSpeedButton1: TJvSpeedButton;
    JvSpeedButton2: TJvSpeedButton;
    Panel4: TPanel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1Descricao: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    iosAcoes: TInstantSelector;
    dtsAcoes: TDataSource;
    iosAcoesDescricao: TStringField;
    iosAcoesIcone: TIntegerField;
    iosAcoesSelf: TIntegerField;
    actAddDetalhe: TAction;
    actDelDetalhe: TAction;
    iosSelecionadorAcoes: TDataSetField;
    iosSelecionadorTipoAcao: TStringField;
    procedure JvSpeedButton1Click(Sender: TObject);
    procedure actAddDetalheUpdate(Sender: TObject);
    procedure actDelDetalheUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroAcaoMontarAmbiente: TfrmCadastroAcaoMontarAmbiente;

implementation

{$R *.dfm}

uses Acao.Controller, Acao, Formulario.Escolha, Formulario.Utils;

procedure TfrmCadastroAcaoMontarAmbiente.actAddDetalheUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := Assigned(iosSelecionador.CurrentObject);
end;

procedure TfrmCadastroAcaoMontarAmbiente.actDelDetalheUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := not ioeMestre.IsEmpty;
end;

procedure TfrmCadastroAcaoMontarAmbiente.JvSpeedButton1Click(Sender: TObject);
var
  objeto: TObject;
  ambiente: TAcaoMontarAmbiente;
begin
  inherited;
  ambiente := TAcaoMontarAmbiente(iosSelecionador.CurrentObject);
  objeto := iosAcoes.Escolher();
  if not Assigned(objeto) then
    Exit;

  ambiente.AddAcao(TAcao(objeto));
  ambiente.Store();
  iosSelecionador.RefreshCurrentObject;
end;

initialization
  RegisterForm(TfrmCadastroAcaoMontarAmbiente);

end.

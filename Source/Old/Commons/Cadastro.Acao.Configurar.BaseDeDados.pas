unit Cadastro.Acao.Configurar.BaseDeDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro.Acao.Copiar, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  InstantPresentation, System.Actions, Vcl.ActnList, cxDBEdit, cxMaskEdit,
  cxDropDownEdit, cxImageComboBox, cxTextEdit, Vcl.StdCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxPC, Vcl.ExtCtrls, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxSpinEdit, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.Menus,
  InstantPersistence;

type
  TfrmCadastroAcaoConfigurarBaseDeDados = class(TfrmCadastroAcaoCopiar)
    ioeMestreSelf: TIntegerField;
    iosSelecionadorAlias: TStringField;
    iosSelecionadorSenha: TStringField;
    iosSelecionadorSistema: TIntegerField;
    iosSelecionadorSistemaDescricao: TStringField;
    iosSelecionadorSistemaNomeDiretorio: TStringField;
    iosSelecionadorUsuario: TStringField;
    Label7: TLabel;
    Label4: TLabel;
    ioeMestreAlias: TStringField;
    ioeMestreSenha: TStringField;
    ioeMestreSistema: TIntegerField;
    ioeMestreSistemaDescricao: TStringField;
    ioeMestreSistemaNomeDiretorio: TStringField;
    ioeMestreUsuario: TStringField;
    iosSistema: TInstantSelector;
    dtsSistema: TDataSource;
    iosSistemaDescricao: TStringField;
    iosSistemaNomeDiretorio: TStringField;
    iosSistemaSelf: TIntegerField;
    cbxSistema: TcxDBLookupComboBox;
    edtAlias: TcxDBTextEdit;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    iosSelecionadorServer: TStringField;
    Label8: TLabel;
    edtServer: TcxDBTextEdit;
    iosSelecionadorDBSenha: TStringField;
    iosSelecionadorDBUsuario: TStringField;
    iosSelecionadorTipoAcao: TStringField;
    iosSelecionadorTipoBanco: TStringField;
    Label10: TLabel;
    edtDBUsuario: TcxDBTextEdit;
    Label9: TLabel;
    edtDBSenha: TcxDBTextEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    edtUsuario: TcxDBTextEdit;
    Label5: TLabel;
    edtSenha: TcxDBTextEdit;
    PopupMenu1: TPopupMenu;
    mnoCopiar: TMenuItem;
    actCopiarAcao: TAction;
    procedure SpeedButton1Click(Sender: TObject);
    procedure actCopiarAcaoUpdate(Sender: TObject);
    procedure actCopiarAcaoExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    function PegarCaminhoTemplate: string; virtual;
  public
    { Public declarations }
  end;

var
  frmCadastroAcaoConfigurarBaseDeDados: TfrmCadastroAcaoConfigurarBaseDeDados;

implementation

{$R *.dfm}

uses Manager.Core.Forms.Utils, Acao;

procedure TfrmCadastroAcaoConfigurarBaseDeDados.actCopiarAcaoExecute(
  Sender: TObject);
var
  clone: TInstantObject;
  copy: TInstantObject;
begin
  inherited;
  clone := InstantGetClass(iosSelecionador.ObjectClassName).Clone(TInstantObject(iosSelecionador.CurrentObject));
  copy := InstantGetClass(iosSelecionador.ObjectClassName).Create();
  TAcaoConfigurarBaseDeDados(clone).CopiarPara(copy);
  TAcao(copy).Descricao := Format('%s %s', [TAcao(copy).Descricao, 'Cópia']);
  iosSelecionador.InsertObject(copy);
  TInstantObject(copy).Store();
end;

procedure TfrmCadastroAcaoConfigurarBaseDeDados.actCopiarAcaoUpdate(
  Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := Assigned(iosSelecionador.CurrentObject) and
    (cxPageControl1.ActivePage = tabDetalhes);
end;

function TfrmCadastroAcaoConfigurarBaseDeDados.PegarCaminhoTemplate: string;
begin
  Exit(ExtractFilePath(Application.ExeName) + 'Templates\DB\');
end;

procedure TfrmCadastroAcaoConfigurarBaseDeDados.SpeedButton1Click(
  Sender: TObject);
begin
  OpenDialog1.InitialDir := PegarCaminhoTemplate;
  OpenDialog1.Execute();
  if not String(OpenDialog1.FileName).IsEmpty then
    cbxOrigem.Text := OpenDialog1.FileName;
end;

initialization
  RegisterForm(TfrmCadastroAcaoConfigurarBaseDeDados);

end.

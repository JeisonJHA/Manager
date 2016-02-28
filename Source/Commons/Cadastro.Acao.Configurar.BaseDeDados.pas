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
  cxDBLookupComboBox, cxSpinEdit, Vcl.Buttons;

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
    cxGrid1DBTableView1Senha: TcxGridDBColumn;
    cxGrid1DBTableView1SistemaDescricao: TcxGridDBColumn;
    cxGrid1DBTableView1Usuario: TcxGridDBColumn;
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
    procedure SpeedButton1Click(Sender: TObject);
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

end.

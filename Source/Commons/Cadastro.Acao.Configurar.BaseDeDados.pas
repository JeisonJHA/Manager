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
  cxDBLookupComboBox, cxSpinEdit;

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
    Label5: TLabel;
    edtSenha: TcxDBTextEdit;
    Label6: TLabel;
    edtUsuario: TcxDBTextEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroAcaoConfigurarBaseDeDados: TfrmCadastroAcaoConfigurarBaseDeDados;

implementation

{$R *.dfm}

end.

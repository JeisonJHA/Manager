unit Cadastro.BancoDeDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro.Paginado.Modelo, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  InstantPresentation, System.Actions, Vcl.ActnList, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, Vcl.StdCtrls, Vcl.ExtCtrls, cxContainer, cxTextEdit, cxDBEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmCadastroBancoDeDados = class(TfrmCadastroPaginadoModelo)
    iosSelecionadorAlias: TStringField;
    iosSelecionadorDescricao: TStringField;
    iosSelecionadorSelf: TIntegerField;
    iosSelecionadorSenha: TStringField;
    iosSelecionadorSistema: TIntegerField;
    iosSelecionadorSistemaDescricao: TStringField;
    iosSelecionadorSistemaNomeDiretorio: TStringField;
    iosSelecionadorUsuario: TStringField;
    cxGrid1DBTableView1Descricao: TcxGridDBColumn;
    cxGrid1DBTableView1SistemaDescricao: TcxGridDBColumn;
    ioeMestreAlias: TStringField;
    ioeMestreDescricao: TStringField;
    ioeMestreSelf: TIntegerField;
    ioeMestreSenha: TStringField;
    ioeMestreSistema: TIntegerField;
    ioeMestreSistemaDescricao: TStringField;
    ioeMestreSistemaNomeDiretorio: TStringField;
    ioeMestreUsuario: TStringField;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label2: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label3: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label4: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    Label5: TLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    iosSistema: TInstantSelector;
    dtsSistema: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroBancoDeDados: TfrmCadastroBancoDeDados;

implementation

{$R *.dfm}

end.

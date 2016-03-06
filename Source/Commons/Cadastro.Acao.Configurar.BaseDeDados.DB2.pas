unit Cadastro.Acao.Configurar.BaseDeDados.DB2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro.Acao.Configurar.BaseDeDados,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  InstantPresentation, System.Actions, Vcl.ActnList, cxSpinEdit, cxDBEdit,
  cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxTextEdit, Vcl.StdCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxPC, Vcl.ExtCtrls, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Vcl.Buttons;

type
  TfrmCadastroAcaoConfigurarBaseDeDadosDB2 = class(TfrmCadastroAcaoConfigurarBaseDeDados)
  private
    { Private declarations }
  protected
    function PegarCaminhoTemplate: string; override;
  public
    { Public declarations }
  end;

var
  frmCadastroAcaoConfigurarBaseDeDadosDB2: TfrmCadastroAcaoConfigurarBaseDeDadosDB2;

implementation

{$R *.dfm}

uses Formulario.Utils;

{ TfrmCadastroAcaoConfigurarBaseDeDadosDB2 }

function TfrmCadastroAcaoConfigurarBaseDeDadosDB2.PegarCaminhoTemplate: string;
begin
  Exit(inherited PegarCaminhoTemplate + 'DB2\');
end;

initialization
  RegisterForm(TfrmCadastroAcaoConfigurarBaseDeDadosDB2);

end.

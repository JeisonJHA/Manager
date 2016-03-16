unit Cadastro.Acao.Configurar.BaseDeDados.Oracle;

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
  cxDBLookupEdit, cxDBLookupComboBox, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadastroAcaoConfigurarBaseDeDadosOracle = class(TfrmCadastroAcaoConfigurarBaseDeDados)
  private
    { Private declarations }
  protected
    function PegarCaminhoTemplate: string; override;
  public
    { Public declarations }
  end;

var
  frmCadastroAcaoConfigurarBaseDeDadosOracle: TfrmCadastroAcaoConfigurarBaseDeDadosOracle;

implementation

{$R *.dfm}

uses Formulario.Utils;

{ TfrmCadastroAcaoConfigurarBaseDeDadosOracle }

function TfrmCadastroAcaoConfigurarBaseDeDadosOracle.PegarCaminhoTemplate: string;
begin
  Exit(inherited PegarCaminhoTemplate + 'Oracle\');
end;

initialization
  RegisterForm(TfrmCadastroAcaoConfigurarBaseDeDadosOracle);

end.

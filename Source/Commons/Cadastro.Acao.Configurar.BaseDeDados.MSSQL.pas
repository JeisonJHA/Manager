unit Cadastro.Acao.Configurar.BaseDeDados.MSSQL;

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
  TfrmCadastroAcaoConfigurarBaseDeDadosMSSQL = class(TfrmCadastroAcaoConfigurarBaseDeDados)
    ioeMestreInstancia: TStringField;
    iosSelecionadorInstancia: TStringField;
  private
    { Private declarations }
  protected
    function PegarCaminhoTemplate: string; override;
  public
    { Public declarations }
  end;

var
  frmCadastroAcaoConfigurarBaseDeDadosMSSQL: TfrmCadastroAcaoConfigurarBaseDeDadosMSSQL;

implementation

{$R *.dfm}

{ TfrmCadastroAcaoConfigurarBaseDeDadosMSSQL }

function TfrmCadastroAcaoConfigurarBaseDeDadosMSSQL.PegarCaminhoTemplate: string;
begin
  Exit(inherited PegarCaminhoTemplate + 'MSSQL\');
end;

end.

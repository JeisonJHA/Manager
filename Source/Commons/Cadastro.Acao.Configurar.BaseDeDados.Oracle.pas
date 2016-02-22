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
  cxClasses, cxGridCustomView, cxGrid, cxPC, Vcl.ExtCtrls;

type
  TfrmCadastroAcaoConfigurarBaseDeDadosOracle = class(TfrmCadastroAcaoConfigurarBaseDeDados)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroAcaoConfigurarBaseDeDadosOracle: TfrmCadastroAcaoConfigurarBaseDeDadosOracle;

implementation

{$R *.dfm}

end.

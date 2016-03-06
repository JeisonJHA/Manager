unit Cadastro.Acao.Catalogo.Bases;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro.Acao.Executar, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  InstantPresentation, System.Actions, Vcl.ActnList, cxCheckBox, cxDBEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, Vcl.StdCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxPC, Vcl.ExtCtrls;

type
  TfrmCadastroAcaoCatalogoBases = class(TfrmCadastroAcaoExecutar)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroAcaoCatalogoBases: TfrmCadastroAcaoCatalogoBases;

implementation

{$R *.dfm}

uses Formulario.Utils;

initialization
  RegisterForm(TfrmCadastroAcaoCatalogoBases);

end.

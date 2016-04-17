unit Manager.Core.Forms.Cadastro.Acao.Exclusao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro.Acao.Executar, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinscxPCPainter, dxBarBuiltInMenu, Data.DB, cxContainer, cxEdit,
  InstantPresentation, System.Actions, Vcl.ActnList, cxCheckBox, cxDBEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, cxPC, Vcl.ExtCtrls;

type
  TfrmCadastroAcaoExclusao = class(TfrmCadastroAcaoExecutar)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroAcaoExclusao: TfrmCadastroAcaoExclusao;

implementation

uses Manager.Core.Forms.Utils;

{$R *.dfm}

initialization
  RegisterForm(TfrmCadastroAcaoExclusao);

end.

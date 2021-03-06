unit Cadastro.Acao.Executar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro.Acao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, InstantPresentation,
  System.Actions, Vcl.ActnList, cxTextEdit, cxDBEdit, Vcl.StdCtrls, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, cxMaskEdit, cxSpinEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxImageComboBox, cxCheckBox, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadastroAcaoExecutar = class(TfrmCadastroAcao)
    Label4: TLabel;
    Label2: TLabel;
    iosSelecionadorAplicativo: TStringField;
    iosSelecionadorParametros: TStringField;
    ioeMestreAplicativo: TStringField;
    ioeMestreParametros: TStringField;
    ioeMestreSelf: TIntegerField;
    cbxAplicativo: TcxDBComboBox;
    iosSelecionadorIsAdmin: TBooleanField;
    chkIsAdmin: TcxDBCheckBox;
    cbxParametros: TcxDBComboBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroAcaoExecutar: TfrmCadastroAcaoExecutar;

implementation

{$R *.dfm}

uses Manager.Core.Forms.Utils;

procedure TfrmCadastroAcaoExecutar.FormShow(Sender: TObject);
begin
  inherited;
  CarregarChaves(cbxAplicativo);
  CarregarChaves(cbxParametros);
end;

initialization
  RegisterForm(TfrmCadastroAcaoExecutar);

end.

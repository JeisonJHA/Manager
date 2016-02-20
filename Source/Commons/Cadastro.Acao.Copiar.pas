unit Cadastro.Acao.Copiar;

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
  cxDropDownEdit, cxImageComboBox;

type
  TfrmCadastroAcaoCopiar = class(TfrmCadastroAcao)
    Label2: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label3: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    iosSelecionadorDestino: TStringField;
    iosSelecionadorOrigem: TStringField;
    ioeMestreDestino: TStringField;
    ioeMestreOrigem: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroAcaoCopiar: TfrmCadastroAcaoCopiar;

implementation

{$R *.dfm}

end.

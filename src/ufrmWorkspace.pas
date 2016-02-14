unit ufrmWorkspace;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvPageList,
  JvNavigationPane, JvComponentBase, dxSkinsCore, dxSkinsdxBarPainter,
  cxClasses, dxBar, Data.DB, dxBarExtDBItems, Vcl.ActnList;

type
  TfrmWorkspace = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    btnSpSQL: TdxBarButton;
    dxBarLookupCombo1: TdxBarLookupCombo;
    DataSource1: TDataSource;
    barAmbiente: TdxBar;
    btnMontarAmbiente: TdxBarSubItem;
    btnExecutarApp: TdxBarSubItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarAmbientes;
    procedure CarregarAplicativos;
    procedure OnExecutarAmbienteClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmWorkspace: TfrmWorkspace;

implementation

{$R *.dfm}

uses uspmDados, ZDataset;

procedure TfrmWorkspace.OnExecutarAmbienteClick(Sender: TObject);
begin

end;

procedure TfrmWorkspace.CarregarAmbientes;
var
  Qry: TZQuery;
  BIL: TdxBarItemLink;
begin
  Qry := TZQuery.Create(nil);
  try
    Qry.Connection := dmDados.dmConexao;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT A.* FROM CADAMBIENTE A');
    Qry.Open;

    Qry.First;
    while not Qry.Eof do
    begin
      BIL := btnMontarAmbiente.ItemLinks.Add;
      BIL.Item := TdxBarButton.Create(dxBarManager1);
      BIL.Item.OnClick := OnExecutarAmbienteClick;
      BIL.Item.Tag := Qry.FieldByName('CDAMBIENTE').AsInteger;
      BIL.Item.Caption := Qry.FieldByName('DEAMBIENTE').AsString;
      BIL.Item.ImageIndex := 8;
      BIL.Item.Category := dxBarManager1.Categories.IndexOf('Default');

      Qry.Next;
    end;

  finally
    FreeAndNil(Qry);
  end;
end;

procedure TfrmWorkspace.CarregarAplicativos;
var
  Qry: TZQuery;
  BIL: TdxBarItemLink;
begin
  Qry := TZQuery.Create(nil);
  try
    Qry.Connection := dmDados.dmConexao;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT AP.* FROM CADAPLICACOES AP WHERE FLWORKSPACE = :FLWORKSPACE');
    Qry.ParamByName('FLWORKSPACE').AsString := 'S';
    Qry.Open;

    Qry.First;
    while not Qry.Eof do
    begin
      BIL := btnExecutarApp.ItemLinks.Add;
      BIL.Item := TdxBarButton.Create(dxBarManager1);
      BIL.Item.OnClick := OnExecutarAmbienteClick;
      BIL.Item.Tag := Qry.FieldByName('CDAPLICACOES').AsInteger;
      BIL.Item.Caption := Qry.FieldByName('DEAPLICACOES').AsString;
      BIL.Item.ImageIndex := 8;
      BIL.Item.Category := dxBarManager1.Categories.IndexOf('Default');

      Qry.Next;
    end;

  finally
    FreeAndNil(Qry);
  end;
end;

procedure TfrmWorkspace.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmWorkspace.FormShow(Sender: TObject);
begin
  CarregarAmbientes;
  CarregarAplicativos;
end;

end.

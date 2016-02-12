unit uspmFormCadPadrao;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, uspmFormPadrao,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, JvTransparentButton, Vcl.ExtCtrls,
  Data.DB, Vcl.DBGrids, JvDBGrid, JvLabel, JvDBControls, ZAbstractRODataset,
  ZDataset, Vcl.Grids, JvExDBGrids, Vcl.ImgList, JvExControls, JvButton;

type
  TspmFormCadPadrao = class(TspmFormPadrao)
    pcFormCadPadrao: TPageControl;
    tsGrid: TTabSheet;
    tsDados: TTabSheet;
    dsFormCadPadrao: TDataSource;
    grGrid: TJvDBGrid;
    btIncluir: TJvTransparentButton;
    btAlterar: TJvTransparentButton;
    btSalvar: TJvTransparentButton;
    btCancelar: TJvTransparentButton;
    btExcluir: TJvTransparentButton;
    acIncluir: TAction;
    acAlterar: TAction;
    acSalvar: TAction;
    acCancelar: TAction;
    acExcluir: TAction;
    pnPesquisa: TPanel;
    pnContador: TPanel;
    lbValorRegistros: TJvDBStatusLabel;
    lbTituloRegistros: TJvLabel;
    procedure acIncluirExecute(Sender: TObject);
    procedure acAlterarExecute(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grGridTitleClick(Column: TColumn);
  private
    procedure DefinirHabilitacaoAcoes(pbIncluir, pbAlterar, pbSalvar, pbCancelar, pbExcluir: boolean);
    procedure DefinirPagina(pnIndice: Integer);
  protected
    FoFormulario: TForm;
  end;

var
  spmFormCadPadrao: TspmFormCadPadrao;

const
  nPAGINA_GRID = 0;
  nPAGINA_DADOS = 1;

implementation

{$R *.dfm}

uses
  uspmFuncoes;

procedure TspmFormCadPadrao.FormDestroy(Sender: TObject);
begin
  try
    try
      inherited;

      Self.FoFormulario := nil;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmFormCadPadrao.FormShow(Sender: TObject);
begin
  try
    try
      inherited;

      Self.DefinirPagina(nPAGINA_GRID);
      Self.DefinirHabilitacaoAcoes(true, not dsFormCadPadrao.DataSet.IsEmpty, false, false, not dsFormCadPadrao.DataSet.IsEmpty);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmFormCadPadrao.grGridTitleClick(Column: TColumn);
begin
  try
    try
      TZQuery(Self.dsFormCadPadrao.DataSet).IndexFieldNames := Column.FieldName;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmFormCadPadrao.DefinirHabilitacaoAcoes(pbIncluir, pbAlterar, pbSalvar, pbCancelar, pbExcluir: boolean);
begin
  try
    try
      Self.acIncluir.Enabled := pbIncluir;
      Self.acAlterar.Enabled := pbAlterar;
      Self.acSalvar.Enabled := pbSalvar;
      Self.acCancelar.Enabled := pbCancelar;
      Self.acExcluir.Enabled := pbExcluir;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmFormCadPadrao.DefinirPagina(pnIndice: Integer);
begin
  try
    try
      Self.pcFormCadPadrao.ActivePageIndex := pnIndice;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmFormCadPadrao.acIncluirExecute(Sender: TObject);
begin
  try
    try
      inherited;

      Self.DefinirPagina(nPAGINA_DADOS);
      Self.DefinirHabilitacaoAcoes(false, false, true, true, false);

      Self.dsFormCadPadrao.DataSet.Append;
    except
      on E: Exception do
      begin
        Self.DefinirPagina(nPAGINA_GRID);
        Self.DefinirHabilitacaoAcoes(true, not dsFormCadPadrao.DataSet.IsEmpty, false, false, not dsFormCadPadrao.DataSet.IsEmpty);

        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmFormCadPadrao.acAlterarExecute(Sender: TObject);
begin
  try
    try
      inherited;

      if Self.dsFormCadPadrao.DataSet.IsEmpty then
      begin
        Exit;
      end;

      Self.DefinirPagina(nPAGINA_DADOS);
      Self.DefinirHabilitacaoAcoes(false, false, true, true, false);

      Self.dsFormCadPadrao.DataSet.Edit;
    except
      on E: Exception do
      begin
        Self.DefinirPagina(nPAGINA_GRID);
        Self.DefinirHabilitacaoAcoes(true, not dsFormCadPadrao.DataSet.IsEmpty, false, false, not dsFormCadPadrao.DataSet.IsEmpty);

        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmFormCadPadrao.acSalvarExecute(Sender: TObject);
begin
  try
    try
      uspmFuncoes.ValidarCampoObrigatorioSalvamento(Self.FoFormulario);

      inherited;

      Self.dsFormCadPadrao.DataSet.Post;
      Self.dsFormCadPadrao.DataSet.Refresh;

      Self.DefinirPagina(nPAGINA_GRID);
      Self.DefinirHabilitacaoAcoes(true, not dsFormCadPadrao.DataSet.IsEmpty, false, false, not dsFormCadPadrao.DataSet.IsEmpty);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmFormCadPadrao.acCancelarExecute(Sender: TObject);
begin
  try
    try
      inherited;

      Self.dsFormCadPadrao.DataSet.Cancel;

      Self.DefinirPagina(nPAGINA_GRID);
      Self.DefinirHabilitacaoAcoes(true, not dsFormCadPadrao.DataSet.IsEmpty, false, false, not dsFormCadPadrao.DataSet.IsEmpty);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmFormCadPadrao.acExcluirExecute(Sender: TObject);
begin
  try
    try
      inherited;

      Self.dsFormCadPadrao.DataSet.Delete;

      Self.DefinirPagina(nPAGINA_GRID);
      Self.DefinirHabilitacaoAcoes(true, not dsFormCadPadrao.DataSet.IsEmpty, false, false, not dsFormCadPadrao.DataSet.IsEmpty);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

end.


unit uspmFormCfgPadrao;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, uspmFormPadrao,
  System.Actions, Vcl.ActnList, JvTransparentButton, Vcl.ExtCtrls, Data.DB,
  Vcl.ImgList, Vcl.ComCtrls, JvExControls, JvButton;

type
  TspmFormCfgPadrao = class(TspmFormPadrao)
    btAlterar: TJvTransparentButton;
    btSalvar: TJvTransparentButton;
    btCancelar: TJvTransparentButton;
    dsFormCfgPadrao: TDataSource;
    acAlterar: TAction;
    acSalvar: TAction;
    acCancelar: TAction;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acAlterarExecute(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
  private
    procedure DefinirHabilitacaoAcoes(pbAlterar, pbSalvar, pbCancelar: boolean);
  protected
    FoFormulario: TForm;
  end;

var
  spmFormCfgPadrao: TspmFormCfgPadrao;

implementation

{$R *.dfm}

uses
  uspmFuncoes;

procedure TspmFormCfgPadrao.acAlterarExecute(Sender: TObject);
begin
  try
    try
      inherited;

      if Self.dsFormCfgPadrao.DataSet.IsEmpty then
      begin
        Self.dsFormCfgPadrao.DataSet.Insert;
      end
      else
      begin
        Self.dsFormCfgPadrao.DataSet.Edit;
      end;

      Self.pnFormPadrao.Enabled := true;
      Self.DefinirHabilitacaoAcoes(false, true, true);
    except
      on E: Exception do
      begin
        Self.pnFormPadrao.Enabled := false;
        Self.DefinirHabilitacaoAcoes(true, false, false);

        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmFormCfgPadrao.acCancelarExecute(Sender: TObject);
begin
  try
    try
      inherited;

      Self.dsFormCfgPadrao.DataSet.Cancel;

      Self.pnFormPadrao.Enabled := false;
      Self.DefinirHabilitacaoAcoes(true, false, false);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmFormCfgPadrao.acSalvarExecute(Sender: TObject);
begin
  try
    try
      uspmFuncoes.ValidarCampoObrigatorioSalvamento(Self.FoFormulario);

      inherited;

      Self.dsFormCfgPadrao.DataSet.Post;
      Self.dsFormCfgPadrao.DataSet.Refresh;

      Self.pnFormPadrao.Enabled := false;
      Self.DefinirHabilitacaoAcoes(true, false, false);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmFormCfgPadrao.DefinirHabilitacaoAcoes(pbAlterar, pbSalvar, pbCancelar: boolean);
begin
  try
    try
      Self.acAlterar.Enabled := pbAlterar;
      Self.acSalvar.Enabled := pbSalvar;
      Self.acCancelar.Enabled := pbCancelar;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmFormCfgPadrao.FormDestroy(Sender: TObject);
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

procedure TspmFormCfgPadrao.FormShow(Sender: TObject);
begin
  try
    try
      inherited;

      Self.DefinirHabilitacaoAcoes(true, false, false);
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


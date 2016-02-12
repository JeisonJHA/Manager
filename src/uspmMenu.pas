unit uspmMenu;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList,
  Vcl.Menus, Vcl.AppEvnts, Vcl.ComCtrls, Vcl.ExtCtrls, JvComputerInfoEx, JvMenus,
  JvTrayIcon, uspmFrameArvoreWorkSpace, uspmFrameBarraBotoes, JvComponentBase,
  Vcl.ImgList, System.Actions, Vcl.ToolWin, uspmForm;

type
  TfrmMenu = class(TspmForm)
    mmMenu: TMainMenu;
    Sistema1: TMenuItem;
    alMenu: TActionList;
    acSair: TAction;
    Sair1: TMenuItem;
    Sair2: TMenuItem;
    Cadastro1: TMenuItem;
    acCadBaseDados: TAction;
    BasedeDados1: TMenuItem;
    aeMenu: TApplicationEvents;
    sbMenu: TStatusBar;
    pnBotoes: TPanel;
    acCadSistemas: TAction;
    Sistemas1: TMenuItem;
    acCadAplicacoes: TAction;
    Aplicacoes: TMenuItem;
    acAcaoPadrao: TAction;
    imMenu16: TImageList;
    imMenu32: TImageList;
    acCfgManager: TAction;
    Configurao1: TMenuItem;
    N1: TMenuItem;
    ieMenu: TJvComputerInfoEx;
    tiMenu: TJvTrayIcon;
    pmMenu: TJvPopupMenu;
    spmFrameArvoreWorkSpace: TspmFrameArvoreWorkSpace;
    tbMenu: TToolBar;
    btSair: TToolButton;
    spmFrameBarraBotoes: TspmFrameBarraBotoes;
    procedure aeMenuException(Sender: TObject; E: Exception);
    procedure acCadBaseDadosExecute(Sender: TObject);
    procedure acCadSistemasExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acCadAplicacoesExecute(Sender: TObject);
    procedure acSairExecute(Sender: TObject);
    procedure acCfgManagerExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure PassarParametro(const psParametro: string; const pvValor: variant); override;
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

uses
  uspmCadBaseDados, uspmCadSistemas, uspmCadAplicacoes, uspmCfgManager,
  uspmFuncoes;

procedure TfrmMenu.acCadAplicacoesExecute(Sender: TObject);
begin
  uspmFuncoes.AbrirFormulario(Self, TspmCadAplicacoes, spmCadAplicacoes);
end;

procedure TfrmMenu.acCadBaseDadosExecute(Sender: TObject);
begin
  uspmFuncoes.AbrirFormulario(Self, TspmCadBaseDados, spmCadBaseDados);
end;

procedure TfrmMenu.acCadSistemasExecute(Sender: TObject);
begin
  uspmFuncoes.AbrirFormulario(Self, TspmCadSistemas, spmCadSistemas);
end;

procedure TfrmMenu.acCfgManagerExecute(Sender: TObject);
begin
  uspmFuncoes.AbrirFormulario(Self, TspmCfgManager, spmCfgManager);
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
  try
    try
      Self.sbMenu.Panels[0].Text := 'Vers�o: ' + PegarVersaoAplicacao;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TfrmMenu.FormShow(Sender: TObject);
begin
  try
    try
      Self.WindowState := wsMaximized;

      Self.spmFrameBarraBotoes.InicializarBarraBotoes;
      Self.spmFrameArvoreWorkSpace.InicializarArvoreWorkSpace;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TfrmMenu.PassarParametro(const psParametro: string; const pvValor: variant);
begin
  try
    try
      if psParametro = 'prmATUALIZAR_APLICACOES' then
      begin
        Self.spmFrameBarraBotoes.InicializarBarraBotoes;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TfrmMenu.acSairExecute(Sender: TObject);
begin
  try
    try
      Application.Terminate;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TfrmMenu.aeMenuException(Sender: TObject; E: Exception);
begin
  try
    try
      ShowMessage(E.Message);
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


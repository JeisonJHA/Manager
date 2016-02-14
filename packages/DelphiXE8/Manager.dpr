program Manager;

uses
  Vcl.Forms,
  ufrmPrincipal in '..\..\src\ufrmPrincipal.pas' {frmPrincipal},
  uspmCadAplicacoes in '..\..\src\uspmCadAplicacoes.pas' {spmCadAplicacoes},
  uspmCadBaseDados in '..\..\src\uspmCadBaseDados.pas' {spmCadBaseDados},
  uspmCadSistemas in '..\..\src\uspmCadSistemas.pas' {spmCadSistemas},
  uspmCfgManager in '..\..\src\uspmCfgManager.pas' {spmCfgManager},
  uspmConstantes in '..\..\src\uspmConstantes.pas',
  uspmControleArquivoIni in '..\..\src\uspmControleArquivoIni.pas',
  uspmForm in '..\..\src\uspmForm.pas' {spmForm},
  uspmFormCadPadrao in '..\..\src\uspmFormCadPadrao.pas' {spmFormCadPadrao},
  uspmFormCfgPadrao in '..\..\src\uspmFormCfgPadrao.pas' {spmFormCfgPadrao},
  uspmFormPadrao in '..\..\src\uspmFormPadrao.pas' {spmFormPadrao},
  uspmFrameArvoreWorkSpace in '..\..\src\uspmFrameArvoreWorkSpace.pas' {spmFrameArvoreWorkSpace: TFrame},
  uspmFrameBarraBotoes in '..\..\src\uspmFrameBarraBotoes.pas' {spmFrameBarraBotoes: TFrame},
  uspmFuncoes in '..\..\src\uspmFuncoes.pas',
  uspmMenu in '..\..\src\uspmMenu.pas' {frmMenu},
  uspmRegrasMenuAcoesExecutaveis in '..\..\src\uspmRegrasMenuAcoesExecutaveis.pas',
  uspmDados in '..\..\src\uspmDados.pas' {dmDados: TDataModule},
  ufrmConfigDatabase in '..\..\src\ufrmConfigDatabase.pas' {frmConfigDatabase},
  ufrmWorkspace in '..\..\src\ufrmWorkspace.pas' {frmWorkspace},
  AplicacaoAction in '..\..\src\AplicacaoAction.pas',
  ufrmRGBToColor in '..\..\src\ufrmRGBToColor.pas' {frmRGBToColor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.

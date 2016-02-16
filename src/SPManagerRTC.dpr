program SPManagerRTC;

uses
  Vcl.Forms,
  Vcl.Dialogs,
  Winapi.Windows,
  System.SysUtils,
  uspmMenu in 'uspmMenu.pas' {frmMenu},
  uspmDados in 'uspmDados.pas' {dmDados: TDataModule},
  uspmFormPadrao in 'uspmFormPadrao.pas' {spmFormPadrao},
  uspmFormCadPadrao in 'uspmFormCadPadrao.pas' {spmFormCadPadrao},
  uspmFormCfgPadrao in 'uspmFormCfgPadrao.pas' {spmFormCfgPadrao},
  uspmCadBaseDados in 'uspmCadBaseDados.pas' {spmCadBaseDados},
  uspmCadSistemas in 'uspmCadSistemas.pas' {spmCadSistemas},
  uspmCadAplicacoes in 'uspmCadAplicacoes.pas' {spmCadAplicacoes},
  uspmCfgManager in 'uspmCfgManager.pas' {spmCfgManager},
  uspmConstantes in 'uspmConstantes.pas',
  uspmFuncoes in 'uspmFuncoes.pas',
  uspmFrameArvoreWorkSpace in 'uspmFrameArvoreWorkSpace.pas' {spmFrameArvoreWorkSpace: TFrame},
  uspmFrameBarraBotoes in 'uspmFrameBarraBotoes.pas' {spmFrameBarraBotoes: TFrame},
  uspmForm in 'uspmForm.pas' {spmForm},
  Workspace.Utils in 'models\Workspace.Utils.pas',
  Workspace.Config in 'models\Workspace.Config.pas',
  Workspace in 'models\Workspace.pas';

{$R *.res}

var
  hMutex: integer;
begin
  hMutex := CreateMutex(nil, True, 'SPManagerRTC');
  try
    if (WaitForSingleObject(hMutex, 0) = WAIT_OBJECT_0) then
    begin
      Application.Initialize;
      Application.MainFormOnTaskbar := True;
      Application.Title := 'SPManagerRTC';
      try
        try
          Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
        except
          on E: Exception do
          begin
            ShowMessage('Não foi possível abrir o sistema: ' + E.Message);
            Application.Terminate;
          end;
        end;
      finally
        Application.Terminate;
      end;
    end;
  finally
    ReleaseMutex(hMutex);
  end;
  CloseHandle(hMutex);
end.


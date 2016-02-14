program SPManagerRTC;

uses
  Vcl.Forms,
  Vcl.Dialogs,
  Winapi.Windows,
  System.SysUtils,
  uspmMenu in '..\..\src\uspmMenu.pas' {frmMenu},
  uspmDados in '..\..\src\uspmDados.pas' {dmDados: TDataModule},
  uspmFormPadrao in '..\..\src\uspmFormPadrao.pas' {spmFormPadrao},
  uspmFormCadPadrao in '..\..\src\uspmFormCadPadrao.pas' {spmFormCadPadrao},
  uspmFormCfgPadrao in '..\..\src\uspmFormCfgPadrao.pas' {spmFormCfgPadrao},
  uspmCadBaseDados in '..\..\src\uspmCadBaseDados.pas' {spmCadBaseDados},
  uspmCadSistemas in '..\..\src\uspmCadSistemas.pas' {spmCadSistemas},
  uspmCadAplicacoes in '..\..\src\uspmCadAplicacoes.pas' {spmCadAplicacoes},
  uspmCfgManager in '..\..\src\uspmCfgManager.pas' {spmCfgManager},
  uspmConstantes in '..\..\src\uspmConstantes.pas',
  uspmFuncoes in '..\..\src\uspmFuncoes.pas',
  uspmFrameArvoreWorkSpace in '..\..\src\uspmFrameArvoreWorkSpace.pas' {spmFrameArvoreWorkSpace: TFrame},
  uspmFrameBarraBotoes in '..\..\src\uspmFrameBarraBotoes.pas' {spmFrameBarraBotoes: TFrame},
  uspmForm in '..\..\src\uspmForm.pas' {spmForm},
  Configuracao in '..\..\src\models\Configuracao.pas';

{$R *.res}
{$R *.mdr} {Configuracao}

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



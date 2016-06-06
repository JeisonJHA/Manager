program ManagerTest;

uses
  SysUtils,
  Vcl.Forms,
  ShellApi,
  Messages,
  Windows,
  Manager.Source.Forms.Main in '..\..\Source\Forms\Manager.Source.Forms.Main.pas' {frmMain},
  Manager.Source.Core.Host in '..\..\Source\Core\Manager.Source.Core.Host.pas',
  Manager.Source.Core.Host.Tester in '..\..\Source\Core\Manager.Source.Core.Host.Tester.pas',
  Manager.Source.Core.Intf.Host in '..\..\Source\Core\Manager.Source.Core.Intf.Host.pas',
  Manager.Source.Core.HostLayout in '..\..\Source\Core\Manager.Source.Core.HostLayout.pas',
  Manager.Source.Core.HostLayout.Tester in '..\..\Source\Core\Manager.Source.Core.HostLayout.Tester.pas',
  Manager.Source.Core.Intf.HostLayout in '..\..\Source\Core\Manager.Source.Core.Intf.HostLayout.pas',
  Manager.Source.Consts in '..\..\Source\Tester\Manager.Source.Consts.pas',
  Manager.Source.Core.AplicationHelper in '..\..\Source\Core\Manager.Source.Core.AplicationHelper.pas',
  Manager.Source.Core.IDE in '..\..\Source\Core\Manager.Source.Core.IDE.pas',
  Manager.Source.Core.Intf.BasicItem in '..\..\Source\Core\Manager.Source.Core.Intf.BasicItem.pas',
  Manager.Source.Forms.Splash in '..\..\Source\Forms\Manager.Source.Forms.Splash.pas' {frmSplash},
  Manager.Source.Forms.Modelo in '..\..\Source\Forms\Manager.Source.Forms.Modelo.pas' {frmModelo},
  Manager.Source.Core.IDE.Update in '..\..\Source\Core\Manager.Source.Core.IDE.Update.pas',
  Manager.Source.Core.IDE.Consts in '..\..\Source\Core\Manager.Source.Core.IDE.Consts.pas',
  Manager.Source.Core.Config in '..\..\Source\Core\Manager.Source.Core.Config.pas',
  Manager.Source.Core.Messages in '..\..\Source\Core\Manager.Source.Core.Messages.pas',
  Manager.Source.Forms.DataModule.Database in '..\..\Source\Forms\Manager.Source.Forms.DataModule.Database.pas' {dtmDatabase: TDataModule},
  Manager.Source.Forms.DataModule.Resources in '..\..\Source\Forms\Manager.Source.Forms.DataModule.Resources.pas' {dtmResources: TDataModule},
  Manager.Source.Core.Intf.Observer in '..\..\Source\Core\Manager.Source.Core.Intf.Observer.pas',
  Manager.Source.Core.Intf.Workspace in '..\..\Source\Core\Manager.Source.Core.Intf.Workspace.pas',
  Acao in '..\..\Source\Models\Acao.pas',
  AcaoCatalogoDeBases in '..\..\Source\Models\AcaoCatalogoDeBases.pas',
  AcaoConjuntoDeBases in '..\..\Source\Models\AcaoConjuntoDeBases.pas',
  AcaoExclusao in '..\..\Source\Models\AcaoExclusao.pas',
  BarraFerramenta in '..\..\Source\Models\BarraFerramenta.pas',
  Sistema in '..\..\Source\Models\Sistema.pas',
  Workspace in '..\..\Source\Models\Workspace.pas',
  Manager.Source.Core.ParserControl in '..\..\Source\Core\Manager.Source.Core.ParserControl.pas',
  Manager.Source.Core.Intf.Parser in '..\..\Source\Core\Manager.Source.Core.Intf.Parser.pas',
  Manager.Source.Core.FormUtils in '..\..\Source\Core\Manager.Source.Core.FormUtils.pas',
  Manager.Source.Core.Parser.Aplicacao in '..\..\Source\Core\Manager.Source.Core.Parser.Aplicacao.pas',
  Manager.Source.Core.Parser in '..\..\Source\Core\Manager.Source.Core.Parser.pas',
  Manager.Source.Core.Parser.Workspace in '..\..\Source\Core\Manager.Source.Core.Parser.Workspace.pas',
  Cadastro.Acao.Catalogo.Bases in '..\..\Source\Forms\Cadastro\Cadastro.Acao.Catalogo.Bases.pas' {frmCadastroAcaoCatalogoBases},
  Cadastro.Acao.Configurar.BaseDeDados.DB2 in '..\..\Source\Forms\Cadastro\Cadastro.Acao.Configurar.BaseDeDados.DB2.pas' {frmCadastroAcaoConfigurarBaseDeDadosDB2},
  Cadastro.Acao.Configurar.BaseDeDados.MSSQL in '..\..\Source\Forms\Cadastro\Cadastro.Acao.Configurar.BaseDeDados.MSSQL.pas' {frmCadastroAcaoConfigurarBaseDeDadosMSSQL},
  Cadastro.Acao.Configurar.BaseDeDados.Oracle in '..\..\Source\Forms\Cadastro\Cadastro.Acao.Configurar.BaseDeDados.Oracle.pas' {frmCadastroAcaoConfigurarBaseDeDadosOracle},
  Cadastro.Acao.Configurar.BaseDeDados in '..\..\Source\Forms\Cadastro\Cadastro.Acao.Configurar.BaseDeDados.pas' {frmCadastroAcaoConfigurarBaseDeDados},
  Cadastro.Acao.Conjunto.Bases in '..\..\Source\Forms\Cadastro\Cadastro.Acao.Conjunto.Bases.pas' {frmCadastroAcaoConjuntoBases},
  Cadastro.Acao.Copiar in '..\..\Source\Forms\Cadastro\Cadastro.Acao.Copiar.pas' {frmCadastroAcaoCopiar},
  Cadastro.Acao.Executar in '..\..\Source\Forms\Cadastro\Cadastro.Acao.Executar.pas' {frmCadastroAcaoExecutar},
  Cadastro.Acao.MontarAmbiente in '..\..\Source\Forms\Cadastro\Cadastro.Acao.MontarAmbiente.pas' {frmCadastroAcaoMontarAmbiente},
  Cadastro.Acao in '..\..\Source\Forms\Cadastro\Cadastro.Acao.pas' {frmCadastroAcao},
  Cadastro.Barra.Ferramentas in '..\..\Source\Forms\Cadastro\Cadastro.Barra.Ferramentas.pas' {frmCadastroBarraFerramentas},
  Cadastro.Modelo in '..\..\Source\Forms\Cadastro\Cadastro.Modelo.pas' {frmCadastroModelo},
  Cadastro.Paginado.Mestre.Detalhe.Modelo in '..\..\Source\Forms\Cadastro\Cadastro.Paginado.Mestre.Detalhe.Modelo.pas' {frmCadastroPaginadoMestreDetalheModelo},
  Cadastro.Paginado.Modelo in '..\..\Source\Forms\Cadastro\Cadastro.Paginado.Modelo.pas' {frmCadastroPaginadoModelo},
  Cadastro.Sistema in '..\..\Source\Forms\Cadastro\Cadastro.Sistema.pas' {frmCadastroSistema},
  Manager.Core.Forms.Cadastro.Acao.Exclusao in '..\..\Source\Forms\Cadastro\Manager.Core.Forms.Cadastro.Acao.Exclusao.pas' {frmCadastroAcaoExclusao},
  Manager.Source.Forms.Opcoes in '..\..\Source\Forms\Manager.Source.Forms.Opcoes.pas' {frmOpcoes},
  Manager.Source.Forms.Selecao in '..\..\Source\Forms\Manager.Source.Forms.Selecao.pas' {frmSelecao},
  Manager.Source.Core.InstantSelectorHelper in '..\..\Source\Core\Manager.Source.Core.InstantSelectorHelper.pas';

{$R *.res}

begin
  CreateMutex(nil, False, APP_GUID);
  if GetLastError = ERROR_ALREADY_EXISTS Then
  begin
    SendMessage(HWND_BROADCAST,
    RegisterWindowMessage(APP_GUID),0,0);
    Halt(0);
  end;

  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdtmDatabase, dtmDatabase);
  Application.CreateForm(TdtmResources, dtmResources);
  Application.CreateForm(TfrmMain, frmMain);
  Application.IDE.Parser.Registrar(TParserAplicacao.Create);
  Application.IDE.Parser.Registrar(TParserWorkspace.Create);
  Application.IDE.Initialize.Add(dtmDatabase);
  Application.IDE.Initialize.Add(Application.IDE.Update);
  Application.IDE.Initialize.Add(TManagerHostTester.Create(Application.MainForm));
  Application.IDE.ExecuteInitialization;
  Application.Run;
end.
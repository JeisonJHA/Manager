program Manager;

uses
  ShellApi,
  Messages,
  Vcl.Forms,
  Windows,
  SysUtils,
  udtmDatabase in '..\..\Source\Commons\udtmDatabase.pas' {dtmDatabase: TDataModule},
  IDE.Workspace in '..\..\Source\Commons\IDE.Workspace.pas' {frmWorkspace},
  Workspace.Action in '..\..\Source\Commons\Workspace.Action.pas',
  Workspace.Config in '..\..\Source\Commons\Workspace.Config.pas',
  Workspace.Utils in '..\..\Source\Commons\Workspace.Utils.pas',
  Workspace.Constantes in '..\..\Source\Commons\Workspace.Constantes.pas',
  Ambiente in '..\..\Source\Models\Ambiente.pas',
  Acao in '..\..\Source\Models\Acao.pas',
  Formulario.Modelo in '..\..\Source\Commons\Formulario.Modelo.pas' {frmModelo},
  Cadastro.Modelo in '..\..\Source\Commons\Cadastro.Modelo.pas' {frmCadastroModelo},
  Gerenciamento.Modelo in '..\..\Source\Commons\Gerenciamento.Modelo.pas' {frmGerenciamentoModelo},
  BarraFerramenta in '..\..\Source\Models\BarraFerramenta.pas',
  Cadastro.Paginado.Mestre.Detalhe.Modelo in '..\..\Source\Commons\Cadastro.Paginado.Mestre.Detalhe.Modelo.pas' {frmCadastroPaginadoMestreDetalheModelo},
  Cadastro.Barra.Ferramentas in '..\..\Source\Commons\Cadastro.Barra.Ferramentas.pas' {frmCadastroBarraFerramentas},
  Cadastro.Acao in '..\..\Source\Commons\Cadastro.Acao.pas' {frmCadastroAcao},
  Cadastro.Acao.Executar in '..\..\Source\Commons\Cadastro.Acao.Executar.pas' {frmCadastroAcaoExecutar},
  Cadastro.Acao.Copiar in '..\..\Source\Commons\Cadastro.Acao.Copiar.pas' {frmCadastroAcaoCopiar},
  IDE.Controller.MainMenu in '..\..\Source\Controllers\IDE.Controller.MainMenu.pas',
  Sistema in '..\..\Source\Models\Sistema.pas',
  Cadastro.Sistema in '..\..\Source\Commons\Cadastro.Sistema.pas' {frmCadastroSistema},
  IDE.Utils in '..\..\Source\Commons\IDE.Utils.pas',
  Workspace in '..\..\Source\Models\Workspace.pas',
  ufrmPrincipal in '..\..\Source\Commons\ufrmPrincipal.pas' {frmPrincipal},
  IDE.Aplicacao in '..\..\Source\Commons\IDE.Aplicacao.pas',
  IDE.Controller.Parser in '..\..\Source\Controllers\IDE.Controller.Parser.pas',
  IDE.IParser in '..\..\Source\Commons\IDE.IParser.pas',
  IDE.Parser.Workspace in '..\..\Source\Commons\IDE.Parser.Workspace.pas',
  IDE.IWorkspace in '..\..\Source\Commons\IDE.IWorkspace.pas',
  IDE.Parser.Aplicacao in '..\..\Source\Commons\IDE.Parser.Aplicacao.pas',
  IDE.Parser in '..\..\Source\Commons\IDE.Parser.pas',
  Cadastro.Acao.Configurar.BaseDeDados in '..\..\Source\Commons\Cadastro.Acao.Configurar.BaseDeDados.pas' {frmCadastroAcaoConfigurarBaseDeDados},
  Cadastro.Acao.Conjunto.Bases in '..\..\Source\Commons\Cadastro.Acao.Conjunto.Bases.pas' {frmCadastroAcaoConjuntoBases},
  Cadastro.Acao.Configurar.BaseDeDados.Oracle in '..\..\Source\Commons\Cadastro.Acao.Configurar.BaseDeDados.Oracle.pas' {frmCadastroAcaoConfigurarBaseDeDadosOracle},
  Cadastro.Acao.Configurar.BaseDeDados.DB2 in '..\..\Source\Commons\Cadastro.Acao.Configurar.BaseDeDados.DB2.pas' {frmCadastroAcaoConfigurarBaseDeDadosDB2},
  Cadastro.Acao.Configurar.BaseDeDados.MSSQL in '..\..\Source\Commons\Cadastro.Acao.Configurar.BaseDeDados.MSSQL.pas' {frmCadastroAcaoConfigurarBaseDeDadosMSSQL},
  Cadastro.Paginado.Modelo in '..\..\Source\Commons\Cadastro.Paginado.Modelo.pas' {frmCadastroPaginadoModelo},
  Acao.Controller in '..\..\Source\Controllers\Acao.Controller.pas',
  Formulario.Escolha in '..\..\Source\Commons\Formulario.Escolha.pas' {frmFormularioEscolha},
  Cadastro.SCM in '..\..\Source\Commons\Cadastro.SCM.pas' {frmCadastroSCM},
  ActiveDs_TLB in '..\..\Source\Commons\ActiveDs_TLB.pas',
  adshlp in '..\..\Source\Commons\adshlp.pas',
  IDE.IBarraFerramenta in '..\..\Source\Commons\IDE.IBarraFerramenta.pas',
  AcaoConjuntoDeBases in '..\..\Source\Models\AcaoConjuntoDeBases.pas',
  Cadastro.Acao.MontarAmbiente in '..\..\Source\Commons\Cadastro.Acao.MontarAmbiente.pas' {frmCadastroAcaoMontarAmbiente},
  Configuracao.Inicial in '..\..\Source\Commons\Configuracao.Inicial.pas' {frmConfiguracaoInicial},
  AcaoCatalogoDeBases in '..\..\Source\Models\AcaoCatalogoDeBases.pas',
  Cadastro.Acao.Catalogo.Bases in '..\..\Source\Commons\Cadastro.Acao.Catalogo.Bases.pas' {frmCadastroAcaoCatalogoBases},
  AcaoExclusao in '..\..\Source\Models\AcaoExclusao.pas',
  DosCommand in '..\..\Source\Commons\DosCommand.pas',
  Manager.PromptCommand in '..\..\Source\Commons\Manager.PromptCommand.pas',
  IDE.Inicializador in '..\..\Source\Commons\IDE.Inicializador.pas',
  IDE.Inicializador.Intf in '..\..\Source\Commons\IDE.Inicializador.Intf.pas',
  IDE.Update in '..\..\Source\Commons\IDE.Update.pas',
  Updater.Core in '..\..\third-part\Updater\Source\Updater.Core.pas',
  Updater.HttpDownload in '..\..\third-part\Updater\Source\Updater.HttpDownload.pas',
  IDE.Criptografia in '..\..\Source\Commons\IDE.Criptografia.pas',
  IDE.Forms.Splash in '..\..\Source\Commons\IDE.Forms.Splash.pas' {frmSplash};

{$R *.res}
{$R *.mdr} {Acao,
            AcaoCatalogoDeBases,
            AcaoConjuntoDeBases,
            AcaoExclusao,
            Ambiente,
            BarraFerramenta,
            Sistema,
            Workspace}

var
  Instancia: THandle;

begin
  Instancia := CreateMutex(nil, false, '{21A25300-6171-4137-B570-13A291665FF5}');
  if WaitForSingleObject(Instancia, 0) = wait_Timeout then
  begin
    Application.MessageBox('Atenção o programa já está aberto!','Atenção',MB_ICONINFORMATION);
    if not IsWindowVisible(Instancia) then
      ShowWindow(Instancia, SW_RESTORE);
    Exit;
  end;
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Manager';
  Application.Inicializador.Registrar(TUpdate.Create);
  Application.Inicializar;
  Application.CreateForm(TdtmDatabase, dtmDatabase);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Parser.Registrar(TIDEParserWorkspace.Create);
  Application.Parser.Registrar(TIDEParserAplicacao.Create);
  Application.Run;
end.

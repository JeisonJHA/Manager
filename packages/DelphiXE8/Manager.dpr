program Manager;

uses
  ShellApi,
  Messages,
  Vcl.Forms,
  Windows,
  SysUtils,
  udtmDatabase in '..\..\Source\Old\Commons\udtmDatabase.pas' {dtmDatabase: TDataModule},
  Formulario.Workspace in '..\..\Source\Old\Commons\Formulario.Workspace.pas' {frmWorkspace},
  Manager.Core.Workspace.Action in '..\..\Source\Core\Manager.Core.Workspace.Action.pas',
  Manager.Core.Configuration in '..\..\Source\Core\Manager.Core.Configuration.pas',
  Manager.Core.Workspace.List in '..\..\Source\Core\Manager.Core.Workspace.List.pas',
  Workspace.Constantes in '..\..\Source\Old\Commons\Workspace.Constantes.pas',
  Ambiente in '..\..\Source\Models\Ambiente.pas',
  Acao in '..\..\Source\Models\Acao.pas',
  Manager.Core.Forms.Modelo in '..\..\Source\Core\Forms\Manager.Core.Forms.Modelo.pas' {frmModelo},
  Cadastro.Modelo in '..\..\Source\Old\Commons\Cadastro.Modelo.pas' {frmCadastroModelo},
  Gerenciamento.Modelo in '..\..\Source\Old\Commons\Gerenciamento.Modelo.pas' {frmGerenciamentoModelo},
  BarraFerramenta in '..\..\Source\Models\BarraFerramenta.pas',
  Cadastro.Paginado.Mestre.Detalhe.Modelo in '..\..\Source\Old\Commons\Cadastro.Paginado.Mestre.Detalhe.Modelo.pas' {frmCadastroPaginadoMestreDetalheModelo},
  Cadastro.Barra.Ferramentas in '..\..\Source\Old\Commons\Cadastro.Barra.Ferramentas.pas' {frmCadastroBarraFerramentas},
  Cadastro.Acao in '..\..\Source\Old\Commons\Cadastro.Acao.pas' {frmCadastroAcao},
  Cadastro.Acao.Executar in '..\..\Source\Old\Commons\Cadastro.Acao.Executar.pas' {frmCadastroAcaoExecutar},
  Cadastro.Acao.Copiar in '..\..\Source\Old\Commons\Cadastro.Acao.Copiar.pas' {frmCadastroAcaoCopiar},
  IDE.Controller.MainMenu in '..\..\Source\Old\Controllers\IDE.Controller.MainMenu.pas',
  Sistema in '..\..\Source\Models\Sistema.pas',
  Cadastro.Sistema in '..\..\Source\Old\Commons\Cadastro.Sistema.pas' {frmCadastroSistema},
  IDE.Utils in '..\..\Source\Old\Commons\IDE.Utils.pas',
  Workspace in '..\..\Source\Models\Workspace.pas',
  ufrmPrincipal in '..\..\Source\Old\Commons\ufrmPrincipal.pas' {frmPrincipal},
  IDE.Aplicacao in '..\..\Source\Old\Commons\IDE.Aplicacao.pas',
  IDE.Controller.Parser in '..\..\Source\Old\Controllers\IDE.Controller.Parser.pas',
  Manager.Core.API.Parser in '..\..\Source\Core\API\Manager.Core.API.Parser.pas',
  Manager.Core.Parser.Workspace in '..\..\Source\Core\Parser\Manager.Core.Parser.Workspace.pas',
  IDE.IWorkspace in '..\..\Source\Old\Commons\IDE.IWorkspace.pas',
  Manager.Core.Parser.Aplicacao in '..\..\Source\Core\Parser\Manager.Core.Parser.Aplicacao.pas',
  Manager.Core.Parser in '..\..\Source\Core\Manager.Core.Parser.pas',
  Cadastro.Acao.Configurar.BaseDeDados in '..\..\Source\Old\Commons\Cadastro.Acao.Configurar.BaseDeDados.pas' {frmCadastroAcaoConfigurarBaseDeDados},
  Cadastro.Acao.Conjunto.Bases in '..\..\Source\Old\Commons\Cadastro.Acao.Conjunto.Bases.pas' {frmCadastroAcaoConjuntoBases},
  Cadastro.Acao.Configurar.BaseDeDados.Oracle in '..\..\Source\Old\Commons\Cadastro.Acao.Configurar.BaseDeDados.Oracle.pas' {frmCadastroAcaoConfigurarBaseDeDadosOracle},
  Cadastro.Acao.Configurar.BaseDeDados.DB2 in '..\..\Source\Old\Commons\Cadastro.Acao.Configurar.BaseDeDados.DB2.pas' {frmCadastroAcaoConfigurarBaseDeDadosDB2},
  Cadastro.Acao.Configurar.BaseDeDados.MSSQL in '..\..\Source\Old\Commons\Cadastro.Acao.Configurar.BaseDeDados.MSSQL.pas' {frmCadastroAcaoConfigurarBaseDeDadosMSSQL},
  Cadastro.Paginado.Modelo in '..\..\Source\Old\Commons\Cadastro.Paginado.Modelo.pas' {frmCadastroPaginadoModelo},
  Acao.Controller in '..\..\Source\Old\Controllers\Acao.Controller.pas',
  Formulario.Escolha in '..\..\Source\Old\Commons\Formulario.Escolha.pas' {frmFormularioEscolha},
  ActiveDs_TLB in '..\..\Source\Old\Commons\ActiveDs_TLB.pas',
  adshlp in '..\..\Source\Old\Commons\adshlp.pas',
  IDE.IBarraFerramenta in '..\..\Source\Old\Commons\IDE.IBarraFerramenta.pas',
  AcaoConjuntoDeBases in '..\..\Source\Models\AcaoConjuntoDeBases.pas',
  Cadastro.Acao.MontarAmbiente in '..\..\Source\Old\Commons\Cadastro.Acao.MontarAmbiente.pas' {frmCadastroAcaoMontarAmbiente},
  Configuracao.Inicial in '..\..\Source\Old\Commons\Configuracao.Inicial.pas' {frmConfiguracaoInicial},
  AcaoCatalogoDeBases in '..\..\Source\Models\AcaoCatalogoDeBases.pas',
  Cadastro.Acao.Catalogo.Bases in '..\..\Source\Old\Commons\Cadastro.Acao.Catalogo.Bases.pas' {frmCadastroAcaoCatalogoBases},
  AcaoExclusao in '..\..\Source\Models\AcaoExclusao.pas',
  DosCommand in '..\..\Source\Old\Commons\DosCommand.pas',
  Manager.PromptCommand in '..\..\Source\Old\Commons\Manager.PromptCommand.pas',
  IDE.Inicializador in '..\..\Source\Old\Commons\IDE.Inicializador.pas',
  IDE.Inicializador.Intf in '..\..\Source\Old\Commons\IDE.Inicializador.Intf.pas',
  IDE.Update in '..\..\Source\Old\Commons\IDE.Update.pas',
  IDE.Forms.Splash in '..\..\Source\Old\Commons\IDE.Forms.Splash.pas' {frmSplash},
  IDE.Criptografia in '..\..\Source\Old\Commons\IDE.Criptografia.pas',
  Updater.Core in '..\..\third-part\Updater\Source\Updater.Core.pas',
  Updater.HttpDownload in '..\..\third-part\Updater\Source\Updater.HttpDownload.pas',
  Formulario.Opcoes in '..\..\Source\Old\Commons\Formulario.Opcoes.pas' {frmFormularioOpcoes},
  Manager.Core.Forms.Utils in '..\..\Source\Core\Manager.Core.Forms.Utils.pas',
  Manager.Core.Workspace.Recentes in '..\..\Source\Core\Manager.Core.Workspace.Recentes.pas',
  Manager.Core.IDE in '..\..\Source\Core\Manager.Core.IDE.pas',
  Manager.Core.API.Main in '..\..\Source\Core\API\Manager.Core.API.Main.pas',
  Manager.Core.API.Workspace in '..\..\Source\Core\API\Manager.Core.API.Workspace.pas',
  Manager.Core.Forms.Main in '..\..\Source\Core\Forms\Manager.Core.Forms.Main.pas' {frmMain},
  Manager.Core.Forms.Workspace in '..\..\Source\Core\Forms\Manager.Core.Forms.Workspace.pas' {frmWorkspace2},
  Manager.Core.MainMenu in '..\..\Source\Core\Manager.Core.MainMenu.pas',
  Manager.Core.Controller.Main in '..\..\Source\Core\Manager.Core.Controller.Main.pas',
  Manager.Core.API.Observer in '..\..\Source\Core\API\Manager.Core.API.Observer.pas',
  Manager.Core.Application.Notify in '..\..\Source\Core\Manager.Core.Application.Notify.pas';

{$R *.res}
{$R *.mdr} {Acao,
            AcaoCatalogoDeBases,
            AcaoConjuntoDeBases,
            AcaoExclusao,
            Ambiente,
            BarraFerramenta,
            Sistema,
            Workspace}

begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Manager';
  Application.CreateForm(TdtmDatabase, dtmDatabase);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

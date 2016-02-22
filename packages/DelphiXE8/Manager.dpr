program Manager;

uses
  Vcl.Forms,
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
  Cadastro.Acao.MontarAmbiente in '..\..\Source\Commons\Cadastro.Acao.MontarAmbiente.pas' {frmCadastroAcaoMontarAmbiente},
  Cadastro.Acao.Configurar.BaseDeDados.Oracle in '..\..\Source\Commons\Cadastro.Acao.Configurar.BaseDeDados.Oracle.pas' {frmCadastroAcaoConfigurarBaseDeDadosOracle},
  Cadastro.Acao.Configurar.BaseDeDados.DB2 in '..\..\Source\Commons\Cadastro.Acao.Configurar.BaseDeDados.DB2.pas' {frmCadastroAcaoConfigurarBaseDeDadosDB2},
  Cadastro.Acao.Configurar.BaseDeDados.MSSQL in '..\..\Source\Commons\Cadastro.Acao.Configurar.BaseDeDados.MSSQL.pas' {frmCadastroAcaoConfigurarBaseDeDadosMSSQL},
  Cadastro.Paginado.Modelo in '..\..\Source\Commons\Cadastro.Paginado.Modelo.pas' {frmCadastroPaginadoModelo},
  Acao.Controller in '..\..\Source\Controllers\Acao.Controller.pas',
  Formulario.Escolha in '..\..\Source\Commons\Formulario.Escolha.pas' {frmFormularioEscolha};

{$R *.res}
{$R *.mdr} {Acao,
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
  Application.CreateForm(TdtmDatabase, dtmDatabase);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Parser.Registrar(TIDEParserWorkspace.Create);
  Application.Parser.Registrar(TIDEParserAplicacao.Create);
  Application.Run;
end.

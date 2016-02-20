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
  Catalogo in '..\..\Source\Models\Catalogo.pas',
  Acao in '..\..\Source\Models\Acao.pas',
  Formulario.Modelo in '..\..\Source\Commons\Formulario.Modelo.pas' {frmModelo},
  Cadastro.Modelo in '..\..\Source\Commons\Cadastro.Modelo.pas' {frmCadastroModelo},
  Gerenciamento.Modelo in '..\..\Source\Commons\Gerenciamento.Modelo.pas' {frmGerenciamentoModelo},
  Cadastro.Paginado.Modelo in '..\..\Source\Commons\Cadastro.Paginado.Modelo.pas' {frmCadastroPaginadoModelo},
  BarraFerramenta in '..\..\Source\Models\BarraFerramenta.pas',
  Cadastro.Paginado.Mestre.Detalhe.Modelo in '..\..\Source\Commons\Cadastro.Paginado.Mestre.Detalhe.Modelo.pas' {frmCadastroPaginadoMestreDetalheModelo},
  Cadastro.Barra.Ferramentas in '..\..\Source\Commons\Cadastro.Barra.Ferramentas.pas' {frmCadastroBarraFerramentas},
  Cadastro.Acao in '..\..\Source\Commons\Cadastro.Acao.pas' {frmCadastroAcao},
  Cadastro.Acao.Executar in '..\..\Source\Commons\Cadastro.Acao.Executar.pas' {frmCadastroAcaoExecutar},
  Cadastro.Acao.Copiar in '..\..\Source\Commons\Cadastro.Acao.Copiar.pas' {frmCadastroAcaoCopiar},
  IDE.Controller.MainMenu in '..\..\Source\Controllers\IDE.Controller.MainMenu.pas',
  Sistema in '..\..\Source\Models\Sistema.pas',
  Cadastro.Sistema in '..\..\Source\Commons\Cadastro.Sistema.pas' {frmCadastroSistema},
  BancoDeDados in '..\..\Source\Models\BancoDeDados.pas',
  Cadastro.BancoDeDados in '..\..\Source\Commons\Cadastro.BancoDeDados.pas' {frmCadastroBancoDeDados},
  Cadastro.BancoDeDados.Oracle in '..\..\Source\Commons\Cadastro.BancoDeDados.Oracle.pas' {frmCadastroBancoDeDadosOracle},
  Cadastro.BancoDeDados.DB2 in '..\..\Source\Commons\Cadastro.BancoDeDados.DB2.pas' {frmCadastroBancoDeDadosDB2},
  Cadastro.BancoDeDados.MSSQL in '..\..\Source\Commons\Cadastro.BancoDeDados.MSSQL.pas' {frmCadastroBancoDeDadosMSSQL},
  IDE.Utils in '..\..\Source\Commons\IDE.Utils.pas',
  Workspace in '..\..\Source\Models\Workspace.pas',
  ufrmPrincipal in '..\..\Source\Commons\ufrmPrincipal.pas' {frmPrincipal};

{$R *.res}
{$R *.mdr} {Acao,
            Ambiente,
            BancoDeDados,
            BarraFerramenta,
            Catalogo,
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
  Application.Run;
end.

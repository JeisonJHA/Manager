unit IDE.Workspace;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, IDE.Aplicacao, IniFiles,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvPageList,
  JvNavigationPane, JvComponentBase, dxSkinsCore, dxSkinsdxBarPainter,
  cxClasses, dxBar, Data.DB, dxBarExtDBItems, Vcl.ActnList, Workspace,
  System.Actions, IDE.IWorkspace, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxCustomTileControl, dxTileControl,
  InstantPresentation, Vcl.StdCtrls, Acao, dxGDIPlusClasses;

type
  TfrmWorkspace = class(TForm, IWorkspace)
    dxBarManager1: TdxBarManager;
    btnSpSQL: TdxBarButton;
    dxBarLookupCombo1: TdxBarLookupCombo;
    DataSource1: TDataSource;
    btnMontarAmbiente: TdxBarSubItem;
    btnExecutarApp: TdxBarSubItem;
    ActionList1: TActionList;
    dxTileControl1: TdxTileControl;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FSandbox: TWorkspace;
    function Parser(const ATexto: string): string;
    procedure Inicializar;
    function PrepararTitulo(const ATexto: string): string;
    procedure BaseDeDadosClick(Sender: TdxTileControlItem);
    function EncontrarConfiguracaoBase(const AAlias,
      AServer: string): TAcaoConfigurarBaseDeDados;
    function BuscarAcao(AAcao: TAcao): TAcao;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ASandbox: TWorkspace); overload;
    function Sandbox: TWorkspace;
  end;

var
  frmWorkspace: TfrmWorkspace;

implementation

{$R *.dfm}

uses udtmDatabase, Workspace.Action, Winapi.ShellApi,
  Workspace.Constantes, Sistema, Workspace.Config,
  Cadastro.Acao.Configurar.BaseDeDados.MSSQL, AcaoConjuntoDeBases, LbCipher,
  LbProc, LbString, LbUtils, IDE.Criptografia;

type
  TSandboxesRecentes = class(TStringList)
  private
    FArquivo: string;
  public
    constructor Create;
    procedure Salvar();
  end;

const
  BoxColors: array [0 .. 3] of TColor = (
    $0050C282, $009A572B, $00B0279C, $004E43F7
  );

function TfrmWorkspace.Parser(const ATexto: string): string;
begin
  Exit(StringReplace(ATexto, '{WS_DIR}', FSandbox.Diretorio, [rfReplaceAll]));
end;

function TfrmWorkspace.Sandbox: TWorkspace;
begin
  Exit(FSandbox);
end;

function TfrmWorkspace.BuscarAcao(AAcao: TAcao): TAcao;
begin
  if AAcao.InheritsFrom(TAcaoConfigurarBaseDeDadosDB2) then
    Exit(TAcaoConfigurarBaseDeDadosDB2.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoConfigurarBaseDeDadosOracle) then
    Exit(TAcaoConfigurarBaseDeDadosOracle.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoConfigurarBaseDeDadosMSSQL) then
    Exit(TAcaoConfigurarBaseDeDadosMSSQL.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoConfigurarBaseDeDados) then
    Exit(TAcaoConfigurarBaseDeDados.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoMontarAmbiente) then
    Exit(TAcaoMontarAmbiente.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoConjuntoDeBases) then
    Exit(TAcaoConjuntoDeBases.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoCopiar) then
    Exit(TAcaoCopiar.Retrieve(AAcao.Id));

  if AAcao.InheritsFrom(TAcaoExecutar) then
    Exit(TAcaoExecutar.Retrieve(AAcao.Id));

  Exit(TAcao.Retrieve(AAcao.Id));
end;

function TfrmWorkspace.EncontrarConfiguracaoBase(const AAlias: string; const AServer: string): TAcaoConfigurarBaseDeDados;
begin
  with TInstantSelector.Create(nil) do
  try
    Connector := dtmDatabase.InstantIBXConnector1;
    Command.Text := Format('SELECT * FROM ANY %s WHERE Alias = %s AND Server = %s', ['TAcaoConfigurarBaseDeDados',
      QuotedStr(AAlias), QuotedStr(AServer)]);
    Open;

    if IsEmpty then
      Exit(nil);

    Exit(BuscarAcao(TAcao(CurrentObject)) as TAcaoConfigurarBaseDeDados);
  finally
    Free;
  end;
end;

procedure TfrmWorkspace.BaseDeDadosClick(Sender: TdxTileControlItem);
var
  dbconfig: TAcaoConfigurarBaseDeDados;
  config: TWorkspaceConfig;
  aplicativo: string;
  paramentro: string;
begin
  dbconfig := EncontrarConfiguracaoBase(Sender.Text1.Value, Sender.Text4.Value);

  if not Assigned(dbconfig) then
  begin
    Exit;
  end;

  config :=  TWorkspaceConfig.Create(nil);
  try
    aplicativo := config.SpSQL.Trim;

    if Trim(aplicativo).IsEmpty then
    begin
      Exit;
    end;

    if not FileExists(aplicativo) then
    begin
      Exit;
    end;

    paramentro := Format('%s %s %s %s', [dbconfig.TipoBanco, dbconfig.Alias, dbconfig.DBUsuario, CriptografaPalavra(dbconfig.DBSenha)]);

    if dbconfig.InheritsFrom(TAcaoConfigurarBaseDeDadosMSSQL) then
    begin
      paramentro := Format('SQLSERVER %s:%s %s %s', [dbconfig.Server, dbconfig.Alias, dbconfig.DBUsuario, CriptografaPalavra(dbconfig.DBSenha)]);
    end;

    if ShellExecute(Handle, 'open', PChar(aplicativo), PChar(paramentro), nil, SW_SHOWNORMAL) <= 32 then
    begin
      ShowMessage(SysErrorMessage(GetLastError));
    end;
  finally
    FreeAndNil(config);
  end;
end;

constructor TfrmWorkspace.Create(AOwner: TComponent; ASandbox: TWorkspace);
begin
  inherited Create(AOwner);
  FSandbox := ASandbox;
  Caption := PrepararTitulo(ASandbox.Descricao);
end;

function TfrmWorkspace.PrepararTitulo(const ATexto: string): string;
var
  texto: string;
  sistemas: TInstantSelector;
  I: integer;
begin
  texto := StringReplace(ATexto, '_', ' ', [rfReplaceAll]);
  with TInstantSelector.Create(nil) do
  begin
    Connector := dtmDatabase.InstantIBXConnector1;
    Command.Text := 'SELECT * FROM TSistema';
    Open;
    for I := 0 to Pred(ObjectCount) do
      texto := StringReplace(texto, TSistema(Objects[I]).NomeDiretorio + '-',
        ' ', [rfReplaceAll]);
    Free;
  end;
  texto := StringReplace(texto, '-', ' ', [rfReplaceAll]);
  Exit(texto);
end;

procedure TfrmWorkspace.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmWorkspace.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  sandboxes: TSandboxesRecentes;
begin
  sandboxes := TSandboxesRecentes.Create;
  try
    sandboxes.Delete(sandboxes.IndexOf(Sandbox.Descricao));
    sandboxes.Salvar;
  finally
    FreeAndNil(sandboxes);
  end;
end;

procedure TfrmWorkspace.FormShow(Sender: TObject);
var
  sandboxes: TSandboxesRecentes;
begin
  sandboxes := TSandboxesRecentes.Create;
  try
    sandboxes.Add(Sandbox.Descricao);
    sandboxes.Salvar;
  finally
    FreeAndNil(sandboxes);
  end;
  Inicializar;
end;

procedure TfrmWorkspace.Inicializar;
var
  arquivos: TStrings;
  path: string;
  I: integer;
  ini: TIniFile;

  grupo: TdxTileControlGroup;
  item: TdxTileControlItem;
  sorteio: integer;
begin
  dxTileControl1.Title.Text :=
    PrepararTitulo(Sandbox.Descricao);

  arquivos := TStringList.Create;
  try
    arquivos.Delimiter := ';';
    arquivos.DelimitedText := Application.Configuracoes.Sandbox.ArquivosIni;

    if arquivos.Count <= 0  then
      Exit;

    grupo := dxTileControl1.Groups.Add;
    grupo.Caption.Text := 'Banco de Dados';

    for I := 0 to arquivos.Count - 1 do
    begin
      path := Application.Parser.ParserText(Sandbox, arquivos.Strings[I]);
      if not FileExists(path) then
        Continue;

      ini := TIniFile.Create(path);
      try
        Randomize;
        item := dxTileControl1.Items.Add;
        item.GroupIndex := grupo.Index;
        item.Size := tcisExtraLarge;
        item.Glyph.ImageIndex := 0;
        item.Text1.Value := ini.ReadString('Database', 'Alias', String.Empty);
        item.Text1.Font.Size := 16;
        item.Text4.Value := ini.ReadString('Database', 'Server', String.Empty);
        item.Style.GradientBeginColor := BoxColors[1];
        item.OnClick := BaseDeDadosClick;
        // grupo.Add(item);

        // grupo.Add(TdxTileControl.Create(dxTileControl1));
      finally
        FreeAndNil(ini);
      end;
    end;

    if grupo.ItemCount <= 0 then
      dxTileControl1.RemoveGroup(grupo);


  finally
    FreeAndNil(arquivos);
  end;
end;

{ TSandboxesRecentes }

constructor TSandboxesRecentes.Create;
begin
  inherited;
  FArquivo := ExtractFilePath(Application.ExeName) + 'sandbox.list';
  if FileExists(FArquivo) then
    LoadFromFile(FArquivo);
end;

procedure TSandboxesRecentes.Salvar;
begin
  SaveToFile(FArquivo);
end;

end.

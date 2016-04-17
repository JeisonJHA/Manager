unit Manager.Core.Forms.Workspace.Controller;

interface

uses Forms, Classes, SysUtils, Manager.Core.Ribbon.MainMenu, Manager.Core.IDE,
  Manager.Core.Workspace.List, Manager.Core.Configuration,
  InstantPresentation, Vcl.ActnList, dxBar, Workspace, dxTabbedMDI,
  Manager.Core.API.Workspace, Manager.Core.Workspace.Recentes,
  Manager.Core.API.Observer, Dialogs, IniFiles, dxCustomTileControl, dxTileControl,
  Acao, Winapi.ShellApi, Winapi.Windows, Winapi.Messages,
  Manager.Core.Utils, Manager.Core.IDE.Constants;

type
  TWorkspaceController = class(TInterfacedObject, IObserver)
  private
    FForm: TForm;
    function EncontrarConfiguracaoBase(const AAlias,
      AServer: string): TAcaoConfigurarBaseDeDados;
    function BuscarAcao(AAcao: TAcao): TAcao;
    procedure OnBaseDeDadosClick(Sender: TdxTileControlItem);
    procedure ConfigurarItemsOfTile(AForm: TForm);
    procedure ConfigurarTitleOfTile(AWorkspace: IWorkspace;
      ATileControl: TdxTileControl);
    function CreateItemTile(AGroup: TdxTileControlGroup; const AAlias,
      AServer: string): TdxTileControlItem;
    procedure PrepareGroupDatabase;
  public
    constructor Create(AForm: TForm);
    procedure Prepare;
    procedure Update(Sender: TObject; ATipoAcao: TTipoAcao);
    procedure OnShow(Sender: TObject);
    procedure OnCreate(Sender: TObject);
  end;

implementation

uses Manager.Core.Forms.Workspace, udtmDatabase, Sistema, AcaoConjuntoDeBases;

  function ToWorkspaceForm(AForm: TForm): TfrmWorkspace2;
  begin
    Exit(TfrmWorkspace2(AForm));
  end;

{ TWorkspaceController }

constructor TWorkspaceController.Create(AForm: TForm);
begin
  FForm := AForm;
end;

procedure TWorkspaceController.OnCreate(Sender: TObject);
begin

end;

procedure TWorkspaceController.OnShow(Sender: TObject);
begin
  PrepareGroupDatabase;
end;

procedure TWorkspaceController.ConfigurarTitleOfTile(AWorkspace: IWorkspace; ATileControl: TdxTileControl);
var
  texto: string;
  sistemas: TInstantSelector;
  I: integer;
begin
  texto := StringReplace(AWorkspace.Sandbox.Descricao, '_', ' ', [rfReplaceAll]);
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
  ATileControl.Title.Text := texto;
  FForm.Caption := texto;
end;

procedure TWorkspaceController.ConfigurarItemsOfTile(AForm: TForm);
var
  arquivos: TStrings;
  path: string;
  I: integer;
  ini: TIniFile;

  grupo: TdxTileControlGroup;
  item: TdxTileControlItem;

  config: TConfiguration;
begin
  config := TConfiguration.Create(nil);
  arquivos := TStringList.Create;
  try
    arquivos.Delimiter := ';';
    arquivos.DelimitedText := config.Sandbox.ArquivosIni;

    if arquivos.Count <= 0  then
      Exit;

    if ToWorkspaceForm(AForm).dxTileControl1.Groups.Count > 0 then
      ToWorkspaceForm(AForm).dxTileControl1.Groups.Delete(0);

    grupo := ToWorkspaceForm(AForm).dxTileControl1.Groups.Add;
    grupo.Caption.Text := 'Banco de Dados';

    for I := 0 to arquivos.Count - 1 do
    begin
      path := Application.Parser.ParserText((AForm as IWorkspace).Sandbox, arquivos.Strings[I]);
      if not FileExists(path) then
        Continue;

      ini := TIniFile.Create(path);
      try
        item := CreateItemTile(grupo, ini.ReadString('Database', 'Alias',
          String.Empty), ini.ReadString('Database', 'Server', String.Empty));
      finally
        FreeAndNil(ini);
      end;
    end;

    if grupo.ItemCount <= 0 then
      ToWorkspaceForm(AForm).dxTileControl1.RemoveGroup(grupo);

  finally
    FreeAndNil(arquivos);
    FreeAndNil(config);
  end;
end;

function TWorkspaceController.CreateItemTile(AGroup: TdxTileControlGroup; const AAlias, AServer: string): TdxTileControlItem;
begin
  Result := ToWorkspaceForm(FForm).dxTileControl1.Items.Add;
  Result.GroupIndex := AGroup.Index;
  Result.Size := tcisExtraLarge;
  Result.Glyph.ImageIndex := 0;
  Result.Text1.Value := AAlias;
  Result.Text1.Font.Size := 16;
  Result.Text4.Value := AServer;
  Result.Style.GradientBeginColor := $009A572B;
  Result.OnClick := OnBaseDeDadosClick;
end;

procedure TWorkspaceController.Prepare;
var
  I: Integer;
begin
  for I := 0 to ToWorkspaceForm(FForm).dxTileControl1.Groups.Count -1 do
    ToWorkspaceForm(FForm).dxTileControl1.Groups.Delete(I);

  PrepareGroupDatabase;
end;

procedure TWorkspaceController.PrepareGroupDatabase;
var
  form: TfrmWorkspace2;
begin
  form := ToWorkspaceForm(FForm);

  ConfigurarTitleOfTile((form as IWorkspace), form.dxTileControl1);
  ConfigurarItemsOfTile(form);
end;

procedure TWorkspaceController.Update(Sender: TObject; ATipoAcao: TTipoAcao);
begin
  if (ATipoAcao in [taExecutar, taCopiar, taExcluir]) then
    Exit;

  Prepare;
end;

procedure TWorkspaceController.OnBaseDeDadosClick(Sender: TdxTileControlItem);
var
  dbconfig: TAcaoConfigurarBaseDeDados;
  config: TConfiguration;
  aplicativo: string;
  paramentro: string;
begin
  dbconfig := EncontrarConfiguracaoBase(Sender.Text1.Value, Sender.Text4.Value);

  if not Assigned(dbconfig) then
  begin
    Exit;
  end;

  config :=  TConfiguration.Create(nil);
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

    if ShellExecute(FForm.Handle, 'open', PChar(aplicativo), PChar(paramentro), nil, SW_SHOWNORMAL) <= 32 then
    begin
      ShowMessage(SysErrorMessage(GetLastError));
    end;
  finally
    FreeAndNil(config);
  end;
end;

function TWorkspaceController.EncontrarConfiguracaoBase(const AAlias: string; const AServer: string): TAcaoConfigurarBaseDeDados;
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

function TWorkspaceController.BuscarAcao(AAcao: TAcao): TAcao;
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

end.

unit uspmRegrasMenuListaWorkSpace;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList,
  Vcl.Menus, Vcl.ExtCtrls, Vcl.AppEvnts, Vcl.ComCtrls, Data.DB, Datasnap.DBClient,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.StdCtrls;

type
  TspmRegrasMenuListaWorkSpace = class
  public
    procedure MontarArvoreWorkSpace(var pcdsDados: TClientDataSet);
    procedure DefinirWorkSpacePadrao(const psDescricaoWS: string; const pnNuNivel: Integer; var poWSPadrao: TPanel);
  end;

implementation

{ TspmRegrasMenuListaWorkSpace }

uses
  usmpDados, uspmFuncoes, uspmConstantes;

procedure TspmRegrasMenuListaWorkSpace.DefinirWorkSpacePadrao(const psDescricaoWS: string; const pnNuNivel: Integer; var poWSPadrao: TPanel);
begin
  if not (pnNuNivel = nNIVEL_WORKSPACE) then
  begin
    Exit;
  end;

  try
    try
      dmDados.qrCfgManager.Edit;
      dmDados.qrCfgManagerDEWSPADRAO.Value := UpperCase(psDescricaoWS);
      dmDados.qrCfgManager.Post;
      dmDados.qrCfgManager.Refresh;

      poWSPadrao.Caption := psDescricaoWS;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;

end;

procedure TspmRegrasMenuListaWorkSpace.MontarArvoreWorkSpace(var pcdsDados: TClientDataSet);
var
  qrCloneSistema: TZQuery;
  slListaBranch: TStringList;
  slListaExec: TStringList;
  sPathArquivo: string;
  i: integer;
  j: integer;
  nCodigo: Integer;
  nCodigoSistema: Integer;
  nCodigoWorkSpace: Integer;
begin
  if dmDados.qrCadSistemas.IsEmpty then
  begin
    Exit;
  end;

  nCodigo := 0;

  qrCloneSistema := TZQuery.Create(nil);
  slListaBranch := TStringList.Create;
  slListaExec := TStringList.Create;
  try
    pcdsDados.EmptyDataSet;

    qrCloneSistema.Connection := dmDados.qrCadSistemas.Connection;
    qrCloneSistema.SQL.Text := dmDados.qrCadSistemas.SQL.Text;
    qrCloneSistema.IndexFieldNames := dmDados.qrCadSistemas.IndexFieldNames;
    qrCloneSistema.Open;

    qrCloneSistema.First;
    while not qrCloneSistema.Eof do
    begin
      slListaExec.CommaText := qrCloneSistema.FieldByName('DELISTAEXE').AsString + ',' + qrCloneSistema.FieldByName('DELISTAEXEPRO').AsString + ',' + qrCloneSistema.FieldByName('DELISTAEXESGC').AsString + ',' + qrCloneSistema.FieldByName('DELISTAEXEARC').AsString + ',' + qrCloneSistema.FieldByName('DELISTAEXEPSS').AsString;

      Inc(nCodigo);
      nCodigoSistema := nCodigo;

      pcdsDados.Append;
      pcdsDados.FieldByName('CODIGO').Value := nCodigoSistema;
      pcdsDados.FieldByName('CODIGOPAI').Value := 0;
      pcdsDados.FieldByName('DESCRICAO').Assign(qrCloneSistema.FieldByName('DESISTEMA'));
      pcdsDados.FieldByName('NUNIVEL').Value := nNIVEL_SISTEMA;
      pcdsDados.Post;

      uspmFuncoes.PegarListaDeDiretorios(dmDados.qrCfgManagerDEPATHREFER.Value + '\', slListaBranch);
      for i := 0 to slListaBranch.Count - 1 do
      begin
        if Pos(qrCloneSistema.FieldByName('DEDIRREFER').AsString, UpperCase(Trim(slListaBranch[i]))) > 0 then
        begin
          Inc(nCodigo);
          nCodigoWorkSpace := nCodigo;

          pcdsDados.Append;
          pcdsDados.FieldByName('CODIGO').Value := nCodigoWorkSpace;
          pcdsDados.FieldByName('CODIGOPAI').Value := nCodigoSistema;
          pcdsDados.FieldByName('DESCRICAO').Value := Trim(slListaBranch[i]);
          pcdsDados.FieldByName('NUNIVEL').Value := nNIVEL_WORKSPACE;
          pcdsDados.Post;

          for j := 0 to slListaExec.Count - 1 do
          begin
            if not (Trim(slListaExec[j]) = sSTRING_INDEFINIDO) then
            begin
              uspmFuncoes.LocalizarArquivo(dmDados.qrCfgManagerDEPATHREFER.Value + '\' + Trim(slListaBranch[i]) + '\bin', UpperCase(slListaExec[j]), sPathArquivo);

              if not (Trim(sPathArquivo) = sSTRING_INDEFINIDO) then
              begin
                Inc(nCodigo);
                pcdsDados.Append;
                pcdsDados.FieldByName('CODIGO').Value := nCodigo;
                pcdsDados.FieldByName('CODIGOPAI').Value := nCodigoWorkSpace;
                pcdsDados.FieldByName('DESCRICAO').Value := ChangeFileExt(UpperCase(slListaExec[j]), sSTRING_INDEFINIDO);
                pcdsDados.FieldByName('NUNIVEL').Value := nNIVEL_EXECUTAVEL;
                pcdsDados.FieldByName('DEPATH').AsString := sPathArquivo;
                pcdsDados.Post;
              end;
            end;
          end;
        end;
      end;

      qrCloneSistema.Next;
    end;
  finally
    FreeAndNil(slListaBranch);
    FreeAndNil(slListaExec);
    FreeAndNil(qrCloneSistema)
  end;
end;

end.


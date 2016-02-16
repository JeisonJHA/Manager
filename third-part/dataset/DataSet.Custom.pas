unit DataSet.Custom;

interface

uses Classes, SysUtils, Data.DB, Workspace;

type
  TRecInfo = record
    Bookmark: Longint;
    BookmarkFlag: TBookmarkFlag;
  end;
  PRecInfo = ^TRecInfo;

  TDataSetCustom = class(TDataset)
  protected
    FList: TWorkspaceList;
    procedure InternalPreOpen; override;
    procedure InternalClose; override;
    function InternalRecordCount: Integer; override;
    procedure InternalLoadCurrentRecord (Buffer: PChar); override;
  end;

  procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Hello', [TDataSetCustom]);
end;

{ TDataSetCustom }

procedure TDataSetCustom.InternalClose;
begin
  FreeAndNil(FList);
  inherited;
end;

procedure TDataSetCustom.InternalLoadCurrentRecord(Buffer: PChar);
begin
  inherited;
  PInteger (Buffer)^ := fCurrentRecord;
  with PMdRecInfo(Buffer + FRecordSize)^ do
  begin
    BookmarkFlag := bfCurrent;
    Bookmark := fCurrentRecord;
  end;
end;

procedure TDataSetCustom.InternalPreOpen;
begin
  inherited;
  FList := TWorkspaceList.Create;
end;

function TDataSetCustom.InternalRecordCount: Integer;
begin
  Exit(FList.Count);
end;

end.

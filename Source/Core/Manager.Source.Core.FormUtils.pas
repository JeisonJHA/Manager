unit Manager.Source.Core.FormUtils;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections, Vcl.Forms,
  Manager.Core.Forms.Modelo;

  procedure RegisterForm(AFormClass: TFormClass);
  procedure UnRegisterForm(AFormClass: TFormClass);
  function GetClass(AFormClassName: string): TFormClass;
  function CreateForm(const AFormClassName: string; AOwner: TComponent = nil): TForm;
  function CreateFormWithSubject(const AFormClassName: string; ASubject: TObject): TForm;
  function FormEstaCriado(AClass: TClass): Boolean;

implementation

type
  TFormModeloClass = class of TfrmModelo;

  TFactoryForm = class(TDictionary<string, TFormModeloClass>)
  private
    class var FInstance: TFactoryForm;
  public
    class function GetInstance: TFactoryForm;
    procedure RegisterForm(const AFormClass: TFormModeloClass);
    procedure UnRegisterForm(const AFormClass: TFormModeloClass);
  end;

{ TFactoryForm }

class function TFactoryForm.GetInstance: TFactoryForm;
begin
  if TFactoryForm.FInstance = nil then
    TFactoryForm.FInstance := TFactoryForm.Create;

  Exit(TFactoryForm.FInstance);
end;

procedure TFactoryForm.RegisterForm(const AFormClass: TFormModeloClass);
begin
  if Self.ContainsKey(AFormClass.ClassName) then
    Exit;

  Self.Add(AFormClass.ClassName, AFormClass);
end;

procedure TFactoryForm.UnRegisterForm(const AFormClass: TFormModeloClass);
begin
  if not Self.ContainsKey(AFormClass.ClassName) then
    Exit;

  Self.Remove(AFormClass.ClassName);
end;

procedure RegisterForm(AFormClass: TFormClass);
begin
  TFactoryForm.GetInstance().RegisterForm(TFormModeloClass(AFormClass));
end;

procedure UnRegisterForm(AFormClass: TFormClass);
begin
  TFactoryForm.GetInstance().UnRegisterForm(TFormModeloClass(AFormClass));
end;

function CreateForm(const AFormClassName: string; AOwner: TComponent): TForm;
begin
  Assert(TFactoryForm.GetInstance.ContainsKey(AFormClassName),'Formulário '+AFormClassName+' não encontrado!');
  Exit(TFactoryForm.GetInstance.Items[AFormClassName].Create(AOwner));
end;

function CreateFormWithSubject(const AFormClassName: string; ASubject: TObject): TForm;
begin
  Assert(TFactoryForm.GetInstance.ContainsKey(AFormClassName),'Formulário '+AFormClassName+' não encontrado!');
  Exit(TFactoryForm.GetInstance.Items[AFormClassName].Create(nil, ASubject));
end;

function GetClass(AFormClassName: string): TFormClass;
begin
  if TFactoryForm.GetInstance.ContainsKey(AFormClassName) then
    Exit(TFactoryForm.GetInstance.Items[AFormClassName]);

  Exit(nil);
end;

function FormEstaCriado(AClass: TClass): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Screen.FormCount -1 do begin
    if Screen.Forms[I] is AClass then begin
      Result := True;
      Break;
    end;
  end;
end;

initialization

finalization
  if Assigned(TFactoryForm.FInstance) then
    FreeAndNil(TFactoryForm.FInstance);

end.
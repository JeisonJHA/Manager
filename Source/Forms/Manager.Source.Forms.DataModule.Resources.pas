unit Manager.Source.Forms.DataModule.Resources;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls,
  cxGraphics;

type
  TdtmResources = class(TDataModule)
    SmallImageList: TcxImageList;
    MediumImageList: TcxImageList;
    LargeImageList: TcxImageList;
    XLargeImageList: TcxImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmResources: TdtmResources;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

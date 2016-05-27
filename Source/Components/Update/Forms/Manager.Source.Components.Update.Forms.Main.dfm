object FrmMain: TFrmMain
  Left = 629
  Top = 211
  BorderStyle = bsSingle
  Caption = 'Updater'
  ClientHeight = 162
  ClientWidth = 602
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    602
    162)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 18
    Top = 173
    Width = 19
    Height = 13
    Caption = 'URL'
  end
  object Label2: TLabel
    Left = 18
    Top = 221
    Width = 67
    Height = 13
    Caption = 'Output Folder'
  end
  object Label3: TLabel
    Left = 28
    Top = 317
    Width = 17
    Height = 13
    Caption = 'Log'
  end
  object LabelMsg: TLabel
    Left = 72
    Top = 29
    Width = 522
    Height = 57
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    ExplicitWidth = 512
  end
  object Label4: TLabel
    Left = 481
    Top = 175
    Width = 47
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Segments'
    ExplicitLeft = 471
  end
  object ImageUpdate: TImage
    Left = 18
    Top = 10
    Width = 32
    Height = 32
    Hint = 'Check for updates'
    AutoSize = True
    ParentShowHint = False
    Picture.Data = {
      0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000020
      000000200806000000737A7AF40000000467414D410000B18F0BFC6105000000
      097048597300000B1300000B1301009A9C180000033B494441545847B5965B4F
      135110C7FBE8DDEFE0F551E387C1E817F0C96065B7343191448D1A8C0F6A30D1
      6808028285DDA5B4451B95EE2EA02D9A2812880F8668F041B9A840EF2D8E674E
      0FA56C67BBDB36FE935FD2EC9C99393D3B67763C6E753E3E76C0A76B67655379
      E433D477ECF72A238F48A6B682CFD0269BEA195C2BDC9A973C3972DC672ADD2C
      49C6676AE00A5D4BFB0CEDB1AC0F1F1561EA57C7FBD13DB2A1DD66018B55095C
      22994A819DC82DEF9B67BB455877F29BEA319FAECC51411B816DE4933F163C22
      C2D7966C28A7D8912F53819A41D2B52569523B29D2D0E2FFFC3F24DF0237617B
      126DD1E85E37C7DE3B9F80543E075625D9B39EB938E95309BE0EB22644C1914E
      9524F35991B25A1BB92CE943D029D29654BA6AEEAADD49948F15BC1D3B5E05DE
      736A218593281F0A6C5A3C79FBCBC0C17A9A8C93281F0A495752ECE4F77BB0BD
      520BEC7012E56307ABBBD31EDEDB09A31D4EA27C6C3194071EFE61A18C363889
      F2B14557E2F80A5629E3CDE928BF56CD6A3D9781EB891755F1116C4CB8813C65
      44A7E2E6A608D3B80A9B45B83A15A98A8FB00DE46C37800C4C1B224CE3EA4FE8
      20C714323EDF001F2608237221D207F185CF2254FD9AFA320FDEB13E3236527A
      050E45E80DF6C0E2AF1511D2BDBEAD2E715F2A66192C42A76B28EB2A5C0E3F85
      541D0599CC66E012F3415F2A6619BC8638C391C60AA4F121B8170B8BF0B5F597
      71677C94F90C93B176A0AB2D5BC3669A5C5081373A00A19944294B0D8D7C780B
      17D95A2A4625D88A3B62817DFC7B800324B5C84A6BE809CC7EFF2A52556B6671
      015AC3BDA4AF15D6861FF2E4289C5EF113492DB422077B6179634DA4DCD6CFF5
      3F208D3814DD1638CA4FAA8745FA92707A25175B907505AE3D0F40BE5814A901
      7285025C890C721BE5634536B51B22EDB6700C67C659EB628AB65701E88A4560
      2D9D82DFA924DC1D0F41DBEB2172AD1576F73F76C4BA7789B43B85530A3607CA
      D10A16E5B9FEFB8C2E5745874886F2C33F317C48A4A385A3B3DB4DD403266F9F
      504E8834B5C54F824DAF54A046C06377FCE756E1E8CC9C3BDDDE0E1256ED5870
      B6EFDC8DF034B05D63E3209310F0798FDDF3AAABD68C7080C4190EFB377E44B0
      4E1839C1123E2BD9D49672877394C7F30FC6AF4BEE447B88290000000049454E
      44AE426082}
    ShowHint = True
    Transparent = True
  end
  object LabelLog: TLabel
    Left = 72
    Top = 10
    Width = 512
    Height = 13
    AutoSize = False
  end
  object Bevel1: TBevel
    Left = 19
    Top = 153
    Width = 575
    Height = 50
    Shape = bsTopLine
  end
  object MemoLog: TMemo
    Left = 17
    Top = 423
    Width = 577
    Height = 168
    Anchors = [akLeft, akTop, akRight]
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object EditURI: TEdit
    Left = 18
    Top = 194
    Width = 456
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
  end
  object EditOutPut: TEdit
    Left = 18
    Top = 242
    Width = 577
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Enabled = False
    TabOrder = 2
  end
  object BtnStart: TButton
    Left = 19
    Top = 122
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 3
    Visible = False
    OnClick = BtnStartClick
  end
  object LvSegments: TListView
    Left = 18
    Top = 269
    Width = 577
    Height = 148
    Anchors = [akLeft, akTop, akRight]
    Columns = <
      item
        Caption = 'Part #'
      end
      item
        Caption = 'Downloaded'
        Width = 100
      end
      item
        Caption = 'From'
        Width = 100
      end
      item
        Caption = 'To'
        Width = 100
      end
      item
        Caption = 'Progress'
        Width = 100
      end
      item
        Caption = 'Speed'
        Width = 100
      end>
    ReadOnly = True
    RowSelect = True
    TabOrder = 4
    ViewStyle = vsReport
  end
  object PbGeneral: TProgressBar
    Left = 19
    Top = 99
    Width = 575
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
  end
  object EditSegments: TEdit
    Left = 481
    Top = 194
    Width = 76
    Height = 21
    Anchors = [akTop, akRight]
    NumbersOnly = True
    TabOrder = 6
    Text = '10'
    OnExit = EditSegmentsExit
  end
  object BtnPause: TButton
    Left = 188
    Top = 122
    Width = 75
    Height = 25
    Caption = 'Pause'
    Enabled = False
    TabOrder = 7
    OnClick = BtnPauseClick
  end
  object Button1: TButton
    Left = 269
    Top = 122
    Width = 75
    Height = 25
    Caption = 'Details >>'
    TabOrder = 8
    OnClick = Button1Click
  end
  object BtnCheckUpdates: TButton
    Left = 19
    Top = 122
    Width = 113
    Height = 25
    Caption = 'Check for updates'
    TabOrder = 9
    OnClick = BtnCheckUpdatesClick
  end
  object BtnInstall: TButton
    Left = 20
    Top = 123
    Width = 113
    Height = 25
    Caption = 'Install'
    TabOrder = 10
    Visible = False
    OnClick = BtnInstallClick
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 408
    Top = 128
  end
end

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
      000000200806000000737A7AF4000000017352474200AECE1CE9000000046741
      4D410000B18F0BFC610500000247494441545847ED57CD2E044110DE47F0081E
      C11B9899A3A3AB038923070707312BBB914838F83970E0C2C9490C33CB0A8915
      41964876838884200E8210DE60F5D7D36D7766AAE767772EC2977CD949AABABE
      AAAEEA9ED9CC3F7E1DF296D66616B4DEAC63E44CDB9865BF169EC1315BEF146E
      E923EB685AD6D14B4CA8164A5BFF64892D8F14B576B1B435A0E258C23473224C
      7318DDD23A50111138092D142142C6474AE29CA6A3571225C1B73D257149CC85
      081F0D267E40056995A3B6D12724D470A7BDBE687CBBAB76F664D5EE3ECA3F9C
      3FECF7048E4BD3D61F225B41558F242E5FF66227B0521E56FA980563484805E1
      1EB9E0220483F0EDFB496402D2F7FAB544DAD92E6C08B920D0236AD1D1FD2A0F
      6A5D4CF17644ED40F5B9C8FDB113945DC805C18C79BF33B61FC1403C8393BBDD
      1E1F3F210C7F244ED9316742D20B669CF33BCB2D45E57E9B8A33FB3D3F495376
      6502E88FDF5926A0AE866653093063A00532810AEBABDFA6A25C8359A0EC8912
      00653551BD975CAB4E70FF9D9B05D2AE7C53FA2F21490442C0386D40923882F0
      A74E8BE9185F428E061CFC8B78D0B7031E74F36ADA636B244EC8E9D37A68B2EC
      C5B422A468C0815AB8743CC803CBE08BC7035C103624886D9795E3C4485B908A
      FE4BA03FF44277B8E425A32292538AB36B5EC884833993C30822F8EAF9181792
      A2480A7342F5BC91F8C61012D1A0EE845618EB55DC08F7C5A457A9604D302FC2
      260392500D655C26AE9C0282B0E3F9480928C9062E51CFA3C077837D4C84CD06
      EE1077C7228E5A1A706FCD3A53FB23F2C790C97C034C1F99133EA8EE61000000
      0049454E44AE426082}
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

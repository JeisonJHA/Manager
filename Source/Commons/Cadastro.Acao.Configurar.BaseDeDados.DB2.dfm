inherited frmCadastroAcaoConfigurarBaseDeDadosDB2: TfrmCadastroAcaoConfigurarBaseDeDadosDB2
  Caption = 'Configurar Base de Dados DB2'
  ClientHeight = 371
  ClientWidth = 694
  ExplicitWidth = 700
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 328
    Width = 694
    ExplicitTop = 328
    ExplicitWidth = 694
  end
  inherited Panel1: TPanel
    Top = 330
    Width = 694
    ExplicitTop = 330
    ExplicitWidth = 694
    inherited Panel2: TPanel
      Left = 332
      ExplicitLeft = 332
    end
  end
  inherited cxPageControl1: TcxPageControl
    Width = 688
    Height = 322
    ExplicitWidth = 688
    ExplicitHeight = 322
    ClientRectBottom = 320
    ClientRectRight = 686
    inherited tabGrade: TcxTabSheet
      ExplicitWidth = 684
      ExplicitHeight = 292
      inherited cxGrid1: TcxGrid
        Width = 678
        Height = 286
        ExplicitWidth = 678
        ExplicitHeight = 286
      end
    end
    inherited tabDetalhes: TcxTabSheet
      ExplicitWidth = 684
      ExplicitHeight = 292
      inherited Label1: TLabel
        Left = 24
        Top = 53
        ExplicitLeft = 24
        ExplicitTop = 53
      end
      inherited Label2: TLabel
        Left = 24
        Top = 164
        ExplicitLeft = 24
        ExplicitTop = 164
      end
      inherited Label3: TLabel
        Top = 164
        ExplicitTop = 164
      end
      inherited lblIcone: TLabel
        Top = 16
        ExplicitTop = 16
      end
      inherited Label7: TLabel
        Left = 24
        Top = 16
        ExplicitLeft = 24
        ExplicitTop = 16
      end
      inherited Label4: TLabel
        Left = 24
        Top = 90
        ExplicitLeft = 24
        ExplicitTop = 90
      end
      inherited SpeedButton1: TSpeedButton
        Left = 295
        Top = 178
        Height = 21
        ExplicitLeft = 295
        ExplicitTop = 178
        ExplicitHeight = 21
      end
      inherited Label8: TLabel
        Left = 24
        Top = 126
        ExplicitLeft = 24
        ExplicitTop = 126
      end
      inherited Label10: TLabel
        Top = 126
        ExplicitTop = 126
      end
      inherited Label9: TLabel
        Top = 126
        ExplicitTop = 126
      end
      inherited edtDescricao: TcxDBTextEdit
        Left = 24
        Top = 67
        TabOrder = 2
        ExplicitLeft = 24
        ExplicitTop = 67
      end
      inherited cbxIcone: TcxDBImageComboBox
        Top = 30
        TabOrder = 1
        ExplicitTop = 30
      end
      inherited cbxSistema: TcxDBLookupComboBox
        Left = 24
        Top = 30
        TabOrder = 0
        ExplicitLeft = 24
        ExplicitTop = 30
      end
      inherited edtAlias: TcxDBTextEdit
        Left = 24
        Top = 104
        Properties.CharCase = ecUpperCase
        TabOrder = 3
        ExplicitLeft = 24
        ExplicitTop = 104
      end
      inherited cbxOrigem: TcxDBComboBox
        Left = 24
        Top = 178
        TabOrder = 7
        ExplicitLeft = 24
        ExplicitTop = 178
      end
      inherited cbxDestino: TcxDBComboBox
        Top = 178
        TabOrder = 8
        ExplicitTop = 178
      end
      inherited edtServer: TcxDBTextEdit
        Left = 24
        Top = 141
        TabOrder = 4
        ExplicitLeft = 24
        ExplicitTop = 141
      end
      inherited edtDBUsuario: TcxDBTextEdit
        Top = 141
        TabOrder = 5
        ExplicitTop = 141
      end
      inherited edtDBSenha: TcxDBTextEdit
        Top = 141
        TabOrder = 6
        ExplicitTop = 141
      end
      inherited GroupBox1: TGroupBox
        Top = 201
        Width = 664
        Height = 81
        ExplicitTop = 201
        ExplicitWidth = 664
        ExplicitHeight = 81
        inherited Label6: TLabel
          Left = 15
          Top = 18
          ExplicitLeft = 15
          ExplicitTop = 18
        end
        inherited Label5: TLabel
          Top = 18
          ExplicitTop = 18
        end
        inherited edtUsuario: TcxDBTextEdit
          Left = 14
          Properties.CharCase = ecUpperCase
          ExplicitLeft = 14
        end
        inherited edtSenha: TcxDBTextEdit
          Top = 32
          ExplicitTop = 32
        end
      end
    end
  end
  inherited ioeMestre: TInstantExposer
    ObjectClassName = 'TAcaoConfigurarBaseDeDadosDB2'
    Left = 16
    Top = 328
  end
  inherited ActionList: TActionList
    Left = 232
    Top = 328
  end
  inherited iosSelecionador: TInstantSelector
    Command.Strings = (
      'SELECT * FROM TAcaoConfigurarBaseDeDadosDB2')
    ObjectClassName = 'TAcaoConfigurarBaseDeDadosDB2'
    Left = 88
    Top = 328
  end
  inherited dtsSelecionador: TDataSource
    Left = 120
    Top = 328
  end
  inherited dtsMestre: TDataSource
    Left = 48
    Top = 328
  end
  inherited iosSistema: TInstantSelector
    Left = 192
    Top = 328
  end
  inherited dtsSistema: TDataSource
    Left = 160
    Top = 328
  end
  inherited OpenDialog1: TOpenDialog
    Left = 264
    Top = 328
  end
end

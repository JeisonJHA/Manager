inherited frmCadastroAcaoConfigurarBaseDeDadosOracle: TfrmCadastroAcaoConfigurarBaseDeDadosOracle
  Caption = 'Configurar Base de Dados Oracle'
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 684
      ExplicitHeight = 292
      inherited cxGrid1: TDBGrid
        Width = 678
        Height = 286
      end
    end
    inherited tabDetalhes: TcxTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
        Left = 294
        Top = 178
        Height = 21
        ExplicitLeft = 294
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
        ExplicitLeft = 24
        ExplicitTop = 67
      end
      inherited cbxIcone: TcxDBImageComboBox
        Top = 30
        ExplicitTop = 30
        ExplicitHeight = 21
      end
      inherited cbxSistema: TcxDBLookupComboBox
        Left = 24
        Top = 30
        ExplicitLeft = 24
        ExplicitTop = 30
      end
      inherited edtAlias: TcxDBTextEdit
        Left = 24
        Top = 104
        Properties.CharCase = ecUpperCase
        ExplicitLeft = 24
        ExplicitTop = 104
      end
      inherited cbxOrigem: TcxDBComboBox
        Left = 24
        Top = 178
        ExplicitLeft = 24
        ExplicitTop = 178
      end
      inherited cbxDestino: TcxDBComboBox
        Top = 178
        ExplicitTop = 178
      end
      inherited edtServer: TcxDBTextEdit
        Left = 24
        Top = 141
        ExplicitLeft = 24
        ExplicitTop = 141
      end
      inherited edtDBUsuario: TcxDBTextEdit
        Top = 141
        ExplicitTop = 141
      end
      inherited edtDBSenha: TcxDBTextEdit
        Top = 141
        ExplicitTop = 141
      end
      inherited GroupBox1: TGroupBox
        Top = 201
        Width = 664
        Height = 81
        ExplicitTop = 172
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
          Left = 15
          ExplicitLeft = 15
        end
      end
    end
  end
  inherited ioeMestre: TInstantExposer
    ObjectClassName = 'TAcaoConfigurarBaseDeDadosOracle'
    Left = 16
    Top = 328
  end
  inherited ActionList: TActionList
    Left = 256
    Top = 328
  end
  inherited iosSelecionador: TInstantSelector
    Command.Strings = (
      'SELECT * FROM TAcaoConfigurarBaseDeDadosOracle')
    ObjectClassName = 'TAcaoConfigurarBaseDeDadosOracle'
    Left = 96
    Top = 328
  end
  inherited dtsSelecionador: TDataSource
    Left = 128
    Top = 328
  end
  inherited dtsMestre: TDataSource
    Left = 48
    Top = 328
  end
  inherited iosSistema: TInstantSelector
    Left = 176
    Top = 328
  end
  inherited dtsSistema: TDataSource
    Left = 208
    Top = 328
  end
  inherited OpenDialog1: TOpenDialog
    Left = 288
    Top = 328
  end
end

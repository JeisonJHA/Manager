inherited frmCadastroAcaoConfigurarBaseDeDados: TfrmCadastroAcaoConfigurarBaseDeDados
  Caption = 'Configurar Base de Dados'
  ExplicitWidth = 696
  ExplicitHeight = 460
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    inherited tabGrade: TcxTabSheet
      ExplicitLeft = 2
      ExplicitTop = 28
      ExplicitWidth = 680
      ExplicitHeight = 352
      inherited cxGrid1: TcxGrid
        inherited cxGrid1DBTableView1: TcxGridDBTableView
          inherited cxGrid1DBTableView1Descricao: TcxGridDBColumn
            DataBinding.FieldName = 'Alias'
          end
          object cxGrid1DBTableView1SistemaDescricao: TcxGridDBColumn
            DataBinding.FieldName = 'Sistema.Descricao'
          end
          object cxGrid1DBTableView1Senha: TcxGridDBColumn
            DataBinding.FieldName = 'Senha'
          end
          object cxGrid1DBTableView1Usuario: TcxGridDBColumn
            DataBinding.FieldName = 'Usuario'
          end
        end
      end
    end
    inherited tabDetalhes: TcxTabSheet
      ExplicitLeft = 2
      ExplicitTop = 28
      ExplicitWidth = 680
      ExplicitHeight = 352
      inherited Label1: TLabel
        Top = 64
        Visible = False
        ExplicitTop = 64
      end
      inherited Label2: TLabel
        Top = 147
        Width = 163
        Caption = 'Template de arquivo ini (Opcional)'
        ExplicitTop = 147
        ExplicitWidth = 163
      end
      inherited Label3: TLabel
        Top = 147
        ExplicitTop = 147
      end
      inherited lblIcone: TLabel
        Left = 25
        Top = 190
        ExplicitLeft = 25
        ExplicitTop = 190
      end
      object Label7: TLabel [4]
        Left = 24
        Top = 24
        Width = 37
        Height = 13
        Caption = 'Sistema'
      end
      object Label4: TLabel [5]
        Left = 24
        Top = 64
        Width = 22
        Height = 13
        Caption = 'Alias'
      end
      object Label5: TLabel [6]
        Left = 152
        Top = 107
        Width = 30
        Height = 13
        Caption = 'Senha'
      end
      object Label6: TLabel [7]
        Left = 25
        Top = 107
        Width = 36
        Height = 13
        Caption = 'Usuario'
      end
      object SpeedButton1: TSpeedButton [8]
        Left = 298
        Top = 164
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton1Click
      end
      inherited edtDescricao: TcxDBTextEdit [9]
      end
      inherited cbxIcone: TcxDBImageComboBox [10]
        Left = 25
        Top = 206
        TabOrder = 7
        ExplicitLeft = 25
        ExplicitTop = 206
        ExplicitHeight = 36
      end
      object cbxSistema: TcxDBLookupComboBox [11]
        Left = 24
        Top = 40
        DataBinding.DataField = 'Sistema'
        DataBinding.DataSource = dtsSelecionador
        Properties.KeyFieldNames = 'Self'
        Properties.ListColumns = <
          item
            FieldName = 'Descricao'
          end>
        Properties.ListSource = dtsSistema
        TabOrder = 1
        Width = 633
      end
      object edtAlias: TcxDBTextEdit [12]
        Left = 24
        Top = 83
        DataBinding.DataField = 'Alias'
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 2
        Width = 633
      end
      inherited cbxOrigem: TcxDBComboBox
        Top = 165
        TabOrder = 5
        ExplicitTop = 165
        ExplicitWidth = 273
        Width = 273
      end
      inherited cbxDestino: TcxDBComboBox
        Top = 165
        TabOrder = 6
        ExplicitTop = 165
      end
      object edtSenha: TcxDBTextEdit
        Left = 152
        Top = 123
        DataBinding.DataField = 'Senha'
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 4
        Width = 121
      end
      object edtUsuario: TcxDBTextEdit
        Left = 25
        Top = 123
        DataBinding.DataField = 'Usuario'
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 3
        Width = 121
      end
    end
  end
  inherited ioeMestre: TInstantExposer
    FieldOptions = [foObjects, foThorough]
    ObjectClassName = 'TAcaoConfigurarBaseDeDados'
    object ioeMestreSelf: TIntegerField
      FieldName = 'Self'
    end
    object ioeMestreAlias: TStringField
      FieldName = 'Alias'
      Size = 255
    end
    object ioeMestreSenha: TStringField
      FieldName = 'Senha'
      Size = 255
    end
    object ioeMestreSistema: TIntegerField
      FieldName = 'Sistema'
    end
    object ioeMestreSistemaDescricao: TStringField
      FieldName = 'Sistema.Descricao'
      Size = 255
    end
    object ioeMestreSistemaNomeDiretorio: TStringField
      FieldName = 'Sistema.NomeDiretorio'
      Size = 255
    end
    object ioeMestreUsuario: TStringField
      FieldName = 'Usuario'
      Size = 255
    end
  end
  inherited iosSelecionador: TInstantSelector
    Command.Strings = (
      'SELECT * FROM TAcaoConfigurarBaseDeDados')
    ObjectClassName = 'TAcaoConfigurarBaseDeDados'
    object iosSelecionadorAlias: TStringField
      FieldName = 'Alias'
      Size = 255
    end
    object iosSelecionadorSenha: TStringField
      FieldName = 'Senha'
      Size = 255
    end
    object iosSelecionadorSistema: TIntegerField
      FieldName = 'Sistema'
    end
    object iosSelecionadorSistemaDescricao: TStringField
      FieldName = 'Sistema.Descricao'
      Size = 255
    end
    object iosSelecionadorSistemaNomeDiretorio: TStringField
      FieldName = 'Sistema.NomeDiretorio'
      Size = 255
    end
    object iosSelecionadorUsuario: TStringField
      FieldName = 'Usuario'
      Size = 255
    end
  end
  object iosSistema: TInstantSelector
    FieldOptions = [foObjects, foThorough]
    AutoOpen = True
    Command.Strings = (
      'SELECT * FROM TSistema')
    Connector = dtmDatabase.InstantIBXConnector1
    ObjectClassName = 'TSistema'
    Left = 520
    Top = 192
    object iosSistemaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object iosSistemaNomeDiretorio: TStringField
      FieldName = 'NomeDiretorio'
      Size = 255
    end
    object iosSistemaSelf: TIntegerField
      FieldName = 'Self'
    end
  end
  object dtsSistema: TDataSource
    DataSet = iosSistema
    Left = 520
    Top = 240
  end
  object OpenDialog1: TOpenDialog
    Left = 336
    Top = 216
  end
end

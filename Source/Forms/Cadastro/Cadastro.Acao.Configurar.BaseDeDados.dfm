inherited frmCadastroAcaoConfigurarBaseDeDados: TfrmCadastroAcaoConfigurarBaseDeDados
  Caption = 'Configurar Base de Dados'
  ExplicitWidth = 696
  ExplicitHeight = 460
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      inherited btnNovo: TButton
        DropDownMenu = PopupMenu1
        Style = bsSplitButton
      end
    end
  end
  inherited cxPageControl1: TcxPageControl
    Properties.ActivePage = tabGrade
    inherited tabGrade: TcxTabSheet
      ExplicitLeft = 2
      ExplicitTop = 28
      ExplicitWidth = 680
      ExplicitHeight = 352
    end
    inherited tabDetalhes: TcxTabSheet
      ExplicitLeft = 2
      ExplicitTop = 28
      ExplicitWidth = 680
      ExplicitHeight = 352
      inherited Label1: TLabel
        Left = 25
        Top = 64
        ExplicitLeft = 25
        ExplicitTop = 64
      end
      inherited Label2: TLabel
        Left = 25
        Top = 187
        Width = 163
        Caption = 'Template de arquivo ini (Opcional)'
        ExplicitLeft = 25
        ExplicitTop = 187
        ExplicitWidth = 163
      end
      inherited Label3: TLabel
        Top = 187
        ExplicitTop = 187
      end
      inherited lblIcone: TLabel
        Left = 600
        Top = 21
        ExplicitLeft = 600
        ExplicitTop = 21
      end
      object Label7: TLabel [4]
        Left = 25
        Top = 24
        Width = 37
        Height = 13
        Caption = 'Sistema'
      end
      object Label4: TLabel [5]
        Left = 25
        Top = 104
        Width = 22
        Height = 13
        Caption = 'Alias'
      end
      object SpeedButton1: TSpeedButton [6]
        Left = 298
        Top = 204
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton1Click
      end
      object Label8: TLabel [7]
        Left = 25
        Top = 147
        Width = 32
        Height = 13
        Caption = 'Server'
      end
      object Label10: TLabel [8]
        Left = 409
        Top = 147
        Width = 36
        Height = 13
        Caption = 'Usuario'
      end
      object Label9: TLabel [9]
        Left = 536
        Top = 147
        Width = 30
        Height = 13
        Caption = 'Senha'
      end
      inherited edtDescricao: TcxDBTextEdit [10]
        Left = 25
        Top = 79
        TabOrder = 2
        ExplicitLeft = 25
        ExplicitTop = 79
      end
      inherited cbxIcone: TcxDBImageComboBox [11]
        Left = 600
        Top = 37
        TabOrder = 1
        ExplicitLeft = 600
        ExplicitTop = 37
        ExplicitHeight = 36
      end
      object cbxSistema: TcxDBLookupComboBox [12]
        Left = 25
        Top = 40
        DataBinding.DataField = 'Sistema'
        DataBinding.DataSource = dtsSelecionador
        Properties.KeyFieldNames = 'Self'
        Properties.ListColumns = <
          item
            FieldName = 'Descricao'
          end>
        Properties.ListSource = dtsSistema
        TabOrder = 0
        Width = 569
      end
      object edtAlias: TcxDBTextEdit [13]
        Left = 25
        Top = 120
        DataBinding.DataField = 'Alias'
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 3
        Width = 633
      end
      inherited cbxOrigem: TcxDBComboBox
        Left = 25
        Top = 205
        TabOrder = 7
        ExplicitLeft = 25
        ExplicitTop = 205
        ExplicitWidth = 273
        Width = 273
      end
      inherited cbxDestino: TcxDBComboBox
        Top = 205
        TabOrder = 8
        ExplicitTop = 205
      end
      object edtServer: TcxDBTextEdit
        Left = 25
        Top = 163
        DataBinding.DataField = 'Server'
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 4
        Width = 378
      end
      object edtDBUsuario: TcxDBTextEdit
        Left = 409
        Top = 163
        DataBinding.DataField = 'DBUsuario'
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 5
        Width = 121
      end
      object edtDBSenha: TcxDBTextEdit
        Left = 536
        Top = 163
        DataBinding.DataField = 'DBSenha'
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 6
        Width = 121
      end
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 10
        Top = 232
        Width = 660
        Height = 110
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alBottom
        Caption = 'Usu'#225'rio de acesso para aplica'#231#227'o'
        TabOrder = 9
        object Label6: TLabel
          Left = 16
          Top = 19
          Width = 36
          Height = 13
          Caption = 'Usuario'
        end
        object Label5: TLabel
          Left = 143
          Top = 19
          Width = 30
          Height = 13
          Caption = 'Senha'
        end
        object edtUsuario: TcxDBTextEdit
          Left = 16
          Top = 33
          DataBinding.DataField = 'Usuario'
          DataBinding.DataSource = dtsSelecionador
          TabOrder = 0
          Width = 121
        end
        object edtSenha: TcxDBTextEdit
          Left = 143
          Top = 33
          DataBinding.DataField = 'Senha'
          DataBinding.DataSource = dtsSelecionador
          TabOrder = 1
          Width = 121
        end
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
  inherited ActionList: TActionList
    Left = 424
    Top = 272
    object actCopiarAcao: TAction
      Caption = 'Clonar configura'#231#227'o'
      OnExecute = actCopiarAcaoExecute
      OnUpdate = actCopiarAcaoUpdate
    end
  end
  inherited iosSelecionador: TInstantSelector
    Command.Strings = (
      'SELECT * FROM TAcaoConfigurarBaseDeDados ORDER BY Descricao')
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
    object iosSelecionadorServer: TStringField
      FieldName = 'Server'
      Size = 255
    end
    object iosSelecionadorDBSenha: TStringField
      FieldName = 'DBSenha'
      Size = 255
    end
    object iosSelecionadorDBUsuario: TStringField
      FieldName = 'DBUsuario'
      Size = 255
    end
    object iosSelecionadorTipoAcao: TStringField
      FieldName = 'TipoAcao'
      Size = 255
    end
    object iosSelecionadorTipoBanco: TStringField
      FieldName = 'TipoBanco'
      Size = 255
    end
  end
  inherited dtsSelecionador: TDataSource
    Left = 384
    Top = 320
  end
  object iosSistema: TInstantSelector
    FieldOptions = [foObjects, foThorough]
    AutoOpen = True
    Command.Strings = (
      'SELECT * FROM TSistema')
    Connector = dtmDatabase.InstantIBXConnector1
    ObjectClassName = 'TSistema'
    Left = 560
    Top = 288
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
    Left = 560
    Top = 336
  end
  object OpenDialog1: TOpenDialog
    Left = 432
    Top = 312
  end
  object PopupMenu1: TPopupMenu
    Left = 336
    Top = 216
    object mnoCopiar: TMenuItem
      Action = actCopiarAcao
    end
  end
end

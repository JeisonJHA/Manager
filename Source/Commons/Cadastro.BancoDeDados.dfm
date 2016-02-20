inherited frmCadastroBancoDeDados: TfrmCadastroBancoDeDados
  Caption = 'Banco de Dados'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    inherited tabGrade: TcxTabSheet
      inherited cxGrid1: TcxGrid
        inherited cxGrid1DBTableView1: TcxGridDBTableView
          object cxGrid1DBTableView1Descricao: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'Descricao'
          end
          object cxGrid1DBTableView1SistemaDescricao: TcxGridDBColumn
            Caption = 'Sistema'
            DataBinding.FieldName = 'Sistema.Descricao'
          end
        end
      end
    end
    inherited tabDetalhes: TcxTabSheet
      ExplicitLeft = 1
      ExplicitTop = 29
      ExplicitWidth = 680
      ExplicitHeight = 352
      object Label1: TLabel
        Left = 24
        Top = 21
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label2: TLabel
        Left = 24
        Top = 64
        Width = 22
        Height = 13
        Caption = 'Alias'
        FocusControl = cxDBTextEdit2
      end
      object Label3: TLabel
        Left = 151
        Top = 110
        Width = 30
        Height = 13
        Caption = 'Senha'
        FocusControl = cxDBTextEdit3
      end
      object Label4: TLabel
        Left = 24
        Top = 112
        Width = 36
        Height = 13
        Caption = 'Usuario'
        FocusControl = cxDBTextEdit4
      end
      object Label5: TLabel
        Left = 335
        Top = 64
        Width = 37
        Height = 13
        Caption = 'Sistema'
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 24
        Top = 40
        DataBinding.DataField = 'Descricao'
        DataBinding.DataSource = dtsMestre
        TabOrder = 0
        Width = 633
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 24
        Top = 83
        DataBinding.DataField = 'Alias'
        DataBinding.DataSource = dtsMestre
        TabOrder = 1
        Width = 305
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 151
        Top = 128
        DataBinding.DataField = 'Senha'
        DataBinding.DataSource = dtsMestre
        TabOrder = 2
        Width = 121
      end
      object cxDBTextEdit4: TcxDBTextEdit
        Left = 24
        Top = 128
        DataBinding.DataField = 'Usuario'
        DataBinding.DataSource = dtsMestre
        TabOrder = 3
        Width = 121
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 335
        Top = 83
        DataBinding.DataField = 'Sistema'
        DataBinding.DataSource = dtsMestre
        Properties.KeyFieldNames = 'Self'
        Properties.ListColumns = <
          item
            FieldName = 'Descricao'
          end>
        Properties.ListSource = dtsSistema
        TabOrder = 4
        Width = 322
      end
    end
  end
  inherited ioeMestre: TInstantExposer
    FieldOptions = [foObjects, foThorough]
    ObjectClassName = 'TBancoDeDados'
    Left = 256
    Top = 280
    object ioeMestreAlias: TStringField
      FieldName = 'Alias'
      Size = 255
    end
    object ioeMestreDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object ioeMestreSelf: TIntegerField
      FieldName = 'Self'
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
    AutoOpen = True
    Command.Strings = (
      'SELECT * FROM TBancoDeDados')
    Left = 344
    Top = 200
    object iosSelecionadorAlias: TStringField
      FieldName = 'Alias'
      Size = 255
    end
    object iosSelecionadorDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object iosSelecionadorSelf: TIntegerField
      FieldName = 'Self'
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
  inherited dtsSelecionador: TDataSource
    Left = 344
    Top = 248
  end
  inherited dtsMestre: TDataSource
    Left = 248
    Top = 320
  end
  object iosSistema: TInstantSelector
    FieldOptions = [foObjects, foThorough]
    AutoOpen = True
    Command.Strings = (
      'SELECT * FROM TSistema')
    Connector = dmDados.InstantIBXConnector1
    Left = 504
    Top = 192
  end
  object dtsSistema: TDataSource
    DataSet = iosSistema
    Left = 504
    Top = 240
  end
end

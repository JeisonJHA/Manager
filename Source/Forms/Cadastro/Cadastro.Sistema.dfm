inherited frmCadastroSistema: TfrmCadastroSistema
  Caption = 'Sistema'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    inherited tabGrade: TcxTabSheet
      inherited cxGrid1: TDBGrid
        DataSource = dtsSelecionador
        Columns = <
          item
            Expanded = False
            FieldName = 'Descricao'
            Title.Caption = 'Descri'#231#227'o'
            Visible = True
          end>
      end
    end
    inherited tabDetalhes: TcxTabSheet
      object Label1: TLabel
        Left = 24
        Top = 21
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label2: TLabel
        Left = 510
        Top = 24
        Width = 71
        Height = 13
        Caption = 'Nome Diret'#243'rio'
      end
      object edtNomeDiretorio: TcxDBTextEdit
        Left = 510
        Top = 40
        DataBinding.DataField = 'NomeDiretorio'
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 1
        Width = 147
      end
      object edtDescricao: TcxDBTextEdit
        Left = 24
        Top = 40
        DataBinding.DataField = 'Descricao'
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 0
        Width = 480
      end
    end
  end
  inherited ioeMestre: TInstantExposer
    FieldOptions = [foObjects, foThorough]
    ObjectClassName = 'TSistema'
    object ioeMestreDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object ioeMestreNomeDiretorio: TStringField
      FieldName = 'NomeDiretorio'
      Size = 255
    end
    object ioeMestreSelf: TIntegerField
      FieldName = 'Self'
    end
  end
  inherited iosSelecionador: TInstantSelector
    AutoOpen = True
    Command.Strings = (
      'SELECT * FROM TSistema')
    ObjectClassName = 'TSistema'
    object iosSelecionadorDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object iosSelecionadorNomeDiretorio: TStringField
      FieldName = 'NomeDiretorio'
      Size = 255
    end
    object iosSelecionadorSelf: TIntegerField
      FieldName = 'Self'
    end
  end
end

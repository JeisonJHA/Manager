inherited frmCadastroAcao: TfrmCadastroAcao
  Caption = 'Procedimento'
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
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Icone'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Self'
            Visible = False
          end>
      end
    end
    inherited tabDetalhes: TcxTabSheet
      object Label1: TLabel
        Left = 24
        Top = 24
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object lblIcone: TLabel
        Left = 480
        Top = 255
        Width = 27
        Height = 13
        Caption = #205'cone'
      end
      object cbxIcone: TcxDBImageComboBox
        Left = 480
        Top = 274
        DataBinding.DataField = 'Icone'
        DataBinding.DataSource = dtsMestre
        Properties.Images = dtmDatabase.LargeImageList
        Properties.Items = <>
        TabOrder = 0
        Width = 57
      end
      object edtDescricao: TcxDBTextEdit
        Left = 24
        Top = 40
        DataBinding.DataField = 'Descricao'
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 1
        Width = 633
      end
    end
  end
  inherited ioeMestre: TInstantExposer
    ObjectClassName = 'TAcao'
    object ioeMestreDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object ioeMestreIcone: TIntegerField
      FieldName = 'Icone'
    end
  end
  inherited iosSelecionador: TInstantSelector
    AutoOpen = True
    Command.Strings = (
      'SELECT * FROM TAcao')
    ObjectClassName = 'TAcao'
    object iosSelecionadorDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 255
    end
    object iosSelecionadorIcone: TIntegerField
      FieldName = 'Icone'
    end
    object iosSelecionadorSelf: TIntegerField
      FieldName = 'Self'
    end
  end
end

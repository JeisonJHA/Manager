inherited frmCadastroAcao: TfrmCadastroAcao
  Caption = 'Procedimento'
  ExplicitWidth = 696
  ExplicitHeight = 460
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    Properties.ActivePage = tabDetalhes
    inherited tabGrade: TcxTabSheet
      ExplicitLeft = 2
      ExplicitTop = 28
      ExplicitWidth = 680
      ExplicitHeight = 352
      inherited cxGrid1: TcxGrid
        inherited cxGrid1DBTableView1: TcxGridDBTableView
          object cxGrid1DBTableView1Descricao: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'Descricao'
          end
        end
      end
    end
    inherited tabDetalhes: TcxTabSheet
      ExplicitLeft = 2
      ExplicitTop = 28
      ExplicitWidth = 680
      ExplicitHeight = 352
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
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 24
        Top = 40
        DataBinding.DataField = 'Descricao'
        DataBinding.DataSource = dtsMestre
        TabOrder = 0
        Width = 633
      end
      object cbxIcone: TcxDBImageComboBox
        Left = 480
        Top = 274
        DataBinding.DataField = 'Icone'
        DataBinding.DataSource = dtsMestre
        Properties.Images = dtmDatabase.LargeImageList
        Properties.Items = <>
        TabOrder = 1
        Width = 57
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
      'SELECT * FROM TAcaoCopiar')
    ObjectClassName = 'TAcao'
    object iosSelecionadorDescricao: TStringField
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

inherited frmCadastroAcaoCopiar: TfrmCadastroAcaoCopiar
  Caption = 'C'#243'pia de Arquivo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    Properties.ActivePage = tabDetalhes
    inherited tabDetalhes: TcxTabSheet
      inherited Label1: TLabel
        Top = 21
        ExplicitTop = 21
      end
      object Label2: TLabel [1]
        Left = 24
        Top = 72
        Width = 34
        Height = 13
        Caption = 'Origem'
      end
      object Label3: TLabel [2]
        Left = 327
        Top = 72
        Width = 36
        Height = 13
        Caption = 'Destino'
      end
      inherited lblIcone: TLabel
        Left = 24
        Top = 119
        ExplicitLeft = 24
        ExplicitTop = 119
      end
      inherited cbxIcone: TcxDBImageComboBox
        Left = 24
        Top = 135
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 3
        ExplicitLeft = 24
        ExplicitTop = 135
      end
      inherited edtDescricao: TcxDBTextEdit
        TabOrder = 0
      end
      object cbxOrigem: TcxDBComboBox
        Left = 24
        Top = 88
        DataBinding.DataField = 'Origem'
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 1
        Width = 297
      end
      object cbxDestino: TcxDBComboBox
        Left = 327
        Top = 88
        DataBinding.DataField = 'Destino'
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 2
        Width = 330
      end
    end
  end
  inherited ioeMestre: TInstantExposer
    ObjectClassName = 'TAcaoCopiar'
    Top = 80
    object ioeMestreDestino: TStringField
      FieldName = 'Destino'
      Size = 255
    end
    object ioeMestreOrigem: TStringField
      FieldName = 'Origem'
      Size = 255
    end
  end
  inherited ActionList: TActionList
    Top = 176
  end
  inherited iosSelecionador: TInstantSelector
    Command.Strings = (
      'SELECT * FROM TAcaoCopiar')
    ObjectClassName = 'TAcaoCopiar'
    Top = 272
    object iosSelecionadorDestino: TStringField
      FieldName = 'Destino'
      Size = 255
    end
    object iosSelecionadorOrigem: TStringField
      FieldName = 'Origem'
      Size = 255
    end
  end
  inherited dtsSelecionador: TDataSource
    Top = 224
  end
  inherited dtsMestre: TDataSource
    Top = 128
  end
end

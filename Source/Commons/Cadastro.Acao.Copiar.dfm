inherited frmCadastroAcaoCopiar: TfrmCadastroAcaoCopiar
  Caption = 'C'#243'pia de Arquivo'
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
    end
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
        FocusControl = cxDBTextEdit2
      end
      object Label3: TLabel [2]
        Left = 327
        Top = 72
        Width = 36
        Height = 13
        Caption = 'Destino'
        FocusControl = cxDBTextEdit3
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
        TabOrder = 3
        ExplicitLeft = 24
        ExplicitTop = 135
        ExplicitHeight = 36
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 24
        Top = 88
        DataBinding.DataField = 'Origem'
        DataBinding.DataSource = dtsMestre
        TabOrder = 1
        Width = 297
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 327
        Top = 88
        DataBinding.DataField = 'Destino'
        DataBinding.DataSource = dtsMestre
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

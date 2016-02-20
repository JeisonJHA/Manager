inherited frmCadastroModelo: TfrmCadastroModelo
  BorderStyle = bsDialog
  Caption = 'frmCadastroModelo'
  ClientHeight = 431
  ClientWidth = 690
  ExplicitWidth = 696
  ExplicitHeight = 460
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel [0]
    Left = 0
    Top = 388
    Width = 690
    Height = 2
    Align = alBottom
    Shape = bsBottomLine
    ExplicitTop = 330
    ExplicitWidth = 680
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 390
    Width = 690
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 491
      Top = 0
      Width = 199
      Height = 41
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnConfirmar: TButton
        Left = 24
        Top = 8
        Width = 75
        Height = 25
        Action = actConfirmar
        Default = True
        ModalResult = 1
        TabOrder = 0
      end
      object btnCancelar: TButton
        Left = 105
        Top = 8
        Width = 75
        Height = 25
        Action = actCancelar
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  inherited ActionList: TActionList
    object actConfirmar: TAction
      Caption = 'Confirmar'
      OnExecute = actConfirmarExecute
      OnUpdate = actConfirmarUpdate
    end
    object actCancelar: TAction
      Caption = 'Cancelar'
      OnExecute = actCancelarExecute
    end
  end
end

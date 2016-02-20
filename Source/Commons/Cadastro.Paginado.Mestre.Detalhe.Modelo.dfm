inherited frmCadastroPaginadoMestreDetalheModelo: TfrmCadastroPaginadoMestreDetalheModelo
  Caption = 'Mestre Detalhe Modelo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    Properties.ActivePage = tabDetalhes
    inherited tabDetalhes: TcxTabSheet
      Caption = 'Formul'#225'rio'
      object GroupBox1: TGroupBox
        Left = 3
        Top = 88
        Width = 674
        Height = 263
        Caption = 'Detalhe'
        TabOrder = 0
        object cxGrid2: TcxGrid
          AlignWithMargins = True
          Left = 5
          Top = 80
          Width = 664
          Height = 178
          Align = alBottom
          TabOrder = 0
          object cxGrid2DBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
          end
          object cxGrid2Level1: TcxGridLevel
            GridView = cxGrid2DBTableView1
          end
        end
      end
    end
  end
  inherited ioeMestre: TInstantExposer
    FieldOptions = [foObjects, foThorough]
    MasterSource = dtsSelecionador
    Mode = amContent
  end
  object ioeDetalhe: TInstantExposer
    FieldOptions = [foObjects, foThorough]
    MasterSource = dtsMestre
    Mode = amContent
    Left = 192
    Top = 112
  end
  object dtsDetalhe: TDataSource
    DataSet = ioeDetalhe
    Left = 192
    Top = 160
  end
end

inherited frmCadastroAcaoMontarAmbiente: TfrmCadastroAcaoMontarAmbiente
  Caption = 'Montar Ambiente'
  ExplicitWidth = 696
  ExplicitHeight = 460
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxPageControl1: TcxPageControl
    Properties.ActivePage = tabDetalhes
    inherited tabGrade: TcxTabSheet
      ExplicitTop = 28
      ExplicitWidth = 680
      ExplicitHeight = 352
    end
    inherited tabDetalhes: TcxTabSheet
      ExplicitLeft = 2
      ExplicitTop = 28
      ExplicitWidth = 680
      ExplicitHeight = 352
      inherited lblIcone: TLabel
        Left = 610
        Top = 3
        Visible = False
        ExplicitLeft = 610
        ExplicitTop = 3
      end
      inherited cbxIcone: TcxDBImageComboBox
        Left = 600
        Top = 32
        DataBinding.DataSource = dtsSelecionador
        TabOrder = 1
        ExplicitLeft = 600
        ExplicitTop = 32
        ExplicitHeight = 36
      end
      inherited edtDescricao: TcxDBTextEdit
        TabOrder = 0
        ExplicitWidth = 570
        Width = 570
      end
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 86
        Width = 674
        Height = 263
        Align = alBottom
        Caption = 'A'#231#245'es dispon'#237'veis'
        TabOrder = 2
        object Panel3: TPanel
          Left = 637
          Top = 15
          Width = 35
          Height = 246
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object JvSpeedButton1: TJvSpeedButton
            Left = 6
            Top = 35
            Width = 25
            Height = 25
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000050B0510234D21703C8339C04BA447F04BA447F03C83
              39C0234D2170050B051000000000000000000000000000000000000000000000
              000000000000142C1340469942E050AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
              4CFF50AF4CFF469942E0142C1340000000000000000000000000000000000000
              0000142C134050AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
              4CFF50AF4CFF50AF4CFF50AF4CFF142C1340000000000000000000000000050B
              0510469942E050AF4CFF50AF4CFF50AF4CFF50AF4CFF7CC379FF7CC379FF50AF
              4CFF50AF4CFF50AF4CFF50AF4CFF469942E0050B05100000000000000000234D
              217050AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFFFFFFFFFFFFFFFFFF50AF
              4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF234D217000000000000000003C83
              39C050AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFFFFFFFFFFFFFFFFFF50AF
              4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF3C8339C000000000000000004BA4
              47F050AF4CFF50AF4CFF7CC379FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF7CC379FF50AF4CFF50AF4CFF4BA447F000000000000000004BA4
              47F050AF4CFF50AF4CFF7CC379FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF7CC379FF50AF4CFF50AF4CFF4BA447EF00000000000000003C83
              39C050AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFFFFFFFFFFFFFFFFFF50AF
              4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF3C8339C00000000000000000234D
              217050AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFFFFFFFFFFFFFFFFFF50AF
              4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF234D21700000000000000000050B
              0510469942DF50AF4CFF50AF4CFF50AF4CFF50AF4CFF7CC379FF7BC278FF50AF
              4CFF50AF4CFF50AF4CFF50AF4CFF469942DF050B051000000000000000000000
              0000142C134050AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
              4CFF50AF4CFF50AF4CFF50AF4CFF142C13400000000000000000000000000000
              000000000000142C1340469942DF50AF4CFF50AF4CFF50AF4CFF50AF4CFF50AF
              4CFF50AF4CFF469942DF142C1340000000000000000000000000000000000000
              00000000000000000000050B0510234C216F3C8339BF4BA447EF4BA447EF3C83
              39BF234C216F050B051000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000}
            OnClick = JvSpeedButton1Click
          end
          object JvSpeedButton2: TJvSpeedButton
            Left = 6
            Top = 66
            Width = 25
            Height = 25
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000030410101B217A802C36C7D03643F4FF3643F4FF2C36
              C7D01B217A800304101000000000000000000000000000000000000000000000
              00000000000014195C60323FE5F03643F4FF3643F4FF3643F4FF3643F4FF3643
              F4FF3643F4FF323FE5F011154D50000000000000000000000000000000000000
              000014195C603643F4FF3643F4FF3643F4FF3643F4FF3643F4FF3643F4FF3643
              F4FF3643F4FF3643F4FF3643F4FF11154D500000000000000000000000000304
              1010323FE5F03643F4FF3643F4FF3643F4FF3643F4FF3643F4FF3643F4FF3643
              F4FF3643F4FF3643F4FF3643F4FF323FE5F00304101000000000000000001B21
              7A803643F4FF3643F4FF3643F4FF3643F4FF3643F4FF3643F4FF3643F4FF3643
              F4FF3643F4FF3643F4FF3643F4FF3643F4FF1B217A8000000000000000002C36
              C7D03643F4FF3643F4FF3643F4FF3643F4FF3643F4FF3643F4FF3643F4FF3643
              F4FF3643F4FF3643F4FF3643F4FF3643F4FF2C36C7D000000000000000003643
              F4FF3643F4FF3643F4FF6872F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF6872F7FF3643F4FF3643F4FF3643F4FF00000000000000003643
              F4FF3643F4FF3643F4FF6872F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF6872F7FF3643F4FF3643F4FF3643F4FF00000000000000002C36
              C7D03643F4FF3643F4FF3643F4FF3643F4FF3643F4FF3643F4FF3643F4FF3643
              F4FF3643F4FF3643F4FF3643F4FF3643F4FF2B36C6CF00000000000000001B21
              7A803643F4FF3643F4FF3643F4FF3643F4FF3643F4FF3643F4FF3643F4FF3643
              F4FF3643F4FF3643F4FF3643F4FF3643F4FF1B217A8000000000000000000304
              1010323EE4EF3643F4FF3643F4FF3643F4FF3643F4FF3643F4FF3643F4FF3643
              F4FF3643F4FF3643F4FF3643F4FF323EE4EF0304101000000000000000000000
              000014195C603643F4FF3643F4FF3643F4FF3643F4FF3643F4FF3643F4FF3643
              F4FF3643F4FF3643F4FF3643F4FF14195C600000000000000000000000000000
              00000000000014195C60323EE4EF3643F4FF3643F4FF3643F4FF3643F4FF3643
              F4FF3643F4FF323EE4EF14195C60000000000000000000000000000000000000
              00000000000000000000030410101B217A7F2B36C6CF3643F4FF3643F4FF2B36
              C6CF1B217A7F0304101000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000}
            OnClick = JvSpeedButton2Click
          end
        end
        object Panel4: TPanel
          Left = 2
          Top = 15
          Width = 635
          Height = 246
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object cxGrid2: TcxGrid
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 629
            Height = 240
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = cxcbsNone
            TabOrder = 0
            object cxGrid2DBTableView1: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.DataSource = dtsMestre
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsSelection.CellSelect = False
              OptionsView.ColumnAutoWidth = True
              object cxGrid2DBTableView1Descricao: TcxGridDBColumn
                DataBinding.FieldName = 'Descricao'
              end
            end
            object cxGrid2Level1: TcxGridLevel
              GridView = cxGrid2DBTableView1
            end
          end
        end
      end
    end
  end
  inherited ioeMestre: TInstantExposer
    FieldOptions = [foObjects, foThorough]
    ContainerName = 'Acoes'
    MasterSource = dtsSelecionador
    Mode = amContent
    object ioeMestreSelf: TIntegerField
      FieldName = 'Self'
    end
  end
  inherited ActionList: TActionList
    object actAddDetalhe: TAction
      Caption = 'Adicionar'
      OnUpdate = actAddDetalheUpdate
    end
    object actDelDetalhe: TAction
      Caption = 'Excluir'
      OnUpdate = actDelDetalheUpdate
    end
  end
  inherited iosSelecionador: TInstantSelector
    Command.Strings = (
      'SELECT * FROM TAcaoMontarAmbiente')
    ObjectClassName = 'TAcaoMontarAmbiente'
    object iosSelecionadorAcoes: TDataSetField
      FieldName = 'Acoes'
    end
    object iosSelecionadorTipoAcao: TStringField
      FieldName = 'TipoAcao'
      Size = 255
    end
  end
  object iosAcoes: TInstantSelector
    FieldOptions = [foObjects, foThorough]
    Filtered = True
    AutoOpen = True
    Command.Strings = (
      'SELECT * FROM ANY TAcao')
    Connector = dtmDatabase.InstantIBXConnector1
    Left = 544
    Top = 96
    object iosAcoesDescricao: TStringField
      FieldName = 'Descricao'
      Size = 255
    end
    object iosAcoesIcone: TIntegerField
      FieldName = 'Icone'
    end
    object iosAcoesSelf: TIntegerField
      FieldName = 'Self'
    end
  end
  object dtsAcoes: TDataSource
    DataSet = ioeMestre
    Left = 544
    Top = 144
  end
end

object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = #54620#44544' '#51312#49324' '#53580#49828#53944
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object eSource: TEdit
    Left = 24
    Top = 53
    Width = 217
    Height = 23
    TabOrder = 0
  end
  object eTarget: TEdit
    Left = 24
    Top = 82
    Width = 217
    Height = 23
    TabOrder = 1
  end
  object btnExecute: TButton
    Left = 247
    Top = 52
    Width = 75
    Height = 25
    Caption = #49892#54665
    TabOrder = 2
    OnClick = btnExecuteClick
  end
  object eType: TComboBox
    Left = 24
    Top = 24
    Width = 217
    Height = 23
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 3
    Text = #51012'/'#47484
    Items.Strings = (
      #51012'/'#47484
      #51060'/'#44032
      #47196'/'#51004#47196)
  end
end

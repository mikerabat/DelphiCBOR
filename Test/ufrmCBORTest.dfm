object frmCBORTest: TfrmCBORTest
  Left = 0
  Top = 0
  Caption = 'CBOR Test'
  ClientHeight = 301
  ClientWidth = 469
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    469
    301)
  PixelsPerInch = 96
  TextHeight = 13
  object edJSON: TJvFilenameEdit
    Left = 24
    Top = 32
    Width = 331
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Text = 'credentailMake.json'
  end
  object btnOpen: TButton
    Left = 369
    Top = 30
    Width = 92
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Open'
    TabOrder = 1
    OnClick = btnOpenClick
  end
  object memLog: TMemo
    Left = 24
    Top = 72
    Width = 332
    Height = 221
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
  end
  object btnEncode: TButton
    Left = 369
    Top = 72
    Width = 92
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Test Encode'
    TabOrder = 3
    OnClick = btnEncodeClick
  end
  object btnRFCTests: TButton
    Left = 369
    Top = 112
    Width = 92
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Write RFC Tests'
    TabOrder = 4
    OnClick = btnRFCTestsClick
  end
end

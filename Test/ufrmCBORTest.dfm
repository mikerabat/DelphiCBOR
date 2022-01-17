object frmCBORTest: TfrmCBORTest
  Left = 0
  Top = 0
  Caption = 'CBOR Test'
  ClientHeight = 242
  ClientWidth = 468
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edJSON: TJvFilenameEdit
    Left = 24
    Top = 32
    Width = 331
    Height = 21
    TabOrder = 0
    Text = 'credentailMake.json'
  end
  object btnOpen: TButton
    Left = 368
    Top = 30
    Width = 92
    Height = 25
    Caption = 'Open'
    TabOrder = 1
    OnClick = btnOpenClick
  end
  object memLog: TMemo
    Left = 24
    Top = 72
    Width = 331
    Height = 162
    TabOrder = 2
  end
  object btnEncode: TButton
    Left = 368
    Top = 72
    Width = 92
    Height = 25
    Caption = 'Test Encode'
    TabOrder = 3
    OnClick = btnEncodeClick
  end
  object btnRFCTests: TButton
    Left = 368
    Top = 112
    Width = 92
    Height = 25
    Caption = 'Write RFC Tests'
    TabOrder = 4
    OnClick = btnRFCTestsClick
  end
end

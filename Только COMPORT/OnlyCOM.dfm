object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 1000
  ClientWidth = 1600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 360
    Top = 120
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 344
    Top = 40
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object Label6: TLabel
    Left = 1404
    Top = 552
    Width = 31
    Height = 13
    Caption = 'Label6'
  end
  object Label7: TLabel
    Left = 1000
    Top = 441
    Width = 82
    Height = 13
    Caption = 'Count_low_times'
    Visible = False
  end
  object Label8: TLabel
    Left = 996
    Top = 648
    Width = 86
    Height = 13
    Caption = 'Count_high_times'
    Visible = False
  end
  object Label9: TLabel
    Left = 1421
    Top = 613
    Width = 31
    Height = 13
    Caption = 'Label6'
  end
  object Label10: TLabel
    Left = 1316
    Top = 678
    Width = 31
    Height = 13
    Caption = 'Label6'
  end
  object Label11: TLabel
    Left = 1000
    Top = 488
    Width = 135
    Height = 13
    Caption = 'Count_low_times_breakable'
    Visible = False
  end
  object Label13: TLabel
    Left = 996
    Top = 709
    Width = 139
    Height = 13
    Caption = 'Count_high_times_breakable'
    Visible = False
  end
  object Label14: TLabel
    Left = 1000
    Top = 422
    Width = 82
    Height = 13
    Caption = 'Count_low_times'
    Visible = False
  end
  object Label15: TLabel
    Left = 1000
    Top = 469
    Width = 135
    Height = 13
    Caption = 'Count_low_times_breakable'
    Visible = False
  end
  object Label16: TLabel
    Left = 996
    Top = 629
    Width = 86
    Height = 13
    Caption = 'Count_high_times'
    Visible = False
  end
  object Label17: TLabel
    Left = 996
    Top = 686
    Width = 139
    Height = 13
    Caption = 'Count_high_times_breakable'
    Visible = False
  end
  object Memo2: TMemo
    Left = 618
    Top = 614
    Width = 410
    Height = 378
    ScrollBars = ssBoth
    TabOrder = 1
    Visible = False
    WordWrap = False
  end
  object Memo1: TMemo
    Left = 106
    Top = 648
    Width = 950
    Height = 105
    Lines.Strings = (
      '')
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    Visible = False
    WordWrap = False
  end
  object RadioButton1: TRadioButton
    Left = 1198
    Top = 121
    Width = 113
    Height = 17
    Caption = 'Connected'
    Enabled = False
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 15
    Top = 591
    Width = 89
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -7
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = False
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 64
    Width = 145
    Height = 17
    Caption = #1054#1090#1089#1083#1077#1078#1080#1074#1072#1085#1080#1077' '#1087#1086#1079#1080#1094#1080#1080
    TabOrder = 4
  end
  object com: TPlot3D
    AlignWithMargins = True
    Left = 176
    Top = 8
    Width = 417
    Height = 369
    Cursor = crHandPoint
    AutoCenter = True
    BoundBoxStyle = bbFaces
    CaptionX = 'X'
    CaptionY = 'Y'
    CaptionZ = #1053#1072#1087#1088#1103#1078#1077#1085#1085#1086#1089#1090#1100
    CentX = 208
    CentY = 184
    ColorFrame = clGray
    ColorBakGnd = clCream
    ColorCodeAvg = True
    ColorCubeFrame = 4210752
    ColorCubeHidLin = 11579568
    ColorCubeFaceLow = clSilver
    ColorCubeFaceHigh = 16707310
    ColorXCoords = clBlue
    ColorYCoords = clBlue
    ColorZCoords = clBlack
    ColorMesh = clRed
    ColorHigh = clMaroon
    ColorMid = clFuchsia
    ColorLow = clWhite
    ColorScaleHigh = 70.000000000000000000
    ColorScaleLow = 10.000000000000000000
    ColorCodingMode = ccmThreeColors
    ColorScheme = csSystem
    DecPlaceX = 0
    DecPlaceY = 0
    DecPlaceZ = 1
    FrameStyle = fsLowered
    LabDistX = 20
    LabDistY = 20
    LabDistZ = 60
    MeshVisible = True
    MeshKind = mkGrid
    Magnification = 1.000000000000000000
    MouseAction = maRotate
    MinTickX = 7
    MinTickY = 7
    MinTickZ = 2
    RangeXLow = -1.000000000000000000
    RangeYLow = -1.000000000000000000
    RangeZLow = -1.000000000000000000
    RangeXHigh = 6.000000000000000000
    RangeYHigh = 6.000000000000000000
    RangeZHigh = 10.000000000000000000
    ScaleFactX = 0.700000000000000000
    ScaleFactY = 0.700000000000000000
    ScaleFactZ = 0.700000000000000000
    ViewAngleX = 66.000000000000000000
    ViewAngleZ = 135.000000000000000000
    VisibleXCoords = True
    VisibleYCoords = True
    VisibleZCoords = True
    OnDataRendered = comDataRendered
    OnBeforeRenderPolygon = comBeforeRenderPolygon
    OnMouseMoveOverPlot = comMouseMoveOverPlot
  end
  object Panel1: TPanel
    Left = 48
    Top = 399
    Width = 209
    Height = 97
    TabOrder = 6
    Visible = False
    object Label3: TLabel
      Left = 9
      Top = 15
      Width = 71
      Height = 13
      Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1072' '#1061
      Layout = tlCenter
    end
    object Label4: TLabel
      Left = 9
      Top = 42
      Width = 71
      Height = 13
      Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1072' Y'
      Layout = tlCenter
    end
    object Label5: TLabel
      Left = 9
      Top = 67
      Width = 80
      Height = 13
      Caption = #1053#1072#1087#1088#1103#1078#1077#1085#1085#1086#1089#1090#1100
      Layout = tlCenter
    end
    object Edit2: TEdit
      Left = 152
      Top = 65
      Width = 41
      Height = 21
      TabOrder = 0
    end
    object Edit3: TEdit
      Left = 152
      Top = 39
      Width = 41
      Height = 21
      TabOrder = 1
    end
    object Edit4: TEdit
      Left = 152
      Top = 12
      Width = 41
      Height = 21
      TabOrder = 2
    end
  end
  object Button3: TButton
    Left = 1198
    Top = 164
    Width = 273
    Height = 97
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 7
    Visible = False
    OnClick = Button3Click
  end
  object StringGrid1: TStringGrid
    Left = 15
    Top = 663
    Width = 410
    Height = 178
    ColCount = 6
    FixedCols = 0
    RowCount = 6
    FixedRows = 0
    TabOrder = 8
    Visible = False
  end
  object com2: TPlot3D
    AlignWithMargins = True
    Left = 1054
    Top = 8
    Width = 417
    Height = 369
    Cursor = crHandPoint
    AutoCenter = True
    BoundBoxStyle = bbFaces
    CaptionX = 'X'
    CaptionY = 'Y'
    CaptionZ = #1053#1072#1087#1088#1103#1078#1077#1085#1085#1086#1089#1090#1100
    CentX = 208
    CentY = 184
    ColorFrame = clGray
    ColorBakGnd = clCream
    ColorCodeAvg = True
    ColorCubeFrame = 4210752
    ColorCubeHidLin = 11579568
    ColorCubeFaceLow = clSilver
    ColorCubeFaceHigh = 16707310
    ColorXCoords = clBlue
    ColorYCoords = clBlue
    ColorZCoords = clBlack
    ColorMesh = clHighlight
    ColorHigh = clNavy
    ColorMid = clMenuHighlight
    ColorLow = clBlue
    ColorScaleHigh = 20.000000000000000000
    ColorScaleLow = -1.000000000000000000
    ColorCodingMode = ccmThreeColors
    ColorScheme = csSystem
    DecPlaceX = 0
    DecPlaceY = 0
    DecPlaceZ = 1
    FrameStyle = fsLowered
    LabDistX = 20
    LabDistY = 20
    LabDistZ = 60
    MeshVisible = True
    MeshKind = mkGrid
    Magnification = 1.000000000000000000
    MouseAction = maRotate
    MinTickX = 7
    MinTickY = 7
    MinTickZ = 2
    RangeXLow = -1.000000000000000000
    RangeYLow = -1.000000000000000000
    RangeZLow = -1.000000000000000000
    RangeXHigh = 7.000000000000000000
    RangeYHigh = 7.000000000000000000
    RangeZHigh = 10.000000000000000000
    ScaleFactX = 0.700000000000000000
    ScaleFactY = 0.700000000000000000
    ScaleFactZ = 0.700000000000000000
    ViewAngleX = 66.000000000000000000
    ViewAngleZ = 135.000000000000000000
    VisibleXCoords = True
    VisibleYCoords = True
    VisibleZCoords = True
    OnDataRendered = com2DataRendered
    OnBeforeRenderPolygon = com2BeforeRenderPolygon
    OnMouseMoveOverPlot = com2MouseMoveOverPlot
  end
  object com3: TPlot3D
    AlignWithMargins = True
    Left = 618
    Top = 8
    Width = 408
    Height = 369
    Cursor = crHandPoint
    AutoCenter = True
    BoundBoxStyle = bbFaces
    CaptionX = 'X'
    CaptionY = 'Y'
    CaptionZ = #1053#1072#1087#1088#1103#1078#1077#1085#1085#1086#1089#1090#1100
    CentX = 204
    CentY = 184
    ColorFrame = clGray
    ColorBakGnd = clCream
    ColorCodeAvg = True
    ColorCubeFrame = 4210752
    ColorCubeHidLin = 11579568
    ColorCubeFaceLow = clSilver
    ColorCubeFaceHigh = 16707310
    ColorXCoords = clBlue
    ColorYCoords = clBlue
    ColorZCoords = clBlack
    ColorMesh = clRed
    ColorHigh = clMaroon
    ColorMid = clFuchsia
    ColorLow = clWhite
    ColorScaleHigh = 70.000000000000000000
    ColorScaleLow = 10.000000000000000000
    ColorCodingMode = ccmThreeColors
    ColorScheme = csSystem
    DecPlaceX = 0
    DecPlaceY = 0
    DecPlaceZ = 1
    FrameStyle = fsLowered
    LabDistX = 20
    LabDistY = 20
    LabDistZ = 60
    MeshVisible = True
    MeshKind = mkGrid
    Magnification = 1.000000000000000000
    MouseAction = maRotate
    MinTickX = 7
    MinTickY = 7
    MinTickZ = 2
    RangeXLow = -1.000000000000000000
    RangeYLow = -1.000000000000000000
    RangeZLow = -1.000000000000000000
    RangeXHigh = 6.000000000000000000
    RangeYHigh = 6.000000000000000000
    RangeZHigh = 10.000000000000000000
    ScaleFactX = 0.700000000000000000
    ScaleFactY = 0.700000000000000000
    ScaleFactZ = 0.700000000000000000
    ViewAngleX = 66.000000000000000000
    ViewAngleZ = 135.000000000000000000
    VisibleXCoords = True
    VisibleYCoords = True
    VisibleZCoords = True
    OnDataRendered = com3DataRendered
    OnBeforeRenderPolygon = com3BeforeRenderPolygon
    OnMouseMoveOverPlot = com3MouseMoveOverPlot
  end
  object Draw3D1: TDraw3D
    Left = 1499
    Top = 472
    Width = 400
    Height = 250
    TabOrder = 11
    DefaultCanvas = 'TGDIPlusCanvas'
  end
  object Panel2: TPanel
    Left = 360
    Top = 392
    Width = 946
    Height = 111
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 12
    Visible = False
    object Label12: TLabel
      Left = 110
      Top = 7
      Width = 723
      Height = 96
      Alignment = taCenter
      AutoSize = False
      Caption = #1048#1053#1060#1054#1056#1052#1040#1062#1048#1071' '#1054' '#1053#1040#1055#1056#1071#1046#1045#1053#1053#1054#1057#1058#1048' '#1053#1040' '#1044#1040#1058#1063#1048#1050#1040#1061
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -40
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
  end
  object CommPortDriver1: TCommPortDriver
    Port = pnCustom
    PortName = '\\.\COM3'
    OnReceiveData = CommPortDriver1ReceiveData
    OnReceivePacket = CommPortDriver1ReceiveData
    Left = 56
    Top = 256
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 32
    Top = 624
  end
  object MainMenu1: TMainMenu
    Left = 56
    Top = 200
    object N1: TMenuItem
      Caption = #1041#1086#1077#1074#1086#1081' '#1088#1077#1078#1080#1084
      object N2: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100' COM'
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100' COM'
        OnClick = N3Click
      end
    end
    object N4: TMenuItem
      Caption = #1069#1084#1091#1083#1103#1090#1086#1088
      object N5: TMenuItem
        Caption = #1069#1084#1091#1083#1103#1090#1086#1088' '#1042#1050#1051
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #1069#1084#1091#1083#1103#1090#1086#1088' '#1042#1067#1050#1051
        OnClick = N6Click
      end
    end
  end
end

object FMain: TFMain
  Left = 291
  Top = 286
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'My DDE Client 1.73!'
  ClientHeight = 215
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 8
    Top = 158
    Width = 377
    Height = 23
    Shape = bsTopLine
  end
  object Bevel1: TBevel
    Left = 8
    Top = 17
    Width = 377
    Height = 53
    Shape = bsBottomLine
  end
  object Label1: TLabel
    Left = 24
    Top = 9
    Width = 77
    Height = 13
    Caption = 'Received string:'
  end
  object l_st: TLabel
    Left = 104
    Top = 9
    Width = 281
    Height = 53
    AutoSize = False
    Caption = 'No data'#13#10
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object Label3: TLabel
    Left = 14
    Top = 164
    Width = 87
    Height = 13
    Caption = 'DDE conv. status:'
  end
  object l_dd: TLabel
    Left = 104
    Top = 164
    Width = 32
    Height = 13
    Caption = 'Closed'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    OnClick = l_ddClick
  end
  object Label5: TLabel
    Left = 61
    Top = 90
    Width = 40
    Height = 13
    Caption = 'Azimuth:'
  end
  object Label6: TLabel
    Left = 222
    Top = 90
    Width = 47
    Height = 13
    Caption = 'Elevation:'
  end
  object Label7: TLabel
    Left = 39
    Top = 122
    Width = 62
    Height = 13
    Caption = 'Uplink mode:'
  end
  object Label8: TLabel
    Left = 68
    Top = 106
    Width = 33
    Height = 13
    Caption = 'Uplink:'
  end
  object Label9: TLabel
    Left = 193
    Top = 122
    Width = 76
    Height = 13
    Caption = 'Downlink mode:'
  end
  object Label10: TLabel
    Left = 222
    Top = 106
    Width = 47
    Height = 13
    Caption = 'Downlink:'
  end
  object l_az: TLabel
    Left = 104
    Top = 90
    Width = 6
    Height = 13
    Caption = '?'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object l_el: TLabel
    Left = 272
    Top = 90
    Width = 6
    Height = 13
    Caption = '?'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object l_uf: TLabel
    Left = 104
    Top = 106
    Width = 6
    Height = 13
    Caption = '?'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object l_df: TLabel
    Left = 272
    Top = 106
    Width = 6
    Height = 13
    Caption = '?'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object l_um: TLabel
    Left = 104
    Top = 122
    Width = 6
    Height = 13
    Caption = '?'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object l_dm: TLabel
    Left = 272
    Top = 122
    Width = 6
    Height = 13
    Caption = '?'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object l_na: TLabel
    Left = 104
    Top = 74
    Width = 6
    Height = 13
    Caption = '?'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 53
    Top = 74
    Width = 48
    Height = 13
    Caption = 'Sat name:'
  end
  object SpeedButton1: TSpeedButton
    Left = 328
    Top = 186
    Width = 57
    Height = 17
    Caption = 'Exit'
    Flat = True
    OnClick = SpeedButton1Click
  end
  object l_aos: TLabel
    Left = 104
    Top = 138
    Width = 6
    Height = 13
    Caption = '?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 45
    Top = 138
    Width = 56
    Height = 13
    Caption = 'Notification:'
  end
  object Label11: TLabel
    Left = 16
    Top = 184
    Width = 53
    Height = 13
    Caption = 'TCP Client:'
  end
  object Label12: TLabel
    Left = 104
    Top = 188
    Width = 66
    Height = 13
    Caption = 'Disconnected'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    OnClick = l_ddClick
  end
  object CheckBox1: TCheckBox
    Left = 296
    Top = 160
    Width = 97
    Height = 17
    Caption = 'Stay on top'
    TabOrder = 0
    OnClick = CheckBox1Click
  end
  object Tracking: TDdeClientConv
    ServiceApplication = 'orbitron'
    DdeService = 'Orbitron'
    DdeTopic = 'Tracking'
    ConnectMode = ddeManual
    OnClose = TrackingClose
    OnOpen = TrackingOpen
    Left = 324
    Top = 7
    LinkInfo = (
      'Service Orbitron'
      'Topic Tracking')
  end
  object TrackingDataEx: TDdeClientItem
    DdeConv = Tracking
    DdeItem = 'TrackingDataEx'
    OnChange = TrackingDataExChange
    Left = 356
    Top = 7
  end
  object Server: TServerSocket
    Active = True
    Port = 1234
    ServerType = stNonBlocking
    OnClientConnect = ServerClientConnect
    OnClientDisconnect = ServerClientDisconnect
    Left = 304
    Top = 96
  end
  object XPManifest1: TXPManifest
    Left = 128
    Top = 88
  end
end

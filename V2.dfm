object Form1: TForm1
  Left = 47
  Top = 129
  Width = 933
  Height = 584
  Caption = 'Centrum Dowodzenia 3.0'
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = zapisz
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 776
    Top = 168
    Width = 145
    Height = 57
    Caption = 'PRZELICZ'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 776
    Top = 232
    Width = 145
    Height = 57
    Caption = 'SORTUJ ROZKAZY'
    TabOrder = 1
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 392
    Top = 368
    Width = 177
    Height = 177
    Caption = '4. Modu'#322' selekcji'
    TabOrder = 2
    object Label55: TLabel
      Left = 8
      Top = 44
      Width = 25
      Height = 13
      Caption = 'X: od'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label56: TLabel
      Left = 8
      Top = 68
      Width = 25
      Height = 13
      Caption = 'Y: od'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label60: TLabel
      Left = 88
      Top = 44
      Width = 12
      Height = 13
      Caption = 'do'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label58: TLabel
      Left = 88
      Top = 68
      Width = 12
      Height = 13
      Caption = 'do'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 8
      Top = 120
      Width = 52
      Height = 13
      Caption = 'Odleg'#322'osc:'
    end
    object Label57: TLabel
      Left = 64
      Top = 120
      Width = 12
      Height = 13
      Caption = 'od'
    end
    object Label59: TLabel
      Left = 120
      Top = 120
      Width = 12
      Height = 13
      Caption = 'do'
    end
    object Edit10: TEdit
      Left = 104
      Top = 64
      Width = 41
      Height = 21
      TabOrder = 0
    end
    object Edit12: TEdit
      Left = 104
      Top = 40
      Width = 41
      Height = 21
      TabOrder = 1
    end
    object Edit9: TEdit
      Left = 40
      Top = 64
      Width = 41
      Height = 21
      TabOrder = 2
    end
    object Edit11: TEdit
      Left = 40
      Top = 40
      Width = 41
      Height = 21
      TabOrder = 3
    end
    object CheckBox4: TCheckBox
      Left = 8
      Top = 13
      Width = 161
      Height = 25
      Caption = 'Modu'#322' selekcji prostok'#261'tnej'
      TabOrder = 4
    end
    object CheckBox7: TCheckBox
      Left = 8
      Top = 96
      Width = 161
      Height = 17
      Caption = 'Modu'#322' selekcji bliskich wiosek'
      TabOrder = 5
    end
    object Edit14: TEdit
      Left = 136
      Top = 112
      Width = 33
      Height = 21
      TabOrder = 6
      Text = '1'
    end
    object Button9: TButton
      Left = 8
      Top = 144
      Width = 49
      Height = 25
      Caption = 'Dodaj'
      TabOrder = 7
      OnClick = Button9Click
    end
    object Button13: TButton
      Left = 64
      Top = 144
      Width = 49
      Height = 25
      Caption = 'Wyczy'#347#263
      TabOrder = 8
      OnClick = Button14Click
    end
    object Edit17: TEdit
      Left = 80
      Top = 112
      Width = 33
      Height = 21
      TabOrder = 9
      Text = '0'
    end
  end
  object GroupBox2: TGroupBox
    Left = 264
    Top = 368
    Width = 121
    Height = 177
    Caption = '3 . Cel ataku'
    TabOrder = 3
    object ListBox2: TListBox
      Left = 8
      Top = 16
      Width = 105
      Height = 65
      ItemHeight = 13
      TabOrder = 0
    end
    object Edit8: TEdit
      Left = 8
      Top = 92
      Width = 105
      Height = 21
      TabOrder = 1
    end
    object CheckBox2: TCheckBox
      Left = 8
      Top = 120
      Width = 49
      Height = 17
      Caption = 'Gracz'
      TabOrder = 2
    end
    object CheckBox3: TCheckBox
      Left = 64
      Top = 120
      Width = 49
      Height = 17
      Caption = 'Plemi'#281
      TabOrder = 3
    end
    object Edit16: TEdit
      Left = 8
      Top = 144
      Width = 105
      Height = 21
      TabOrder = 4
      Text = '8000'
    end
  end
  object GroupBox3: TGroupBox
    Left = 136
    Top = 368
    Width = 121
    Height = 177
    Caption = '2. Atakuj'#261'cy szlacht'#261
    TabOrder = 4
    object ListBox4: TListBox
      Left = 8
      Top = 16
      Width = 105
      Height = 65
      ItemHeight = 13
      TabOrder = 0
    end
    object Edit13: TEdit
      Left = 8
      Top = 92
      Width = 105
      Height = 21
      TabOrder = 1
    end
    object CheckBox5: TCheckBox
      Left = 8
      Top = 120
      Width = 49
      Height = 17
      Caption = 'Gracz'
      TabOrder = 2
    end
    object CheckBox6: TCheckBox
      Left = 64
      Top = 120
      Width = 49
      Height = 17
      Caption = 'Plemi'#281
      TabOrder = 3
    end
    object Button10: TButton
      Left = 8
      Top = 144
      Width = 49
      Height = 25
      Caption = 'Dodaj'
      TabOrder = 4
      OnClick = Button10Click
    end
    object Button12: TButton
      Left = 64
      Top = 144
      Width = 49
      Height = 25
      Caption = 'Wyczy'#347#263
      TabOrder = 5
      OnClick = Button12Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 136
    Top = 8
    Width = 249
    Height = 353
    Caption = '1. Modu'#322' wprowadzania raport'#243'w'
    TabOrder = 5
    object Label50: TLabel
      Left = 40
      Top = 16
      Width = 19
      Height = 13
      Alignment = taCenter
      Caption = 'Offy'
    end
    object Label51: TLabel
      Left = 112
      Top = 16
      Width = 22
      Height = 13
      Alignment = taCenter
      Caption = 'Fejki'
    end
    object Label52: TLabel
      Left = 196
      Top = 16
      Width = 21
      Height = 13
      Caption = 'Cele'
    end
    object Button7: TButton
      Left = 168
      Top = 288
      Width = 73
      Height = 25
      Caption = 'Dodaj'
      TabOrder = 0
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 168
      Top = 320
      Width = 73
      Height = 25
      Caption = 'Cele'
      TabOrder = 1
      OnClick = Button8Click
    end
    object Button4: TButton
      Left = 88
      Top = 288
      Width = 73
      Height = 25
      Caption = 'Dodaj'
      TabOrder = 2
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 88
      Top = 320
      Width = 73
      Height = 25
      Caption = 'Offy/Fejki'
      TabOrder = 3
      OnClick = Button5Click
    end
    object Button3: TButton
      Left = 8
      Top = 288
      Width = 73
      Height = 25
      Caption = 'Dodaj'
      TabOrder = 4
      OnClick = Button3Click
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 320
      Width = 73
      Height = 25
      Caption = 'Usu'#324' dane'
      TabOrder = 5
    end
    object Memo3: TMemo
      Left = 168
      Top = 32
      Width = 73
      Height = 249
      TabOrder = 6
    end
    object Memo2: TMemo
      Left = 88
      Top = 32
      Width = 73
      Height = 249
      TabOrder = 7
    end
    object Memo1: TMemo
      Left = 8
      Top = 32
      Width = 73
      Height = 249
      TabOrder = 8
    end
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 8
    Width = 121
    Height = 209
    Caption = 'Atakuj'#261'cy gracze'
    TabOrder = 6
    object ListBox3: TListBox
      Left = 8
      Top = 16
      Width = 105
      Height = 153
      ItemHeight = 13
      TabOrder = 0
    end
    object Button6: TButton
      Left = 8
      Top = 176
      Width = 105
      Height = 25
      Caption = 'Usu'#324' gracza'
      TabOrder = 1
      OnClick = Button6Click
    end
  end
  object GroupBox6: TGroupBox
    Left = 776
    Top = 8
    Width = 145
    Height = 65
    Caption = 'Test danych'
    TabOrder = 7
    object Label15: TLabel
      Left = 10
      Top = 16
      Width = 30
      Height = 13
      Caption = 'OFFY:'
    end
    object Label18: TLabel
      Left = 78
      Top = 16
      Width = 51
      Height = 13
      Caption = 'NIE WIEM'
    end
    object Label16: TLabel
      Left = 10
      Top = 32
      Width = 59
      Height = 13
      Caption = 'SZLACHTA:'
    end
    object Label19: TLabel
      Left = 78
      Top = 32
      Width = 51
      Height = 13
      Caption = 'NIE WIEM'
    end
    object Label17: TLabel
      Left = 10
      Top = 48
      Width = 31
      Height = 13
      Caption = 'FEJKI:'
    end
    object Label20: TLabel
      Left = 78
      Top = 48
      Width = 51
      Height = 13
      Caption = 'NIE WIEM'
    end
  end
  object GroupBox7: TGroupBox
    Left = 392
    Top = 8
    Width = 177
    Height = 353
    Caption = 'Dane pocz'#261'tkowe'
    TabOrder = 8
    object Label2: TLabel
      Left = 8
      Top = 15
      Width = 78
      Height = 13
      Caption = 'Predko'#347#263' '#347'wiata'
    end
    object Label47: TLabel
      Left = 8
      Top = 39
      Width = 94
      Height = 13
      Caption = 'Limit atak'#243'w gracza'
    end
    object Label3: TLabel
      Left = 8
      Top = 66
      Width = 157
      Height = 13
      Caption = 'Predkosc najwolniejszej jednostki'
    end
    object Label4: TLabel
      Left = 8
      Top = 117
      Width = 53
      Height = 13
      Caption = 'Czas ataku'
    end
    object Label5: TLabel
      Left = 8
      Top = 184
      Width = 143
      Height = 13
      Caption = 'Maksymalny czas podrozy w h'
    end
    object Label6: TLabel
      Left = 8
      Top = 224
      Width = 148
      Height = 13
      Caption = 'Ilosc offow atakuj'#261'cych wiosk'#281
    end
    object Label45: TLabel
      Left = 8
      Top = 264
      Width = 151
      Height = 13
      Caption = 'Ilosc szlachty atakujacej wiosk'#281
    end
    object Label46: TLabel
      Left = 8
      Top = 304
      Width = 153
      Height = 13
      Caption = 'Ilosc fejk'#243'w atakuj'#261'cych wiosk'#281
    end
    object Label53: TLabel
      Left = 8
      Top = 141
      Width = 14
      Height = 13
      Caption = 'Od'
    end
    object Label54: TLabel
      Left = 8
      Top = 163
      Width = 14
      Height = 13
      Caption = 'Do'
    end
    object Edit1: TEdit
      Left = 112
      Top = 14
      Width = 33
      Height = 21
      TabOrder = 0
      Text = '1'
    end
    object Edit7: TEdit
      Left = 112
      Top = 38
      Width = 33
      Height = 21
      TabOrder = 1
      Text = '100'
    end
    object ListBox1: TListBox
      Left = 8
      Top = 80
      Width = 161
      Height = 33
      ItemHeight = 13
      Items.Strings = (
        'Pikinierzy'
        'Miecznicy'
        'Zwiadowcy'
        'Lekka kawleria'
        'Ci'#281#380'ka kawaleria'
        'Tarany'
        'Szlachta'
        '')
      TabOrder = 2
      OnClick = ListBox1Click
    end
    object Edit2: TEdit
      Left = 32
      Top = 158
      Width = 105
      Height = 21
      TabOrder = 3
      Text = '2009-07-07 13:00:00'
    end
    object Edit3: TEdit
      Left = 8
      Top = 200
      Width = 161
      Height = 21
      TabOrder = 4
      Text = '120'
    end
    object Edit4: TEdit
      Left = 8
      Top = 240
      Width = 161
      Height = 21
      TabOrder = 5
      Text = '6'
    end
    object Edit5: TEdit
      Left = 8
      Top = 280
      Width = 161
      Height = 21
      TabOrder = 6
      Text = '4'
    end
    object Edit6: TEdit
      Left = 8
      Top = 320
      Width = 161
      Height = 21
      TabOrder = 7
      Text = '10'
    end
    object Edit15: TEdit
      Left = 32
      Top = 136
      Width = 105
      Height = 21
      TabOrder = 8
      Text = '2009-07-07 8:00:00'
    end
  end
  object GroupBox8: TGroupBox
    Left = 576
    Top = 64
    Width = 193
    Height = 145
    Caption = 'Offy'
    TabOrder = 9
    object Label12: TLabel
      Left = 8
      Top = 16
      Width = 60
      Height = 13
      Caption = 'Liczba off'#243'w'
    end
    object Label13: TLabel
      Left = 8
      Top = 32
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label7: TLabel
      Left = 8
      Top = 48
      Width = 117
      Height = 13
      Caption = 'Liczba pasuj'#261'cych off'#243'w'
    end
    object Label1: TLabel
      Left = 8
      Top = 64
      Width = 6
      Height = 13
      Caption = '0'
      Color = clSilver
      ParentColor = False
    end
    object Label8: TLabel
      Left = 8
      Top = 80
      Width = 160
      Height = 13
      Caption = 'Liczba cel'#243'w atakowanych offami'
    end
    object Label9: TLabel
      Left = 8
      Top = 96
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label10: TLabel
      Left = 8
      Top = 112
      Width = 102
      Height = 13
      Caption = 'Liczba wolnych off'#243'w'
    end
    object Label11: TLabel
      Left = 8
      Top = 128
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label39: TLabel
      Left = 160
      Top = 8
      Width = 20
      Height = 13
      Caption = 'LPC'
    end
    object Label40: TLabel
      Left = 168
      Top = 24
      Width = 6
      Height = 13
      Caption = '0'
    end
  end
  object GroupBox9: TGroupBox
    Left = 576
    Top = 216
    Width = 193
    Height = 145
    Caption = 'Szlachta'
    TabOrder = 10
    object Label21: TLabel
      Left = 8
      Top = 16
      Width = 125
      Height = 13
      Caption = 'Liczba atak'#243'w do szlachty'
    end
    object Label22: TLabel
      Left = 8
      Top = 32
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label25: TLabel
      Left = 8
      Top = 48
      Width = 174
      Height = 13
      Caption = 'Liczba pasuj'#261'cych wiosek z szlacht'#261
    end
    object Label26: TLabel
      Left = 8
      Top = 64
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label27: TLabel
      Left = 8
      Top = 80
      Width = 171
      Height = 13
      Caption = 'Liczba cel'#243'w atakowanych szlacht'#261
    end
    object Label28: TLabel
      Left = 8
      Top = 96
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label29: TLabel
      Left = 8
      Top = 112
      Width = 114
      Height = 13
      Caption = 'Liczba wolnych atak'#243'w '
    end
    object Label30: TLabel
      Left = 8
      Top = 128
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label41: TLabel
      Left = 160
      Top = 8
      Width = 20
      Height = 13
      Caption = 'LPC'
    end
    object Label43: TLabel
      Left = 168
      Top = 24
      Width = 6
      Height = 13
      Caption = '0'
    end
  end
  object GroupBox10: TGroupBox
    Left = 576
    Top = 368
    Width = 193
    Height = 145
    Caption = 'Fejki'
    TabOrder = 11
    object Label31: TLabel
      Left = 8
      Top = 16
      Width = 65
      Height = 13
      Caption = 'Liczba fejk'#243'w'
    end
    object Label32: TLabel
      Left = 8
      Top = 32
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label33: TLabel
      Left = 8
      Top = 48
      Width = 122
      Height = 13
      Caption = 'Liczba pasuj'#261'cych fejk'#243'w'
    end
    object Label34: TLabel
      Left = 8
      Top = 64
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label35: TLabel
      Left = 8
      Top = 80
      Width = 165
      Height = 13
      Caption = 'Liczba cel'#243'w atakowanych fejkami'
    end
    object Label36: TLabel
      Left = 8
      Top = 96
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label37: TLabel
      Left = 8
      Top = 112
      Width = 107
      Height = 13
      Caption = 'Liczba wolnych fejk'#243'w'
    end
    object Label38: TLabel
      Left = 8
      Top = 128
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label42: TLabel
      Left = 160
      Top = 8
      Width = 20
      Height = 13
      Caption = 'LPC'
    end
    object Label44: TLabel
      Left = 168
      Top = 24
      Width = 6
      Height = 13
      Caption = '0'
    end
  end
  object GroupBox11: TGroupBox
    Left = 776
    Top = 80
    Width = 145
    Height = 81
    Caption = 'Statystyki'
    TabOrder = 12
    object Label23: TLabel
      Left = 8
      Top = 16
      Width = 127
      Height = 13
      Caption = 'Liczba oryginalnych fejk'#243'w'
    end
    object Label24: TLabel
      Left = 8
      Top = 32
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label48: TLabel
      Left = 8
      Top = 48
      Width = 104
      Height = 13
      Caption = #321#261'czna liczba atak'#243'w'
    end
    object Label49: TLabel
      Left = 8
      Top = 64
      Width = 6
      Height = 13
      Caption = '0'
    end
  end
  object Button11: TButton
    Left = 776
    Top = 296
    Width = 145
    Height = 57
    Caption = 'Przydziel wioski graczom'
    TabOrder = 13
    OnClick = Button11Click
  end
  object GroupBox12: TGroupBox
    Left = 576
    Top = 8
    Width = 193
    Height = 49
    Caption = 'Modu'#322' ataku dok'#322'adnego'
    TabOrder = 14
    object CheckBox8: TCheckBox
      Left = 8
      Top = 24
      Width = 177
      Height = 17
      Caption = 'Atakuj dok'#322'adnie i z szlacht'#261
      TabOrder = 0
    end
  end
end

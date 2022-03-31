{
   My DDE Client is an example of user's custom driver for Orbitron.
   version 1.02, released 2003.11.07
           1.03, released 2004.09.04
           1.04, released 2004.09.10
           1.05, released 2005.02.26
   (C) 2003-2005 by Sebastian Stoff
   sebastian@stoff.pl
   www.stoff.pl

   You can use this source to receive tracking data from Orbitron and send it
   to your rotor/radio hardware via COM/LPT/USB interfaces. Other purposes are
   also allowed, depending on your invention...
   To change this source code into the driver, you must write code specific to
   hardware you have in 'UpdateRotorAndRadio' procedure. Please find it
   on the end of this file.

   Detailed information are available in READ_ME.TXT file.

   CHANGING, COMPILING AND FREE DISTRIBUTING OF THIS PROGRAM/SOURCES IS
   ALLOWED FOR ***ORBITRON*** RELATED PURPOSES WITHOUT MY PERMISSION.
}

unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DdeMan, StdCtrls, ExtCtrls, Buttons, Registry, ComCtrls, ScktComp, XPMan;

type
  TSatData = record
    name        : String;       //satellite name
    azm,elv     : Double;       //observation angles
    upf,dnf     : Double;       //uplink and downlink frequencies (with doppler shift)
    upm,dnm     : String;       //uplink and downlink modes
  end;
  TFMain = class(TForm)
    Tracking: TDdeClientConv;
    TrackingDataEx: TDdeClientItem;
    Label1: TLabel;
    l_st: TLabel;
    Label3: TLabel;
    l_dd: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Bevel1: TBevel;
    l_az: TLabel;
    l_el: TLabel;
    l_uf: TLabel;
    l_df: TLabel;
    l_um: TLabel;
    l_dm: TLabel;
    Bevel2: TBevel;
    l_na: TLabel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    l_aos: TLabel;
    Label2: TLabel;
    Server: TServerSocket;
    Label11: TLabel;
    Label12: TLabel;
    CheckBox1: TCheckBox;
    XPManifest1: TXPManifest;
    procedure TrackingOpen(Sender: TObject);
    procedure TrackingClose(Sender: TObject);
    procedure TrackingDataExChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure l_ddClick(Sender: TObject);
    procedure ServerClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ParseString(s: String; var data: TSatData);
    procedure PrintData(data: TSatData);
    procedure UpdateRotorAndRadio();
  end;

var
  FMain   : TFMain;
  SatData : TSatData;
  Reg     : TRegistry;
  PathP   : String;
  AOS     : String;

implementation

{$R *.DFM}

procedure Replace(var s: String; subs1,subs2: String);
var i : Integer;
begin
  if subs1='' then Exit;
  if subs1=subs2 then Exit;
  i:=Pos(subs1,s);
  while i>0 do begin
    Delete(s,i,Length(subs1));
    Insert(subs2,s,i);
    i:=Pos(subs1,s);
  end;
end;

function FieldToReal(s: String):Real;
var c : Integer;
begin
  val(s,result,c);
  if c>0 then result:=0;
end;

function GetField(source,field: String):String;
var p1,p2  : Integer;
    quotes : Boolean;
    s2     : String;

  function FindField(source,field: String):Integer;
  var i      : Integer;
      quotes : Boolean;
  begin
    quotes:=False;
    for i:=1 to Length(source) do begin
      if source[i]='"' then begin
        quotes:=not quotes;
        Continue;
      end;

      if quotes then source[i]:='-';
    end;
    result:=pos(field,source);
  end;

begin
  source:=' '+source;
  field:=UpperCase(field);
  field:=' '+field;
  p1:=FindField(source,field);
  if p1=0 then begin
    result:='';
    Exit;
  end;

  s2:='';
  p2:=p1+Length(field);
  quotes:=False;
  while p2<=Length(source) do begin
    if source[p2]='"' then begin
      quotes:=not quotes;
      Inc(p2);
      Continue;
    end;

    if (source[p2]=' ') and not quotes then Break;

    s2:=s2+source[p2];
    Inc(p2);
  end;
  result:=s2;
end;

procedure TFMain.ParseString(s: String; var data: TSatData);
begin
  if s='' then with data do begin
    name:='';
    azm:=0;
    elv:=0;
    upf:=0;
    dnf:=0;
    upm:='';
    dnm:='';
    AOS:='';
    Exit;
  end;

  s:=UpperCase(s);
  Replace(s,',','.');
  with data do begin
    name:=GetField(s,'SN');
    azm:=FieldToReal(GetField(s,'AZ'));
    elv:=FieldToReal(GetField(s,'EL'));
    upf:=FieldToReal(GetField(s,'UP'));
    dnf:=FieldToReal(GetField(s,'DN'));
    upm:=GetField(s,'UM');
    dnm:=GetField(s,'DM');
    AOS:=GetField(s,'AOS');
  end;
end;

procedure TFMain.PrintData(data: TSatData);
begin
  with data do begin
    l_na.Caption:=name;
    l_az.Caption:=FloatToStrF(azm,ffFixed,4,1);
    l_el.Caption:=FloatToStrF(elv,ffFixed,4,1);
    l_uf.Caption:=FloatToStrF(upf,ffFixed,12,0)+' Hz';
    l_df.Caption:=FloatToStrF(dnf,ffFixed,12,0)+' Hz';
    l_um.Caption:=upm;
    l_dm.Caption:=dnm;
  end;
  if AOS<>'' then l_aos.Caption:='AOS ('+AOS+')' else l_aos.Caption:='None'; 
end;

procedure TFMain.SpeedButton1Click(Sender: TObject);
begin
  FMain.Close;
end;

procedure TFMain.TrackingOpen(Sender: TObject);
begin
  l_dd.Caption:='Opened';
end;

procedure TFMain.TrackingClose(Sender: TObject);
begin
  l_dd.Caption:='Closed';
  l_st.Caption:='No data';
  ParseString('',SatData);
  PrintData(SatData);
end;

procedure TFMain.TrackingDataExChange(Sender: TObject);
var s : String;
begin
  s:=Trim(TrackingDataEx.Text);
  if s='' then l_st.Caption:='No data' else
    l_st.Caption:=s;
  ParseString(s,SatData);

  PrintData(SatData);
  UpdateRotorAndRadio();
end;

procedure TFMain.FormCreate(Sender: TObject);
begin

//obs³uga serwera
server.Active:= true;

  ParseString('',SatData);
  PrintData(SatData);

  PathP:=ExtractFileDir(ParamStr(0));
  if PathP[length(PathP)]<>'\' then PathP:=PathP+'\';
  ChDir(PathP);

  If not FileExists(PathP+'Orbitron.exe') then begin
    Reg:=TRegistry.Create;
    try
      if Reg.OpenKey('\Software\Stoff\Orbitron',True) then
        Tracking.ServiceApplication:=Reg.ReadString('Path')+'orbitron';
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  Tracking.OpenLink;
end;

procedure TFMain.l_ddClick(Sender: TObject);
begin
  Tracking.OpenLink;
end;

procedure TFMain.UpdateRotorAndRadio();
begin
if label12.Caption = 'Connected' then begin
server.socket.Connections[0].SendText(l_st.Caption);
end;
end;

procedure TFMain.ServerClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
         label12.Caption:= 'Connected';
         server.socket.Connections[0].SendText(l_st.Caption);
end;

procedure TFMain.ServerClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
label12.Caption:= 'Disconnected';
end;



procedure TFMain.CheckBox1Click(Sender: TObject);
begin
if  fmain.FormStyle = fsNormal then
     fmain.FormStyle :=fsStayOnTop
     else
       fmain.FormStyle :=fsNormal
end;

end.

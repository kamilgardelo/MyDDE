program MyDDE;

uses
  SysUtils, Forms,
  main in 'main.pas' {FMain};

{$R *.RES}

begin
  DecimalSeparator:='.';
  Application.Initialize;
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.

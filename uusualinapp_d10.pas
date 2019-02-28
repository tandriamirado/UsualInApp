unit uusualinapp_d10;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls;

type
  TCustomControl1 = class(TCustomControl)
  private
    { Déclarations privées }
  protected
    { Déclarations protégées }
  public
    { Déclarations publiques }
  published
    { Déclarations publiées }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('System', [TCustomControl1]);
end;

end.

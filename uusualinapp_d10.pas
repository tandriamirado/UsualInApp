unit uusualinapp_d10;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls;

type
  TCustomControl1 = class(TCustomControl)
  private
    { D�clarations priv�es }
  protected
    { D�clarations prot�g�es }
  public
    { D�clarations publiques }
  published
    { D�clarations publi�es }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('System', [TCustomControl1]);
end;

end.

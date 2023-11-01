unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnHitung: TButton;
    btnUlangi: TButton;
    btnClose: TButton;
    CBKode: TComboBox;
    EQTY: TEdit;
    ENama: TEdit;
    EHarga: TEdit;
    ESubTotal: TEdit;
    EDiskon: TEdit;
    ETotal: TEdit;
    kode: TLabel;
    kode1: TLabel;
    kode2: TLabel;
    kode3: TLabel;
    kode4: TLabel;
    kode5: TLabel;
    kode6: TLabel;
    procedure btnHitungClick(Sender: TObject);
    procedure btnUlangiClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnHitungClick(Sender: TObject);
var
  qty, harga, subtotal, diskon, total: Integer;
begin
  // Validasi Quantity
  if not TryStrToInt(EQTY.Text, qty) then
  begin
    ShowMessage('Masukkan jumlah yang valid');
    Exit;
  end;

  if (qty < 1) or (qty > 10) then
  begin
    ShowMessage('Quantity tidak boleh lebih dari 10!');
    Exit;
  end;

  case CBKode.ItemIndex of
    0: begin
         ENama.Text := 'Speaker';
         harga := 50000;
       end;
    1: begin
         ENama.Text := 'Mouse';
         harga := 25000;
       end;
    2: begin
         ENama.Text := 'Harddisk';
         harga := 750000;
       end;
    3: begin
         ENama.Text := 'Mouse Pad';
         harga := 5000;
       end;
  else
    ShowMessage('Pilih kode barang yang valid');
    Exit;
  end;

  EHarga.Text := IntToStr(harga);

  // Hitung subtotal
  subtotal := harga * qty;
  ESubTotal.Text := FormatFloat('#,##0.00', "Rp.", SubTotal);

  // Hitung diskon
  if subtotal >= 100000 then
    diskon := 15
  else if subtotal >= 50000 then
    diskon := 10
  else if subtotal >= 25000 then
    diskon := 5
  else
    diskon := 0;

  EDiskon.Text := IntToStr(diskon) + '%';

  // Hitung total
  total := subtotal - (subtotal * diskon div 100);
  ETotal.Text := FormatFloat('#,##0.00', Total);

end;

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.btnUlangiClick(Sender: TObject);
begin
  // Reset
  CBKode.ItemIndex := -1;
  EQTY.Text := '';
  ENama.Text := '';
  EHarga.Text := '';
  ESubTotal.Text := '';
  EDiskon.Text := '';
  ETotal.Text := '';
end;

end.

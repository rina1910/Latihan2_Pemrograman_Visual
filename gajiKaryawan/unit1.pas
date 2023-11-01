unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type
  { TForm1 }

  TForm1 = class(TForm)
    btnHitung: TButton;
    btnIsiData: TButton;
    btnClose: TButton;
    cbJabatan: TComboBox;
    edtTotalGaji: TEdit;
    edtTunjangan: TEdit;
    edtGapok: TEdit;
    edtNama: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    rbHonorer: TRadioButton;
    rbTetap: TRadioButton;
    rgStatus: TRadioGroup;
    procedure btnHitungClick(Sender: TObject);
    procedure btnIsiDataClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure cbJabatanChange(Sender: TObject);
    procedure rbHonorerChange(Sender: TObject);
    procedure rbTetapChange(Sender: TObject);
    procedure rgStatusClick(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.rbHonorerChange(Sender: TObject);
begin
  if rbHonorer.Checked then
    edtTunjangan.Text := '500000';
end;

procedure TForm1.rbTetapChange(Sender: TObject);
begin
  if rbTetap.Checked then
    edtTunjangan.Text := '1500000';
end;

procedure TForm1.rgStatusClick(Sender: TObject);
begin

end;

procedure TForm1.btnHitungClick(Sender: TObject);
var
  GajiPokok, TotalGaji, GajiBersih: Double;
  StatusTunjangan: Double;
begin
  GajiPokok := StrToFloat(edtGapok.Text);
  StatusTunjangan := StrToFloat(edtTunjangan.Text);

  TotalGaji := GajiPokok + StatusTunjangan;

  GajiBersih := TotalGaji;

  edtTotalGaji.Text := FormatFloat('#,##0.00', TotalGaji);
end;

procedure TForm1.cbJabatanChange(Sender: TObject);
var
  Jabatan: string;
  GajiPokok: Double;
begin
  Jabatan := cbJabatan.Items[cbJabatan.ItemIndex];

  case Jabatan of
    'direktur': GajiPokok := 5000000;
    'manager': GajiPokok := 3000000;
    'karyawan': GajiPokok := 1000000;
  else
    GajiPokok := 0;
  end;

  edtGapok.Text := FloatToStr(GajiPokok);
end;

procedure TForm1.btnIsiDataClick(Sender: TObject);
begin
  edtNama.Text := '';
  cbJabatan.ItemIndex := -1; // Menghapus pilihan jabatan
  edtGapok.Text := '';
  edtTunjangan.Text := '';
  edtTotalGaji.Text := '';
  rgStatus.ItemIndex := -1; // Menghapus pilihan status
  rbTetap.Checked := False;
  rbHonorer.Checked := False;
end;

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.


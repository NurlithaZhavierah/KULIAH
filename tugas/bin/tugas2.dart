import 'dart:io';
void main() {
//type data yang dipakai nurlitha
  String? namaKaryawan;
  int ? jamKerja;
  double ? upahPerjam;
  String? status;
  bool ? statusTetap;
  double ? gajiKotor;
  double ? pajak;
  double ? gajiBersih;
  
  stdout.write("Masukkan Nama Karyawan: ");
  namaKaryawan = stdin.readLineSync();

  stdout.write("Masukkan Jumlah Jam Kerja per Minggu: ");
  jamKerja = int.parse(stdin.readLineSync()!);

  stdout.write("Masukkan Upah per Jam: ");
  upahPerjam = double.parse(stdin.readLineSync()!);

  stdout.write("Apakah karyawan tetap? (y/n): ");
  status = stdin.readLineSync();
  statusTetap = (status == 'y' || status == 'Y');
   gajiKotor = jamKerja * upahPerjam;

   pajak;
  if (statusTetap) {
    pajak = 0.10 * gajiKotor; // 10% untuk karyawan tetap
  } else {
    pajak = 0.05 * gajiKotor; // 5% untuk karyawan kontrak
  }
  
   gajiBersih = gajiKotor - pajak;

  print("\n=== Data Gaji Karyawan ===");
  print("Nama Karyawan : $namaKaryawan");
  print("Gaji Kotor    : Rp. $gajiKotor");
  print("Pajak         : Rp. $pajak");
  print("Gaji Bersih   : Rp. $gajiBersih");
}

// switch case = memilih satu dari banyak kode blok
import 'dart:io';
void main() {
  stdout.write("Masukkan angka (1-12): ");
  String? input = stdin.readLineSync();
  if (input != null) {
  int bulan = int.parse(input);
    switch (bulan) {
      case 1:
        print("Januari");
        break;
      case 2:
        print("Februari");
        break;
      case 3:
        print("Maret");
        break;
      case 4:
        print("April");
        break;
      case 5:
        print("Mei");
        break;
      case 6:
        print("Juni");
        break;
      case 7:
        print("Juli");
        break;
      case 8:
        print("Agustus");
        break;
      case 9:
        print("September");
        break;
      case 10:
        print("Oktober");
        break;
      case 11:
        print("November");
        break;
      case 12:
        print("Desember");
        break;
      default:
        print("Angka harus antara 1 sampai 12!");
    }
  }
}
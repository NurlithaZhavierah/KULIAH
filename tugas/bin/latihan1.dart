import 'dart:io';

void main() {
  stdout.write("Masukkan sebuah angka: ");
  String? input = stdin.readLineSync();

  if (input != null) {
    int angka = int.parse(input);

    if (angka % 2 == 0) {
      print("angka $angka adalah Genap");
    } else {
      print("angka $angka adalah Ganjil");
    }
  } else {
    print("Input tidak boleh kosong!");
  }
}
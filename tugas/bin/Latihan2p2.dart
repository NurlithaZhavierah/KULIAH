import 'dart:io';
  
  void main(){
    int? umur;
  stdout.write("Masukkan Umur anda: ");
  umur = int.parse(stdin.readLineSync()!);

String kategori;
    if (umur >= 0 && umur <= 12) {
      kategori = "Anak-anak";
    } else if (umur >= 13 && umur <= 17) {
      kategori = "Remaja";
    } else if (umur >= 18 && umur <= 59) {
      kategori = "Dewasa";
    } else if (umur >= 60) {
      kategori = "Lansia";
    } else {
      kategori = "Umur tidak valid";
    }
    print("Kategori umur Anda: $kategori");
  }
import 'dart:io';
void main() {
  List<Map<String, dynamic>> mahasiswa = [];
  print(" Entry Data Mahasiswa Informatika ");
  for (int i = 1; i <= 10; i++) {
    print("\nMahasiswa ke-$i");

    stdout.write("Nama      : ");
    String? nama = stdin.readLineSync();

    stdout.write("NPM       : ");
    String? npm = stdin.readLineSync();

    stdout.write("Angkatan  : ");
    int? angkatan = int.parse(stdin.readLineSync()!);

    mahasiswa.add({
      "nama": nama,
      "npm": npm,
      "angkatan": angkatan
    });
  }
  print("\n=== Pencarian Data Mahasiswa Informatika ===");
  stdout.write("Masukkan nama mahasiswa yang ingin dicari: ");
  String? cari = stdin.readLineSync();
  bool ditemukan = false;

  for (var mhs in mahasiswa) {
    if (mhs["nama"]!.toLowerCase() == cari!.toLowerCase()) {
      print("\nData mahasiswa ditemukan!");
      print([
        mhs["nama"],
        mhs["NPM"],
        mhs["angkatan"]
      ]);
      ditemukan = true;
      break;
    }
  }
  if (!ditemukan) {
    print("\nData mahasiswa dengan nama '$cari' tidak ditemukan.");
  }
}
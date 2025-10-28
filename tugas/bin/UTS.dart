
// Aplikasi Pemesanan Transportasi "SmartRide"
// Memenuhi: abstraksi, pewarisan, enkapsulasi, polimorfisme, fungsi global

import 'dart:math';

// -------------------- KELAS ABSTRAK --------------------
abstract class Transportasi {
  final String id;
  String nama;
  double _tarifDasar; // private (enkapsulasi)
  int kapasitas;

  Transportasi({
    required this.id,
    required this.nama,
    required double tarifDasar,
    required this.kapasitas,
  }) : _tarifDasar = tarifDasar;

  // Getter untuk _tarifDasar (sesuai soal)
  double get tarifDasar => _tarifDasar;

  // Method abstrak -> dipaksa diimplementasikan oleh subclass
  double hitungTarif(int jumlahPenumpang);

  // Menampilkan info transportasi (bisa dioverride)
  void tampilInfo() {
    print('ID: $id | Nama: $nama | Tarif Dasar: ${_tarifDasar.toStringAsFixed(2)} | Kapasitas: $kapasitas');
  }
}

// -------------------- KELAS TURUNAN --------------------
// a. Taksi
class Taksi extends Transportasi {
  double jarak; // dalam km

  Taksi({
    required String id,
    required String nama,
    required double tarifDasar,
    required int kapasitas,
    required this.jarak,
  }) : super(id: id, nama: nama, tarifDasar: tarifDasar, kapasitas: kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    // Asumsi: taksi bayar per jarak * tarifDasar
    return tarifDasar * jarak;
  }

  @override
  void tampilInfo() {
    super.tampilInfo();
    print('Tipe: Taksi | Jarak: ${jarak} km');
  }
}

// b. Bus
class Bus extends Transportasi {
  bool adaWifi;

  Bus({
    required String id,
    required String nama,
    required double tarifDasar,
    required int kapasitas,
    required this.adaWifi,
  }) : super(id: id, nama: nama, tarifDasar: tarifDasar, kapasitas: kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    // total = (_tarifDasar * jumlahPenumpang) + (adaWifi ? 5000 : 0)
    double tambahanWifi = adaWifi ? 5000.0 : 0.0;
    return (tarifDasar * jumlahPenumpang) + tambahanWifi;
  }

  @override
  void tampilInfo() {
    super.tampilInfo();
    print('Tipe: Bus | WiFi: ${adaWifi ? "Ada" : "Tidak"}');
  }
}

// c. Pesawat
class Pesawat extends Transportasi {
  String kelas; // "Ekonomi" atau "Bisnis"

  Pesawat({
    required String id,
    required String nama,
    required double tarifDasar,
    required int kapasitas,
    required this.kelas,
  }) : super(id: id, nama: nama, tarifDasar: tarifDasar, kapasitas: kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    // total = _tarifDasar * jumlahPenumpang * (kelas == "Bisnis" ? 1.5 : 1.0)
    double faktorKelas = (kelas.toLowerCase() == 'bisnis') ? 1.5 : 1.0;
    return tarifDasar * jumlahPenumpang * faktorKelas;
  }

  @override
  void tampilInfo() {
    super.tampilInfo();
    print('Tipe: Pesawat | Kelas: $kelas');
  }
}

// -------------------- KELAS PEMESANAN --------------------
class Pemesanan {
  final String idPemesanan;
  final String namaPelanggan;
  final Transportasi transportasi;
  final int jumlahPenumpang;
  final double totalTarif;

  Pemesanan({
    required this.idPemesanan,
    required this.namaPelanggan,
    required this.transportasi,
    required this.jumlahPenumpang,
    required this.totalTarif,
  });

  void cetakStruk() {
    print('----------------------------------------');
    print('STRUK PEMESANAN');
    print('ID Pemesanan : $idPemesanan');
    print('Nama Pelanggan: $namaPelanggan');
    print('Transportasi : ${transportasi.nama} (ID: ${transportasi.id})');
    print('Jumlah Penumpang: $jumlahPenumpang');
    print('Total Tarif  : Rp ${totalTarif.toStringAsFixed(2)}');
    print('----------------------------------------\n');
  }

  // Simulasi penyimpanan ke "database" (Map)
  Map<String, dynamic> toMap() {
    return {
      'idPemesanan': idPemesanan,
      'namaPelanggan': namaPelanggan,
      'transportasi': {
        'id': transportasi.id,
        'nama': transportasi.nama,
        'tarifDasar': transportasi.tarifDasar,
        'kapasitas': transportasi.kapasitas,
        'tipe': transportasi.runtimeType.toString(),
      },
      'jumlahPenumpang': jumlahPenumpang,
      'totalTarif': totalTarif,
    };
  }
}

// -------------------- FUNGSI GLOBAL --------------------
String _generateId(String prefix) {
  final int n = DateTime.now().microsecondsSinceEpoch;
  final int r = Random().nextInt(1000);
  return '$prefix-$n-$r';
}

Pemesanan buatPemesanan(Transportasi t, String nama, int jumlahPenumpang) {
  // Cek kapasitas (enkapsulasi & validasi sederhana)
  if (jumlahPenumpang <= 0) {
    throw ArgumentError('Jumlah penumpang harus > 0');
  }
  if (jumlahPenumpang > t.kapasitas) {
    throw ArgumentError('Jumlah penumpang melebihi kapasitas ${t.kapasitas}');
  }

  double total = t.hitungTarif(jumlahPenumpang);
  String idP = _generateId('PM');
  return Pemesanan(
    idPemesanan: idP,
    namaPelanggan: nama,
    transportasi: t,
    jumlahPenumpang: jumlahPenumpang,
    totalTarif: total,
  );
}

void tampilSemuaPemesanan(List<Pemesanan> daftar) {
  if (daftar.isEmpty) {
    print('Belum ada pemesanan.\n');
    return;
  }
  print('=== RIWAYAT PEMESANAN (${daftar.length}) ===\n');
  for (var p in daftar) {
    p.cetakStruk();
  }
}

// -------------------- MAIN --------------------
void main() {
  // Membuat objek transportasi
  var taksi1 = Taksi(
    id: 'TAXI-001',
    nama: 'BlueTaxi',
    tarifDasar: 3000.0, // per km
    kapasitas: 4,
    jarak: 12.5,
  );

  var bus1 = Bus(
    id: 'BUS-001',
    nama: 'TransKota',
    tarifDasar: 8000.0, // per penumpang
    kapasitas: 40,
    adaWifi: true,
  );

  var pesawat1 = Pesawat(
    id: 'PLN-001',
    nama: 'Garuda Mini',
    tarifDasar: 500000.0, // per penumpang
    kapasitas: 150,
    kelas: 'Bisnis',
  );

  // Tampilkan info (demonstrasi polymorphism & overriding)
  print('--- Info Transportasi ---');
  taksi1.tampilInfo();
  print('');
  bus1.tampilInfo();
  print('');
  pesawat1.tampilInfo();
  print('\n');

  // Membuat pemesanan
  List<Pemesanan> daftarPemesanan = [];

  try {
    var p1 = buatPemesanan(taksi1, 'Andi', 2); // untuk taksi jarak sudah tersimpan di objek
    daftarPemesanan.add(p1);

    var p2 = buatPemesanan(bus1, 'Budi', 3);
    daftarPemesanan.add(p2);

    var p3 = buatPemesanan(pesawat1, 'Citra', 2);
    daftarPemesanan.add(p3);

    // contoh gagal (melebihi kapasitas) -> uncomment untuk test error
    // var p4 = buatPemesanan(taksi1, 'Deni', 6);

  } catch (e) {
    print('Error saat membuat pemesanan: $e');
  }

  // Tampilkan semua pemesanan
  tampilSemuaPemesanan(daftarPemesanan);

  // Tampilkan bentuk map (simulasi simpan ke db)
  print('--- Simulasi toMap() pada pemesanan pertama ---');
  if (daftarPemesanan.isNotEmpty) {
    print(daftarPemesanan.first.toMap());
  }
}

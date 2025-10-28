import 'dart:math';

abstract class Transportasi{
  final String id;
  String nama;
  double _tarifDasar;
  int kapasitas;

  Transportasi({required this.id, required this.nama, required double tarifDasar,required this.kapasitas }) : _tarifDasar = tarifDasar;
  double get tarifDasar => _tarifDasar;
  double hitungTarif(int jumlahPenumpang);
  void tampilInfo()=> print('ID: $id | Nama: $nama |Tarif: ${_tarifDasar.toStringAsFixed(2)}| Kapasitas: $kapasitas');
}
class Taksi extends Transportasi{
  double jarak;
  Taksi({required String id, required String nama, required double tarifDasar, required int kapasitas, required this.jarak})
      :super(id: id, nama: nama, tarifDasar: tarifDasar, kapasitas: kapasitas);
      @override
      double hitungTarif(int jumlahPenumpang)=> tarifDasar*jarak;
    @override
  void tampilInfo() {
    // TODO: implement tampilInfo
    super.tampilInfo();
    print('Tipe: Taksi | jarak: ${jarak} km');
  }
}
class Bus extends Transportasi{
  bool adaWifi;
  Bus({required String id, required String nama, required double tarifDasar, required int kapasitas, required this.adaWifi})
    :super(id: id, nama: nama, tarifDasar: tarifDasar, kapasitas: kapasitas);
    @override
  double hitungTarif(int jumlahPenumpang) =>(tarifDasar*jumlahPenumpang)+(adaWifi ? 5000 :0);

    @override
    void tampilInfo(){
      super.tampilInfo();
      print('Tipe: Bus | Wifi: ${adaWifi ? "ada" : "tidak"}');
    }
  }

  class Pesawat extends Transportasi{
    String kelas;
    Pesawat({required String id, required String nama, required double tarifDasar, required int kapasitas, required this.kelas})
    :super(id: id, nama: nama, tarifDasar: tarifDasar, kapasitas: kapasitas);

    @override
    double hitungTarif(int jumlahPenumpang) => tarifDasar*jumlahPenumpang*(kelas.toLowerCase()=='bisnis' ? 1.5 : 1.0);
    
    @override
     void tampilInfo(){
      super.tampilInfo();
      print('Tipe: pesawat | Kelas: $kelas');
     }
  }

  class Pemesanan{
    final String idPemesanan, namaPelanggan;
    final Transportasi transportasi;
    final int jumlahPenumpang;
    final double totalTarif;

    Pemesanan({required this.idPemesanan, required this.namaPelanggan,
     required this.transportasi,required this.jumlahPenumpang, required this.totalTarif});
    void cetakStruk(){
      print('----struk----');
      print('ID: $idPemesanan| Pelanggan: $namaPelanggan| Transportasi: ${transportasi.nama}| Penumpang: $jumlahPenumpang|Total: Rp ${totalTarif.toStringAsFixed(2)}');
    }
    Map<String, dynamic> toMap() { // Simulasi database (wajib)
    return {
      'idPemesanan': idPemesanan,
      'namaPelanggan': namaPelanggan,
      'transportasi': {'id': transportasi.id, 'nama': 
      transportasi.nama, 'tarifDasar': transportasi.tarifDasar, 'kapasitas': transportasi.kapasitas},
      'jumlahPenumpang': jumlahPenumpang,
      'totalTarif': totalTarif,
    };
  }
}

// Fungsi Global (Polimorfisme & Logika)
String _generateId(String prefix) => '$prefix-${DateTime.now().microsecondsSinceEpoch}-${Random().nextInt(1000)}';

Pemesanan buatPemesanan(Transportasi t, String nama, int jumlahPenumpang) {
  if (jumlahPenumpang <= 0 || jumlahPenumpang > t.kapasitas) throw ArgumentError('Jumlah penumpang invalid'); // Validasi kapasitas
  return Pemesanan(idPemesanan: _generateId('PM'), namaPelanggan: 
  nama, transportasi: t, jumlahPenumpang: jumlahPenumpang, totalTarif: t.hitungTarif(jumlahPenumpang));
}

void tampilSemuaPemesanan(List<Pemesanan> daftar) {
  if (daftar.isEmpty) return;
  print('Riwayat Pemesanan:');
  daftar.forEach((p) => p.cetakStruk());
}

// Main (Logika Program & Output)
void main() {
  // Buat objek transportasi (demo OOP)
  var taksi = Taksi(id: 'TAXI-001', nama: 'BlueTaxi', tarifDasar: 3000, kapasitas: 4, jarak: 12.5);
  var bus = Bus(id: 'BUS-001', nama: 'TransKota', tarifDasar: 8000, kapasitas: 40, adaWifi: true);
  var pesawat = Pesawat(id: 'PLN-001', nama: 'Garuda', tarifDasar: 500000, kapasitas: 150, kelas: 'Bisnis');

  print('Info Transportasi:');
  taksi.tampilInfo();
  bus.tampilInfo();
  pesawat.tampilInfo();

  // Buat pemesanan (gunakan fungsi global)
  List<Pemesanan> daftar = [];
  daftar.add(buatPemesanan(taksi, 'Andi', 2));
  daftar.add(buatPemesanan(bus, 'Budi', 3));
  daftar.add(buatPemesanan(pesawat, 'Citra', 2));

 // tampilkan semua
  tampilSemuaPemesanan(daftar);
  print('toMap()contoh: ${daftar.first.toMap()}');
}
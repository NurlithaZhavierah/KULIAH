class Biodata {
  String? nama;
  int? umur;
  String? minumanFav;
  int? tanggalLahir;
  void infoBiodata() {
    print("nama  : $nama");
    print("umur : $umur");
    print("hobi : $minumanFav");
    print("ttl : $tanggalLahir");
  }
}

void main() {
  Biodata biodata = Biodata();
  biodata.nama = "Nama saya Vira";
  biodata.umur = 20;
  biodata.minumanFav = "americano dan coconut coffe";
  biodata.tanggalLahir = 23;
  print(biodata.nama);
  print(biodata.umur);
  print(biodata.minumanFav);
  print(biodata.tanggalLahir);

  biodata.nama = "litha";
  biodata.umur = 20;
  biodata.minumanFav = "air Le Mineral";
  biodata.tanggalLahir = 23;
  print(biodata.nama);
  print(biodata.umur);
  print(biodata.minumanFav);
  print(biodata.tanggalLahir);
}
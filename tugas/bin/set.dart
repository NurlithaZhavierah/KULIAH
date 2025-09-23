//set adalah kumpulan elemen yang bersifat unik tapi tidak berurutan 
void main(List<String> args){
Set<int> angka = {1,2,3,4,5};
Set<dynamic> angka1 = {1,2,3,4,5};

print(angka);
print(angka.length); //panjang data
print(angka.add(6)); //tambahkan data
print(angka.remove(1)); //hapus data
print(angka.contains(1)); //mengecek data
angka.clear(); //bersihkan
print(angka); //panggil angka

angka.toList();
print(angka.runtimeType); //List pake [] kalo SET {}
print(angka.toList());
}
//set properti = lengh
import 'dart:io';
void main(){
  double? panjang ;
  double? lebar;
 

  stdout.write("masukan panjang: "); //input nama
  panjang=double.parse(stdin.readLineSync()!); //membaca input pengguna
  stdout.write("masukan lebar: "); //input nama
  lebar =double.parse(stdin.readLineSync()!);

double Luas = panjang * lebar ;
double Panjangkeliling = 2*(panjang + lebar);

  print("panjang = $panjang");
  print("lebar = $lebar");
  print("luas  = $Luas");
  print("keliling = $Panjangkeliling");


}



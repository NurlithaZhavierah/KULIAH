//input
import 'dart:io';
void main(List<String>args){
String ? name;
int? usia;
stdout.write("masukan nama: "); //input nama
name=stdin.readLineSync(); //membaca input pengguna
stdout.write("masukan usia: "); //input nama
usia =int.parse(stdin.readLineSync()!);
print(name);
print(usia);
}
import 'dart:io';

void main() {
  stdout.write("Masukkan skor Anda (0-100): ");
  String? input = stdin.readLineSync();

  if (input == null) {
    print("Input tidak boleh kosong!");
    return;
  }

  int? skor = int.tryParse(input);

  if (skor == null) {
    print("Input harus berupa angka!");
    return;
  }

  if (skor < 0 || skor > 100) {
    print("Error: Skor harus dalam rentang 0 - 100");
    return;
  }

  String grade;

  if (skor >= 85) {
    grade = "A";
  } else if (skor >= 70) {
    grade = "B";
  } else if (skor >= 60) {
    grade = "C";
  } else if (skor >= 50) {
    grade = "D";
  } else {
    grade = "E";
  }

  print("Skor Anda: $skor");
  print("Grade Anda: $grade");
}
import 'package:flutter/material.dart';

class DataHelper {
  static List<String> letterGrade() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

  static double numberGrade(String letter) {
    switch (letter) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> allLessonsLetter() {
    return letterGrade()
        .map((e) => DropdownMenuItem(value: numberGrade(e), child: Text(e)))
        .toList();
  }
}

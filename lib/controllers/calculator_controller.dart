import 'package:flutter/material.dart';

import '../models/person.dart';

class CalculatorController {
  final weightTextEditingController = TextEditingController();
  final heightController = TextEditingController();

  String? weightValidator(String? value) {
    return value!.isEmpty ? 'Campo Obrigatório' : null;
  }

  String? heightValidator(String? value) {
    return value!.isEmpty ? 'Campo Obrigatório' : null;
  }

  double calculate() {
    final weigth = double.parse(weightTextEditingController.text);
    final height = double.parse(heightController.text);
    final person = Person(weight: weigth, height: height / 100);
    final imc = person.weight / (person.height * person.height);
    return imc;
  }
}

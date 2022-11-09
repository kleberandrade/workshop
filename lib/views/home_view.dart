import 'package:flutter/material.dart';
import 'package:workshop_intranetmall/views/form_list.dart';
import 'package:workshop_intranetmall/widgets/number_input_field.dart';

import '../controllers/calculator_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomePageState();
}

class _HomePageState extends State<HomeView> {
  final controller = CalculatorController();
  final formKey = GlobalKey<FormState>();
  double? imc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workshop'),
      ),
      body: FormList(
        formKey: formKey,
        children: [
          NumberInputField(
            controller: controller.weightController,
            label: 'Peso',
            validator: controller.weightValidator,
          ),
          NumberInputField(
            controller: controller.heightController,
            label: 'Altura',
            validator: controller.heightValidator,
          ),
          ElevatedButton(
            onPressed: _onCalculate,
            child: const Text('Calcular'),
          ),
          Visibility(
            visible: imc != null,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(imc != null ? imc!.toStringAsFixed(2) : ''),
            ),
          ),
        ],
      ),
    );
  }

  void _onCalculate() {
    if (formKey.currentState!.validate()) {
      setState(() {
        imc = controller.calculate();
      });
    }
  }
}

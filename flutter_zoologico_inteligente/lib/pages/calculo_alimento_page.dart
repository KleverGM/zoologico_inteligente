import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CalculoAlimentoPage extends StatefulWidget {
  const CalculoAlimentoPage({super.key});

  @override
  State<CalculoAlimentoPage> createState() => _CalculoAlimentoPageState();
}

class _CalculoAlimentoPageState extends State<CalculoAlimentoPage> {
  final List<TextEditingController> pesoControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  final TextEditingController gramosController = TextEditingController();
  String resultado = '';

  void calcularAlimento() {
    double gramosPorKg = double.tryParse(gramosController.text.replaceAll(',', '.')) ?? 0.0;
    double total = 0.0;
    List<double> pesos = [];
    for (var controller in pesoControllers) {
      double peso = double.tryParse(controller.text.replaceAll(',', '.')) ?? 0.0;
      pesos.add(peso);
    }
    for (var peso in pesos) {
      total += peso * gramosPorKg;
    }
    setState(() {
      resultado = 'El alimento diario necesario es ${total.toStringAsFixed(2)} gramos de alimento por kg';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de alimento diario'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Ingrese el peso de cada animal en kg:'),
              const SizedBox(height: 8),
              for (int i = 0; i < pesoControllers.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: pesoControllers[i],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Peso del animal ${i + 1}',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              const SizedBox(height: 12),
              TextField(
                controller: gramosController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Gramos de alimento por kg',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: calcularAlimento,
                child: const Text('Calcular alimento total'),
              ),
              const SizedBox(height: 16),
              Text(resultado),
            ],
          ),
        ),
      ),
    );
  }
}
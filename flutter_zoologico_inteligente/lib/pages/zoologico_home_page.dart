import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ZoologicoHomePage extends StatelessWidget {
  const ZoologicoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zoológico Inteligente')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            const Text(
              'Bienvenido al zoológico inteligente',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            const Text(
              'Seleccione una opción:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),

            ElevatedButton(
              onPressed: () => context.go('/animal-habitat'),
              child: const Text('Animales por hábitat'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/calculo-alimento'),
              child: const Text('Calculadora de alimento diario'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/animal-favorito'),
              child: const Text('Favoritos del zoológico '),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/plan-alimentacion'),
              child: const Text('Plan dinámico de alimentación semanal'),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
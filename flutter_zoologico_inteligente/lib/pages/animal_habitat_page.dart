import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnimalHabitatPage extends StatefulWidget {
  const AnimalHabitatPage({super.key});

  @override
  State<AnimalHabitatPage> createState() => _AnimalHabitatPageState();
}

class _AnimalHabitatPageState extends State<AnimalHabitatPage> {
  String selectedHabitat = 'Selva';

  final Map<String, List<String>> habitatAnimals = {
    'Selva': ['Jaguar', 'Mono', 'Tucan', 'Serpiente'],
    'Sabana': ['Leon', 'Elefante', 'Cebra', 'Jirafa'],
    'Acuatico': ['Delfin', 'Tiburon', 'Tortuga', 'Pulpo'],
    'Aviario': ['Loro', 'Aguila', 'Flamenco', 'Buho'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animales por habitat'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                'assets/images/habitat-sisa.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            const Text('Seleccione un habitat:'),
            DropdownButton<String>(
              value: selectedHabitat,
              isExpanded: true,
              items: habitatAnimals.keys.map((habitat) {
                return DropdownMenuItem(
                  value: habitat,
                  child: Text(habitat),
                );
              }).toList(),
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  selectedHabitat = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Animales en el habitat $selectedHabitat:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: habitatAnimals[selectedHabitat]?.length ?? 0,
                itemBuilder: (context, index) {
                  final animal = habitatAnimals[selectedHabitat]![index];
                  return Card(
                    child: ListTile(
                      title: Text(animal),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



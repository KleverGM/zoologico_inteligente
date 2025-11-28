import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnimalFavoritoPage extends StatefulWidget {
  const AnimalFavoritoPage({super.key});

  @override
  State<AnimalFavoritoPage> createState() => _AnimalFavoritoPageState();
}

class _AnimalFavoritoPageState extends State<AnimalFavoritoPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> favoritos = [];

  void agregarFavorito() {
    final nombre = _controller.text.trim();
    if (nombre.isNotEmpty && !favoritos.contains(nombre)) {
      setState(() {
        favoritos.add(nombre);
        _controller.clear();
      });
    }
  }

  void eliminarFavorito(int index) {
    setState(() {
      favoritos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animales favoritos del zoológico'),
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
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Nombre del animal',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => agregarFavorito(),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: agregarFavorito,
              child: const Text('Agregar a favoritos'),
            ),
            const SizedBox(height: 16),
            Text('Total de favoritos: ${favoritos.length}'),
            const SizedBox(height: 8),
            Expanded(
              child: favoritos.isEmpty
                  ? const Center(child: Text('No hay animales agregados a favoritos'))
                  : ListView.builder(
                      itemCount: favoritos.length,
                      itemBuilder: (context, index) {
                        final animal = favoritos[index];
                        return Card(
                          child: ListTile(
                            title: Text(animal),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => eliminarFavorito(index),
                            ),
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

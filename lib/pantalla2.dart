import 'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de URLs de imágenes
    final List<String> imageUrls = [
      'https://cdn.pixabay.com/photo/2024/06/03/13/43/ai-generated-8806485_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/06/05/18/34/ai-generated-8807927_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/06/07/14/22/ai-generated-8809783_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/06/10/17/11/ai-generated-8813710_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/06/13/12/20/ai-generated-8817361_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/06/15/09/43/ai-generated-8820154_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/06/17/21/51/ai-generated-8823765_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/06/20/14/02/ai-generated-8827632_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/06/23/11/32/ai-generated-8831627_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/06/26/19/53/ai-generated-8835961_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/06/30/10/11/ai-generated-8840927_1280.jpg',
      'https://cdn.pixabay.com/photo/2024/07/03/15/40/ai-generated-8844871_1280.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true, // Hace que el GridView ocupe solo el espacio necesario
                physics: const NeverScrollableScrollPhysics(), // Evita scroll dentro del GridView
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Tres cartas por fila
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.7, // Proporción ajustada para la carta
                ),
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.network(
                            imageUrls[index],
                            width: double.infinity,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Imagen ${index + 1}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

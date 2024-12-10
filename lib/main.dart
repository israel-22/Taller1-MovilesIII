import 'package:flutter/material.dart';
import 'package:taller_01/pantalla2.dart';
import 'pantalla1.dart';

void main() {
  runApp(const Taller01());
}

class Taller01 extends StatelessWidget {
  const Taller01({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catálogo de Películas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home:  Pantalla2(), // Aquí definimos que Pantalla1 es la pantalla inicial
    );
  }
}
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Catálogo de Películas'),
    ),
    body: Center(
      child: Text('Cargando películas...'),
    ),
  );
}


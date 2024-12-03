import 'package:flutter/material.dart';
import 'pantallas/pantalla_principal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consumo de Gasolina',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PantallaPrincipal(),
    );
  }
}

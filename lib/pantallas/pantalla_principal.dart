import 'package:flutter/material.dart';
import 'pantalla_ingreasr_datos.dart';

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo de pantalla
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo.png'), // Agrega una imagen en "assets"
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido principal
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ícono de bienvenida
                const Icon(
                  Icons.directions_car,
                  size: 100,
                  color: Colors.white,
                ),
                const SizedBox(height: 20),
                // Texto de bienvenida
                const Text(
                  '¡Bienvenido esta es una aplicacion de Calculo Consumo de Gasolina!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PantallaIngresarDatos()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Comenzar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

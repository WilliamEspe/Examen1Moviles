import 'package:flutter/material.dart';

class PantallaResultados extends StatelessWidget {
  final Map<String, dynamic> resultados;
  final Map<String, dynamic> datosIngresados;

  const PantallaResultados({
    Key? key,
    required this.resultados,
    required this.datosIngresados,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resultados')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Resumen de Datos Ingresados',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _crearResumenDato('Kilómetros recorridos:', '${datosIngresados['kilometros']} km'),
            _crearResumenDato(
                'Precio por litro de gasolina:', '\$${datosIngresados['precioGasolina']}'),
            _crearResumenDato('Dinero gastado en gasolina:', '\$${datosIngresados['dineroGastado']}'),
            _crearResumenDato('Tiempo de viaje:', '${datosIngresados['horas']} horas y ${datosIngresados['minutos']} minutos'),
            const SizedBox(height: 20),
            const Text(
              'Resultados Calculados',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _crearResultado('Velocidad media', '${resultados['velocidadMedia']} km/h'),
            _crearResultado(
                'Consumo total de gasolina', '${resultados['litrosGastados']} litros'),
            _crearResultado(
                'Consumo de gasolina por kilómetro', '${resultados['consumoPorKm']} litros/km'),
            _crearResultado(
                'Consumo de gasolina por cada 100 km', '${resultados['consumoPorCienKm']} litros'),
          ],
        ),
      ),
    );
  }

  Widget _crearResumenDato(String titulo, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              titulo,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              valor,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearResultado(String titulo, String valor) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: const Icon(Icons.check_circle, color: Colors.green),
        title: Text(
          titulo,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          valor,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

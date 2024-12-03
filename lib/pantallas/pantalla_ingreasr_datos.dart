import 'package:flutter/material.dart';
import '../logica/calcular_consumo.dart';
import 'pantalla_resultados.dart';

class PantallaIngresarDatos extends StatefulWidget {
  const PantallaIngresarDatos({Key? key}) : super(key: key);

  @override
  State<PantallaIngresarDatos> createState() => _PantallaIngresarDatosState();
}

class _PantallaIngresarDatosState extends State<PantallaIngresarDatos> {
  final _kilometrosController = TextEditingController();
  final _precioGasolinaController = TextEditingController();
  final _dineroGastadoController = TextEditingController();
  final _tiempoHorasController = TextEditingController();
  final _tiempoMinutosController = TextEditingController();

  Map<String, dynamic>? _resultados;
  Map<String, dynamic>? _datosIngresados;

  void _calcular() {
    try {
      final double kilometros = double.parse(_kilometrosController.text);
      final double precioGasolina = double.parse(_precioGasolinaController.text);
      final double dineroGastado = double.parse(_dineroGastadoController.text);
      final int horas = int.parse(_tiempoHorasController.text);
      final int minutos = int.parse(_tiempoMinutosController.text);

      setState(() {
        _datosIngresados = {
          'kilometros': kilometros,
          'precioGasolina': precioGasolina,
          'dineroGastado': dineroGastado,
          'horas': horas,
          'minutos': minutos,
        };

        _resultados = calcularConsumo(
          kilometros,
          precioGasolina,
          dineroGastado,
          horas,
          minutos,
        );
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cálculos realizados con éxito')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingrese valores válidos')),
      );
    }
  }

  void _mostrarResultados() {
    if (_resultados == null || _datosIngresados == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, realice los cálculos primero')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PantallaResultados(
          resultados: _resultados!,
          datosIngresados: _datosIngresados!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ingresar Datos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _crearCampoTexto('Kilómetros recorridos', _kilometrosController),
            _crearCampoTexto('Precio de la gasolina por litro', _precioGasolinaController),
            _crearCampoTexto('Dinero gastado en gasolina', _dineroGastadoController),
            _crearCampoTexto('Horas de viaje', _tiempoHorasController),
            _crearCampoTexto('Minutos de viaje', _tiempoMinutosController),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _calcular,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text('Calcular'),
                ),
                ElevatedButton(
                  onPressed: _mostrarResultados,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text('Mostrar Resultados'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearCampoTexto(String etiqueta, TextEditingController controlador) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controlador,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: etiqueta,
          border: OutlineInputBorder(),
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}

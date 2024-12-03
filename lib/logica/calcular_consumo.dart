Map<String, dynamic> calcularConsumo(
    double kilometros,
    double precioGasolina,
    double dineroGastado,
    int horas,
    int minutos,
    ) {
  final double litrosGastados = dineroGastado / precioGasolina;
  final double tiempoHoras = horas + (minutos / 60);
  final double velocidadMedia = kilometros / tiempoHoras;
  final double consumoPorKm = litrosGastados / kilometros;
  final double consumoPorCienKm = consumoPorKm * 100;

  return {
    'litrosGastados': litrosGastados,
    'velocidadMedia': velocidadMedia,
    'consumoPorKm': consumoPorKm,
    'consumoPorCienKm': consumoPorCienKm,
  };
}

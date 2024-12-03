String? validarDatos({
  required double kilometros,
  required double precioGasolina,
  required double dineroGastado,
  required int horas,
  required int minutos,
}) {
  if (kilometros <= 0 || precioGasolina <= 0 || dineroGastado <= 0) {
    return 'Todos los valores deben ser positivos y mayores a 0.';
  }
  if (horas < 0 || minutos < 0) {
    return 'El tiempo debe ser positivo.';
  }
  return null; // Sin errores
}

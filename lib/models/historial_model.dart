class HistorialModel {
  final int id;
  final String fechaSalida;
  final String fechaEntrega;
  final String status;
  final String material;
  final int cantidad;
  // final List<String> listaPrestamos;

  HistorialModel({
    required this.id,
    required this.fechaSalida,
    required this.fechaEntrega,
    required this.status,
    required this.material,
    required this.cantidad,
    // required this.listaPrestamos,
  });
}

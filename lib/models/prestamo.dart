class PrestamoModel {
  final int id;
  final String name;
  final String email;
  final String fechaSalida;
  final String fechaEntrega;
  final String status;
  final String material;
  final int cantidad;
  // final List<String> listaPrestamos;

  PrestamoModel({
    required this.id,
    required this.name,
    required this.email,
    required this.fechaSalida,
    required this.fechaEntrega,
    required this.status,
    required this.material,
    required this.cantidad,
    // required this.listaPrestamos,
  });
}

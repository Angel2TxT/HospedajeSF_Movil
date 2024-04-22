class ReservationModel {
  final int id;
  final String date1;
  final String date2;
  final int peoples;
  final int extraPeoples;
  final double total;
  final String state;
  final String client;
  final String employee;
  final String commentary;
  final String specialPrice;

  ReservationModel({
    required this.id,
    required this.date1,
    required this.date2,
    required this.peoples,
    required this.extraPeoples,
    required this.total,
    required this.state,
    required this.client,
    required this.employee,
    required this.commentary,
    required this.specialPrice,
  });
}
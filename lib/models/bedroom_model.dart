class BedroomsModel {
  final int id;
  final String num;
  final int occupants;
  final int maxOccupants;
  final int floor;
  final String state;
  final String url;

  BedroomsModel({
    required this.id,
    required this.num,
    required this.occupants,
    required this.maxOccupants,
    required this.floor,
    required this.state,
    required this.url,
  });
}
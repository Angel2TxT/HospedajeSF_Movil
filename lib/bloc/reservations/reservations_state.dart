part of 'reservations_bloc.dart';


class ReservationsState extends Equatable {
  final List<ReservationModel> reservationsList;

  const ReservationsState({
    required this.reservationsList,
  });

  // BedroomsState add(BedroomsModel item) {
  //   bedroomsList.add(item);
  //   return this;
  // }

  @override
  List<Object> get props => [
    reservationsList,
  ];
}
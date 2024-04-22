part of 'reservations_bloc.dart';

abstract class ReservationEvent extends Equatable {
  const ReservationEvent();
  
  @override
  List<Object> get props => [];
}

class ReservationsGetAllEvent extends ReservationEvent {
  const ReservationsGetAllEvent();
}

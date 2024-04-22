part of 'bedroom_bloc.dart';

abstract class BedroomEvent extends Equatable {
  const BedroomEvent();
  
  @override
  List<Object> get props => [];
}

// class BedroomsInitializeEvent extends BedroomsEvent {
//   const BedroomsInitializeEvent();
// }

// class BedroomsCleanEvent extends BedroomsEvent {
//   const BedroomsCleanEvent();
// }

// class BedroomsAddOneEvent extends BedroomsEvent {
//   const BedroomsAddOneEvent();
// }

class BedroomsGetEvent extends BedroomEvent {
  final int id;
  BedroomsGetEvent({required this.id});
}

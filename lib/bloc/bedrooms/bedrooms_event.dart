part of 'bedrooms_bloc.dart';

abstract class BedroomsEvent extends Equatable {
  const BedroomsEvent();
  
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

class BedroomsGetAllEvent extends BedroomsEvent {
  const BedroomsGetAllEvent();
}

class BedroomsCleanEvent extends BedroomsEvent {
  const BedroomsCleanEvent();
}

class BedroomsGetForIdEvent extends BedroomsEvent {
  final int id;
  const BedroomsGetForIdEvent({required this.id});
}
part of 'floors_bloc.dart';

abstract class FloorsEvent extends Equatable {
  const FloorsEvent();
  
  @override
  List<Object> get props => [];
}

class FloorsGetAllEvent extends FloorsEvent {
  const FloorsGetAllEvent();
}

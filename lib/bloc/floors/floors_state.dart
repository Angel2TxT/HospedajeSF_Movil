part of 'floors_bloc.dart';

class FloorsState extends Equatable {
  final List<FloorModel> floorsList;

  const FloorsState({
    required this.floorsList,
  });

  @override
  List<Object> get props => [
    floorsList,
  ];
}
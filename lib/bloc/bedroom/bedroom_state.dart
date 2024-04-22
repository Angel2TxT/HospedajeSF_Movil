part of 'bedroom_bloc.dart';


class BedroomState extends Equatable {
  final BedroomsModel bedroom;

  const BedroomState({
    required this.bedroom,
  });

  // BedroomsState add(BedroomsModel item) {
  //   bedroomsList.add(item);
  //   return this;
  // }

  @override
  List<Object> get props => [
    bedroom,
  ];
}
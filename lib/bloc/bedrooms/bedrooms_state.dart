part of 'bedrooms_bloc.dart';


class BedroomsState extends Equatable {
  final List<BedroomsModel> bedroomsList;

  const BedroomsState({
    required this.bedroomsList,
  });

  // BedroomsState add(BedroomsModel item) {
  //   bedroomsList.add(item);
  //   return this;
  // }

  @override
  List<Object> get props => [
    bedroomsList,
  ];
}
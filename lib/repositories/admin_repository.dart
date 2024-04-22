import '../models/bedroom_model.dart';
import '../models/client_model.dart';
import '../models/comment.dart';
import '../models/floor_model.dart';
import '../models/reservation.dart';
import '../services/mysql/bedroom_queries.dart';

class AdminRepository {
  Future<List<FloorModel>> getAllFloors() {
    BedroomsQueries bedroomsQueries = BedroomsQueries();
    return bedroomsQueries.consultAllFloor();
  }

  Future<List<BedroomsModel>> getBedroomsById(int id) {
    BedroomsQueries bedroomsQueries = BedroomsQueries();
    return bedroomsQueries.consultBedroomsById(id);
  }

  Future<List<CommentModel>> getAllComments() {
    BedroomsQueries bedroomsQueries = BedroomsQueries();
    return bedroomsQueries.consultAllComments();
  }

  Future<List<ClientModel>> getAllClient() {
    BedroomsQueries bedroomsQueries = BedroomsQueries();
    return bedroomsQueries.consultAllClient();
  }

  Future<BedroomsModel> getBedroom(int id) {
        BedroomsQueries bedroomsQueries = BedroomsQueries();
        return bedroomsQueries.consultOneBedroomsById(id);
  }

  Future<List<ReservationModel>> getReservations() {
    BedroomsQueries bedroomsQueries = BedroomsQueries();
    return bedroomsQueries.consultAllReservations();
  }
}
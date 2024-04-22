import '../services/mysql/bedroom_queries.dart';
import '../services/mysql/connection.dart';

import '../models/bedroom_model.dart';

class ClientRepository {
  Future<List<BedroomsModel>> rGetAllBedrooms() {
    print("----------------------------2");

    // MysqlService mysqlService = MysqlService();
    BedroomsQueries bedroomsQueries = BedroomsQueries();
    print("----------------------------3");
    // return mysqlService.getAllBedrooms();
    return bedroomsQueries.getAllBedrooms();
    

  }
}
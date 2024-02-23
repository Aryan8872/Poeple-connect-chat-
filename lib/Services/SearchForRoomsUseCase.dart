import 'package:chat/ViewModels/Room/Room.dart';
import 'package:chat/Repository/Repository interface/RoomsRepositoryContract.dart';

class SearchForRoomsUseCase {
  RoomDataRepository repository;
  SearchForRoomsUseCase(this.repository);

  Future<List<Room>> invoke(String query)async{
    var response = await repository.getRoomsForSearch(query);
    return response;
  }

}
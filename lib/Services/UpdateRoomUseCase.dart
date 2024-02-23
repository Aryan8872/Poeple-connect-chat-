import 'package:chat/ViewModels/Room/Room.dart';
import 'package:chat/Repository/Repository interface/RoomsRepositoryContract.dart';

class UpdateRoomUseCase{
  RoomDataRepository repository;
  UpdateRoomUseCase(this.repository);

  Future<void> invoke(Room room)async{
    await repository.updateRoomData(room);
  }
}
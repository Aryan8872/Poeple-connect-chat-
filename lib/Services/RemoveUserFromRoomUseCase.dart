import 'package:chat/ViewModels/Room/Room.dart';
import 'package:chat/Repository/Repository interface/RoomsRepositoryContract.dart';
import 'package:chat/Repository/Repository interface/UsersRepositoryContract.dart';

class RemoveUserFromRoomUseCase {

  RoomDataRepository repository;
  UsersRepository usersRepository;
  RemoveUserFromRoomUseCase(this.repository , this.usersRepository);

  Future<String> invoke(Room room , String uid)async{
    room.users.removeWhere((element) => element == uid);
    await repository.updateRoomMembers(room);
    await usersRepository.removeUser(room.id, uid);
    return "You Are No Longer Allowed to view This Room";
  }

}
import 'package:chat/ViewModels/Room/Room.dart';
import 'package:chat/ViewModels/User/Users.dart';
import 'package:chat/Repository/Repository interface/RoomsRepositoryContract.dart';
import 'package:chat/Repository/Repository interface/UsersRepositoryContract.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddUserToRoomUseCase {

  RoomDataRepository repository;
  UsersRepository usersRepository;
  AddUserToRoomUseCase(this.repository , this.usersRepository);

  Future<String> invoke(Room room , User user)async{
    room.users.add(user.uid);
    var response = await repository.updateRoomMembers(room);
    var userResponse = await usersRepository.addUser(room.id, Users(uid: user.uid, name: user.displayName!, email: user.email!, password: "unKnown"));

    return response;
  }

}
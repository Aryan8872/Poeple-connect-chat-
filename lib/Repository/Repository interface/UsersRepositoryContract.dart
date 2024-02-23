import 'package:chat/Models/User/UserDTO.dart';
import 'package:chat/ViewModels/User/Users.dart';

abstract class UsersFirebaseRemoteDataSource {
  Future<String> addUser(String roomId , UserDTO user);
  Future<String> removeUser(String roomId , String userId);
  Future<List<Users>> getUsersList(String roomId);
}

abstract class UsersRepository{
  Future<String> addUser(String roomId , Users user);
  Future<String> removeUser(String roomId , String userId);
  Future<List<Users>> getUsersList(String roomId);
}
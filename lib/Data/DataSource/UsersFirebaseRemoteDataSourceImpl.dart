import 'dart:async';

import 'package:chat/Data/Firebase/ErrorHandeler.dart';
import 'package:chat/Data/Firebase/RoomUsersDataBase.dart';
import 'package:chat/Models/User/UserDTO.dart';
import 'package:chat/Services/Exception/FirebaseFireStoreDatabaseTimeoutException.dart';
import 'package:chat/Services/Exception/FirebaseFirestoreDatabaseException.dart';
import 'package:chat/ViewModels/User/Users.dart';
import 'package:chat/Repository/Repository interface//UsersRepositoryContract.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersFirebaseRemoteDataSourceImpl implements UsersFirebaseRemoteDataSource {
  RoomUsersDatabase database;
  ErrorHandler errorHandler;

  UsersFirebaseRemoteDataSourceImpl(this.database , this.errorHandler);

  @override
  Future<String> addUser(String roomId, UserDTO user) async{
    try{
      await database.addRoomMember(roomId, user);
      return "User Added Successfully";
    }on FirebaseException catch(e){
      var error = errorHandler.handleFirebaseFireStoreError(e.code);
      throw FirebaseFireStoreDatabaseException(error);
    }on TimeoutException catch(e){
      throw FirebaseFireStoreDatabaseTimeoutException("This Operation Has Timed Out");
    }catch (e){
      throw FirebaseFireStoreDatabaseException("UnKnown Error");
    }
  }

  @override
  Future<String> removeUser(String roomId, String userId)async {
    try{
      await database.removeRoomMember(roomId, userId);
      return "User Removed Successfully";
    }on FirebaseException catch(e){
      var error = errorHandler.handleFirebaseFireStoreError(e.code);
      throw FirebaseFireStoreDatabaseException(error);
    }on TimeoutException catch(e){
      throw FirebaseFireStoreDatabaseTimeoutException("This Operation Has Timed Out");
    }catch (e){
      throw FirebaseFireStoreDatabaseException("UnKnown Error");
    }
  }

  @override
  Future<List<Users>> getUsersList(String roomId) async{
    var response = await database.getRoomUsersList(roomId);
    return response.map((e) => e.toDomain()).toList();
  }



}
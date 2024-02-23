import 'package:chat/Models/Room/RoomDTO.dart';
import 'package:chat/Repository/Repository interface/RoomsRepositoryContract.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetPublicRoomsUseCase{
  RoomDataRepository repository;
  GetPublicRoomsUseCase(this.repository);

  Stream<QuerySnapshot<RoomDTO>> invoke(){
    return repository.getPublicRooms();
  }
}
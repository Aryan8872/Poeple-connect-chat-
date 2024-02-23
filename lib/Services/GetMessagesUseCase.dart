import 'package:chat/Models/Message/MessageDTO.dart';
import 'package:chat/Repository/Repository interface/MessagesRepositoryContract.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetMessagesUseCase{
  MessagesRepository repository ;
  GetMessagesUseCase(this.repository);

  Stream<QuerySnapshot<MessageDTO>> invoke(String roomId){
    return repository.getMessages(roomId);
  }


}
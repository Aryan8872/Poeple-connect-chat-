import 'package:chat/Models/Message/MessageDTO.dart';
import 'package:chat/ViewModels/Message/Message.dart';
import 'package:chat/Repository/Repository interface/MessagesRepositoryContract.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesRepositoryImpl implements MessagesRepository{
  MessagesRemoteDataSource dataSource ;
  MessagesRepositoryImpl(this.dataSource);

  @override
  Future<void> sendMessage(Message message) async{
    await dataSource.sendMessage(message.toDataSource());
  }

  @override
  Stream<QuerySnapshot<MessageDTO>> getMessages(String roomId) {
    return dataSource.getMessages(roomId);
  }
}
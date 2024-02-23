import 'package:chat/ViewModels/Message/Message.dart';
import 'package:chat/Repository/Repository interface/MessagesRepositoryContract.dart';

class SendMessageUseCase {

  MessagesRepository repository;
  SendMessageUseCase(this.repository);

  Future<void> invoke(Message message)async{
    await repository.sendMessage(message);
  }

}
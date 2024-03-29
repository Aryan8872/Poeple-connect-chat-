import 'package:chat/Core/Base/BaseViewModel.dart';
import 'package:chat/Services/Exception/FirebaseFireStoreDatabaseTimeoutException.dart';
import 'package:chat/Services/Exception/FirebaseFirestoreDatabaseException.dart';
import 'package:chat/ViewModels/Room/Room.dart';
import 'package:chat/Services/AddUserToRoomUseCase.dart';
import 'package:chat/Presentation/UI/JoinRoom/JoinRoomNavigator.dart';

class JoinRoomViewModel extends BaseViewModel<JoinRoomNavigator>{

  AddUserToRoomUseCase addUserToRoomUseCase ;
  JoinRoomViewModel(this.addUserToRoomUseCase);

  void joinRoom(Room room)async{
    navigator!.showLoading("Joining...");
    try{
      var response = await addUserToRoomUseCase.invoke(room, provider!.user!);
      navigator!.removeContext();
      navigator!.showSuccessMessage(message: response  , posAction: goToChatScreen, posActionTitle:"Ok" );
    }catch (e){
      navigator!.removeContext();
      if (e is FirebaseFireStoreDatabaseTimeoutException){
        navigator!.showFailMessage(message: e.errorMessage , posActionTitle: "Try Again" );
      }else if (e is FirebaseFireStoreDatabaseException){
        navigator!.showFailMessage(message: e.errorMessage , posActionTitle: "Try Again" );
      }else {
        navigator!.showFailMessage(message: e.toString() , posActionTitle: "Try Again");
      }
    }
  }

  void goToChatScreen(){
    navigator!.goToChatRoom();
  }
}
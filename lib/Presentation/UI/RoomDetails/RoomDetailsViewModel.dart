import 'package:chat/Core/Base/BaseViewModel.dart';
import 'package:chat/Services/Exception/FirebaseAuthException.dart';
import 'package:chat/Services/Exception/FirebaseAuthTimeoutException.dart';
import 'package:chat/ViewModels/Room/Room.dart';
import 'package:chat/ViewModels/User/Users.dart';
import 'package:chat/Services/GetUsersListUseCase.dart';
import 'package:chat/ViewModels/Room/RoomCategory.dart';
import 'package:chat/ViewModels/Room/RoomType.dart';
import 'package:chat/Presentation/UI/RoomDetails/RoomDetailsNavigator.dart';
import 'package:flutter/services.dart';

class RoomDetailsViewModel extends BaseViewModel<RoomDetailsNavigator> {

  GetUsersListUseCase useCase;
  RoomDetailsViewModel(this.useCase);

  List<Users> users= [];
  String? errorMessage;

  Room? room;
  late RoomCategory category;
  late RoomType type;

  // gets the users that are members of a specific room
  void getUsersList()async{
    users = [];
    errorMessage = null;
    try{
      users = await useCase.invoke(roomId: room!.id);
      notifyListeners();
    }catch (e){

      if(e is FirebaseAuthRemoteDataSourceException){
        errorMessage = e.errorMessage;
      }else if (e is FirebaseAuthTimeoutException){
        errorMessage = e.errorMessage;
      }else{
        errorMessage = e.toString();
      }
      notifyListeners();
    }
  }

  onCopyIconPress(){
    Clipboard.setData(ClipboardData(text: room!.id));
    navigator!.showNotification();
  }

  onGroupMembersPress(){
    navigator!.showMyModalBottomSheetWidget(users);
  }

  onGoToUpdateRoomDetailsScreenPress(){
    navigator!.goToUpdateRoomDetailsScreen(room!);
  }

}
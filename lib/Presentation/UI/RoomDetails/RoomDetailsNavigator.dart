import 'package:chat/Core/Base/BaseNavigator.dart';
import 'package:chat/ViewModels/Room/Room.dart';
import 'package:chat/ViewModels/User/Users.dart';

abstract class RoomDetailsNavigator extends BaseNavigator{
  showMyModalBottomSheetWidget(List<Users> users);
  goToUpdateRoomDetailsScreen(Room room);
}
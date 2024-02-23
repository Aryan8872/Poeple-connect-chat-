import 'package:chat/Core/Base/BaseNavigator.dart';
import 'package:chat/ViewModels/Room/Room.dart';

abstract class SearchNavigator extends BaseNavigator{

  goToJoinRoomScreen(Room room);
  goToChatScreen(Room room);
}
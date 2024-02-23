import 'package:chat/Core/Base/BaseNavigator.dart';
import 'package:chat/ViewModels/Room/Room.dart';

abstract class ChatNavigator extends BaseNavigator{
  goToRoomDetailsScreen(Room room);
}
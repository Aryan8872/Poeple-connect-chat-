import 'package:chat/Core/Base/BaseNavigator.dart';
import './AppConfigProvider.dart';
import 'package:flutter/material.dart';

abstract class BaseViewModel<N extends BaseNavigator> extends ChangeNotifier {
  N? navigator;
  AppConfigProvider? provider;
}
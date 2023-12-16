import 'package:flutter/foundation.dart';

class ChatNotifier extends ChangeNotifier {
  List<String> _online = [];
  List<String> get online => _online;
  bool _typing = false;

  bool get typing => _typing;

  set typing(bool newState) {
    _typing = newState;
    notifyListeners();
  }

  set onlineUsers(List<String> newList) {
    _online = newList;
    notifyListeners();
  }
}

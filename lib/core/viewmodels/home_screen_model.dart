import 'package:flutter/material.dart';

import '../utils/service_locator.dart';
import '../services/auth_service_b4a.dart';
import '../models/user.dart';

class HomeScreenModel extends ChangeNotifier {
  AuthServiceB4a _auth = locator<AuthServiceB4a>();
  User _user;

  void initialise() async {
    if (_auth.user == null) {
      var result = await _auth.tryAutoLogin();
      if (result) {
        _user = _auth.user;
      }
    } else {
      _user = _auth.user;
    }
    notifyListeners();
  }

  User get user {
    return _user;
  }
}

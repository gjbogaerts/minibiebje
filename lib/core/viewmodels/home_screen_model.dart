import 'package:flutter/material.dart';

import '../models/user.dart';
import '../services/auth_service_abstract.dart';
import '../utils/service_locator.dart';

class HomeScreenModel extends ChangeNotifier {
  AuthServiceAbstract _auth = locator<AuthServiceAbstract>();
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

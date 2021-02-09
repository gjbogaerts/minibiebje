import 'package:flutter/material.dart';

import '../models/user.dart';
import '../services/auth_service_abstract.dart';
import '../utils/service_locator.dart';

class HomeScreenModel extends ChangeNotifier {
  AuthServiceAbstract _auth = locator<AuthServiceAbstract>();
  User _user;
  bool _hasAuth = false;

  void initialise() async {
    if (_auth.user == null) {
      var result = await _auth.tryAutoLogin();
      if (result) {
        _user = _auth.user;
        _hasAuth = true;
      }
    } else {
      _user = _auth.user;
      _hasAuth = true;
    }
    notifyListeners();
  }

  void logout() async {
    bool result = await _auth.logout();
    if (result) {
      _user = null;
      _hasAuth = false;
      notifyListeners();
    }
  }

  User get user {
    return _user;
  }

  bool get hasAuth {
    return _hasAuth;
  }
}

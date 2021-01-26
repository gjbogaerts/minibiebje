// import '../services/auth_service_b4a.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../utils/service_locator.dart';
import '../services/auth_service_abstract.dart';
import '../utils/my_validator.dart';

class AuthScreenModel extends BaseViewModel {
  AuthServiceAbstract _authService = locator<AuthServiceAbstract>();
  bool _isRegistering = false;
  String _errorString = '';
  bool _hidePassword = true;
  bool _authResult;
  TextEditingController _pwController = TextEditingController();
  Map<String, dynamic> _formValues = {
    'username': null,
    'email': null,
    'password': null
  };
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final MyValidator _validator = MyValidator();

  MyValidator get validator {
    return _validator;
  }

  GlobalKey<FormState> get formKey {
    return _formKey;
  }

  Map<String, dynamic> get formValues {
    return _formValues;
  }

  set formValues(Map<String, dynamic> values) {
    _formValues = values;
    notifyListeners();
  }

  TextEditingController get pwController {
    return _pwController;
  }

  bool get hidePassword {
    return _hidePassword;
  }

  set hidePassword(bool val) {
    _hidePassword = val;
    notifyListeners();
  }

  set errorString(String val) {
    _errorString = val;
    notifyListeners();
  }

  String get errorString {
    return _errorString;
  }

  set isRegistering(bool val) {
    _isRegistering = val;
    notifyListeners();
  }

  bool get isRegistering {
    return _isRegistering;
  }

  void startAuth() async {
    if (!_formKey.currentState.validate()) {
      _errorString =
          'Je formulier bevat fouten. Wil je het svp correct invullen?';
      notifyListeners();
      return;
    } else {
      _errorString = '';
      notifyListeners();
    }
    _formKey.currentState.save();
    _formValues['register'] = _isRegistering;
    try {
      var result = await runBusyFuture(auth());
      if (result) {
        _authResult = true;
        _errorString = '';
      } else {
        _authResult = false;
        _errorString =
            'Er ging iets mis tijdens de authenticatie. Probeer het opnieuw.';
      }
    } catch (err) {
      _authResult = false;
      _errorString = err.toString();
    } finally {
      notifyListeners();
    }
  }

  Future<bool> auth() async {
    return await _authService.auth(_formValues);
  }

  bool get authResult {
    return _authResult;
  }
}

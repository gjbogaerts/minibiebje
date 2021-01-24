import '../services/auth_service_b4a.dart';
import '../utils/service_locator.dart';
import '../services/auth_service_abstract.dart';

class AuthScreenModel {
  AuthServiceAbstract _authService = locator<AuthServiceB4a>();

  Future<bool> auth(Map<String, dynamic> authData) async {
    return await _authService.auth(authData);
  }
}

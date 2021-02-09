import '../models/user.dart';

abstract class AuthServiceAbstract {
  Future<bool> auth(Map<String, dynamic> authData);
  Future<bool> tryAutoLogin();
  Future<bool> logout();
  User get user;
}

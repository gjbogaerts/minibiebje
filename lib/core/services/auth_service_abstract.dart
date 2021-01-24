abstract class AuthServiceAbstract {
  Future<bool> auth(Map<String, dynamic> authData);
  Future<void> logout();
}

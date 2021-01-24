class AuthException implements Exception {
  final String _msg;

  AuthException(this._msg);

  String toString() {
    return _msg;
  }
}

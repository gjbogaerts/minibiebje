class SearchException implements Exception {
  final String _msg;

  SearchException(this._msg);

  String toString() {
    return _msg;
  }
}

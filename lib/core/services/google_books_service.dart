import 'package:minibieb/core/exceptions/search_exception.dart';

import '../keys/api.dart';
import 'package:dio/dio.dart';

class GoogleBooksService {
  static const _baseUrl = 'https://www.googleapis.com/books/';
  Map<String, dynamic> _queryParams = {'key': kGoogleApiKey};
  Response _response;
  Dio _dio = Dio();

  Future doSearch({String title = '', String author = ''}) async {
    String _q = _buildQueryString(title: title, author: author);
    final uri = _baseUrl + 'v1/volumes?q=$_q';
    _response = await _dio.get(uri, queryParameters: _queryParams);
    // print(_response.request.uri);
    // print(_response.realUri);
    print(_response.data);
  }

  String _buildQueryString({String title = '', String author = ''}) {
    List<String> terms = [];
    if (title.isNotEmpty) {
      terms.add('intitle:$title');
    }
    if (author.isNotEmpty) {
      terms.add('inauthor:$author');
    }
    if (terms.length == 0) {
      throw SearchException(
          'Je hebt geen zoektermen opgegeven. Je moet ten minste een auteur of een titel invullen.');
    }
    return terms.join('+');
  }
}

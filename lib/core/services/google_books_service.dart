import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../exceptions/search_exception.dart';
import '../keys/api.dart';
import '../models/google_volume.dart';
import '../utils/my_logger.dart';

class GoogleBooksService {
  static const _baseUrl = 'https://www.googleapis.com/books/';
  Map<String, dynamic> _queryParams = {'key': kGoogleApiKey};
  Response _response;
  Dio _dio = Dio();
  int _totalItemCount = 0;
  List<GoogleVolume> _volumes = [];
  final Logger _log = getLogger('GoogleBooksService');

  Future<bool> doSearch(
      {String title = '', String author = '', offset = 0}) async {
    _log.d('doSearch | title: $title, author: $author');
    String _q = _buildQueryString(title: title, author: author);
    final uri = _baseUrl + 'v1/volumes?q=$_q';
    _queryParams['startIndex'] = offset;
    _volumes = [];
    try {
      _response = await _dio.get(uri, queryParameters: _queryParams);
      List _items = _response.data['items'] ?? [];
      _totalItemCount = _response.data['totalItems'] ?? 0;
      for (int i = 0; i < _items.length; i++) {
        // print(_items[i]);
        GoogleVolume vol = GoogleVolume.fromResponseData(_items[i]);
        _volumes.add(vol);
      }
      return true;
    } catch (err) {
      throw SearchException(err.toString());
    }
  }

  int get totalItemCount => _totalItemCount;

  List<GoogleVolume> get volumes => _volumes;

  String _buildQueryString({String title = '', String author = ''}) {
    _log.d('_buildQueryString | title: $title, author: $author');
    List<String> terms = [];
    if (title != null && title.isNotEmpty) {
      terms.add('intitle:$title');
    }
    if (author != null && author.isNotEmpty) {
      terms.add('inauthor:$author');
    }
    if (terms.length == 0) {
      throw SearchException(
          'Je hebt geen zoektermen opgegeven. Je moet ten minste een auteur of een titel invullen.');
    }
    return terms.join('+');
  }
}

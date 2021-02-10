import 'package:stacked/stacked.dart';
import '../services/google_books_service.dart';
import '../utils/service_locator.dart';

class SearchScreenModel extends BaseViewModel {
  GoogleBooksService _service = locator<GoogleBooksService>();
  String title;
  String author;

  void startSearch() {
    _service.doSearch(title: title, author: author);
  }
}

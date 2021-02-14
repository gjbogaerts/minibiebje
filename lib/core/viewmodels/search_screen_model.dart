import 'package:minibieb/core/models/google_volume.dart';
import 'package:stacked/stacked.dart';
import '../services/google_books_service.dart';
import '../utils/service_locator.dart';

enum ImageSize {
  Small,
  Medium,
  Large,
}

class SearchScreenModel extends BaseViewModel {
  GoogleBooksService _service = locator<GoogleBooksService>();
  static const numItemsToFetch = 10;
  String _title;
  String _author;
  bool _isWorking = false;

  List<GoogleVolume> volumes;
  int totalSearchResultCount;
  int offset = 0;

  void startSearch() async {
    _isWorking = true;
    notifyListeners();
    await _service.doSearch(title: _title, author: _author);
    volumes = _service.volumes;
    totalSearchResultCount = _service.totalItemCount;
    _isWorking = false;
    notifyListeners();
  }

  Future<List<GoogleVolume>> fetchNext(int o) async {
    volumes = [];
    offset += numItemsToFetch;
    await _service.doSearch(title: _title, author: _author, offset: offset);
    return _service.volumes;
  }

  set title(String title) {
    _title = title;
  }

  set author(String author) {
    _author = author;
  }

  String get author => _author;
  String get title => _title;

  String getImage(ImageSize size, GoogleVolume volume) {
    switch (size) {
      case ImageSize.Large:
        if (volume.extraLarge != null && volume.extraLarge.isNotEmpty) {
          return volume.extraLarge;
        } else if (volume.large != null && volume.large.isNotEmpty) {
          return volume.large;
        } else {
          return getImage(ImageSize.Medium, volume);
        }
        break;
      case ImageSize.Medium:
        if (volume.medium != null && volume.medium.isNotEmpty) {
          return volume.medium;
        } else if (volume.small != null && volume.small.isNotEmpty) {
          return volume.small;
        } else {
          return getImage(ImageSize.Small, volume);
        }
        break;
      case ImageSize.Small:
        if (volume.thumbnail != null && volume.thumbnail.isNotEmpty) {
          return volume.thumbnail;
        } else if (volume.smallThumbnail != null &&
            volume.smallThumbnail.isNotEmpty) {
          return volume.smallThumbnail;
        } else {
          return 'https://upload.wikimedia.org/wikipedia/commons/7/72/Placeholder_book.svg';
        }
        break;
      default:
        return 'https://upload.wikimedia.org/wikipedia/commons/7/72/Placeholder_book.svg';
    }
  }

  bool get isWorking => _isWorking;
}

import 'dart:convert';

import 'package:flutter/foundation.dart';

class GoogleVolume {
  /// This class contains information on what Google calls a 'Volume'
  /// @see https://developers.google.com/books/docs/v1/reference/volumes
  /// A volume is the generic information on a book, and can contain many editions.

  String id;
  String etag;
  String selfLink;
  String title;
  String subtitle;
  List<dynamic> authors;
  String publisher;
  String publishedDate;
  String description;
  List<dynamic> industryIdentifiers;
  int pageCount;
  String mainCategory;
  List<dynamic> categories;
  double averageRating;
  String smallThumbnail;
  String thumbnail;
  String small;
  String medium;
  String large;
  String extraLarge;
  String language;
  String previewLink;
  String infoLink;
  String canonicalVolumeLink;
  bool isEbook;
  bool publicDomain;
  bool isAvailable;
  String downloadLink;
  String textSnippet;

  Map<String, dynamic> listPrice;
  Map<String, dynamic> retailPrice;

  GoogleVolume(
      {this.id,
      this.etag,
      this.selfLink,
      this.title,
      this.subtitle,
      this.authors,
      this.publisher,
      this.publishedDate,
      this.description,
      this.industryIdentifiers,
      this.pageCount,
      this.mainCategory,
      this.categories,
      this.averageRating,
      this.smallThumbnail,
      this.thumbnail,
      this.small,
      this.medium,
      this.large,
      this.extraLarge,
      this.language,
      this.previewLink,
      this.infoLink,
      this.canonicalVolumeLink,
      this.isEbook,
      this.publicDomain,
      this.isAvailable,
      this.downloadLink,
      this.textSnippet,
      this.listPrice,
      this.retailPrice});

  GoogleVolume copyWith({
    String id,
    String etag,
    String selfLink,
    String title,
    String subtitle,
    List<String> authors,
    String publisher,
    String publishedDate,
    String description,
    List<String> industryIdentifiers,
    int pageCount,
    String mainCategory,
    List<String> categories,
    double averageRating,
    String smallThumbnail,
    String thumbnail,
    String small,
    String medium,
    String large,
    String extraLarge,
    String language,
    String previewLink,
    String infoLink,
    String canonicalVolumeLink,
    bool isEbook,
    bool publicDomain,
    bool isAvailable,
    String downloadLink,
    String textSnippet,
    Map<String, dynamic> listPrice,
    Map<String, dynamic> retailPrice,
  }) {
    return GoogleVolume(
      id: id ?? this.id,
      etag: etag ?? this.etag,
      selfLink: selfLink ?? this.selfLink,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      authors: authors ?? this.authors,
      publisher: publisher ?? this.publisher,
      publishedDate: publishedDate ?? this.publishedDate,
      description: description ?? this.description,
      industryIdentifiers: industryIdentifiers ?? this.industryIdentifiers,
      pageCount: pageCount ?? this.pageCount,
      mainCategory: mainCategory ?? this.mainCategory,
      categories: categories ?? this.categories,
      averageRating: averageRating ?? this.averageRating,
      smallThumbnail: smallThumbnail ?? this.smallThumbnail,
      thumbnail: thumbnail ?? this.thumbnail,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      extraLarge: extraLarge ?? this.extraLarge,
      language: language ?? this.language,
      previewLink: previewLink ?? this.previewLink,
      infoLink: infoLink ?? this.infoLink,
      canonicalVolumeLink: canonicalVolumeLink ?? this.canonicalVolumeLink,
      isEbook: isEbook ?? this.isEbook,
      publicDomain: publicDomain ?? this.publicDomain,
      isAvailable: isAvailable ?? this.isAvailable,
      downloadLink: downloadLink ?? this.downloadLink,
      textSnippet: textSnippet ?? this.textSnippet,
      listPrice: listPrice ?? this.listPrice,
      retailPrice: retailPrice ?? this.retailPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'etag': etag,
      'selfLink': selfLink,
      'title': title,
      'subtitle': subtitle,
      'authors': authors,
      'publisher': publisher,
      'publishedDate': publishedDate,
      'description': description,
      'industryIdentifiers': industryIdentifiers,
      'pageCount': pageCount,
      'mainCategory': mainCategory,
      'categories': categories,
      'averageRating': averageRating,
      'smallThumbnail': smallThumbnail,
      'thumbnail': thumbnail,
      'small': small,
      'medium': medium,
      'large': large,
      'extraLarge': extraLarge,
      'language': language,
      'previewLink': previewLink,
      'infoLink': infoLink,
      'canonicalVolumeLink': canonicalVolumeLink,
      'isEbook': isEbook,
      'publicDomain': publicDomain,
      'isAvailable': isAvailable,
      'downloadLink': downloadLink,
      'textSnippet': textSnippet,
      'listPrice': listPrice,
      'retailPrice': retailPrice,
    };
  }

  factory GoogleVolume.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return GoogleVolume(
      id: map['id'],
      etag: map['etag'],
      selfLink: map['selfLink'],
      title: map['title'],
      subtitle: map['subtitle'],
      authors: List<String>.from(map['authors']),
      publisher: map['publisher'],
      publishedDate: map['publishedDate'],
      description: map['description'],
      industryIdentifiers: List<String>.from(map['industryIdentifiers']),
      pageCount: map['pageCount'],
      mainCategory: map['mainCategory'],
      categories: List<String>.from(map['categories']),
      averageRating: map['averageRating'],
      smallThumbnail: map['smallThumbnail'],
      thumbnail: map['thumbnail'],
      small: map['small'],
      medium: map['medium'],
      large: map['large'],
      extraLarge: map['extraLarge'],
      language: map['language'],
      previewLink: map['previewLink'],
      infoLink: map['infoLink'],
      canonicalVolumeLink: map['canonicalVolumeLink'],
      isEbook: map['isEbook'],
      publicDomain: map['publicDomain'],
      isAvailable: map['isAvailable'],
      downloadLink: map['downloadLink'],
      textSnippet: map['textSnippet'],
      listPrice: map['listPrice'],
      retailPrice: map['retailPrice'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GoogleVolume.fromJson(String source) =>
      GoogleVolume.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GoogleVolume(id: $id, etag: $etag, selfLink: $selfLink, title: $title, subtitle: $subtitle, authors: $authors, publisher: $publisher, publishedDate: $publishedDate, description: $description, industryIdentifiers: $industryIdentifiers, pageCount: $pageCount, mainCategory: $mainCategory, categories: $categories, averageRating: $averageRating, smallThumbnail: $smallThumbnail, thumbnail: $thumbnail, small: $small, medium: $medium, large: $large, extraLarge: $extraLarge, language: $language, previewLink: $previewLink, infoLink: $infoLink, canonicalVolumeLink: $canonicalVolumeLink, isEbook: $isEbook, publicDomain: $publicDomain, isAvailable: $isAvailable, downloadLink: $downloadLink, textSnippet: $textSnippet, listPrice: $listPrice, retailPrice: $retailPrice)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is GoogleVolume &&
        o.id == id &&
        o.etag == etag &&
        o.selfLink == selfLink &&
        o.title == title &&
        o.subtitle == subtitle &&
        listEquals(o.authors, authors) &&
        o.publisher == publisher &&
        o.publishedDate == publishedDate &&
        o.description == description &&
        listEquals(o.industryIdentifiers, industryIdentifiers) &&
        o.pageCount == pageCount &&
        o.mainCategory == mainCategory &&
        listEquals(o.categories, categories) &&
        o.averageRating == averageRating &&
        o.smallThumbnail == smallThumbnail &&
        o.thumbnail == thumbnail &&
        o.small == small &&
        o.medium == medium &&
        o.large == large &&
        o.extraLarge == extraLarge &&
        o.language == language &&
        o.previewLink == previewLink &&
        o.infoLink == infoLink &&
        o.canonicalVolumeLink == canonicalVolumeLink &&
        o.isEbook == isEbook &&
        o.publicDomain == publicDomain &&
        o.isAvailable == isAvailable &&
        o.downloadLink == downloadLink &&
        o.textSnippet == textSnippet &&
        o.listPrice == listPrice &&
        o.retailPrice == retailPrice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        etag.hashCode ^
        selfLink.hashCode ^
        title.hashCode ^
        subtitle.hashCode ^
        authors.hashCode ^
        publisher.hashCode ^
        publishedDate.hashCode ^
        description.hashCode ^
        industryIdentifiers.hashCode ^
        pageCount.hashCode ^
        mainCategory.hashCode ^
        categories.hashCode ^
        averageRating.hashCode ^
        smallThumbnail.hashCode ^
        thumbnail.hashCode ^
        small.hashCode ^
        medium.hashCode ^
        large.hashCode ^
        extraLarge.hashCode ^
        language.hashCode ^
        previewLink.hashCode ^
        infoLink.hashCode ^
        canonicalVolumeLink.hashCode ^
        isEbook.hashCode ^
        publicDomain.hashCode ^
        isAvailable.hashCode ^
        downloadLink.hashCode ^
        textSnippet.hashCode ^
        listPrice.hashCode ^
        retailPrice.hashCode;
  }

  GoogleVolume.fromResponseData(Map<String, dynamic> volume) {
    Map<String, dynamic> volumeInfo = volume['volumeInfo'];
    this.id = volume['id'] ?? '';
    this.etag = volume['etag'] ?? '';
    this.selfLink = volume['selfLink'] ?? '';
    this.title = volumeInfo['title'] ?? '';
    this.subtitle = volumeInfo['subTitle'] ?? '';
    this.authors = volumeInfo['authors'] ?? [];
    this.publisher = volumeInfo['publisher'] ?? '';
    this.publishedDate = volumeInfo['publishedDate'] ?? '';
    this.description = volumeInfo['description'] ?? '';
    this.industryIdentifiers = volumeInfo['industryIdentifiers'] ?? [];
    this.pageCount = volumeInfo['pageCount'] ?? 0;
    this.mainCategory = volumeInfo['mainCategory'] ?? '';
    this.categories = volumeInfo['categories'] ?? [];
    this.averageRating =
        double.tryParse(volumeInfo['averageRating'].toString() ?? '0');
    this.language = volumeInfo['language'] ?? '';
    this.previewLink = volumeInfo['previewLink'] ?? '';
    this.infoLink = volumeInfo['infoLink'] ?? '';
    this.canonicalVolumeLink = volumeInfo['canonicalVolumeLink'] ?? '';

    _createImages(volumeInfo);
    _createSaleInfo(volume);
    _createAccessInfo(volume);
    _createSearchInfo(volume);
  }

  void _createSearchInfo(Map<String, dynamic> searchInfo) {
    if (searchInfo['searchInfo'] == null) {
      return;
    }
    if (searchInfo['searchInfo'] != null &&
        searchInfo['searchInfo']['textSnippet'] != null) {
      this.textSnippet = searchInfo['searchInfo']['textSnippet'] ?? '';
    }
  }

  void _createAccessInfo(Map<String, dynamic> accessInfo) {
    if (accessInfo['accessInfo'] == null) {
      return;
    }
    this.publicDomain = accessInfo['accessInfo']['publicDomain'] ?? false;
    this.isAvailable = accessInfo['accessInfo']['epub']['isAvailable'] ??
        accessInfo['accessInfo']['pdf']['isAvailable'] ??
        false;
    this.downloadLink = accessInfo['accessInfo']['epub']['downloadLink'] ??
        accessInfo['accessInfo']['pdf']['downloadLink'] ??
        '';
  }

  void _createSaleInfo(Map<String, dynamic> saleInfo) {
    if (saleInfo['saleInfo'] == null) {
      return;
    }
    this.listPrice = saleInfo['saleInfo']['listPrice'] ?? {};
    this.retailPrice = saleInfo['saleInfo']['retailPrice'] ?? {};
    this.isEbook = saleInfo['saleInfo']['isEbook'] ?? false;
  }

  void _createImages(Map<String, dynamic> volumeInfo) {
    if (volumeInfo['imageLinks'] == null) {
      return;
    }
    this.smallThumbnail = volumeInfo['imageLinks']['smallThumbnail'] ?? '';
    this.thumbnail = volumeInfo['imageLinks']['thumbnail'] ?? '';
    this.small = volumeInfo['imageLinks']['small'] ?? '';
    this.medium = volumeInfo['imageLinks']['medium'] ?? '';
    this.large = volumeInfo['imageLinks']['large'] ?? '';
    this.extraLarge = volumeInfo['imageLinks']['extraLarge'] ?? '';
  }
}
/*

*/

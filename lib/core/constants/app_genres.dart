import 'package:easy_localization/easy_localization.dart';

abstract final class AppGenres {
  static const List<String> all = [
    'Animation', 'Adventure', 'Action',
    'Crime', 'Comedy', 'Biography',
    'Family', 'Drama', 'Documentary',
    'Game-Show', 'Film-Noir', 'Fantasy',
    'Music', 'Horror', 'History',
    'News', 'Mystery', 'Musical',
    'Sci-Fi', 'Romance', 'Reality-TV',
    'Talk-Show', 'Sport', 'Short',
    'Western', 'War', 'Thriller',
  ];

  static String label(String genre) {
    final key = 'genres_list.$genre';
    final translated = key.tr();
    return translated == key ? genre : translated;
  }
}
import 'package:netflix_api/core/strings.dart';
import 'package:netflix_api/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = '$kBaseUrl/trending/all/day?api_key=$apiKey';
  static const search =
      '$kBaseUrl/search/movie?include_adult=false&page=1';
}

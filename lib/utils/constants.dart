class Constants {
  static const String _apiKey = 'c56574f4d89b4f82b3da44be008ee6a4';
  static const String _baseUrl = 'https://newsapi.org/v2/';

  // ignore: non_constant_identifier_names
  static const String TOP_HEADLINES_URL =
      _baseUrl + 'top-headlines?country=fr&apiKey=' + _apiKey;

  static String headlinesFor(String keyword) {
    return _baseUrl + 'everything?q=$keyword&apiKey=$_apiKey';
  }
}

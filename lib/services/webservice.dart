import 'dart:convert';
import 'package:fresh_news/models/newsArticle.dart';
import 'package:fresh_news/utils/constants.dart';
import 'package:http/http.dart' as http;

String apiKey = "c56574f4d89b4f82b3da44be008ee6a4";

class WebService {
  Future<List<NewsArticle>> fetchHeadlinesByKeywork(String keyword) async {
    String url = Constants.headlinesFor(keyword);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((json) => NewsArticle.fromJSON(json)).toList();
    } else {
      throw Exception("Failed to get Headlines by keyword");
    }
  }

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    String url = Constants.TOP_HEADLINES_URL;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((json) => NewsArticle.fromJSON(json)).toList();
    } else {
      throw Exception("Failed to get top news");
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:fresh_news/models/newsArticle.dart';
import 'package:fresh_news/services/webservice.dart';
import 'package:fresh_news/viewmodels/newsArticleViewModel.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewsArticleListViewModel extends ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;

  List<NewsArticleViewModel> articles = <NewsArticleViewModel>[];

  Future<void> populateTopHeadlines() async {
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlines();
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  Future<void> search(String keyword) async {
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<NewsArticle> newsArticle =
        await WebService().fetchHeadlinesByKeywork(keyword);
    this.articles = newsArticle
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}

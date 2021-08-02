import 'package:flutter/material.dart';
import 'package:fresh_news/pages/newsListPage.dart';
import 'package:fresh_news/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fresh News",
      home: ChangeNotifierProvider(
        create: (context) => NewsArticleListViewModel()..populateTopHeadlines(),
        child: NewsListPage(),
      ),
    );
  }
}

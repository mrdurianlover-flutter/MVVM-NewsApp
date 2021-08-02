import 'package:flutter/material.dart';
import 'package:fresh_news/pages/newsArticleDetailsPage.dart';
import 'package:fresh_news/viewmodels/newsArticleListViewModel.dart';
import 'package:fresh_news/viewmodels/newsArticleViewModel.dart';
import 'package:fresh_news/widgets/newsList.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatelessWidget {
  final _controller = TextEditingController();

  Widget _buildList(BuildContext context, NewsArticleListViewModel vm) {
    switch (vm.loadingStatus) {
      case LoadingStatus.searching:
        return Align(child: CircularProgressIndicator());
      case LoadingStatus.empty:
        return Align(child: Text("No result found"));
      case LoadingStatus.completed:
        return Expanded(
          child: NewsList(
              articles: vm.articles,
              onSelected: (article) => _showNewDetails(context, article)),
        );
      default:
        return Align(child: CircularProgressIndicator());
    }
  }

  void _showNewDetails(BuildContext context, NewsArticleViewModel article) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewsArticleDetailsPage(article: article)));
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Top News"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                vm.search(value);
              }
            },
            decoration: InputDecoration(
              labelText: 'Enter search term',
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  _controller.clear();
                },
              ),
            ),
          ),
          _buildList(context, vm),
        ],
      ),
    );
  }
}

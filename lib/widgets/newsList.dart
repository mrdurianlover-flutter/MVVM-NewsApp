import 'package:flutter/material.dart';
import 'package:fresh_news/viewmodels/newsArticleViewModel.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  final Function(NewsArticleViewModel article)? onSelected;

  NewsList({required this.articles, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return ListTile(
          onTap: () {
            if (this.onSelected != null) {
              this.onSelected!(article);
            }
          },
          // short syntax
          // onTap: () =>
          //     this.onSelected != null ? this.onSelected!(article) : null,
          leading: Container(
            width: 100,
            height: 100,
            child: article.imageURL == null
                ? Image.asset('images/news-placeholder.jpg')
                : Image.network(articles[index].imageURL!),
          ),
          title: Text(articles[index].title),
        );
      },
    );
  }
}

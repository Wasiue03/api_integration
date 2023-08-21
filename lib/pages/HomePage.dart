import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:api_integration/models/Article_provider.dart';
import '../components/customListTile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final articleProvider = Provider.of<ArticleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: ListView.builder(
        itemCount: articleProvider.articles.length,
        itemBuilder: (context, index) {
          return customListTile(articleProvider.articles[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await articleProvider
              .fetchArticles(); // Fetch and update the articles
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

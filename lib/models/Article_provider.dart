import 'package:flutter/material.dart';
import 'package:api_integration/models/Article_model.dart';
import '../services/api_service.dart';

class ArticleProvider with ChangeNotifier {
  List<Article> _articles = [];

  List<Article> get articles => _articles;

  void setArticles(List<Article> articles) {
    _articles = articles;
    notifyListeners();
  }

  Future<void> fetchArticles() async {
    final fetchedArticles = await ApiService().getArticle(); // Use 'await' here
    setArticles(fetchedArticles);
  }
}

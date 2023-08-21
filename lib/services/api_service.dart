import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_integration/models/Article_model.dart';

class ApiService {
  final String apiKey = 'fe9af4c0f27a4daabc6ad60f5281d004';

  Future<List<Article>> getArticle() async {
    const String endPointUrl = "newsapi.org";
    const String country = 'us';
    const String category = 'technology';

    final Map<String, String> queryParameters = {
      'country': country,
      'category': category,
      'apiKey': apiKey,
    };

    final Uri uri =
        Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
    final http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List<dynamic> articleData = jsonData['articles'];

      final List<Article> articles =
          articleData.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw Exception('Failed to load articles');
    }
  }
}

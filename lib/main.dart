import 'package:api_integration/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:api_integration/models/Article_provider.dart'; // Import your ArticleProvider // Import your HomeScreen

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ArticleProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'News App',
      home: HomeScreen(),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/services/News_Service.dart';
import 'package:news_app/view/Home_View.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Homeview());
  }
}

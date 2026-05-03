import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Models/Article_Model.dart';
import '../services/News_Service.dart';
import 'News_Tile_Widget.dart';

class NewsTileListView extends StatelessWidget {
  final List<ArticleModel> articles ;

  const NewsTileListView({super.key , required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
            delegate: SliverChildBuilderDelegate(childCount: articles.length, (
              context,
              index,
            ) {
              return NewsTileWidget(articleModel: articles[index]);
            }),
          );

    // ListView.builder(
    //   itemCount: newsList.length,
    //   itemBuilder: (context, index) {
    //     return NewsTileWidget(news: newsList[index]);
    //   },
    // );
  }
}

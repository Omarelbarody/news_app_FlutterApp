import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/Article_Model.dart';
import '../services/News_Service.dart';
import 'News_Tile_List_View.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category ;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  //////// with statfull
  // List<ArticleModel> articles = [];
  // bool isloading = true;
  // @override
  // void initState() {
  //   super.initState();
  //   GetGeneralNews();
  // }
  //
  // Future<void> GetGeneralNews() async {
  //   articles = await NewsService(Dio()).getNews();
  //   isloading = false;
  //   setState(() {});
  // }

  var future ;
  @override
  void initState() {
    super.initState();
    future =   NewsService(Dio(),).getNews(
        category: widget.category
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<ArticleModel>>(
      future: future ,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsTileListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text(
                "Oops There Was An Error , Try Later",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
            ),
          );
        } else {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
                strokeWidth: 3,
              ),
            ),
          );
        }
      },
    );

    // return isloading
    //     ? SliverFillRemaining(
    //         hasScrollBody: false,
    //         child: Center(
    //           child: CircularProgressIndicator(color: Colors.grey , strokeWidth: 5,),
    //         ),
    //       )
    //     : articles.isNotEmpty
    //     ? NewsTileListView(articles: articles)
    //     : SliverFillRemaining(
    //         hasScrollBody: false,
    //         child: Center(
    //           child: Text(
    //             "Oops There Was An Error , Try Later",
    //             style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
    //           ),
    //         ),
    //       );
  }
}

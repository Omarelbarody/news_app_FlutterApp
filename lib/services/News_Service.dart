import 'package:dio/dio.dart';
import 'package:news_app/Models/Article_Model.dart';

class NewsService {
  NewsService(this.dio);
  final Dio dio;

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      var response = await dio.get(
        "https://newsapi.org/v2/top-headlines?apiKey=43a00a10d1e440e2b5eed162c8d83dab&country=us&category=$category",
      );

      Map<String, dynamic> jasonData = response.data;
      List<dynamic> articles = jasonData["articles"];

      List<ArticleModel> articleList = [];

      for (var article in articles) {
        ArticleModel articleModel =ArticleModel.fromJson(article);
        articleList.add(articleModel);
      }
      return articleList;
    } catch (e) {
      return [];
    }
  }
}

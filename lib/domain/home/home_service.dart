import 'package:b3_news_app/domain/home/home_repository.dart';
import 'package:b3_news_app/shared/models/news_model.dart';
import 'package:dio/dio.dart';

class HomeService {
  static Future<List<NewsModel>> fetchNews() async {
    final Response response = await HomeRepository().fetchNews();
    return response.data
        .map<NewsModel>((news) => NewsModel.fromJson(news))
        .toList();
  }

  static Future<NewsModel> findNewsById(String newsId) async {
    final Response response = await HomeRepository().findNewsById(newsId);
    return NewsModel.fromJson(response.data);
  }
}

import 'package:b3_news_app/shared/repositories/abstract_repository.dart';

class HomeRepository extends AbstractRepository {
  factory HomeRepository() {
    return _singleton;
  }
  HomeRepository._internal();

  static final HomeRepository _singleton = HomeRepository._internal();

  Future fetchNews() async => httpClient.get('/news');

  Future findNewsById(String newsId) async => httpClient.get('/news/$newsId');
}

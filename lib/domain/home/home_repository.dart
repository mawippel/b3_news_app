import 'package:b3_news_app/shared/repositories/abstract_repository.dart';

class HomeRepository extends AbstractRepository {

  Future fetchNews() async {
    await httpClient.get('/news');
  }
  
}
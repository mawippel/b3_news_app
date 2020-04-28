import 'package:b3_news_app/shared/repositories/abstract_repository.dart';

class ParagraphRepository extends AbstractRepository {

  factory ParagraphRepository() {
    return _singleton;
  }
  ParagraphRepository._internal();

  static final ParagraphRepository _singleton = ParagraphRepository._internal();

  Future fetchParagrahps(String newsId) async => httpClient.get('/news/$newsId/paragraphs');
  
}
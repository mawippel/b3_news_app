import 'package:b3_news_app/domain/home/home_service.dart';
import 'package:b3_news_app/shared/handlers/dio_error_handler.dart';
import 'package:b3_news_app/shared/models/news_model.dart';
import 'package:b3_news_app/shared/services/paragraph_service.dart';
import 'package:mobx/mobx.dart';
part 'news_detail_store.g.dart';

class NewsDetailStore = _NewsDetailStoreBase with _$NewsDetailStore;

abstract class _NewsDetailStoreBase with Store {
  @observable
  NewsModel news;

  @observable
  bool isLoading;

  @action
  Future findNewsWithParagraphs(String newsId) async {
    isLoading = true;
    try {
      await findNewsById(newsId);
      await fetchParagraphs(newsId);
    } catch (e) {
      DioErrorHandler.handle(e);
    } finally {
      isLoading = false;
    }
  }

  @action
  Future findNewsById(String newsId) async {
    news = await HomeService.findNewsById(newsId);
  }

  @action
  Future fetchParagraphs(String newsId) async {
    final paragraps = await ParagraphService.fetchParagraphs(newsId);
    news.paragraphs = paragraps;
  }
}

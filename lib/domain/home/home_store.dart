import 'package:b3_news_app/domain/home/home_service.dart';
import 'package:b3_news_app/shared/handlers/dio_error_handler.dart';
import 'package:b3_news_app/shared/models/news_model.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  ObservableList<NewsModel> news = <NewsModel>[].asObservable();

  @observable
  bool isLoading;

  @action
  void addNews(NewsModel news) {
    this.news.add(news);
  }

  @action
  void emptyNews() {
    news.clear();
  }

  @action
  Future fetchNews({bool displayLoading}) async {
    if (displayLoading) {
      isLoading = true;
    }
    try {
      final serverNews = await HomeService.fetchNews();
      serverNews.forEach(addNews);
    } catch (e) {
      DioErrorHandler.handle(e);
    } finally {
      isLoading = false;
    }
  }
}

import "package:collection/collection.dart";
import 'package:b3_news_app/domain/home/home_service.dart';
import 'package:b3_news_app/shared/handlers/dio_error_handler.dart';
import 'package:b3_news_app/shared/models/news_model.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  ObservableList<NewsModel> news = <NewsModel>[].asObservable();

  @observable
  ObservableList<NewsModel> searchableNews = <NewsModel>[].asObservable();

  @observable
  ObservableMap<DateTime, List<NewsModel>> newsMap = ObservableMap.of({});

  @observable
  bool isLoading;

  @observable
  bool isSearching = false;

  List<NewsModel> getSortedNewsByDate(DateTime date) {
    return newsMap[date]..sort((b, a) => a.createdAt.compareTo(b.createdAt));
  }

  @action
  void filterNews(String text) {
    if (text == null || text.length < 3) return;

    isLoading = true;
    searchableNews.clear();
    for (final n in news) {
      for (final stock in n.stocks) {
        if (stock.ticker.contains(text.toUpperCase())) {
          searchableNews.add(n);
        }
      }

      if (n.title.toUpperCase().contains(text.toUpperCase()) ||
          n.websiteName.toUpperCase().contains(text.toUpperCase())) {
        searchableNews.add(n);
      }
    }
    isLoading = false;
  }

  @action
  void clearSearchFilter() {
    searchableNews.clear();
    news.forEach(searchableNews.add);
    isSearching = false;
  }

  @action
  void addNews(NewsModel news) {
    this.news.add(news);
    searchableNews.add(news);
  }

  @action
  void emptyNews() {
    news.clear();
    searchableNews.clear();
  }

  @action
  Future fetchNews({bool displayLoading}) async {
    if (displayLoading) {
      isLoading = true;
    }
    try {
      final serverNews = await HomeService.fetchNews();
      serverNews.forEach(addNews);

      final newMap = groupBy(
          serverNews,
          (obj) => DateFormat('dd/MM/yyyy')
              .parse(DateFormat('dd/MM/yyyy').format(obj.createdAt)));
      newsMap.addAll(newMap);
    } catch (e) {
      DioErrorHandler.handle(e);
    } finally {
      isLoading = false;
    }
  }
}

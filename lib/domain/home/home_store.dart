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
  ObservableList<NewsModel> _news = <NewsModel>[].asObservable();

  @observable
  ObservableMap<DateTime, List<NewsModel>> presentedNewsMap =
      ObservableMap.of({});

  final List<NewsModel> _searchableNews = <NewsModel>[];

  @observable
  bool isLoading;

  @observable
  bool isSearching = false;

  List<NewsModel> getSortedNewsByDate(DateTime date) {
    return presentedNewsMap[date]
      ..sort((b, a) => a.createdAt.compareTo(b.createdAt));
  }

  @action
  void filterNews(String text) {
    if (text == null || text.length < 3) return;
    isLoading = true;
    _searchableNews.clear();

    for (final n in _news) {
      for (final stock in n.stocks) {
        if (stock.ticker.contains(text.toUpperCase())) {
          _searchableNews.add(n);
        }
      }

      if (n.title.toUpperCase().contains(text.toUpperCase()) ||
          n.websiteName.toUpperCase().contains(text.toUpperCase())) {
        _searchableNews.add(n);
      }
    }

    final newMap = groupBy(
        _searchableNews,
        (obj) => DateFormat('dd/MM/yyyy')
            .parse(DateFormat('dd/MM/yyyy').format(obj.createdAt)));
    presentedNewsMap.clear();
    presentedNewsMap.addAll(newMap);

    isLoading = false;
  }

  @action
  void filterByDate(DateTime initial, DateTime end) {
    if (initial == null || end == null) return;
    _searchableNews.clear();

    for (final n in _news) {
      if (n.createdAt.isAfter(initial) && n.createdAt.isBefore(end)) {
        _searchableNews.add(n);
      }
    }

    final newMap = groupBy(
        _searchableNews,
        (obj) => DateFormat('dd/MM/yyyy')
            .parse(DateFormat('dd/MM/yyyy').format(obj.createdAt)));
    presentedNewsMap.clear();
    presentedNewsMap.addAll(newMap);
  }

  @action
  void clearSearchFilter() {
    final newMap = groupBy(
        _news,
        (obj) => DateFormat('dd/MM/yyyy')
            .parse(DateFormat('dd/MM/yyyy').format(obj.createdAt)));
    presentedNewsMap.clear();
    presentedNewsMap.addAll(newMap);
    isSearching = false;
  }

  @action
  void addNews(NewsModel news) {
    _news.add(news);
  }

  @action
  void emptyNews() {
    _news.clear();
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
      presentedNewsMap.addAll(newMap);
    } catch (e) {
      DioErrorHandler.handle(e);
    } finally {
      isLoading = false;
    }
  }
}

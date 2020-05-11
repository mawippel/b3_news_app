// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$_newsAtom = Atom(name: '_HomeStoreBase._news');

  @override
  ObservableList<NewsModel> get _news {
    _$_newsAtom.context.enforceReadPolicy(_$_newsAtom);
    _$_newsAtom.reportObserved();
    return super._news;
  }

  @override
  set _news(ObservableList<NewsModel> value) {
    _$_newsAtom.context.conditionallyRunInAction(() {
      super._news = value;
      _$_newsAtom.reportChanged();
    }, _$_newsAtom, name: '${_$_newsAtom.name}_set');
  }

  final _$presentedNewsMapAtom = Atom(name: '_HomeStoreBase.presentedNewsMap');

  @override
  ObservableMap<DateTime, List<NewsModel>> get presentedNewsMap {
    _$presentedNewsMapAtom.context.enforceReadPolicy(_$presentedNewsMapAtom);
    _$presentedNewsMapAtom.reportObserved();
    return super.presentedNewsMap;
  }

  @override
  set presentedNewsMap(ObservableMap<DateTime, List<NewsModel>> value) {
    _$presentedNewsMapAtom.context.conditionallyRunInAction(() {
      super.presentedNewsMap = value;
      _$presentedNewsMapAtom.reportChanged();
    }, _$presentedNewsMapAtom, name: '${_$presentedNewsMapAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: '_HomeStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$isSearchingAtom = Atom(name: '_HomeStoreBase.isSearching');

  @override
  bool get isSearching {
    _$isSearchingAtom.context.enforceReadPolicy(_$isSearchingAtom);
    _$isSearchingAtom.reportObserved();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.context.conditionallyRunInAction(() {
      super.isSearching = value;
      _$isSearchingAtom.reportChanged();
    }, _$isSearchingAtom, name: '${_$isSearchingAtom.name}_set');
  }

  final _$fetchNewsAsyncAction = AsyncAction('fetchNews');

  @override
  Future<dynamic> fetchNews({bool displayLoading}) {
    return _$fetchNewsAsyncAction
        .run(() => super.fetchNews(displayLoading: displayLoading));
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void filterNews(String text) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction();
    try {
      return super.filterNews(text);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterByDate(DateTime initial, DateTime end) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction();
    try {
      return super.filterByDate(initial, end);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSearchFilter() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction();
    try {
      return super.clearSearchFilter();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNews(NewsModel news) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction();
    try {
      return super.addNews(news);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void emptyNews() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction();
    try {
      return super.emptyNews();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'presentedNewsMap: ${presentedNewsMap.toString()},isLoading: ${isLoading.toString()},isSearching: ${isSearching.toString()}';
    return '{$string}';
  }
}

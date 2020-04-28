// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsDetailStore on _NewsDetailStoreBase, Store {
  final _$newsAtom = Atom(name: '_NewsDetailStoreBase.news');

  @override
  NewsModel get news {
    _$newsAtom.context.enforceReadPolicy(_$newsAtom);
    _$newsAtom.reportObserved();
    return super.news;
  }

  @override
  set news(NewsModel value) {
    _$newsAtom.context.conditionallyRunInAction(() {
      super.news = value;
      _$newsAtom.reportChanged();
    }, _$newsAtom, name: '${_$newsAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: '_NewsDetailStoreBase.isLoading');

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

  final _$findNewsWithParagraphsAsyncAction =
      AsyncAction('findNewsWithParagraphs');

  @override
  Future<dynamic> findNewsWithParagraphs(String newsId) {
    return _$findNewsWithParagraphsAsyncAction
        .run(() => super.findNewsWithParagraphs(newsId));
  }

  final _$findNewsByIdAsyncAction = AsyncAction('findNewsById');

  @override
  Future<dynamic> findNewsById(String newsId) {
    return _$findNewsByIdAsyncAction.run(() => super.findNewsById(newsId));
  }

  final _$fetchParagraphsAsyncAction = AsyncAction('fetchParagraphs');

  @override
  Future<dynamic> fetchParagraphs(String newsId) {
    return _$fetchParagraphsAsyncAction
        .run(() => super.fetchParagraphs(newsId));
  }

  @override
  String toString() {
    final string =
        'news: ${news.toString()},isLoading: ${isLoading.toString()}';
    return '{$string}';
  }
}

import 'package:b3_news_app/shared/models/paragraph_model.dart';
import 'package:b3_news_app/shared/repositories/paragraph_repository.dart';
import 'package:dio/dio.dart';

class ParagraphService {

  static Future<List<ParagraphModel>> fetchParagraphs(String newsId) async {
    final Response response = await ParagraphRepository().fetchParagrahps(newsId);
    return response.data
        .map<ParagraphModel>((paragraph) => ParagraphModel.fromJson(paragraph))
        .toList();
  }
  
}
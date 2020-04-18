import 'package:b3_news_app/shared/providers/http_client.dart';
import 'package:get_it/get_it.dart';

abstract class AbstractRepository {

  final httpClient = GetIt.I.get<HttpClient>().client;
}
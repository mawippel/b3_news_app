import 'package:b3_news_app/shared/models/sentiment.dart';
import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  NewsModel({
    this.id,
    this.title,
    this.href,
    this.createdAt,
    this.mixed,
    this.neutral,
    this.positive,
    this.negative,
    this.sentiment,
    this.websiteName,
    this.websitePhoto,
  });
  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  String id;
  String title;
  String href;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  double mixed;
  double neutral;
  double positive;
  double negative;
  Sentiment sentiment;
  String websiteName;
  String websitePhoto;

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}

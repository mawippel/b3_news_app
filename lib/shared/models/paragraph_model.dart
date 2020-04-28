import 'package:b3_news_app/shared/models/sentiment.dart';
import 'package:json_annotation/json_annotation.dart';
part 'paragraph_model.g.dart';

@JsonSerializable()
class ParagraphModel {
  ParagraphModel({
    this.id,
    this.text,
    this.createdAt,
    this.mixed,
    this.neutral,
    this.positive,
    this.negative,
    this.sentiment,
  });
  factory ParagraphModel.fromJson(Map<String, dynamic> json) =>
      _$ParagraphModelFromJson(json);

  String id;
  String text;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  double mixed;
  double neutral;
  double positive;
  double negative;
  Sentiment sentiment;

  Map<String, dynamic> toJson() => _$ParagraphModelToJson(this);
}

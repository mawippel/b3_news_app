// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return NewsModel(
    id: json['id'] as String,
    title: json['title'] as String,
    href: json['href'] as String,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    mixed: (json['mixed'] as num)?.toDouble(),
    neutral: (json['neutral'] as num)?.toDouble(),
    positive: (json['positive'] as num)?.toDouble(),
    negative: (json['negative'] as num)?.toDouble(),
    sentiment: _$enumDecodeNullable(_$SentimentEnumMap, json['sentiment']),
    websiteName: json['websiteName'] as String,
    websitePhoto: json['websitePhoto'] as String,
  )
    ..paragraphs = (json['paragraphs'] as List)
        ?.map((e) => e == null
            ? null
            : ParagraphModel.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..stocks = (json['stocks'] as List)
        ?.map((e) =>
            e == null ? null : StockModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'href': instance.href,
      'created_at': instance.createdAt?.toIso8601String(),
      'mixed': instance.mixed,
      'neutral': instance.neutral,
      'positive': instance.positive,
      'negative': instance.negative,
      'sentiment': _$SentimentEnumMap[instance.sentiment],
      'websiteName': instance.websiteName,
      'websitePhoto': instance.websitePhoto,
      'paragraphs': instance.paragraphs,
      'stocks': instance.stocks,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$SentimentEnumMap = {
  Sentiment.POSITIVE: 'POSITIVE',
  Sentiment.NEGATIVE: 'NEGATIVE',
  Sentiment.MIXED: 'MIXED',
  Sentiment.NEUTRAL: 'NEUTRAL',
};

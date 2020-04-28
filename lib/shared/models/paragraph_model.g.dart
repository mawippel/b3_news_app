// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paragraph_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParagraphModel _$ParagraphModelFromJson(Map<String, dynamic> json) {
  return ParagraphModel(
    id: json['id'] as String,
    text: json['text'] as String,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    mixed: (json['mixed'] as num)?.toDouble(),
    neutral: (json['neutral'] as num)?.toDouble(),
    positive: (json['positive'] as num)?.toDouble(),
    negative: (json['negative'] as num)?.toDouble(),
    sentiment: _$enumDecodeNullable(_$SentimentEnumMap, json['sentiment']),
  );
}

Map<String, dynamic> _$ParagraphModelToJson(ParagraphModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'created_at': instance.createdAt?.toIso8601String(),
      'mixed': instance.mixed,
      'neutral': instance.neutral,
      'positive': instance.positive,
      'negative': instance.negative,
      'sentiment': _$SentimentEnumMap[instance.sentiment],
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

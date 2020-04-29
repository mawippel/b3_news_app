// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockModel _$StockModelFromJson(Map<String, dynamic> json) {
  return StockModel(
    ticker: json['ticker'] as String,
    name: json['name'] as String,
    company: json['company'] as String,
  );
}

Map<String, dynamic> _$StockModelToJson(StockModel instance) =>
    <String, dynamic>{
      'ticker': instance.ticker,
      'name': instance.name,
      'company': instance.company,
    };

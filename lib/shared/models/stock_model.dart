import 'package:json_annotation/json_annotation.dart';

part 'stock_model.g.dart';

@JsonSerializable()
class StockModel {
  StockModel({
    this.ticker,
    this.name,
    this.company,
  });
  factory StockModel.fromJson(Map<String, dynamic> json) =>
      _$StockModelFromJson(json);

  String ticker;
  String name;
  String company;

  Map<String, dynamic> toJson() => _$StockModelToJson(this);
}

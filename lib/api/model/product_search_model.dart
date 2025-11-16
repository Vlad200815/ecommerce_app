import 'package:ecommerce_app/api/model/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part "product_search_model.g.dart";

@JsonSerializable()
class ProductSearchModel {
  final List<ProductModel> products;
  final int total;
  final int skip;
  final int limit;

  const ProductSearchModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductSearchModel.fromJson(Map<String, dynamic> json) =>
      _$ProductSearchModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductSearchModelToJson(this);
}

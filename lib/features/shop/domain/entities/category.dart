import 'package:firebase_database/firebase_database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../core/data/hive_adapters.dart';
import 'product.dart';

part 'category.freezed.dart';
part 'category.g.dart';

/// Categpry Entity
@HiveType(typeId: HiveAdapters.category)
@freezed
class Category with _$Category {
  /// Constructor
  @JsonSerializable(explicitToJson: true)
  const factory Category(
      {@HiveField(0)
          required int id,
      @HiveField(1)
          required String title,
      @HiveField(2)
          required String icon,
      @JsonKey(
          name: 'items',
          defaultValue: <Product>[],
          fromJson: _productFromJson)
      @HiveField(3)
          required List<Product> products}) = _Category;

  /// Initial state with default values
  factory Category.initial() =>
      const Category(id: 0, icon: '', products: [], title: '');

  /// Convert from json to model
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

      /// Convert from DataSnapshot to model
  // factory Category.fromDataSnapshot(Object? dataSnapshot)  {
  //  return Category(id: dataSnapshot.get('id') as String, title: dataSnapshot.get('title') as String, icon: dataSnapshot.get('icon') as String, products: products)
  // }
}

List<Product> _productFromJson(List<dynamic> json) {
  return json
      .cast<Map<String, dynamic>>()
      .map<Product>(Product.fromJson)
      .toList();
}

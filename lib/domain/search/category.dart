import 'package:freezed_annotation/freezed_annotation.dart';
part 'category.g.dart';

@JsonSerializable()
class Category {
  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, Object?> json) =>
      _$CategoryFromJson(json);

  final String id;
  final String name;

}

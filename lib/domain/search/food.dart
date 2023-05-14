import 'package:freezed_annotation/freezed_annotation.dart';
part 'food.g.dart';

@JsonSerializable()
class Food {
  Food({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.cusineId,
    required this.chef,
  });
  final String id;
  final String name;
  final String categoryId;
  final String cusineId;
  final String chef;

  factory Food.fromJson(Map<String, Object?> json) => _$FoodFromJson(json);

  Map<String, dynamic> toJson(dynamic data) => _$FoodToJson(data);
}

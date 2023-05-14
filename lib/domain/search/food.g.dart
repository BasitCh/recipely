// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Food _$FoodFromJson(Map<String, dynamic> json) => Food(
      id: json['id'] as String,
      name: json['name'] as String,
      categoryId: json['categoryId'] as String,
      cusineId: json['cusineId'] as String,
      chef: json['chef'] as String,
    );

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'categoryId': instance.categoryId,
      'cusineId': instance.cusineId,
      'chef': instance.chef,
    };

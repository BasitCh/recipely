import 'package:freezed_annotation/freezed_annotation.dart';
part 'cusine.g.dart';

@JsonSerializable()
class Cusine {
  Cusine({required this.id, required this.name});

  factory Cusine.fromJson(Map<String, Object?> json) => _$CusineFromJson(json);

  final String id;
  final String name;

}

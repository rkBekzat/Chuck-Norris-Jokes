import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'Joke.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: 0)
class Joke {
  @HiveField(0)
  var categories = [];
  @HiveField(1)
  var createdAt = "";
  @HiveField(2)
  var iconUrl = "";
  @HiveField(3)
  var id = "";
  @HiveField(4)
  var updatedAt = "";
  @HiveField(5)
  var url = "";
  @HiveField(6)
  var value = "";

  Joke(
      {required this.categories,
      required this.createdAt,
      required this.iconUrl,
      required this.id,
      required this.updatedAt,
      required this.url,
      required this.value});

  factory Joke.fromJson(Map<String, dynamic> json) => _$JokeFromJson(json);

  Map<String, dynamic> toJson() => _$JokeToJson(this);
}

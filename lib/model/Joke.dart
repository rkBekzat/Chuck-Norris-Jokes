import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'Joke.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: 0)
class Joke {
  @HiveField(0)
  final List<String> categories;
  @HiveField(1)
  final String createdAt ;
  @HiveField(2)
  final String iconUrl ;
  @HiveField(3)
  final String id ;
  @HiveField(4)
  final String updatedAt ;
  @HiveField(5)
  final String url ;
  @HiveField(6)
  final String value ;

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

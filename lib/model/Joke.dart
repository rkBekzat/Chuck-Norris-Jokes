import 'package:json_annotation/json_annotation.dart';

part 'Joke.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Joke {
  var categories = [];
  var createdAt = "";
  var iconUrl = "";
  var id = "";
  var updatedAt = "";
  var url = "";
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

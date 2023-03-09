import 'package:json_annotation/json_annotation.dart';

part 'Joke.g.dart';

// don't change names of variable cause it's name of variables of json which extract by API
@JsonSerializable()
class Joke {
  var categories = [];
  var created_at = "";
  var icon_url = "";
  var id = "";
  var updated_at = "";
  var url = "";
  var value = "";

  Joke(
      {required this.categories,
      required this.created_at,
      required this.icon_url,
      required this.id,
      required this.updated_at,
      required this.url,
      required this.value});

  factory Joke.fromJson(Map<String, dynamic> json) => _$JokeFromJson(json);

  Map<String, dynamic> toJson() => _$JokeToJson(this);
}

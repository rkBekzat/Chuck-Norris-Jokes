// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Joke.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Joke _$JokeFromJson(Map<String, dynamic> json) => Joke(
      categories: json['categories'] as List<dynamic>,
      created_at: json['created_at'] as String,
      icon_url: json['icon_url'] as String,
      id: json['id'] as String,
      updated_at: json['updated_at'] as String,
      url: json['url'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$JokeToJson(Joke instance) => <String, dynamic>{
      'categories': instance.categories,
      'created_at': instance.created_at,
      'icon_url': instance.icon_url,
      'id': instance.id,
      'updated_at': instance.updated_at,
      'url': instance.url,
      'value': instance.value,
    };

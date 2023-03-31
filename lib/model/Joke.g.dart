// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Joke.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Joke _$JokeFromJson(Map<String, dynamic> json) => Joke(
      categories: json['categories'] as List<dynamic>,
      createdAt: json['created_at'] as String,
      iconUrl: json['icon_url'] as String,
      id: json['id'] as String,
      updatedAt: json['updated_at'] as String,
      url: json['url'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$JokeToJson(Joke instance) => <String, dynamic>{
      'categories': instance.categories,
      'created_at': instance.createdAt,
      'icon_url': instance.iconUrl,
      'id': instance.id,
      'updated_at': instance.updatedAt,
      'url': instance.url,
      'value': instance.value,
    };

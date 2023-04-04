// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Joke.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JokeAdapter extends TypeAdapter<Joke> {
  @override
  final int typeId = 0;

  @override
  Joke read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Joke(
      categories: (fields[0] as List).cast<dynamic>(),
      createdAt: fields[1] as String,
      iconUrl: fields[2] as String,
      id: fields[3] as String,
      updatedAt: fields[4] as String,
      url: fields[5] as String,
      value: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Joke obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.categories)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.iconUrl)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.url)
      ..writeByte(6)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JokeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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

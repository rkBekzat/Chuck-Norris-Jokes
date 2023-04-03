// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LikedJoke.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LikedJokeAdapter extends TypeAdapter<LikedJoke> {
  @override
  final int typeId = 0;

  @override
  LikedJoke read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LikedJoke()..joke = fields[0] as Future<Joke>;
  }

  @override
  void write(BinaryWriter writer, LikedJoke obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.joke);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LikedJokeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

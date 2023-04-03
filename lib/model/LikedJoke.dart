import 'package:hive/hive.dart';
import 'Joke.dart';

part 'LikedJoke.g.dart';

@HiveType(typeId: 0)
class LikedJoke {
  @HiveField(0)
  late Future<Joke> joke;
}
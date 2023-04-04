import 'package:courses/model/Joke.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<Joke> getLikedJokes() =>
      Hive.box<Joke>('Joke');
}
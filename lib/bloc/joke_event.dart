

part of 'joke_bloc.dart';

@immutable
abstract class JokeEvent {}

class AddJoke extends JokeEvent {
  final Future<Joke> likes;
  final Future<Joke> next;

  AddJoke({
        required this.likes,
        required this.next,
  });
}

class SkipJoke extends JokeEvent {
  final Future<Joke> next;

  SkipJoke({
    required this.next,
  });
}

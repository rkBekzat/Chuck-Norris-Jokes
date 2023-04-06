part of 'joke_bloc.dart';

@immutable
abstract class JokeEvent {}

class AddJoke extends JokeEvent {}

class SkipJoke extends JokeEvent {}

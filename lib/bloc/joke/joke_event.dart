part of 'joke_bloc.dart';

@immutable
abstract class JokeEvent {}

class AddJoke extends JokeEvent {}

class SkipJoke extends JokeEvent {}

class CategoryJokeEvent extends JokeEvent {
  final String category;

  CategoryJokeEvent({required this.category});
}

class SearchedJokeEvent extends JokeEvent {
  final String text;

  SearchedJokeEvent({required this.text});
}

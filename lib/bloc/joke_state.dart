part of 'joke_bloc.dart';

class JokeState {
  final Future<Joke> first;
  final Future<Joke> second;

  JokeState({
    required this.first,
    required this.second,
  });

  JokeState copyWith(Future<Joke> front, Future<Joke> back){
    return JokeState(first: front, second: back);
  }
}

class JokeInitial extends JokeState{
  JokeInitial() : super(first: getHttp(), second: getHttp());
}

class JokeUpdateState extends JokeState {
  JokeUpdateState({required super.first, required super.second});
}

part of 'joke_bloc.dart';

class JokeState {
  final Future<Joke> jokeOnFront;
  final Future<Joke> jokeOnBack;
  final int count;
  final int currentImage;
  final int nextImage;

  JokeState({
    required this.jokeOnFront,
    required this.jokeOnBack,
    required this.count,
    required this.currentImage,
    required this.nextImage,
  });

  JokeState copyWith(Future<Joke> front, Future<Joke> back, int image){
    return JokeState(jokeOnFront: front, jokeOnBack: back, count: count+1, currentImage: image, nextImage: Random().nextInt(4));
  }
}

class JokeInitial extends JokeState{
  JokeInitial() : super(jokeOnFront: getHttp(), jokeOnBack: getHttp(), count: 0, currentImage: Random().nextInt(4), nextImage: Random().nextInt(4));
}

class JokeUpdateState extends JokeState {
  JokeUpdateState({
  required super.jokeOnFront,
  required super.jokeOnBack,
  required super.count,
  required super.currentImage,
  required super.nextImage});
}

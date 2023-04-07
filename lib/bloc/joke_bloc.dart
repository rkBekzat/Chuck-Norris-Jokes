import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../functions/get_joke.dart';
import '../model/Joke.dart';

part 'joke_event.dart';
part 'joke_state.dart';



class JokeBloc extends Bloc<JokeEvent, JokeState> {
  JokeBloc() : super(JokeInitial()) {
    on<AddJoke>(_addJoke);
    on<SkipJoke>(_skipJoke);
    on<CategoryJokeEvent>(_showCategoryJoke);
  }

  _addJoke(AddJoke event, Emitter<JokeState> emit) async{
    var box = Hive.box<Joke>('Joke');

    box.add(await state.jokeOnFront);
    emit(state.copyWith(state.jokeOnBack, getRandomJoke(), state.nextImage));
  }

  _showCategoryJoke(CategoryJokeEvent event, Emitter<JokeState> emit) async {
    emit(state.copyWith(getCategory(event.category), state.jokeOnBack, state.currentImage));
  }

  _skipJoke(SkipJoke event, Emitter<JokeState> emit) async {
    emit(state.copyWith(state.jokeOnBack, getRandomJoke(), state.nextImage));
  }


}

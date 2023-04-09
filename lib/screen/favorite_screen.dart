import 'package:courses/model/joke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../bloc/joke/joke_bloc.dart';

class LikeJoke extends StatelessWidget {
  const LikeJoke

  ({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Joke>>(
          valueListenable: Hive.box<Joke>('Joke').listenable(),
          builder: (context, box, _) {
            final likes = box.values.toList().cast<Joke>();
            return ListView.builder(
                itemCount: likes.length,
                itemBuilder: (BuildContext context, int index) {
                  return  Dismissible(
                      key: Key('${likes.length * index}'),
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                          border: Border.all(
                          color: Colors.black12,
                          width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(likes[index].value),
                          ),
                        onDismissed: (direction) {
                          BlocProvider.of<JokeBloc>(context).add(DeleteJokeEvent(likes[index]));
                  },
                  );
                }
          );
          },
        );
  }

}

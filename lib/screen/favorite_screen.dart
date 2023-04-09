import 'package:courses/model/joke.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LikeJoke extends StatelessWidget {
  const LikeJoke({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Joke>>(
      valueListenable: Hive.box<Joke>('Joke').listenable(),
      builder: (context, box, _) {
        final likes = box.values.toList().cast<Joke>();
        return buildContent(likes);
      },
    );
  }

  Widget buildContent(List<Joke> likes) {
    return ListView.builder(
        itemCount: likes.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black12,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(likes[index].value),
          );
        });
  }
}

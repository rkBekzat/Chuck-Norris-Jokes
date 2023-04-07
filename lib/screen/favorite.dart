import 'package:courses/model/Joke.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/Joke.dart';

class LikeJoke extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ValueListenableBuilder<Box<Joke>>(
        valueListenable: Hive.box<Joke>('Joke').listenable(),
        builder: (context, box, _){
          final likes = box.values.toList().cast<Joke>();
          print("LISTS:\n");
          print(likes);
          print("\n");
          return buildContent(likes);
        },
      ),
    );
  }

  Widget buildContent(List<Joke> likes){
    return ListView.builder(
        itemCount: likes.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(likes[index].value),
          );
        }
    );
  }

}

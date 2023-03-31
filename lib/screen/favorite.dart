import 'package:flutter/material.dart';

import '../model/Joke.dart';

class LikeJoke extends StatelessWidget {

  final List<Future<Joke>>  fav;

  const LikeJoke({required this.fav});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: fav.length,
          itemBuilder: (BuildContext context, int index) {
            return FutureBuilder(
                future: fav[index],
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    return Text(snapshot.data!.value);
                  } else if(snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  }
                  return const Text("Loading...");
                }
            );
          }
      ),
    );
  }
}

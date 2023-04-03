import 'package:flutter/cupertino.dart';
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
                child: FutureBuilder(
                future: fav[index],
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    return Text(snapshot.data!.value);
                  } else if(snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  }
                  return const Text("Loading...");
                }
            ));
          }
      ),
    );
  }
}

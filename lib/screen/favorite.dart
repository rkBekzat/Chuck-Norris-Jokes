import 'package:flutter/material.dart';

import '../model/Joke.dart';

class LikeJoke extends StatelessWidget {

  final List<Future<Joke>>  fav;

  const LikeJoke({required this.fav});

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}

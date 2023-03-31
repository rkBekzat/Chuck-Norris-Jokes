import 'dart:async';
import 'dart:math';

import 'package:courses/screen/widget/bottom.dart';
import 'package:courses/screen/widget/dialog_button.dart';
import 'package:courses/screen/widget/information.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../model/Joke.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.lightBlue),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: const [MyDialog()],
          title: const Text('Chucks joke'),
        ),
        body: const SafeArea(child: JokePage()),
      ),
    );
  }
}

class JokePage extends StatefulWidget {
  const JokePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _JokePageState createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  late Future<Joke> information1;
  late Future<Joke> information2;
  late List<Future<Joke>> favoriteJoke;
  late int count = 0;
  static const List<String> images = [
    "assets/images/chuck1.jpg",
    "assets/images/chuck2.jpg",
    "assets/images/chuck3.jpg",
    "assets/images/chuck4.jpg",
  ];
  late int position , next;

  @override
  void initState() {
    super.initState();
    information1 = getHttp();
    information2 = getHttp();
    position = Random().nextInt(4);
    next = Random().nextInt(4);
    favoriteJoke = [];
  }


  void update(bool fav) {
    position = next;
    next = Random().nextInt(4);
    if(fav){
      favoriteJoke.add((count % 2 == 0) ? information1 : information2);
    }
    print(favoriteJoke.length);
    print(favoriteJoke);
    setState(() {
      if (count % 2 == 0) {
        information1 = getHttp();
      } else {
        information2 = getHttp();
      }
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Information(
              information: count % 2 == 1 ? information1 : information2,
              color: next,
              path: images[next],
            ),
            Dismissible(
              key: Key("$count"),
              child: Information(
                information: count % 2 == 0 ? information1 : information2,
                color: position,
                path: images[position],
              ),
              onDismissed: (DismissDirection direction) {
                if(direction == DismissDirection.startToEnd){
                  update(false);
                } else {
                  update(true);
                }
              },
            ),
          ],
        ),
        BottomPart(
          updateCallback: update,
        ),
      ],
    );
  }
}

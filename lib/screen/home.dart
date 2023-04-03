import 'dart:async';
import 'dart:math';

import 'package:courses/model/LikedJoke.dart';
import 'package:courses/screen/widget/bottom.dart';
import 'package:courses/screen/widget/dialog_button.dart';
import 'package:courses/screen/widget/information.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../main.dart';
import '../model/Joke.dart';
import 'favorite.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Widget> buildBody = <Widget>[
      JokePage(),
      LikeJoke(),
  ];
  int index = 0;

  void choose(int selectedIndex){
    setState(() {
      index = selectedIndex;
    });
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: const [MyDialog()],
          title: const Text('Chucks joke'),
        ),
        body: buildBody.elementAt(index),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          unselectedItemColor: Colors.indigoAccent,
          onTap: choose,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.monitor_heart),
                label: 'liked',
            ),
          ],
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
      Box box = Hive.box<LikedJoke>('likedJoke');
      final likes = LikedJoke()
        ..joke = (count % 2 == 0) ? information1 : information2;
      box.add(likes);
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

import 'package:courses/bloc/joke_bloc.dart';
import 'package:courses/widget/dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'JokePage.dart';
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

  void choose(int selectedIndex) {
    setState(() {
      index = selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final jokeBloc = context.read<JokeBloc>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [MyDialog(jokeBloc: jokeBloc,),
        ],
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

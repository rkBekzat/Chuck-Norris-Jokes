import 'package:courses/bloc/joke/joke_bloc.dart';
import 'package:courses/generated/locale_keys.g.dart';
import 'package:courses/widget/dialog_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'joke_screen.dart';
import 'favorite_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> buildBody = <Widget>[
    const JokePage(),
    const LikeJoke(),
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
        actions: [
          MyDialog(
            jokeBloc: jokeBloc,
          ),
        ],
        leading: IconButton(
          onPressed: () {
            if (context.locale == Locale('ru')) {
              context.setLocale(Locale('en'));
            } else {
              context.setLocale(Locale('ru'));
            }
            setState(() {

            });
          },
          icon: Icon(Icons.language),
        ),
        title:  Text(LocaleKeys.Chucks_joke.tr()),
      ),
      body: buildBody.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        unselectedItemColor: Colors.indigoAccent,
        onTap: choose,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: LocaleKeys.home.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart),
            label: LocaleKeys.Liked.tr(),
          ),
        ],
      ),
    );
  }
}

import 'package:courses/model/Joke.dart';
import 'package:courses/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/joke_bloc.dart';
import 'model/Joke.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(JokeAdapter());
  await Hive.openBox<Joke>("Joke");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.lightBlue),
      home: BlocProvider<JokeBloc>(
        create: (context) => JokeBloc(),
        child: Home(),
      ),
    );
  }
}

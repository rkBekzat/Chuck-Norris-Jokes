import 'package:courses/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/Joke.dart';

Future<Joke> getHttp() async {
  var response =
      await http.get(Uri.https('api.chucknorris.io', '/jokes/random'));
  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    return Joke.fromJson(result);
  } else {
    throw Exception("Bad connection try again");
  }
}

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.lightBlue),
      home: Home(),
    );
  }
}

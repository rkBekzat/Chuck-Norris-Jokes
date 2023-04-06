import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/Joke.dart';

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
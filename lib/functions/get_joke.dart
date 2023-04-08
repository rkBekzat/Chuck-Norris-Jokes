import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/Joke.dart';

Future<Joke> getRandomJoke()  {
  final uri = Uri.https('api.chucknorris.io', '/jokes/random');
  return getResponse(uri);
}

Future<Joke> getCategory(String category)  {
  final uri = Uri.https('api.chucknorris.io', 'jokes/random',  {'category' : category,});
  return getResponse(uri);
}

Future<Joke> getSearched(String text){
  final uri = Uri.https('api.chucknorris.io', 'jokes/search', {'query' : text});
  return getResponse(uri);
}

Future<Joke> getResponse(final uri) async {
  var response =
      await http.get(uri);
  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    return Joke.fromJson(result);
  } else {
    throw Exception("Bad connection try again");
  }
}
# Flutter course, assignment 1


__Chuck Norris jokes__

## Table content


- [Description](#description)
- [Images](#Demo)
- [Library](#library)
- [Code](#code)
- [APK](#APK)

## Description

This is the Flutter application which show image of the Chunk Norris and his joke. The app based on tinder appliction idea where you can swipe to  left if like and to right if it's not interesting, also  in bottom align two buttons like and dislike. In appbar I align the buttons which show dialog and information about me. 


## Images 


|                    Scrolling jokes                     |                        page                        |                       dialog                     |
|:------------------------------------------------------:|:--------------------------------------------------------:|:----------------------------------------------------------------:|
| <img src="https://i.ibb.co/1Z2rYfN/app3.jpg" alt="Scrolling"> | <img src="https://i.ibb.co/3cpGNRm/app2.jpg" alt="page"> | <img src="https://i.ibb.co/vLXndWC/app4.jpg" alt="dailog"> |


<!-- ![](https://i.ibb.co/9tFNKym/app1.jpg) ![](https://i.ibb.co/3cpGNRm/app2.jpg) ![](https://i.ibb.co/1Z2rYfN/app3.jpg) ![](https://i.ibb.co/vLXndWC/app4.jpg) -->



## Library


- [http](https://pub.dev/packages/http) - This library used to fetch quotes from this [site](https://api.chucknorris.io/)
- [json_serializable](https://pub.dev/packages/json_serializable) - This library used to serialize JSON data into a model object. 
- [flutter_lints](https://pub.dev/packages/flutter_lints) - This library detect warnings and report them to the user.
- [build_runner](https://pub.dev/packages/build_runner) - This library used to generate __Joke.g.dart__ file.

## Code 


___Fetch data with API___ 
```
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
```

Result will json which contains this properties:
```
var categories = [];
var created_at = "";
var icon_url = "";
var id = "";
var updated_at = "";
var url = "";
var value = "";
```



## APK

[release-apk](https://github.com/rkBekzat/Assignment1/apk-release.apk)
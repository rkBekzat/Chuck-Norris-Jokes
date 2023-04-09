import 'package:flutter/material.dart';
import '../../model/joke.dart';

class Information extends StatelessWidget {
  final Future<Joke> information;

  static const List<Color> _color = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
  ];
  final int color;
  final String path;

  const Information(
      {Key? key,
      required this.information,
      required this.color,
      required this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.65,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
          color: _color[color],
          borderRadius: const BorderRadius.all(Radius.circular(18)),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(path),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder<Joke>(
                future: information,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.value);
                  } else if (snapshot.hasError) {
                    return Text('ERROR: ${snapshot.error}');
                  }
                  return const Text("Loading...");
                },
              ),
            ],
          ),
        ));
  }
}

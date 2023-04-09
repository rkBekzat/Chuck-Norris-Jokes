import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/joke/joke_bloc.dart';
import '../../assets/constants.dart' as Constants;

class MyDialog extends StatelessWidget {
  final JokeBloc jokeBloc;

  const MyDialog({Key? key, required this.jokeBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(3),
        child: Row(
          children: [
            IconButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                        child: showCategory(),
                      )),
              icon: const Icon(
                Icons.filter_alt_outlined,
              ),
            ),
            IconButton(
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(Constants.aboutConst),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Close')),
                              ],
                            ),
                          ),
                        )),
                icon: const Icon(Icons.info)),
          ],
        ));
  }

  Widget showCategory() {
    // final jokeBloc = BlocProvider.of<JokeBloc>(context);
    return BlocProvider<JokeBloc>(
      create: (context) => JokeBloc(),
      child: ListView.builder(
          itemCount: Constants.categoriesConst.length,
          itemBuilder: (context, index) {
            return ListTile(
                onTap: () {
                  jokeBloc
                      .add(CategoryJokeEvent(category: Constants.categoriesConst[index]));
                  Navigator.pop(context);
                },
                title: Text(Constants.categoriesConst[index]));
          }),
    );
  }
}

import 'package:courses/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/joke/joke_bloc.dart';
import '../../assets/constants.dart' as constants;

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
                                  child: Text(constants.aboutConst),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(LocaleKeys.close.tr())),
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
          itemCount: constants.categoriesConst.length,
          itemBuilder: (context, index) {
            return ListTile(
                onTap: () {
                  jokeBloc.add(CategoryJokeEvent(
                      category: constants.categoriesConst[index]));
                  Navigator.pop(context);
                },
                title: Text(constants.categoriesConst[index]));
          }),
    );
  }
}

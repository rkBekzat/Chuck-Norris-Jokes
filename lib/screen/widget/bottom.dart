import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/joke_bloc.dart';


class BottomPart extends StatelessWidget {

  const BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jokeBloc = BlocProvider.of<JokeBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.12,
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ElevatedButton(
            onPressed: () => {  },
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: Colors.blue),
            ))),
            child: const Icon(
              Icons.favorite,
              size: 50,
              color: Colors.red,
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.12,
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ElevatedButton(
            onPressed: () => { jokeBloc.add(SkipJoke()) },
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: Colors.blue),
            ))),
            child: Image.asset(
              'assets/icon/dislike.png',
              height: 50,
              width: 50,
            ),
          ),
        ),
      ],
    );
  }
}

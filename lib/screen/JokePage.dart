import 'package:flutter/material.dart';
import 'package:courses/bloc/internet_cubit.dart';
import 'package:courses/bloc/joke_bloc.dart';
import 'package:courses/widget/bottom.dart';
import 'package:courses/widget/information.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../const/variables.dart';


class JokePage extends StatefulWidget {
  const JokePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _JokePageState createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is NotConnectedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Internet not connected'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if( state is ConnectedState) {
          return buildWidget(context);
        }
        return Container(child: Text(state.toString()),);
      },
    );
  }

  Widget buildWidget(BuildContext context){
    final jokeBloc = BlocProvider.of<JokeBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<JokeBloc, JokeState>(
          bloc: jokeBloc,
          builder: (context, state) {
            final jokeOnFront = state.jokeOnFront;
            final jokeOnBack = state.jokeOnBack;
            final count = state.count;
            final current = state.currentImage;
            final next = state.nextImage;
            return Stack(
              children: [
                Information(
                  information: jokeOnBack,
                  color: next,
                  path: IMAGES[next],
                ),
                Dismissible(
                  key: Key("$count"),
                  child: Information(
                    information: jokeOnFront,
                    color: current,
                    path: IMAGES[current],
                  ),
                  onDismissed: (DismissDirection direction) {
                    if (direction == DismissDirection.startToEnd) {
                      jokeBloc.add(SkipJoke());
                    } else {
                      jokeBloc.add(AddJoke());
                    }
                  },
                ),
              ],
            );
          },
        ),
        BottomPart(),
      ],
    );
  }

}

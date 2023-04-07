import 'package:flutter/material.dart';

import '../../const/variables.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({Key? key}) : super(key: key);

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
                  child: ShowCategory(),
                )
              ),
              icon: Icon(Icons.filter_alt_outlined,),
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
                                  child: Text(ABOUT),
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

  Widget ShowCategory(){
    return ListView.builder(
        itemCount: CATEGORIES.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
              onPressed: () {},
              child: Text(CATEGORIES[index]));
        }
    );
  }

}

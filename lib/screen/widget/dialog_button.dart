import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({Key? key}) : super(key: key);

  static const about =
      "Hi My name is Bekzat. I am from Kazakhstan, and 21 years old. "
      "I love sport, and enjoy playing table tennis, football, basketball. Also I like watching anime. "
      "In programming I like using python it's easy but difficult to debugging. I have a lot experience with c++(only on comp prog) "
      "cause I participated several olympiad and solve a lot task on c++. ";

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(3),
        child: IconButton(
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
                              child: Text(about),
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
            icon: const Icon(Icons.info)));
  }
}

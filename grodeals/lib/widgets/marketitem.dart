import 'package:grodeals/providers/supermarkets.dart';
import 'package:flutter/material.dart';

class SupermarketItem extends StatelessWidget {
  final Supermarket supermarket;
  const SupermarketItem({Key? key, required this.supermarket})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        color: getColor(),
        child: Stack(children: [
          Align(
              alignment: Alignment.centerLeft, child: Text(supermarket.title)),
          Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.add_task),
                tooltip: 'Choose Supermarket',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const MaterialApp()));
                },
              )),
        ]));
  }

  Color getColor() {
    if (supermarket.allAvailable) {
      return Color.fromARGB(255, 255, 212, 112);
    } else {
      return Color.fromARGB(255, 104, 104, 104);
    }
  }
}

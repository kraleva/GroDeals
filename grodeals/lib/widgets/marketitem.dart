import 'package:grodeals/providers/supermarkets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grodeals/screens/market_list.dart';

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
              alignment: Alignment.centerLeft,
              child: Text(
                supermarket.title,
                style: GoogleFonts.acme(color: Colors.white),
              )),
          Align(
              alignment: const Alignment(0.6, 0.0),
              child: Text(supermarket.distance.toString(),
                  style: const TextStyle(color: Colors.white))),
          Align(
              alignment: const Alignment(0.3, 0.0),
              child: Text(supermarket.price.toString(),
                  style: const TextStyle(color: Colors.white70))),
          Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.add_task),
                tooltip: 'Choose Supermarket',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MarketList(supermarketid: supermarket.id)));
                },
              )),
        ]));
  }

  Color getColor() {
    if (supermarket.title == "") {
      return Color.fromARGB(255, 255, 152, 0);
    } else if (supermarket.allAvailable) {
      return Color.fromARGB(255, 255, 212, 112);
    } else {
      return Color.fromARGB(255, 212, 186, 155);
    }
  }
}

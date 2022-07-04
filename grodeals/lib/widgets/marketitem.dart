import 'package:grodeals/providers/supermarkets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grodeals/screens/market_list.dart';
import "package:grodeals/providers/listprovider.dart";
import 'package:provider/provider.dart';

class SupermarketItem extends StatelessWidget {
  final Supermarket supermarket;
  const SupermarketItem({Key? key, required this.supermarket})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ListProvider>(context);
    return Container(
        height: 50,
        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        color: getColor(),
        child: Stack(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                supermarket.title,
                style: GoogleFonts.acme(color: Colors.white, fontSize: 18),
              )),
          Align(
              alignment: const Alignment(0.6, 0.0),
              child: Text("${supermarket.distance.toString()} km",
                  style: const TextStyle(color: Colors.white))),
          Align(
              alignment: const Alignment(0.3, 0.0),
              child: Text("${supermarket.price.toString()} €",
                  style: const TextStyle(color: Colors.white70))),
          Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.add_task),
                tooltip: 'Choose Supermarket',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MarketList(
                            supermarketid: supermarket.id,
                            productids: products.items.keys.toList(),
                            supermarket: supermarket,
                          )));
                },
              )),
        ]));
  }

  Color getColor() {
    if (supermarket.title == "") {
      return const Color.fromARGB(255, 255, 152, 0);
    } else if (supermarket.allAvailable) {
      return const Color.fromARGB(255, 255, 212, 112);
    } else {
      return const Color.fromARGB(255, 212, 186, 155);
    }
  }
}

import 'package:grodeals/providers/supermarkets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grodeals/screens/market_list.dart';
import 'package:provider/provider.dart';

class ReplacementItem extends StatelessWidget {
  final String category;
  const ReplacementItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final supermarkets = Provider.of<SupermarketProvider>(context);
    return Container(
        height: 50,
        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        color: getColor(),
        child: Stack(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                category,
                style: GoogleFonts.acme(color: Colors.white, fontSize: 18),
              )),
          Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.add_circle),
                tooltip: 'Choose Product',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Text("test")));
                },
              )),
        ]));
  }

  String getNullProtectedString(String? word) {
    if (word == null) {
      return "";
    }
    return word;
  }

  Color getColor() {
    return Color.fromARGB(255, 255, 212, 112);
  }
}

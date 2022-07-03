import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grodeals/screens/suggestion_items_screen.dart';

class ReplacementItem extends StatelessWidget {
  final String category;
  final String supermarketid;
  const ReplacementItem(
      {Key? key, required this.category, required this.supermarketid})
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
                      builder: (BuildContext context) => SuggestionsItemsScreen(
                            category: category,
                            supermarketid: supermarketid,
                          )));
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
    return const Color.fromARGB(255, 255, 212, 112);
  }
}
